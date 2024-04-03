Profile: ServiceDeliveryLocation
Parent: $ParticipantRole
Id: ServiceDeliveryLocation
Title: "Service Delivery Location"
Description: "This clinical statement represents the physical place of available services or resources. It is the location of a service event where an act, observation or procedure took or can place."

* insert LogicalModelTemplateRootOnly(service-delivery-loc, 2.16.840.1.113883.10.20.22.4.32)

* classCode 1..1
* classCode = #SDLOC (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"SDLOC\" (CodeSystem: HL7RoleCode urn:oid:2.16.840.1.113883.5.111 STATIC) (CONF:81-7758)."
* id
  * insert USCDI([[Facility Identifier]])
  * ^comment = "Systems SHALL support National Provider Identifier (NPI) for organizations and SHOULD support Clinical Laboratory Improvement Amendments (CLIA) for laboratories and the National Association of Insurance Commissioners NAIC Company code (sometimes called “NAIC Number” or “cocode”) for payers."
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "root"
  * ^slicing.rules = #open
* id contains NPI 0..* and CLIA 0..* and NAIC 0..*
* id[NPI].root = "2.16.840.1.113883.4.6"
* id[CLIA].root = "2.16.840.1.113883.4.7"
* id[NAIC].root = "2.16.840.1.113883.6.300"  
* code 1..1
* code from $2.16.840.1.113883.1.11.20275 (required)
  * insert USCDI([[Facility Type]])
* obeys should-addr
* addr 0..*
* addr only USRealmAddress
  * ^comment = "SHOULD contain zero or more [0..*] addr (CONF:81-7760)." // auto-should
* obeys should-telecom
* telecom 0..*
  * ^comment = "SHOULD contain zero or more [0..*] telecom (CONF:81-7761)." // auto-should
* playingEntity 0..1
  * ^comment = "MAY contain zero or one [0..1] playingEntity (CONF:81-7762)."
  * classCode 1..1
  * classCode = #PLC (exactly)
    * ^comment = "The playingEntity, if present, SHALL contain exactly one [1..1] @classCode=\"PLC\" (CodeSystem: HL7EntityClass urn:oid:2.16.840.1.113883.5.41 STATIC) (CONF:81-7763)."
  * name 0..1
    * insert USCDI([[Facility Name]])
    * ^comment = "The playingEntity, if present, MAY contain zero or one [0..1] name (CONF:81-16037)."