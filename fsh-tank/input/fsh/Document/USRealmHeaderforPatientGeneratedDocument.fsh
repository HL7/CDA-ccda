Profile: USRealmHeaderforPatientGeneratedDocument
Parent: USRealmHeader
Id: USRealmHeaderforPatientGeneratedDocument
Title: "US Realm Header for Patient Generated Document"
Description: """This template focuses on the patient or related person in the roles of author and other participants and is designed to be used in conjunction with the US Realm Header. It includes additional conformances which further constrain the US Realm Header. 
The Patient Generated Document Header template is not a separate document type. The document body may contain any structured or unstructured content from C-CDA."""

* insert LogicalModelTemplate(us-patient-gen-doc, 2.16.840.1.113883.10.20.29.1, 2024-05-01)

* ^status = #active
* recordTarget 1..1
  * ^short = "The recordTarget records the patient whose health information is described by the clinical document; each recordTarget must contain at least one patientRole element. \n\nIf the document receiver is interested in setting up a translator for the encounter with the patient, the receiver of the document will have to infer the need for a translator, based upon the language skills identified for the patient, the patient's language of preference and the predominant language used by the organization receiving the CDA.\n\nHL7 Vocabulary simply describes guardian as a relationship to a ward.  This need not be a formal legal relationship. When a guardian relationship exists for the patient, it can be represented, regardless of who is present at the time the document is generated. This need not be a formal legal relationship. A child's parent can be represented in the guardian role.  In this case, the guardian/code element would encode the personal relationship of \"mother\" for the child's mom or \"father\" for the child's dad. An elderly person's child can be represented in the guardian role. In this case, the guardian/code element would encode the personal relationship of \"daughter\" or \"son\", or if a legal relationship existed, the relationship of \"legal guardian\" could be encoded."
  * ^comment = "SHALL contain exactly one [1..1] recordTarget (CONF:1198-28460)."
  * patientRole 1..1
    * ^comment = "This recordTarget SHALL contain exactly one [1..1] patientRole (CONF:1198-28461)."
    * id 1..*
      * ^comment = "This patientRole SHALL contain at least one [1..*] id (CONF:1198-28462)."
    * patient 1..1
      * ^comment = "This patientRole SHALL contain exactly one [1..1] patient (CONF:1198-28465)."
      * guardian 0..*
        * ^comment = "This patient MAY contain zero or more [0..*] guardian (CONF:1198-28469)."
        * obeys should-id
        * id 0..*
          * ^comment = "The guardian, if present, SHOULD contain zero or more [0..*] id (CONF:1198-28470)." // auto-should
        * obeys should-code
        * code 0..1
        * code from $2.16.840.1.113883.11.20.12.1 (required)
          * ^comment = "The guardian, if present, SHOULD contain zero or one [0..1] code, which SHALL be selected from ValueSet Personal And Legal Relationship Role Type urn:oid:2.16.840.1.113883.11.20.12.1 DYNAMIC (CONF:1198-28473)." // man-should
      * obeys should-languageCommunication
      * languageCommunication 0..*
        * ^comment = "This patient SHOULD contain zero or more [0..*] languageCommunication which SHALL be selected from ValueSet AllLanguages https://www.hl7.org/fhir/valueset-all-languages.html (OID 2.16.840.1.113883.4.642.3.21) DYNAMIC (CONF:XXX)." // man-should
        * languageCode from http://hl7.org/fhir/ValueSet/all-languages (required)
        * preferenceInd 0..1
          * ^short = "Indicates a preference for information about care delivery and treatments be communicated (or translated if needed) into this language.\n\nIf more than one languageCommunication is present, only one languageCommunication element SHALL have a preferenceInd with a value of 1."
          * ^comment = "The languageCommunication, if present, MAY contain zero or one [0..1] preferenceInd (CONF:1198-28475)."
    * providerOrganization 0..1
      * ^label = "If present, this organization represents the provider organization where the person is claiming to be a patient."
      * ^short = "If present, this organization represents the provider organization where the person is claiming to be a patient."
      * ^comment = "This patientRole MAY contain zero or one [0..1] providerOrganization (CONF:1198-28476)."
