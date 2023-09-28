Profile: ProductInstance
Parent: $ParticipantRole
Id: ProductInstance
Title: "Product Instance"
Description: """This clinical statement represents a particular device that was placed in a patient or used as part of a procedure or other act. This provides a record of the identifier and other details about the given product that was used. For example, it is important to have a record that indicates not just that a hip prostheses was placed in a patient but that it was a particular hip prostheses number with a unique identifier.

The FDA Amendments Act specifies the creation of a Unique Device Identification (UDI) System that requires the label of devices to bear a unique identifier that will standardize device identification and identify the device through distribution and use. 

The FDA permits an issuing agency to designate that their Device Identifier (DI) + Production Identifier (PI) format qualifies as a UDI through a process of accreditation. Currently, there are three FDA-accredited issuing agencies that are allowed to call their format a UDI. These organizations are GS1, HIBCC, and ICCBBA. For additional information on technical formats that qualify as UDI from each of the issuing agencies see the UDI Appendix.

When communicating only the issuing agency device identifier (i.e., subcomponent of the UDI), the use of the issuing agency OID is appropriate. However, when communicating the unique device identifier (DI + PI), the FDA OID (2.16.840.1.113883.3.3719) must be used. 
When sending a UDI, populate the participantRole/id/@root with the FDA OID (2.16.840.1.113883.3.3719) and participantRole/id/@extension with the UDI.

When sending a DI, populate the participantRole/id/@root with the appropriate assigning agency OID and participantRole/id/@extension with the DI.
The scopingEntity/id should correspond to FDA or the appropriate issuing agency."""
* insert LogicalModelNA
* ^identifier.value = "urn:oid:2.16.840.1.113883.10.20.22.4.37"
* classCode 1..1
* classCode = #MANU (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"MANU\" Manufactured Product (CodeSystem: HL7RoleClass urn:oid:2.16.840.1.113883.5.110 STATIC) (CONF:81-7900)."
* templateId ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "root"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:81-7901) such that it, SHALL not contain [0..0] extension."
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.4.37"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.4.37\" (CONF:81-10522)."
  * extension 0..0
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:81-7902)."
* playingDevice 1..1
  * ^comment = "SHALL contain exactly one [1..1] playingDevice (CONF:81-7903)."
  * code 0..1
    * ^comment = "This playingDevice SHOULD contain zero or one [0..1] code (CONF:81-16837)."
* scopingEntity 1..1
  * ^comment = "SHALL contain exactly one [1..1] scopingEntity (CONF:81-7905)."
  * id 1..*
    * ^comment = "This scopingEntity SHALL contain at least one [1..*] id (CONF:81-7908)."