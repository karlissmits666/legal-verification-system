# OPERATION_WORKFLOWS_v1

Juridiskās pārbaudes sistēmas universālā darba plūsmu arhitektūra

**Statuss:** MELNRAKSTS — KONSOLIDĒTS v0.2 PAKETEI  
**Versija:** v0.2  
**Bāze:**  
- `PROFESSIONAL_SCOPE_v1.4` — KONSOLIDĒTS MELNRAKSTS  
- `TRACEABILITY_RECORD_v1 — Arhitektūra v0.6` — KONSOLIDĒTS MELNRAKSTS  
- `TERMINOLOGY_AND_ENUMS_v1 — v0.4` — KONSOLIDĒTS MELNRAKSTS  
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
TASK CLARIFICATION
↓
COMPETENCE CHECK
↓
AI TOOL / DATA PERMISSION GATE
↓
OBJECT IDENTIFICATION
↓
OBJECT-DEPENDENT INTAKE
↓
OPERATION WORKFLOW
↓
TRACEABILITY + RELEASE GATES
```

OBJECT = CONTRACT gadījumā:
```text
CONTRACT TYPE
↓
FACT PROFILE
↓
CANDIDATE-MODULE SCREENING
↓
SHORT INTAKE OR FULL INTAKE
↓
COMMON CONTRACT REVIEW
↓
SPECIALIZED MODULES / REQUIREMENTS SETS, ja piemērojami
```

OBJECT = QUESTION / INTERNAL POLICY / EXTERNAL SOURCE gadījumā CONTRACT TYPE nav obligāts. LCA tiek veikts tikai tad, ja pats jautājums prasa juridisku / regulatīvu klasifikāciju.

## 3. LEGAL INTAKE mērķis

`LEGAL INTAKE` atbild uz četriem atsevišķiem jautājumiem:

1. Kas ir uzdevuma objekts?
2. Ja tas ir līgums — kāda veida līgums tas ir?
3. Kādi juridiskie / regulatīvie režīmi var būt piemērojami?
4. Kuras prasību kopas pēc cilvēka vai ārēja lēmuma drīkst aktivizēt?

Tas nav pilna līguma pārbaude un neaizstāj izvēlēto operāciju.

## 4. CONTRACT TYPE lietošana

CONTRACT TYPE tehnisko taxonomy uztur `TERMINOLOGY_AND_ENUMS_v1`.

Šis dokuments nosaka tā izmantošanu darba plūsmā.

Vienam līgumam drīkst būt vairākas CONTRACT TYPE vērtības. Jaukta līguma gadījumā contract-type-specific baseline review tvērums ir visu piešķirto tipu attiecīgo elementu apvienojums.

CONTRACT TYPE:
- nav MODULE;
- nenosaka automātisku regulatīvo režīmu;
- neaktivizē specializētu REQUIREMENTS SET bez atsevišķas moduļa piemērojamības noteikšanas.

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

FACT PROFILE ir izsekojamu `FINDING` atsauču kopa, ne brīvs MI kopsavilkums.

Katram klasifikācijai materiālam faktam jābūt identificējamai izcelsmei:
- biznesa / lietotāja deklarēts ievaddats;
- AI no dokumenta izgūts FINDING ar EVIDENCE BINDING;
- jurista konstatējums ar avota atsauci;
- pieņēmums (`ASSUMPTION = true`);
- trūkstošs fakts / UNRESOLVED ISSUE.

Ja materiāls FINDING ir `ASSUMPTION = true`, QUALITATIVE LIKELIHOOD nevar būt LIKELY vai UNLIKELY, kamēr pilnvarots cilvēks pieņēmumu nav tieši pieņēmis un fiksējis lēmumā. Citādi — INDETERMINATE.

## 6.1. CANDIDATE-MODULE SCREENING

Candidate-module screening notiek tikai pret `MODULE_TRIGGER_REGISTRY_v1` ACTIVE trigger set.

Katram screening saglabā `MODULE SCREENING RECORD`:
```text
SCREENED MODULES
TRIGGER REGISTRY VERSION
TRIGGERS IDENTIFIED
SCREENED BY
SCREENED AT
```

`TRIGGERS IDENTIFIED = []` nozīmē apzinātu negatīvu screening rezultātu tikai tad, ja pārbaudīts viss attiecīgās versijas trigger saraksts.

Negatīvs screening rezultāts nav `MODULE STATUS = NOT APPLICABLE`.

Ja modulim nav ACTIVE trigger set:
```text
SHORT PATH UNAVAILABLE
→ FULL LCA, ja moduļa relevance jāizvērtē
```

## 6.2. SHORT INTAKE

SHORT INTAKE drīkst izmantot, ja:
- līgums ir identificēts;
- FACT PROFILE ir pietiekams screening veikšanai;
- attiecīgajiem screening moduļiem ir ACTIVE trigger set;
- nav identificēts trigger;
- nav citas zināmas neskaidrības, kas prasītu FULL LCA.

SHORT INTAKE rezultāts:
- CONTRACT TYPE;
- FACT PROFILE refs;
- MODULE SCREENING RECORD;
- HUMAN DECISION ieraksts, kura RELATED OBJECT ir MODULE SCREENING RECORD;
- COMMON CONTRACT REVIEW.

## 6.3. FULL INTAKE

FULL INTAKE obligāts, ja:
- identificēts vismaz viens trigger;
- klasifikācija ir neskaidra;
- jaukts / neparasts līgums materiāli ietekmē regulatīvo režīmu;
- trūkstošs fakts var mainīt moduļa piemērojamību;
- lietotājs uzdod klasifikācijas jautājumu;
- iekšējs noteikums prasa pilnu klasifikāciju;
- modulim nav ACTIVE trigger set.

FULL INTAKE ietver LCA un attiecīgās autoritātes lēmumu.

ICT-DORA gadījumā jurista IKT pakalpojuma juridiskā klasifikācija ir obligāts ievaddats MODULE STATUS lēmumam. Moduļa apstiprinošā funkcija nepārraksta juridisko kvalifikāciju; domstarpība izraisa ESCALATION REQUIRED.

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

## 9.1. UNCLEAR un scenārija analīze

MODULE = UNCLEAR bloķē tikai tos rezultātus, kuri pieņem moduļa piemērojamību kā faktu.

COMMON CONTRACT REVIEW turpinās.

Scenārija analīzes REQUIREMENT RESULT:
```text
scenario_only = true
```

Šādi rezultāti:
- ir tikai hipotētiski;
- vienmēr formulējami nosacīti;
- nemantojas kā actual rezultāti;
- nepakļaujas HUMAN VERIFIED minimumam;
- ja modulis kļūst APPLICABLE, tiek radīti jauni actual rezultāti.

## 10. REQUIREMENTS SET izvēle

REQUIREMENTS SET tiek izvēlēts tikai pēc moduļa statusa.

Piemērs:

```text
COMMON CONTRACT REVIEW
→ OBLIGĀTS visiem CONTRACT objektiem; nav vārtēts ar specializētu klasifikāciju