* author 1..*
  * ^short = "The author element represents the creator of the clinical document.  The author may be a device, or a person. The person is the patient or the patient's advocate."
  * ^comment = "SHALL contain at least one [1..*] author (CONF:1198-28477)."
  * assignedAuthor 1..1
    * ^comment = "Such authors SHALL contain exactly one [1..1] assignedAuthor (CONF:1198-28478)."
    * id 1..*
      * ^comment = "This assignedAuthor SHALL contain at least one [1..*] id (CONF:1198-28479)."
    * obeys should-code
    * code 0..1
      * ^short = "When the author is a person who is not acting in the role of a clinician, this code encodes the personal or legal relationship between author and the patient."
      * ^comment = "This assignedAuthor SHOULD contain zero or one [0..1] code (CONF:1198-28481)." // auto-should
      * insert BindAtCode($2.16.840.1.113883.11.20.12.1, preferred)
* dataEnterer 0..1
  * ^short = "The dataEnterer element represents the person who transferred the content, written or dictated by someone else, into the clinical document. The guiding rule of thumb is that an author provides the content found within the header or body of the document, subject to their own interpretation, and the dataEnterer adds that information to the electronic system. In other words, a dataEnterer transfers information from one source to another (e.g., transcription from paper form to electronic system). If the dataEnterer is missing, this role is assumed to be played by the author."
  * ^comment = "MAY contain zero or one [0..1] dataEnterer (CONF:1198-28678)."
  * assignedEntity 1..1
    * ^comment = "The dataEnterer, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1198-28679)."
    * code 0..1
    * code from $2.16.840.1.113883.11.20.12.1 (preferred)
      * ^comment = "This assignedEntity MAY contain zero or one [0..1] code, which SHOULD be selected from ValueSet Personal And Legal Relationship Role Type urn:oid:2.16.840.1.113883.11.20.12.1 DYNAMIC (CONF:1198-28680)."
// Removing slicing since only discriminator is always required
* informant[non-provider]
  * relatedEntity 1..1
    * ^comment = "SHALL contain exactly one [1..1] relatedEntity (CONF:1198-28682)."
    * code 0..1
      * ^comment = "This relatedEntity MAY contain zero or one [0..1] code (CONF:1198-28683)."
      * obeys should-code-attr
      * code 0..1
      * code from $2.16.840.1.113883.11.20.12.1 (preferred)
        * ^comment = "The code, if present, SHOULD contain zero or one [0..1] @code, which SHOULD be selected from ValueSet Personal And Legal Relationship Role Type urn:oid:2.16.840.1.113883.11.20.12.1 DYNAMIC (CONF:1198-28684)." // man-should
* custodian 1..1
  * ^short = "The custodian element represents the organization or person that is in charge of maintaining the document. The custodian is the steward that is entrusted with the care of the document. Every CDA document has exactly one custodian. The custodian participation satisfies the CDA definition of Stewardship. Because CDA is an exchange standard and may not represent the original form of the authenticated document (e.g., CDA could include scanned copy of original), the custodian represents the steward of the original source document. The custodian may be the document originator, a health information exchange, or other responsible party. Also, the custodian may be the patient or an organization acting on behalf of the patient, such as a PHR organization."
  * ^comment = "SHALL contain exactly one [1..1] custodian (CONF:1198-28685)."
  * assignedCustodian 1..1
    * ^comment = "This custodian SHALL contain exactly one [1..1] assignedCustodian (CONF:1198-28686)."
    * representedCustodianOrganization 1..1
      * ^short = "The representedCustodianOrganization may be the person when the document is not maintained by an organization."
      * ^comment = "This assignedCustodian SHALL contain exactly one [1..1] representedCustodianOrganization (CONF:1198-28687)."
      * id 1..*
        * ^short = "The combined @root and @extension attributes record the custodian organization's identity in a secure, trusted, and unique way."
        * ^comment = "This representedCustodianOrganization SHALL contain at least one [1..*] id (CONF:1198-28688)."
