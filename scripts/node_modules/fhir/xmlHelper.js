"use strict";
exports.__esModule = true;
var _ = require("underscore");
var XmlHelper = (function () {
    function XmlHelper() {
    }
    XmlHelper.escapeInvalidCharacters = function (element) {
        _.each(element.attributes, function (attribute, index) {
            element.attributes[index] = element.attributes[index]
                .replace(/&(?!(?:apos|quot|[gl]t|amp);|#)/g, '&amp;');
        });
        if (element.type === 'text' && element.text) {
            element.text = element.text
                .replace(/&(?!(?:apos|quot|[gl]t|amp);|#)/g, '&amp;');
        }
        _.each(element.elements, XmlHelper.escapeInvalidCharacters);
        return element;
    };
    XmlHelper.unescapeInvalidCharacters = function (element) {
        _.each(element.attributes, function (attribute, index) {
            element.attributes[index] = element.attributes[index]
                .replace(/&amp;/g, '&');
        });
        if (element.type === 'text' && element.text) {
            element.text = element.text
                .replace(/&amp;/g, '&');
        }
        _.each(element.elements, XmlHelper.unescapeInvalidCharacters);
        return element;
    };
    return XmlHelper;
}());
exports.XmlHelper = XmlHelper;
//# sourceMappingURL=xmlHelper.js.map