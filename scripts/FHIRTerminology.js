"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.FHIRTerminology = void 0;
const fs = __importStar(require("fs"));
const cheerio = __importStar(require("cheerio"));
const ini_1 = __importDefault(require("ini"));
const axios_1 = __importDefault(require("axios"));
class FHIRTerminology {
    getValueSetsInProfile(profileFile) {
        const profile = JSON.parse(fs.readFileSync(profileFile, 'utf8'));
        // Read all value sets specified in a binding
        let valueSets = new Set();
        for (const element of profile.snapshot.element) {
            const binding = element.binding;
            if (typeof binding === 'undefined' || typeof binding.valueSet === 'undefined' || binding.strength == 'example')
                continue;
            valueSets.add(binding.valueSet);
        }
        return valueSets;
    }
    getValueSetFilename(packageDir, valueSetUrl) {
        return `${packageDir}/package/ValueSet-${valueSetUrl.split('/').pop().split('|')[0]}.json`;
    }
    async getValueSetObject(fhirPackages, authMethods, valueSetUrl) {
        // Read the value set from the given libraries first
        for (const packageDir of fhirPackages) {
            const filename = this.getValueSetFilename(packageDir, valueSetUrl);
            if (fs.existsSync(filename)) {
                return JSON.parse(fs.readFileSync(filename, 'utf8'));
            }
        }
        // If we didn't find it, then try to download it
        // Determine auth method
        const auth = authMethods.find((authMethod) => {
            valueSetUrl.includes(authMethod.url);
        });
        try {
            return (await axios_1.default.get(this.fixValueSetUrl(valueSetUrl), {
                headers: { Accept: 'application/json+fhir' },
                auth: { username: auth ? auth.username : '', password: auth ? auth.password : '' },
            })).data;
        }
        catch (error) {
            console.log(`ERROR: ${error.response.status} - ${error.config.url}`);
            return undefined;
        }
    }
    fixValueSetUrl(valueSetUrl) {
        const versionLessUrl = valueSetUrl.split('|')[0];
        return versionLessUrl.includes('loinc.org') ? versionLessUrl.replace('http://loinc.org/vs/', 'https://fhir.loinc.org/ValueSet/') :
            versionLessUrl.includes('cts.nlm') ? versionLessUrl.replace('http://cts.nlm.nih.gov/', 'https://cts.nlm.nih.gov/') : versionLessUrl;
    }
    async getValueSetsInGuide(guideDir, dependentPackages, authMethods) {
        let foundValueSets = new Set();
        const profiles = fs.readdirSync(guideDir, 'utf8').filter((filename) => { return filename.endsWith('.json') && filename.startsWith('StructureDefinition'); });
        let foundValueSetURLs = new Set();
        for (const profile of profiles) {
            foundValueSetURLs = new Set([...foundValueSetURLs, ...this.getValueSetsInProfile(`${guideDir}/${profile}`)]);
        }
        for (const valueSetUrl of foundValueSetURLs) {
            const valueSet = await this.getValueSetObject(dependentPackages, authMethods, valueSetUrl);
            if (typeof valueSet === 'undefined')
                continue;
            foundValueSets.add(valueSet);
        }
        return foundValueSets;
    }
    saveGuideValueSets(guideOutputDir, outputFile, dependentPackages, authMethods) {
        this.getValueSetsInGuide(guideOutputDir, dependentPackages, authMethods).then((valueSets) => {
            fs.writeFileSync(outputFile, [...valueSets].sort((valueSetA, valueSetB) => { return valueSetA.name.localeCompare(valueSetB.name); }).map((valueSet) => { return `${valueSet === null || valueSet === void 0 ? void 0 : valueSet.name}: ${valueSet === null || valueSet === void 0 ? void 0 : valueSet.url}`; }).join('\r\n'));
        }).catch((reason) => { console.log(reason); });
    }
    loadGuide(guideDir, fhirPackageDir, authMethodFile, outputFile) {
        // read ig.ini to find the IG resource
        const guideIni = ini_1.default.parse(fs.readFileSync(`${guideDir}/ig.ini`, 'utf-8'));
        const igFilename = guideIni.IG.ig;
        // Read in the IG resource
        const igString = fs.readFileSync(`${guideDir}/${igFilename}`, 'utf8');
        let igData;
        if (igFilename.endsWith('.json')) {
            igData = JSON.parse(igString);
        }
        else {
            const igXML = cheerio.load(igString);
            igData = {};
            igData.fhirVersion = igXML('fhirVersion').attr('value');
            igData.dependsOn = igXML('dependsOn').get().map((depends) => {
                return { packageId: igXML(depends).find('packageId').attr('value'), version: igXML(depends).find('version').attr('value') };
            });
        }
        // Build up the list of dependencies
        let guidePackages = [];
        // Get FHIR dependency
        guidePackages.push(`${fhirPackageDir}/hl7.fhir.r5.core#${igData.fhirVersion}`);
        // Now walk the dependencies
        igData.dependsOn.forEach((dependency) => {
            guidePackages.push(`${fhirPackageDir}/${dependency.packageId}#${dependency.version}`);
        });
        console.log(guidePackages);
        const authMethods = JSON.parse(fs.readFileSync(authMethodFile, 'utf-8'));
        this.saveGuideValueSets(`${guideDir}/output`, outputFile, guidePackages, authMethods);
    }
}
exports.FHIRTerminology = FHIRTerminology;
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiRkhJUlRlcm1pbm9sb2d5LmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vc3JjL0ZISVJUZXJtaW5vbG9neS50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7OztBQUFBLHVDQUF5QjtBQUN6QixpREFBbUM7QUFDbkMsOENBQXNCO0FBQ3RCLGtEQUEwQjtBQW1DMUIsTUFBYSxlQUFlO0lBQ25CLHFCQUFxQixDQUFDLFdBQW1CO1FBQzlDLE1BQU0sT0FBTyxHQUF5QixJQUFJLENBQUMsS0FBSyxDQUFDLEVBQUUsQ0FBQyxZQUFZLENBQUMsV0FBVyxFQUFFLE1BQU0sQ0FBQyxDQUFDLENBQUM7UUFDdkYsNkNBQTZDO1FBQzdDLElBQUksU0FBUyxHQUFHLElBQUksR0FBRyxFQUFVLENBQUM7UUFDbEMsS0FBSyxNQUFNLE9BQU8sSUFBSSxPQUFPLENBQUMsUUFBUSxDQUFDLE9BQU8sRUFBRTtZQUM5QyxNQUFNLE9BQU8sR0FBRyxPQUFPLENBQUMsT0FBTyxDQUFDO1lBQ2hDLElBQUksT0FBTyxPQUFPLEtBQUssV0FBVyxJQUFJLE9BQU8sT0FBTyxDQUFDLFFBQVEsS0FBSyxXQUFXLElBQUksT0FBTyxDQUFDLFFBQVEsSUFBSSxTQUFTO2dCQUFFLFNBQVM7WUFDekgsU0FBUyxDQUFDLEdBQUcsQ0FBQyxPQUFPLENBQUMsUUFBUSxDQUFDLENBQUM7U0FDakM7UUFDRCxPQUFPLFNBQVMsQ0FBQztJQUNuQixDQUFDO0lBRU0sbUJBQW1CLENBQUMsVUFBa0IsRUFBRSxXQUFtQjtRQUNoRSxPQUFPLEdBQUcsVUFBVSxxQkFBcUIsV0FBVyxDQUFDLEtBQUssQ0FBQyxHQUFHLENBQUMsQ0FBQyxHQUFHLEVBQUcsQ0FBQyxLQUFLLENBQUMsR0FBRyxDQUFDLENBQUMsQ0FBQyxDQUFDLE9BQU8sQ0FBQztJQUU5RixDQUFDO0lBRU0sS0FBSyxDQUFDLGlCQUFpQixDQUFDLFlBQXNCLEVBQUUsV0FBMEIsRUFBRSxXQUFv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O1FBQ3RCLGFBQWEsQ0FBQyxJQUFJLENBQUMsR0FBRyxjQUFjLHFCQUFxQixNQUFNLENBQUMsV0FBVyxFQUFFLENBQUMsQ0FBQztRQUMvRSw0QkFBNEI7UUFDNUIsTUFBTSxDQUFDLFNBQVUsQ0FBQyxPQUFPLENBQ3ZCLENBQUUsVUFBVSxFQUFHLEVBQUU7WUFDZixhQUFhLENBQUMsSUFBSSxDQUFDLEdBQUcsY0FBYyxJQUFJLFVBQVUsQ0FBQyxTQUFTLElBQUksVUFBVSxDQUFDLE9BQU8sRUFBRSxDQUFDLENBQUM7UUFDeEYsQ0FBQyxDQUNGLENBQUM7UUFDRixPQUFPLENBQUMsR0FBRyxDQUFDLGFBQWEsQ0FBQyxDQUFDO1FBRTNCLE1BQU0sV0FBVyxHQUFpQixJQUFJLENBQUMsS0FBSyxDQUFDLEVBQUUsQ0FBQyxZQUFZLENBQUMsY0FBYyxFQUFFLE9BQU8sQ0FBQyxDQUFDLENBQUM7UUFFdkYsSUFBSSxDQUFDLGtCQUFrQixDQUFDLEdBQUcsUUFBUSxTQUFTLEVBQUUsVUFBVSxFQUFFLGFBQWEsRUFBRSxXQUFXLENBQUMsQ0FBQztJQUN4RixDQUFDO0NBRUY7QUE1R0QsMENBNEdDIiwic291cmNlc0NvbnRlbnQiOlsiaW1wb3J0ICogYXMgZnMgZnJvbSAnZnMnO1xuaW1wb3J0ICogYXMgY2hlZXJpbyBmcm9tICdjaGVlcmlvJztcbmltcG9ydCBpbmkgZnJvbSAnaW5pJztcbmltcG9ydCBheGlvcyBmcm9tICdheGlvcyc7XG5cbmludGVyZmFjZSBTdHJ1Y3R1cmVEZWZpbml0aW9uIHtcbiAgc25hcHNob3QgOiB7XG4gICAgZWxlbWVudCA6IEVsZW1lbnREZWZpbml0aW9uW107XG4gIH07XG59XG5cbmludGVyZmFjZSBFbGVtZW50RGVmaW5pdGlvbiB7XG4gIGJpbmRpbmc/IDoge1xuICAgIHZhbHVlU2V0IDogc3RyaW5nO1xuICAgIHN0cmVuZ3RoOiBzdHJpbmc7XG4gIH07XG59XG5cbmludGVyZmFjZSBWYWx1ZVNldCB7XG4gIHVybCA6IHN0cmluZztcbiAgbmFtZTogc3RyaW5nO1xuICB0aXRsZTogc3RyaW5nO1xufVxuXG5pbnRlcmZhY2UgSW1wbGVtZW50YXRpb25HdWlkZSB7XG4gIGZoaXJWZXJzaW9uPzogc3RyaW5nO1xuICBkZXBlbmRzT24/OiB7XG4gICAgcGFja2FnZUlkOiBzdHJpbmc7XG4gICAgdmVyc2lvbjogc3RyaW5nO1xuICB9W107XG59XG5cbmludGVyZmFjZSBBdXRoTWV0aG9kIHtcbiAgdXJsOiBzdHJpbmc7XG4gIHVzZXJuYW1lOiBzdHJpbmc7XG4gIHBhc3N3b3JkOiBzdHJpbmc7XG59XG5cbmV4cG9ydCBjbGFzcyBGSElSVGVybWlub2xvZ3kge1xuICBwdWJsaWMgZ2V0VmFsdWVTZXRzSW5Qcm9maWxlKHByb2ZpbGVGaWxlOiBzdHJpbmcpIDogU2V0PHN0cmluZz4ge1xuICAgIGNvbnN0IHByb2ZpbGUgOiBTdHJ1Y3R1cmVEZWZpbml0aW9uID0gSlNPTi5wYXJzZShmcy5yZWFkRmlsZVN5bmMocHJvZmlsZUZpbGUsICd1dGY4JykpO1xuICAgIC8vIFJlYWQgYWxsIHZhbHVlIHNldHMgc3BlY2lmaWVkIGluIGEgYmluZGluZ1xuICAgIGxldCB2YWx1ZVNldHMgPSBuZXcgU2V0PHN0cmluZz4oKTtcbiAgICBmb3IgKGNvbnN0IGVsZW1lbnQgb2YgcHJvZmlsZS5zbmFwc2hvdC5lbGVtZW50KSB7XG4gICAgICBjb25zdCBiaW5kaW5nID0gZWxlbWVudC5iaW5kaW5nO1xuICAgICAgaWYgKHR5cGVvZiBiaW5kaW5nID09PSAndW5kZWZpbmVkJyB8fCB0eXBlb2YgYmluZGluZy52YWx1ZVNldCA9PT0gJ3VuZGVmaW5lZCcgfHwgYmluZGluZy5zdHJlbmd0aCA9PSAnZXhhbXBsZScpIGNvbnRpbnVlO1xuICAgICAgdmFsdWVTZXRzLmFkZChiaW5kaW5nLnZhbHVlU2V0KTtcbiAgICB9XG4gICAgcmV0dXJuIHZhbHVlU2V0cztcbiAgfVxuXG4gIHB1YmxpYyBnZXRWYWx1ZVNldEZpbGVuYW1lKHBhY2thZ2VEaXI6IHN0cmluZywgdmFsdWVTZXRVcmw6IHN0cmluZykgOiBzdHJpbmcge1xuICAgIHJldHVybiBgJHtwYWNrYWdlRGlyfS9wYWNrYWdlL1ZhbHVlU2V0LSR7dmFsdWVTZXRVcmwuc3BsaXQoJy8nKS5wb3AoKSEuc3BsaXQoJ3wnKVswXX0uanNvbmA7XG5cbiAgfVxuXG4gIHB1YmxpYyBhc3luYyBnZXRWYWx1ZVNldE9iamVjdChmaGlyUGFja2FnZXM6IHN0cmluZ1tdLCBhdXRoTWV0aG9kcyA6IEF1dGhNZXRob2RbXSwgdmFsdWVTZXRVcmwgOiBzdHJpbmcpIDogUHJvbWlzZTxWYWx1ZVNldCB8IHVuZGVmaW5lZD4ge1xuICAgIC8vIFJlYWQgdGhlIHZhbHVlIHNldCBmcm9tIHRoZSBnaXZlbiBsaWJyYXJpZXMgZmlyc3RcbiAgICBmb3IgKGNvbnN0IHBhY2thZ2VEaXIgb2YgZmhpclBhY2thZ2VzKSB7XG4gICAgICBjb25zdCBmaWxlbmFtZSA9IHRoaXMuZ2V0VmFsdWVTZXRGaWxlbmFtZShwYWNrYWdlRGlyLCB2YWx1ZVNldFVybCk7XG4gICAgICBpZiAoZnMuZXhpc3RzU3luYyhmaWxlbmFtZSkpIHtcbiAgICAgICAgcmV0dXJuIEpTT04ucGFyc2UoZnMucmVhZEZpbGVTeW5jKGZpbGVuYW1lLCAndXRmOCcpKSBhcyBWYWx1ZVNldDtcbiAgICAgIH1cbiAgICB9XG4gICAgLy8gSWYgd2UgZGlkbid0IGZpbmQgaXQsIHRoZW4gdHJ5IHRvIGRvd25sb2FkIGl0XG4gICAgLy8gRGV0ZXJtaW5lIGF1dGggbWV0aG9kXG4gICAgY29uc3QgYXV0aCA9IGF1dGhNZXRob2RzLmZpbmQoIChhdXRoTWV0aG9kKSA9PiB7XG4gICAgICB2YWx1ZVNldFVybC5pbmNsdWRlcyhhdXRoTWV0aG9kLnVybCk7XG4gICAgfSk7XG4gICAgdHJ5IHtcbiAgICAgIHJldHVybiAoYXdhaXQgYXhpb3MuZ2V0KHRoaXMuZml4VmFsdWVTZXRVcmwodmFsdWVTZXRVcmwpLFxuICAgICAgICB7XG4gICAgICAgICAgaGVhZGVyczogeyBBY2NlcHQ6ICdhcHBsaWNhdGlvbi9qc29uK2ZoaXInIH0sXG4gICAgICAgICAgYXV0aDogeyB1c2VybmFtZTogYXV0aCA/IGF1dGgudXNlcm5hbWUgOiAnJywgcGFzc3dvcmQ6IGF1dGg/IGF1dGgucGFzc3dvcmQgOiAnJyB9LFxuICAgICAgICB9KSkuZGF0YTtcbiAgICB9IGNhdGNoIChlcnJvcjogYW55KSB7XG4gICAgICBjb25zb2xlLmxvZyhgRVJST1I6ICR7ZXJyb3IucmVzcG9uc2Uuc3RhdHVzfSAtICR7ZXJyb3IuY29uZmlnLnVybH1gKTtcbiAgICAgIHJldHVybiB1bmRlZmluZWQ7XG4gICAgfVxuICB9XG5cbiAgcHVibGljIGZpeFZhbHVlU2V0VXJsKHZhbHVlU2V0VXJsOiBzdHJpbmcpIDogc3RyaW5nIHtcbiAgICBjb25zdCB2ZXJzaW9uTGVzc1VybCA9IHZhbHVlU2V0VXJsLnNwbGl0KCd8JylbMF07XG4gICAgcmV0dXJuIHZlcnNpb25MZXNzVXJsLmluY2x1ZGVzKCdsb2luYy5vcmcnKSA/IHZlcnNpb25MZXNzVXJsLnJlcGxhY2UoJ2h0dHA6Ly9sb2luYy5vcmcvdnMvJywgJ2h0dHBzOi8vZmhpci5sb2luYy5vcmcvVmFsdWVTZXQvJykgOlxuICAgICAgdmVyc2lvbkxlc3NVcmwuaW5jbHVkZXMoJ2N0cy5ubG0nKSA/IHZlcnNpb25MZXNzVXJsLnJlcGxhY2UoJ2h0dHA6Ly9jdHMubmxtLm5paC5nb3YvJywgJ2h0dHBzOi8vY3RzLm5sbS5uaWguZ292LycpIDogdmVyc2lvbkxlc3NVcmw7XG4gIH1cblxuICBwdWJsaWMgYXN5bmMgZ2V0VmFsdWVTZXRzSW5HdWlkZShndWlkZURpcjogc3RyaW5nLCBkZXBlbmRlbnRQYWNrYWdlczogc3RyaW5nW10sIGF1dGhNZXRob2RzOiBBdXRoTWV0aG9kW10pIDogUHJvbWlzZTxTZXQ8VmFsdWVTZXQ+PiB7XG4gICAgbGV0IGZvdW5kVmFsdWVTZXRzID0gbmV3IFNldDxWYWx1ZVNldD4oKTtcbiAgICBjb25zdCBwcm9maWxlcyA9IGZzLnJlYWRkaXJTeW5jKGd1aWRlRGlyLCAndXRmOCcpLmZpbHRlcigoZmlsZW5hbWUpID0+IHtyZXR1cm4gZmlsZW5hbWUuZW5kc1dpdGgoJy5qc29uJykgJiYgZmlsZW5hbWUuc3RhcnRzV2l0aCgnU3RydWN0dXJlRGVmaW5pdGlvbicpO30pO1xuICAgIGxldCBmb3VuZFZhbHVlU2V0VVJMcyA9IG5ldyBTZXQ8c3RyaW5nPigpO1xuICAgIGZvciAoY29uc3QgcHJvZmlsZSBvZiBwcm9maWxlcykge1xuICAgICAgZm91bmRWYWx1ZVNldFVSTHMgPSBuZXcgU2V0PHN0cmluZz4oWy4uLmZvdW5kVmFsdWVTZXRVUkxzLCAuLi50aGlzLmdldFZhbHVlU2V0c0luUHJvZmlsZShgJHtndWlkZURpcn0vJHtwcm9maWxlfWApXSk7XG4gICAgfVxuICAgIGZvciAoY29uc3QgdmFsdWVTZXRVcmwgb2YgZm91bmRWYWx1ZVNldFVSTHMpIHtcbiAgICAgIGNvbnN0IHZhbHVlU2V0ID0gYXdhaXQgdGhpcy5nZXRWYWx1ZVNldE9iamVjdChkZXBlbmRlbnRQYWNrYWdlcywgYXV0aE1ldGhvZHMsIHZhbHVlU2V0VXJsKTtcbiAgICAgIGlmICh0eXBlb2YgdmFsdWVTZXQgPT09ICd1bmRlZmluZWQnKSBjb250aW51ZTtcbiAgICAgIGZvdW5kVmFsdWVTZXRzLmFkZCh2YWx1ZVNldCEpO1xuICAgIH1cbiAgICByZXR1cm4gZm91bmRWYWx1ZVNldHM7XG4gIH1cblxuICBwdWJsaWMgc2F2ZUd1aWRlVmFsdWVTZXRzKGd1aWRlT3V0cHV0RGlyOiBzdHJpbmcsIG91dHB1dEZpbGU6IHN0cmluZywgZGVwZW5kZW50UGFja2FnZXM6IHN0cmluZ1tdLCBhdXRoTWV0aG9kczogQXV0aE1ldGhvZFtdKSB7XG4gICAgdGhpcy5nZXRWYWx1ZVNldHNJbkd1aWRlKGd1aWRlT3V0cHV0RGlyLCBkZXBlbmRlbnRQYWNrYWdlcywgYXV0aE1ldGhvZHMpLnRoZW4oKHZhbHVlU2V0cykgPT4ge1xuICAgICAgZnMud3JpdGVGaWxlU3luYyhvdXRwdXRGaWxlLFxuICAgICAgICBbLi4udmFsdWVTZXRzXS5zb3J0KCh2YWx1ZVNldEEsIHZhbHVlU2V0QikgPT4ge3JldHVybiB2YWx1ZVNldEEubmFtZS5sb2NhbGVDb21wYXJlKHZhbHVlU2V0Qi5uYW1lKTt9LFxuICAgICAgICApLm1hcChcbiAgICAgICAgICAodmFsdWVTZXQpID0+IHtyZXR1cm4gYCR7dmFsdWVTZXQ/Lm5hbWV9OiAke3ZhbHVlU2V0Py51cmx9YDt9KS5qb2luKCdcXHJcXG4nKSk7XG4gICAgfSkuY2F0Y2goIChyZWFzb24pID0+IHtjb25zb2xlLmxvZyhyZWFzb24pO30pO1xuICB9XG4gIFxuICBwdWJsaWMgbG9hZEd1aWRlKGd1aWRlRGlyOiBzdHJpbmcsIGZoaXJQYWNrYWdlRGlyOiBzdHJpbmcsIGF1dGhNZXRob2RGaWxlOiBzdHJpbmcgLCBvdXRwdXRGaWxlOiBzdHJpbmcpIHtcbiAgICAvLyByZWFkIGlnLmluaSB0byBmaW5kIHRoZSBJRyByZXNvdXJjZVxuICAgIGNvbnN0IGd1aWRlSW5pID0gaW5pLnBhcnNlKGZzLnJlYWRGaWxlU3luYyhgJHtndWlkZURpcn0vaWcuaW5pYCwgJ3V0Zi04JykpO1xuICAgIGNvbnN0IGlnRmlsZW5hbWUgPSBndWlkZUluaS5JRy5pZztcbiAgICAvLyBSZWFkIGluIHRoZSBJRyByZXNvdXJjZVxuICAgIGNvbnN0IGlnU3RyaW5nID0gZnMucmVhZEZpbGVTeW5jKGAke2d1aWRlRGlyfS8ke2lnRmlsZW5hbWV9YCwndXRmOCcpO1xuICAgIFxuICAgIGxldCBpZ0RhdGEgOiBJbXBsZW1lbnRhdGlvbkd1aWRlO1xuICAgIGlmIChpZ0ZpbGVuYW1lLmVuZHNXaXRoKCcuanNvbicpKSB7XG4gICAgICBpZ0RhdGEgPSBKU09OLnBhcnNlKGlnU3RyaW5nKTtcbiAgICB9IGVsc2Uge1xuICAgICAgY29uc3QgaWdYTUwgPSBjaGVlcmlvLmxvYWQoaWdTdHJpbmcpO1xuICAgICAgaWdEYXRhID0ge31cbiAgICAgIGlnRGF0YS5maGlyVmVyc2lvbiA9IGlnWE1MKCdmaGlyVmVyc2lvbicpLmF0dHIoJ3ZhbHVlJyk7XG4gICAgICBpZ0RhdGEuZGVwZW5kc09uID0gaWdYTUwoJ2RlcGVuZHNPbicpLmdldCgpLm1hcCggKGRlcGVuZHMpID0+IHtcbiAgICAgICAgcmV0dXJuIHsgcGFja2FnZUlkOiBpZ1hNTChkZXBlbmRzKS5maW5kKCdwYWNrYWdlSWQnKS5hdHRyKCd2YWx1ZScpISwgdmVyc2lvbjogaWdYTUwoZGVwZW5kcykuZmluZCgndmVyc2lvbicpLmF0dHIoJ3ZhbHVlJykhIH07XG4gICAgICB9KTtcbiAgICB9XG4gICAgLy8gQnVpbGQgdXAgdGhlIGxpc3Qgb2YgZGVwZW5kZW5jaWVzXG4gICAgbGV0IGd1aWRlUGFja2FnZXMgOiBzdHJpbmdbXSA9IFtdO1xuICAgIC8vIEdldCBGSElSIGRlcGVuZGVuY3lcbiAgICBndWlkZVBhY2thZ2VzLnB1c2goYCR7ZmhpclBhY2thZ2VEaXJ9L2hsNy5maGlyLnI1LmNvcmUjJHtpZ0RhdGEuZmhpclZlcnNpb259YCk7XG4gICAgLy8gTm93IHdhbGsgdGhlIGRlcGVuZGVuY2llc1xuICAgIGlnRGF0YS5kZXBlbmRzT24hLmZvckVhY2goXG4gICAgICAoIGRlcGVuZGVuY3kgKSA9PiB7XG4gICAgICAgIGd1aWRlUGFja2FnZXMucHVzaChgJHtmaGlyUGFja2FnZURpcn0vJHtkZXBlbmRlbmN5LnBhY2thZ2VJZH0jJHtkZXBlbmRlbmN5LnZlcnNpb259YCk7XG4gICAgICB9XG4gICAgKTtcbiAgICBjb25zb2xlLmxvZyhndWlkZVBhY2thZ2VzKTtcblxuICAgIGNvbnN0IGF1dGhNZXRob2RzOiBBdXRoTWV0aG9kW10gPSBKU09OLnBhcnNlKGZzLnJlYWRGaWxlU3luYyhhdXRoTWV0aG9kRmlsZSwgJ3V0Zi04JykpO1xuXG4gICAgdGhpcy5zYXZlR3VpZGVWYWx1ZVNldHMoYCR7Z3VpZGVEaXJ9L291dHB1dGAsIG91dHB1dEZpbGUsIGd1aWRlUGFja2FnZXMsIGF1dGhNZXRob2RzKTtcbiAgfVxuXG59XG4iXX0=