* informationRecipient 0..*
  * ^short = "The informationRecipient element records the intended recipient of the information at the time the document is created. For example, in cases where the intended recipient of the document is the patient's health chart, set the receivedOrganization to be the scoping organization for that chart."
  * ^comment = "MAY contain zero or more [0..*] informationRecipient (CONF:1198-28690)."
  * intendedRecipient 1..1
    * ^comment = "The informationRecipient, if present, SHALL contain exactly one [1..1] intendedRecipient (CONF:1198-28691)."
    * obeys should-id
    * id 0..*
      * ^short = "The combined @root and @extension  attributes to record the information recipient's identity in a secure, trusted, and unique way."
      * ^comment = "This intendedRecipient SHOULD contain zero or more [0..*] id (CONF:1198-28692)." // auto-should
      * obeys should-root
      * root 0..1
        * ^short = "For a provider, the id/@root =\"2.16.840.1.113883.4.6\" indicates the National Provider Identifier where id/@extension is the NPI number for the provider.\n\nThe ids MAY reference the id of a person or organization entity specified elsewhere in the document."
        * ^comment = "The id, if present, SHOULD contain zero or one [0..1] @root (CONF:1198-28693)." // man-should
* legalAuthenticator 0..1
  * ^short = "In a patient authored document, the legalAuthenticator identifies the single person legally responsible for the document and must be present if the document has been legally authenticated. (Note that per the following section, there may also be one or more document authenticators.) \n\nBased on local practice, patient authored documents may be provided without legal authentication. This implies that a patient authored document that does not contain this element has not been legally authenticated.\n\nThe act of legal authentication requires a certain privilege be granted to the legal authenticator depending upon local policy. All patient documents have the potential for legal authentication, given the appropriate legal authority.\n\nLocal policies MAY choose to delegate the function of legal authentication to a device or system that generates the document. In these cases, the legal authenticator is the person accepting responsibility for the document, not the generating device or system.\n\nNote that the legal authenticator, if present, must be a person."
  * ^comment = "MAY contain zero or one [0..1] legalAuthenticator (CONF:1198-28694)."
  * assignedEntity 1..1
    * ^comment = "The legalAuthenticator, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1198-28695)."
    * id 1..*
      * ^short = "The combined @root and @extension  attributes to record the information recipient's identity in a secure, trusted, and unique way."
      * ^comment = "This assignedEntity SHALL contain at least one [1..*] id (CONF:1198-28696)."
    * code 0..1
      * ^comment = "This assignedEntity MAY contain zero or one [0..1] code (CONF:1198-28697)."
      * code 0..1
      * code from $2.16.840.1.113883.11.20.12.1 (preferred)
        * ^comment = "The code, if present, MAY contain zero or one [0..1] @code, which SHOULD be selected from ValueSet Personal And Legal Relationship Role Type urn:oid:2.16.840.1.113883.11.20.12.1 DYNAMIC (CONF:1198-28698)."
* authenticator 0..*
  * ^comment = "MAY contain zero or more [0..*] authenticator (CONF:1198-28699)."
  * assignedEntity 1..1
    * ^comment = "The authenticator, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1198-28700)."
    * id 1..*
      * ^short = "The combined @root and @extension  attributes to record the authenticator's identity in a secure, trusted, and unique way."
      * ^comment = "This assignedEntity SHALL contain at least one [1..*] id (CONF:1198-28701)."
    * obeys should-code
    * code 0..1
    * code from $2.16.840.1.113883.11.20.12.1 (preferred)
      * ^comment = "This assignedEntity SHOULD contain zero or one [0..1] code, which SHOULD be selected from ValueSet Personal And Legal Relationship Role Type urn:oid:2.16.840.1.113883.11.20.12.1 DYNAMIC (CONF:1198-28702)." // man-should
