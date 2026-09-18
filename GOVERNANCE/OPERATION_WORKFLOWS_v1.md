# OPERATION_WORKFLOWS_v1

Juridiskās pārbaudes sistēmas universālā darba plūsmu arhitektūra

**Statuss:** MELNRAKSTS — ARHITEKTŪRAS APSPRIEŠANAI  
**Versija:** v0.1  
**Bāze:**  
- `PROFESSIONAL_SCOPE_v1.4` — MELNRAKSTS  
- `TRACEABILITY_RECORD_v1 — Arhitektūra v0.6` — MELNRAKSTS  
- `TERMINOLOGY_AND_ENUMS_v1 — v0.4` — MELNRAKSTS  
- `VERIFICATION_PROTOCOL_v1 — v0.5` — IESALDĒTS

## 1. Mērķis

Šis dokuments nosaka universālo izpildes secību operācijām:

```text
ANALYSE
VERIFY
DRAFT
COMPARE
EXTRACT
```

Neviena no šīm operācijām nedrīkst līguma gadījumā sākt specializētu regulatīvu pārbaudi, pirms pabeigts piemērojamais `LEGAL INTAKE`.

## 2. Universālā ieejas secība

```text
LEGAL TASK RECEIVED
↓
AI TOOL / DATA PERMISSION GATE
↓
OBJECT IDENTIFICATION
↓
IF OBJECT = CONTRACT:
    CONTRACT TYPE CLASSIFICATION
↓
FACT PROFILE + MISSING INFORMATION
↓
LEGAL / REGULATORY CLASSIFICATION ASSESSMENT
↓
HUMAN / EXTERNAL AUTHORITY DECISION
↓
MODULE STATUS
↓
REQUIREMENTS SET SELECTION
↓
SELECTED OPERATION WORKFLOW
↓
TRACEABILITY + RELEASE GATES
```

Datu atļauju pārbaude notiek pirms AI apstrādes. `LEGAL INTAKE` nedrīkst izmantot kā pamatojumu, lai apietu AI rīka atļauju prasības.

## 3. LEGAL INTAKE mērķis

`LEGAL INTAKE` atbild uz četriem atsevišķiem jautājumiem:

1. Kas ir uzdevuma objekts?
2. Ja tas ir līgums — kāda veida līgums tas ir?
3. Kādi juridiskie / regulatīvie režīmi var būt piemērojami?
4. Kuras prasību kopas pēc cilvēka vai ārēja lēmuma drīkst aktivizēt?

Tas nav pilna līguma pārbaude un neaizstāj izvēlēto operāciju.

## 4. CONTRACT TYPE REGISTRY

Šis dokuments ir `CONTRACT TYPE REGISTRY` īpašnieks.

Sākotnējā v0.1 taxonomy:

| Canonical | Machine key | LV apzīmējums |
|---|---|---|
| SERVICE AGREEMENT | `service_agreement` | Pakalpojumu līgums |
| GOODS SUPPLY | `goods_supply` | Preču piegādes / pirkuma līgums |
| CONSTRUCTION | `construction` | Būvniecības līgums |
| SOFTWARE LICENCE | `software_licence` | Programmatūras licences līgums |
| SAAS / CLOUD SERVICE | `saas_cloud_service` | SaaS / mākoņpakalpojuma līgums |
| IT DEVELOPMENT | `it_development` | IT izstrādes līgums |
| IT SUPPORT / MAINTENANCE | `it_support_maintenance` | IT atbalsta / uzturēšanas līgums |
| CONSULTING / PROFESSIONAL SERVICES | `consulting_professional_services` | Konsultāciju / profesionālo pakalpojumu līgums |
| AUDIT SERVICES | `audit_services` | Audita pakalpojumu līgums |
| TRAINING SERVICES | `training_services` | Mācību pakalpojumu līgums |
| FACILITY SERVICES | `facility_services` | Saimnieciskās / facility apkalpošanas līgums |
| SECURITY SERVICES | `security_services` | Apsardzes / drošības pakalpojumu līgums |
| MARKETING SERVICES | `marketing_services` | Mārketinga pakalpojumu līgums |
| FRAMEWORK AGREEMENT | `framework_agreement` | Ietvarlīgums |
| CONFIDENTIALITY AGREEMENT | `confidentiality_agreement` | Konfidencialitātes līgums |
| DATA PROCESSING AGREEMENT | `data_processing_agreement` | Datu apstrādes līgums |
| LEASE | `lease` | Nomas līgums |
| OTHER | `other` | Cits |