OUTSOURCING-EBA = APPLICABLE
→ + EBA_REQUIREMENTS_MATRIX

ICT-DORA = APPLICABLE
→ + DORA CIF-INDEPENDENT REQUIREMENTS SET uzreiz

ICT-DORA = APPLICABLE
+ CIF STATUS = CRITICAL / IMPORTANT
→ + attiecīgā CIF-DEPENDENT critical/important DORA requirements set

ICT-DORA = APPLICABLE
+ CIF STATUS = NOT CRITICAL / IMPORTANT
→ + attiecīgā CIF-DEPENDENT non-critical DORA requirements set

ICT-DORA = APPLICABLE
+ CIF STATUS = NOT YET DETERMINED
→ CIF-INDEPENDENT SET turpinās
→ HUMAN INPUT REQUIRED tikai CIF-DEPENDENT daļai

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

## 15.1. RECLASSIFICATION TRIGGER

Obligāts reclassification review tiek ierosināts, ja:
a) mainās FINDING, uz kuru atsaucas spēkā esošais LCA; vai
b) rodas jauns FINDING, kas skar kādu no attiecīgā MODULE TRIGGER SET tēmām.

MODULE TRIGGER SET šeit kalpo tikai kā atbilstības filtrs.

Materialitāti izvērtē cilvēks un rezultātu fiksē HUMAN DECISION ar DECISION TYPE = reclassification_materiality arī tad, ja izmaiņa nav materiāla.

Ja izmaiņa ir materiāla:
- saglabā iepriekšējo LCA un lēmumu;
- izveido jaunu LCA / lēmumu;
- pārvērtē MODULE STATUS;
- pārvērtē REQUIREMENTS SET selection;
- uz vecās klasifikācijas balstītie requirement results tiek saglabāti kā vēsturiski, bet atzīmēti kā vairs neaktuāli klasifikācijas bāzei;
- skartās prasības tiek pārbaudītas no jauna.

## 16. Traceability minimums

Ja `LEGAL INTAKE` piemērojams, Traceability jāspēj rekonstruēt:
- CONTRACT TYPE;
- FACT PROFILE FINDING refs;
- MODULE SCREENING RECORDS;
- katru LEGAL CLASSIFICATION ASSESSMENT;
- izmantotos avotus;
- QUALITATIVE LIKELIHOOD;
- cilvēka / ārējo lēmumu;
- MODULE STATUS;
- izvēlēto REQUIREMENTS SET, versiju un SELECTION CONDITIONS versiju;
- materiālajā output: SCREENED MODULES, TRIGGER SET ID/VERSION, SCREENING RESULT un MSR ID; SCREENED BY / AT paliek izsekojamībā.

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