* participant 0..*
  * ^short = "The participant element identifies other supporting participants, including parents, relatives, caregivers, insurance policyholders, guarantors, and other participants related in some way to the patient. \n\nA supporting person or organization is an individual or an organization with a relationship to the patient. A supporting person who is playing multiple roles would be recorded in multiple participants (e.g., emergency contact and next-of-kin)"
  * ^comment = "MAY contain zero or more [0..*] participant (CONF:1198-28703)."
  * typeCode 1..1
    * ^short = "Unless otherwise specified by the document specific header constraints, when participant/@typeCode is IND, associatedEntity/@classCode SHALL be selected from ValueSet 2.16.840.1.113883.11.20.9.33 INDRoleclassCodes STATIC 2011-09-30"
    * ^comment = "The participant, if present, SHALL contain exactly one [1..1] @typeCode (CONF:1198-28704)."
  * associatedEntity 1..1
    * ^comment = "The participant, if present, SHALL contain exactly one [1..1] associatedEntity (CONF:1198-28705)."
    * obeys should-code
    * code 0..1
    * code from $2.16.840.1.113883.11.20.12.1 (preferred)
      * ^comment = "This associatedEntity SHOULD contain zero or one [0..1] code, which SHOULD be selected from ValueSet Personal And Legal Relationship Role Type urn:oid:2.16.840.1.113883.11.20.12.1 DYNAMIC (CONF:1198-28706)."  // man-should
* inFulfillmentOf 0..*
  * ^comment = "MAY contain zero or more [0..*] inFulfillmentOf (CONF:1198-28707)."
  * order 1..1
    * ^comment = "The inFulfillmentOf, if present, SHALL contain exactly one [1..1] order (CONF:1198-28708)."
    * id 1..*
      * ^short = "A scheduled appointment or service event in a practice management system may be represented using this id element."
      * ^comment = "This order SHALL contain at least one [1..*] id (CONF:1198-28709)."
* documentationOf 0..*
  * ^comment = "MAY contain zero or more [0..*] documentationOf (CONF:1198-28710)."
  * serviceEvent 1..1
    * ^comment = "The documentationOf, if present, SHALL contain exactly one [1..1] serviceEvent (CONF:1198-28711)."
    * obeys should-code
    * code 0..1
      * ^short = "The code should be selected from a value set established by the document-level template for a specific type of Patient Generated Document."
      * ^comment = "This serviceEvent SHOULD contain zero or one [0..1] code (CONF:1198-28712)." // auto-should
    * obeys should-performer
    * performer 0..*
      * ^comment = "This serviceEvent SHOULD contain zero or more [0..*] performer (CONF:1198-28713)." // auto-should
      * typeCode 1..1
      * typeCode from $2.16.840.1.113883.1.11.19601 (required)
        * ^comment = "The performer, if present, SHALL contain exactly one [1..1] @typeCode, which SHALL be selected from ValueSet x_ServiceEventPerformer urn:oid:2.16.840.1.113883.1.11.19601 STATIC (CONF:4537-14840)."      
      * functionCode 0..1
        * ^comment = "When indicating the performer was the primary care physician, implementers should indicate \"PCP\" as the functionCode"
        * ^comment = "The performer, if present, MAY contain zero or one [0..1] functionCode (CONF:4537-16818)."
        // No need for this - it's on USRealmHeader * obeys should-code-attr
        * code 0..1
        * code from $2.16.840.1.113883.1.11.10267 (required)
      * assignedEntity 1..1
        * ^comment = "The performer, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1198-28715)."
        * id 1..*
          * ^short = "The combined @root and @extension  attributes record the performer's identity in a secure, trusted, and unique way."
          * ^comment = "This assignedEntity SHALL contain at least one [1..*] id (CONF:1198-28716)."
        * code 0..1
        * code from $2.16.840.1.113883.11.20.12.1 (preferred)
          * ^short = "If the assignedEntity is an individual, the code SHOULD be selected from value set PersonalandLegalRelationshipRoleType value set"
          * ^comment = "This assignedEntity MAY contain zero or one [0..1] code, which SHOULD be selected from ValueSet Personal And Legal Relationship Role Type urn:oid:2.16.840.1.113883.11.20.12.1 DYNAMIC (CONF:1198-28718)."