Vienam līgumam drīkst piešķirt vairākas vērtības, ja tas ir jaukts līgums.

`CONTRACT TYPE`:
- nav `MODULE`;
- nenosaka automātisku regulatīvo režīmu;
- neaktivizē REQUIREMENTS SET bez atsevišķas moduļa piemērojamības noteikšanas.

## 5. CONTRACT TYPE noteikšana

Sistēma drīkst piedāvāt CONTRACT TYPE, pamatojoties uz:
- līguma priekšmetu;
- pušu faktiskajiem pienākumiem;
- pakalpojuma sniegšanas modeli;
- atlīdzības modeli;
- licences / piekļuves / hostinga elementiem;
- līguma ilgumu un atkārtojamību;
- citiem materiāliem elementiem.

Ja līguma nosaukums un saturs konfliktē, prioritāte ir faktiskajam saturam.

Piemērs:

```text
Document title: "Licence Agreement"
Actual content:
- hosted platform
- recurring service
- support
- data hosting

CONTRACT TYPE:
SOFTWARE LICENCE
SAAS / CLOUD SERVICE
IT SUPPORT / MAINTENANCE
```

## 6. FACT PROFILE

Pirms regulatīvās klasifikācijas sistēma apkopo klasifikācijai materiālos faktus.

Piemēram:
- ko piegādātājs faktiski dara;
- vai pakalpojums ir vienreizējs vai atkārtots;
- vai tas aizstāj bankas funkciju vai aktivitāti;
- piekļuve sistēmām, datiem vai telpām;
- datu hostings / apstrāde;
- kritiskums un atkarība;
- apakšuzņēmēji;
- pakalpojuma vieta;
- procesa integrācijas pakāpe;
- trūkstošie fakti.

Fakts, pieņēmums un neatbildēts jautājums jānošķir.

## 7. LEGAL / REGULATORY CLASSIFICATION

Katram iespējamam režīmam, kur vajadzīgs profesionāls spriedums, izveido `LEGAL CLASSIFICATION ASSESSMENT`.

Tipiski klasifikācijas jautājumi:
- vai sadarbība ir outsourcing;
- vai pakalpojums ir IKT pakalpojums DORA izpratnē;
- vai piemērojams procurement modulis;
- vai nepieciešama data-protection iesaiste;
- vai piemērojams INFOSEC modulis;
- cita juridiska kvalifikācija.

Sistēma nedrīkst pieņemt, ka visi iespējamie jautājumi vienmēr ir piemērojami. Kandidātjautājumi izriet no CONTRACT TYPE, faktiskā satura, lietotāja uzdevuma un identificētajiem avotiem.

## 8. Klasifikācijas lēmums

`LEGAL CLASSIFICATION ASSESSMENT` ir priekšlikums / profesionāls izvērtējums.

Gala `MODULE STATUS` paliek:

```text
APPLICABLE
NOT APPLICABLE
UNCLEAR
```

un to drīkst noteikt tikai atbilstoši `PROFESSIONAL_SCOPE_v1.4` autoritātei.

`QUALITATIVE LIKELIHOOD` nedrīkst automātiski pārvērst par `MODULE STATUS`.

## 9. Ja klasifikācija ir UNCLEAR

Ja specializētā moduļa gala statuss ir `UNCLEAR`:
- sistēma nedrīkst attiecīgo REQUIREMENTS SET pasniegt kā gala piemērojamo prasību bāzi;
- drīkst veikt skaidri marķētu scenārija analīzi;
- jānorāda nepieciešamais HUMAN INPUT REQUIRED vai HUMAN CONFIRMATION REQUIRED;
- materiāls downstream rezultāts, kas pieņem moduļa piemērojamību kā faktu, tiek bloķēts.

## 10. REQUIREMENTS SET izvēle

REQUIREMENTS SET tiek izvēlēts tikai pēc moduļa statusa.

Piemērs:

```text
COMMON CONTRACT REVIEW
→ universāls contract review slānis

OUTSOURCING-EBA = APPLICABLE
→ + EBA_REQUIREMENTS_MATRIX

ICT-DORA = APPLICABLE
→ + DORA_REQUIREMENTS_MATRIX

ICT-DORA = NOT APPLICABLE
→ DORA_REQUIREMENTS_MATRIX netiek aktivizēta
```

Prasību kopas izvēles governance nosaka `REQUIREMENTS_MATRIX_GOVERNANCE_v1`.

## 11. ANALYSE plūsma

```text
LEGAL INTAKE
→ LEGAL QUESTION
→ FACTS / ASSUMPTIONS / MISSING INFORMATION
→ APPLICABLE SOURCES
→ INTERPRETATIONS
→ SUPPORTING / COUNTERARGUMENTS
→ OPTIONS
→ RISKS / LIMITS
→ UNRESOLVED ISSUES
→ LAWYER REVIEW
→ OUTPUT
```

Ja ANALYSE uzdevums pats ir klasifikācijas jautājums, klasifikācijas analīze ir operācijas gala priekšmets, nevis tikai pre-processing solis.

## 12. VERIFY plūsma

```text
LEGAL INTAKE
→ APPROVED REQUIREMENTS SET(S)
→ REQUIREMENT-BY-REQUIREMENT REVIEW
→ EVIDENCE / VERIFICATION SCOPE RECORD
→ REQUIREMENT STATUS
→ REQUIRED HUMAN VERIFICATION
→ COMPLETENESS CONTROL
→ RELEASE GATE
→ OUTPUT
```

## 13. DRAFT plūsma

```text
LEGAL INTAKE
→ APPLICABLE LEGAL / INTERNAL REQUIREMENTS
→ DRAFTING OBJECTIVE
→ LEGAL BASIS / PURPOSE
→ PROPOSED TEXT
→ ALTERNATIVE ACCEPTABLE TEXT
→ DEVIATIONS / RISKS
→ LAWYER REVIEW
→ OUTPUT
```

## 14. COMPARE plūsma

```text
LEGAL INTAKE
→ IDENTIFY COMPARISON OBJECTS
→ NORMALIZE SCOPE
→ FIND MATERIAL DIFFERENCES
→ LEGAL EFFECT OF DIFFERENCES
→ APPLICABLE REQUIREMENTS
→ UNRESOLVED ISSUES
→ OUTPUT
```

## 15. EXTRACT plūsma

```text
LEGAL INTAKE, ja nepieciešams turpmākai izmantošanai
→ DEFINE EXTRACTION TARGET
→ EXTRACT
→ EVIDENCE BINDING
→ STRUCTURED OUTPUT
```

EXTRACT pats par sevi neveic juridisku klasifikāciju, ja vien tas nav skaidri definēts kā klasifikācijas ievaddatu iegūšanas solis.

## 16. Traceability minimums

Ja `LEGAL INTAKE` piemērojams, Traceability jāspēj rekonstruēt:
- CONTRACT TYPE;
- faktu profilu;
- katru LEGAL CLASSIFICATION ASSESSMENT;
- izmantotos avotus;
- QUALITATIVE LIKELIHOOD;
- cilvēka / ārējo lēmumu;
- MODULE STATUS;
- izvēlēto REQUIREMENTS SET un versiju.

## 17. Aizliegtie saīsinājumi

Nav pieļaujams:

```text
SaaS
→ therefore DORA applies

Service agreement
→ therefore outsourcing

AI says likely outsourcing
→ activate EBA matrix as final

Contract title says "Licence"
→ ignore hosted-service substance
```

## 18. Dokumenta robeža

Šis dokuments nosaka darba secību un CONTRACT TYPE taxonomy.

Tas nenosaka:
- ārējo tiesību interpretācijas metodoloģiju detalizētā līmenī;
- REQUIREMENTS SET saturu;
- REQUIREMENT LEVEL governance;
- HUMAN VERIFIED metodes;
- bankas AI datu atļaujas.

## 19. Nākamais pārskata solis

Pirms freeze jāveic kritiska pārbaude vismaz par:
- CONTRACT TYPE taxonomy granularitāti;
- jauktu līgumu reprezentāciju;
- faktu profila minimumu;
- kad klasifikācijas jautājums ir obligāts un kad nevajadzīgs;
- UNCLEAR scenārija analīzes robežu;
- administratīvo slodzi LEGAL INTAKE posmā.
