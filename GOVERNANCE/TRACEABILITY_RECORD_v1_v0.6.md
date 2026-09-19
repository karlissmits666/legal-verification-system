# TRACEABILITY_RECORD_v1

Bankas juridiskā darba izsekojamības ieraksta arhitektūra

**Statuss:** MELNRAKSTS — KONSOLIDĒTS v0.2 PAKETEI  
**Versija:** Arhitektūra v0.6  
**Bāze:** `PROFESSIONAL_SCOPE_v1.4` — MELNRAKSTS; `TRACEABILITY_RECORD_v1 v0.5` — IESALDĒTA PAMATVERSIJA

## 1. Mērķis

`TRACEABILITY_RECORD_v1` definē standartizētu izsekojamības modeli AI atbalstītam juridiskajam darbam. Tam jāļauj rekonstruēt uzdevumu, izmantotos avotus, būtiskos AI secinājumus, pierādījumus, verifikācijas aktus, cilvēka lēmumus, neatrisinātos jautājumus, eskalācijas un izdoto materiālo rezultātu.

Izsekojamības ieraksts (`Traceability Record`) nav juridiskais atzinums, pilns lietas fails vai `LEGAL APPROVED` mehānisms.

## 2. Glabāšanas vieta

Izsekojamības ieraksts tiek glabāts attiecīgā juridiskā uzdevuma Legora projekta vidē.

Pilnais pierādījuma (`evidence`) fragments netiek dublēts izsekojamības ierakstā. Tas dzīvo atsevišķā strukturētā pierādījumu glabātuvē; Izsekojamības ieraksts satur noturīgu atsauci uz evidence objektu. Cilvēka veiktais pārbaudes tvērums neesamības un negatīvu prasību gadījumā tiek glabāts atsevišķā `VERIFICATION SCOPE RECORD`, kas nav `EVIDENCE OBJECT`.

## 3. Ģenerēšanas brīdis

Izsekojamības ieraksts tiek sagatavots un finalizēts pirms materiāla rezultāta izdošanas.

Darba gaitā metadati drīkst tikt uzkrāti darba artefaktos. Materiāls output netiek izlaists, kamēr nav izpildīti piemērojamie izdošanas vārti.

## 4. Centrālā vienība

Centrālā vienība ir `TASK`.

```text
TASK
├── CLASSIFICATION
├── CONTRACT TYPE                     [ja piemērojams]
├── LEGAL CLASSIFICATION ASSESSMENTS  [ja piemērojams]
├── MODULE SCREENING RECORDS          [ja piemērojams]
├── MODULE TRIGGER SET REFERENCES     [ja piemērojams]
├── MODULES
├── AI GOVERNANCE
├── SOURCES
├── FINDINGS
├── EVIDENCE REFERENCES
├── REQUIREMENTS SET          [ja piemērojams]
├── REQUIREMENT RESULTS       [ja piemērojams]
│   └── REQUIREMENT COMPONENTS
├── VERIFICATION EVENTS
├── VERIFICATION SCOPE RECORDS
├── HUMAN DECISIONS
├── ESCALATIONS
├── UNRESOLVED ISSUES
├── OUTPUTS
└── LEGAL STATUS REFERENCE
```

## 5. Identifikatoru princips

Identifikatori ir necaurspīdīgi un neiekodē savstarpējās attiecības.

Piemēri: `TASK-0042`, `SRC-0184`, `MOD-0006`, `FND-0071`, `REQ-0038`, `CMP-0082`, `EVD-0160`, `VER-0027`, `VSR-0011`, `LCA-0012`, `MSR-0007`, `DEC-0014`, `ESC-0009`, `ISS-0010`, `OUT-0031`.

Saistības glabā laukos, nevis ID.

### 5.1. Piesprausta izsekojamības objekta atsauce

Atsauce tiek glabāta vienā no diviem režīmiem.

INTRA-RECORD REFERENCE:
```text
OBJECT TYPE
OBJECT ID
```

TRACE RECORD ID un RECORD VERSION tiek mantoti no containing immutable record versijas un netiek glabāti atkārtoti.

CROSS-RECORD REFERENCE:
```text
TRACE RECORD ID
RECORD VERSION
OBJECT TYPE
OBJECT ID
```

Cross-record režīmā visi četri lauki ir obligāti.

OBJECT TYPE izmanto T&E §25 reģistrētu TRACE OBJECT TYPE.
OBJECT ID prefiksam jāatbilst OBJECT TYPE prefiksam T&E §26.
OBJECT ID vērtība ir tā vērtība, kas target objekta owner shēmā glabāta T&E §30.1 šim OBJECT TYPE reģistrētajā ID FIELD NAME laukā.
Target objektam jāeksistē attiecīgajā record versijā.

Nepilnīga cross-record reference ir INVALID.
Atsauce uz current, latest vai citu kustīgu mērķi nav derīga.

Governance dokuments, ko TASK faktiski izmanto, tiek reģistrēts kā SOURCE; tam neievieš atsevišķu governance-artifact references klasi.


## 6. Uzdevuma ieraksts (`TASK RECORD`)

Obligāti:

```text
TASK ID
CREATED AT
RESPONSIBLE LAWYER
OPERATION
OBJECT
CONTRACT TYPE                    [ja OBJECT = CONTRACT]
FACT PROFILE FINDING IDS          [ja piemērojams]
MODULE SCREENING RECORD IDS       [ja piemērojams]
ACTIVE MODULES
AI USED
AI USE DECLARED BY
AI USE DECLARED AT
AI TOOL                            [obligāts, ja AI USED = true]
AI/MODEL VERSION                   [obligāts, ja AI USED = true]
AI TOOL USAGE POLICY VERSION       [obligāts, ja AI USED = true]
```

TASK līmeņa `DECLARED DATA CLASSES` ir visu SOURCE ierakstu datu klašu atvasināta kopa.

`AI USED` ir boolean. `AI USE DECLARED BY` un `AI USE DECLARED AT` dokumentē deklarācijas autoru un laiku.

```text
IF AI USED = false
THEN AI TOOL, AI/MODEL VERSION AND AI TOOL USAGE POLICY VERSION MUST BE ABSENT

IF AI USED = true
THEN AI TOOL, AI/MODEL VERSION AND AI TOOL USAGE POLICY VERSION ARE REQUIRED
AND THE PERMISSION GATE REMAINS FAIL-CLOSED
```

AI neizmantošanu nedrīkst aizvietot ar `NOT ESTABLISHED`, `N/A`, `TBD`, tukšu obligāto lauku vai citu ad hoc placeholder. Ja `AI USED = true`, trūkstoša vai neapstiprināta permission autoritāte netiek maskēta ar placeholder un piemēro `BLOCK`.

Ja AI ir izmantots un platforma neatklāj modeļa versiju:

```text
MODEL VERSION: NOT EXPOSED BY PLATFORM
```

## 7. Uzdevuma klasifikācija

```text
OPERATION:
ANALYSE / VERIFY / DRAFT / COMPARE / EXTRACT

OBJECT:
QUESTION / CONTRACT / CLAUSE / INTERNAL POLICY /
EXTERNAL SOURCE / DOCUMENT SET
```

Ja klasifikācija nav viennozīmīga: `TASK CLARIFICATION REQUIRED`.

## 7.1. Juridiskās klasifikācijas izvērtējums (`LEGAL CLASSIFICATION ASSESSMENT`)

`LEGAL CLASSIFICATION ASSESSMENT` ir strukturēts profesionālās analīzes objekts, kas dokumentē sistēmas vai jurista argumentētu izvērtējumu par iespējamu juridisku vai regulatīvu klasifikāciju.

Tas nav gala `MODULE STATUS`, nav `LEGAL APPROVED` un pats par sevi neaktivizē prasību kopu.

Minimāli:

```text
LEGAL CLASSIFICATION ASSESSMENT ID
TASK ID
CLASSIFICATION QUESTION
CLASSIFICATION TARGET
CONTRACT TYPE REFERENCES           [ja piemērojams]
RELEVANT FACT FINDING REFERENCES
MATERIAL ASSUMPTION FINDING REFERENCES [ja piemērojams]
SUPPORTING SOURCE REFERENCES
SUPPORTING ARGUMENTS
COUNTERVAILING SOURCE REFERENCES
COUNTERARGUMENTS
UNCERTAINTIES
MISSING INFORMATION
QUALITATIVE LIKELIHOOD
AUTHORITY REQUIRED
PROPOSED CLASSIFICATION
CREATED BY
CREATED AT
HUMAN DECISION REFERENCE           [ja pieejama]
RELATED MODULE ID
CLASSIFICATION BASIS VERSION
SUPERSEDES LCA ID                   [ja piemērojams]
RECLASSIFICATION REVIEW DECISION ID [DECISION TYPE = reclassification_materiality; ja piemērojams]
```

`CREATED BY` drīkst būt AI rīks vai cilvēks. Tas nepadara objektu par cilvēka lēmumu.

Ja klasifikācijai nepieciešams cilvēka gala lēmums, tas tiek glabāts atsevišķā `HUMAN DECISION RECORD` vai attiecīgā moduļa `CONFIRMED BY` laukā.

Kvalitatīvais varbūtības novērtējums ir analīzes metadats, ne gala juridiskais statuss. Tā vērtības nosaka `LEGAL_RESEARCH_METHOD_v1` un reģistrē `TERMINOLOGY_AND_ENUMS_v1`.

## 7.2. Moduļa screening ieraksts (`MODULE SCREENING RECORD`)

`MODULE SCREENING RECORD` dokumentē candidate-module screening pret konkrētu apstiprināta trigger reģistra versiju.

Minimāli:

```text
MODULE SCREENING RECORD ID
TASK ID
SCREENED MODULES
TRIGGER REGISTRY ID
TRIGGER REGISTRY VERSION
TRIGGERS IDENTIFIED               [array; [] = apzināts negatīvs rezultāts]
TRIGGERS NOT IDENTIFIED WITH SUPPORTING FINDING
                                  [map: trigger id → FINDING ID; obligāts negatīvi formulētiem triggeriem]
SCREENED BY
SCREENED AT
RELATED FACT FINDING IDS
SCREENING DECISION ID              [HUMAN DECISION]
```

Screening apstiprinājums netiek ieviests kā jauns lēmuma tips. Tas ir `HUMAN DECISION`, kura `RELATED TRACE OBJECT REFERENCES` ietver piespraustu atsauci uz konkrēto `MODULE SCREENING RECORD ID`.

`TRIGGERS IDENTIFIED = []` ir derīgs tikai tad, ja visi attiecīgās versijas triggeri ir pārbaudīti. Missing / null lauks nav negatīvs screening rezultāts.

MODULE SCREENING RECORD nav MODULE STATUS un neaizvieto LEGAL CLASSIFICATION ASSESSMENT, ja trigger ir identificēts.

## 8. Moduļa ieraksts (`MODULE RECORD`)

Katram modulim:

```text
MODULE ID
MODULE
CONTRACT TYPE, ja izmaiņa maina juridisko kvalifikāciju vai piemērojamību
LEGAL CLASSIFICATION ASSESSMENT, ja mainās materiāls klasifikācijas secinājums
MODULE STATUS
APPLICABILITY AUTHORITY
PROPOSED BY          [ja piemērojams]
CONFIRMED BY         [ja piemērojams]
CONFIRMATION DATE    [ja piemērojams]
SOURCE / REFERENCE
CLASSIFICATION ASSESSMENT REFERENCES [ja piemērojams]
```

`LEGAL CLASSIFICATION ASSESSMENT, ja mainās materiāls klasifikācijas secinājums` ir nosacījuma/semantikas piezīme, ne atsevišķs persistēts relationship lauks un ne §5.1 reference. Vienīgā persistētā MODULE → LCA saite ir `CLASSIFICATION ASSESSMENT REFERENCES`, kas izmanto §5.1 reference uz konkrētu LCA objektu.

`MODULE ID` ir instances necaurspīdīgais identifikators ar `MOD-` prefiksu. `MODULE` ir atsevišķa canonical taxonomy vērtība. Vienas instances `MODULE ID` tiek saglabāts nemainīgs starp Traceability Record versijām; materiāla jauna instance saņem jaunu ID.

Kanoniskās `MODULE STATUS` vērtības:
```text
APPLICABLE / NOT APPLICABLE / UNCLEAR
```

Kanoniskās `APPLICABILITY AUTHORITY` vērtības:
```text
SYSTEM PROPOSAL ONLY
HUMAN CONFIRMATION REQUIRED
EXTERNAL INPUT ONLY
RULE-BASED DETERMINATION
```

## 9. Avotu reģistrs (`SOURCE REGISTER`)

Katram izmantotajam avotam:

```text
SOURCE ID
SOURCE TYPE
TITLE
DATA CLASS
DATA CLASS DECLARED AT
OWNER / AUTHORITY
VERSION                         [ja pieejama]
DOCUMENT DATE                   [ja pieejama]
EFFECTIVE DATE                  [ja pieejama]
FILE NAME                       [ja piemērojams]
RECEIVED AT                     [ja piemērojams]
RECEIVED FROM                   [ja piemērojams]
DOCUMENT MANAGEMENT REFERENCE   [ja pieejama]
CONTENT HASH ALGORITHM          [obligāts, ja CONTENT HASH ir pieejams]
CONTENT HASH                    [ja tehniski pieejams]
LOCATION / REFERENCE
PERMISSION STATUS
PERMISSION CHECKED AT
```

Ja `CONTENT HASH` ir norādīts, `CONTENT HASH ALGORITHM` ir obligāts un izmanto `TERMINOLOGY_AND_ENUMS_v1` kontrolētu vērtību. Ja `CONTENT HASH` nav norādīts, `CONTENT HASH ALGORITHM` nav norādāms.

## 10. Avota tips (`SOURCE TYPE`)

SOURCE TYPE nav juridisks statuss. Piemēri:

```text
INTERNAL POLICY
INTERNAL PROCEDURE
CONTRACT
CONTRACT ANNEX
CHECKLIST
TEMPLATE
EXTERNAL LEGAL SOURCE
REGULATORY GUIDANCE
CASE LAW
CORRESPONDENCE
PRIOR TASK OUTPUT
OTHER
```

## 11. Neversētu dokumentu identitāte

Ja dokumentam nav VERSION vai EFFECTIVE DATE, konkrēto redakciju identificē ar pietiekamu kombināciju no:

```text
FILE NAME
RECEIVED AT
RECEIVED FROM
DOCUMENT MANAGEMENT REFERENCE
CONTENT HASH ALGORITHM
CONTENT HASH
```

Ja redakciju nevar pietiekami identificēt, tiek radīts `UNRESOLVED ISSUE`.

## 12. Datu klase (`DATA CLASS`) pieder avotam (`SOURCE`)

DATA CLASS tiek deklarēta katram SOURCE pirms AI apstrādes, kur tas tehniski iespējams.

```text
SOURCE ADDED
→ DATA CLASS DECLARATION
→ PERMISSION CHECK
→ AI PROCESSING
```

Ja jebkuram SOURCE ir `NOT ALLOWED` vai `PERMISSION UNKNOWN`, piemēro `BLOCK`.

## 13. Datu klases notikums (`DATA CLASS EVENT`)

Ja konstatēta iespējama neatbilstība:

```text
DATA CLASS EVENT
EVENT ID
SOURCE ID
DECLARED CLASS
SUSPECTED CLASS
DETECTED AT
DETECTED BY
PERMISSION STATUS: DATA CLASS MISMATCH SUSPECTED
SUSPENSION STATES: BLOCK + HUMAN CONFIRMATION REQUIRED
RESOLVED BY
RESOLVED AT
RESOLUTION REFERENCE
```

Sistēma identificē visus jau radītos `FINDINGS`, `REQUIREMENT RESULTS` un `OUTPUTS`, kas ir atkarīgi no attiecīgā SOURCE, un sasaista tos ar DATA CLASS EVENT.

`BLOCK` attiecas uz visa TASK materiālo rezultātu. Pēc cilvēka lēmuma vēsturē paliek redzams, kuri secinājumi radīti pirms neatbilstības atrisināšanas.

DATA CLASS EVENT izraisa jaunu izsekojamības ieraksta versiju.

## 14. Iepriekšēja uzdevuma rezultāts (`PRIOR TASK OUTPUT`) kā avots

Ja viena TASK materiāls rezultāts kļūst par citas TASK ievaddatu:

```text
SOURCE TYPE: PRIOR TASK OUTPUT
ORIGIN TASK REFERENCE            [full cross-record TRACE OBJECT REFERENCE]
ORIGIN OUTPUT REFERENCE          [full cross-record TRACE OBJECT REFERENCE]
ORIGIN OBJECT REFERENCE          [full cross-record TRACE OBJECT REFERENCE; ja piemērojams]
INHERITED VERIFICATION LEVEL
```

ORIGIN TASK REFERENCE.OBJECT TYPE = TASK.
ORIGIN OUTPUT REFERENCE.OBJECT TYPE = OUTPUT.
Visas trīs references satur izcelsmes TRACE RECORD ID un RECORD VERSION.

Mantotais verification level tiek iegūts tieši no norādītās izcelsmes versijas un netiek paaugstināts ar nodošanu citam uzdevumam.

To var paaugstināt tikai jauns VERIFICATION EVENT attiecībā uz konkrēto apgalvojumu.


## 15. Atradums (`FINDING`)

Katram būtiskam AI secinājumam:

```text
FINDING ID
STATEMENT
SOURCE IDS
EVIDENCE IDS
ANALYSIS / INTERPRETATION
VERIFICATION LEVEL
RELATED REQUIREMENT          [ja piemērojams]
RELATED OUTPUT
DATA CLASS EVENT REFERENCES  [ja piemērojams]
VERIFICATION SCOPE RECORD IDS [ja piemērojams]
```

FINDING nav cilvēka juridiskais lēmums.

## 16. Atraduma (`FINDING`) izmantošana operācijās

```text
ANALYSE  → FINDINGS
VERIFY   → REQUIREMENT RESULTS + FINDINGS papildu secinājumiem
COMPARE  → FINDINGS par atšķirībām
EXTRACT  → FINDINGS par iegūtiem faktiem / prasībām
DRAFT    → FINDINGS par juridisko pamatu un būtiskiem redakcijas izstrādes apsvērumiem
```

## 17. Pierādījuma objekts (`EVIDENCE OBJECT`)

Pierādījuma objektam minimāli:

```text
EVIDENCE ID
SOURCE ID
LOCATION
EXACT QUOTED FRAGMENT
RELATED FINDING / REQUIREMENT / COMPONENT
EVIDENCE STORE REFERENCE
EVIDENCE SET / REVIEW ID
GENERATED AT
```

`EXACT QUOTED FRAGMENT` satur tikai secinājumam nepieciešamo operatīvo tekstu, nevis visu dokumentu vai nevajadzīgi lielu sadaļu.

Ja secinājums atkarīgs no definīcijas, cross-reference, annex vai cita fragmenta, arī tie tiek saglabāti kā atsevišķi evidence objekti.

## 18. Pierādījuma noturības invarianti

Derīgs `EVIDENCE ID` ir:

1. noturīgs — ID nemainās darba artefakta pārģenerēšanas dēļ;
2. nepārrakstāms klusējot — materiāls labojums rada jaunu evidence objektu;
3. saglabājams vismaz tikpat ilgi, cik Traceability Record, kas uz to atsaucas.

Ja pierādījumu glabātuve šos nosacījumus nenodrošina, `EVIDENCE BINDING` ir nepilnīgs. Materiāls rezultāts tiek bloķēts un `HUMAN VERIFIED` netiek piešķirts vai izmantots izdošanai. Prasības statuss netiek automātiski mainīts. Cilvēka semantiskā verifikācija šo noturīguma defektu neaizstāj.

## 19. Pierādījuma un interpretācijas nodalījums

`EVIDENCE` atbild: “Ko tieši avotā sistēma izmantoja?”

`ANALYSIS / INTERPRETATION` atbild: “Ko šis saturs nozīmē konkrētajam juridiskajam secinājumam?”

Abi tiek glabāti atsevišķi.

## 20. Izsekojamības atsauce uz pierādījumu

Izsekojamības ieraksts neglabā pilnu quoted fragment. Tas glabā:

```text
EVIDENCE STORE REFERENCE
EVIDENCE SET / REVIEW ID
GENERATED AT
EVIDENCE IDS
```

## 20.1. Verifikācijas tvēruma ieraksts (`VERIFICATION SCOPE RECORD`)

`VERIFICATION SCOPE RECORD` nav `EVIDENCE OBJECT`. Tas dokumentē cilvēka semantiskās verifikācijas laikā faktiski pārbaudīto avotu kopu gadījumos, kad secinājums ir par neesamību, avotu kopas sastāvu vai negatīvu prasību.

Minimāli:

```text
VERIFICATION SCOPE RECORD ID
SOURCE SET REFERENCE
INCLUDED SOURCES
EXCLUDED / UNAVAILABLE SOURCES
SCOPE BASIS
REVIEWED AT
REVIEWED BY
RELATED FINDING / REQUIREMENT / COMPONENT
```

Objektam jābūt noturīgam, nepārrakstāmam klusējot un saglabājamam vismaz tikpat ilgi, cik Traceability Record, kas uz to atsaucas.

`VERIFICATION SCOPE RECORD` nevar izmantot, lai aizvietotu trūkstošu `EVIDENCE OBJECT` satura secinājumam.

## 21. Prasību kopas ieraksts (`REQUIREMENTS SET RECORD`)

Ja tiek izmantota prasību matrica:

```text
REQUIREMENTS SET ID
REQUIREMENTS SET VERSION
EFFECTIVE DATE
APPROVED BY
LAST REVIEW DATE
```

Ieraksts identificē izmantoto kopu; tas pats par sevi nepierāda, ka kopa ir pilnīga pret visu spēkā esošo regulējumu.

## 22. Prasības rezultāta ieraksts (`REQUIREMENT RESULT RECORD`)

```text
REQUIREMENT ID
REQUIREMENT LEVEL
GOVERNANCE STATUS
REQUIREMENT TYPE
REQUIREMENT STATUS
VERIFICATION LEVEL
REQUIREMENT SOURCE
EVIDENCE IDS
ANALYSIS / INTERPRETATION
DATA CLASS EVENT REFERENCES  [ja piemērojams]
SCENARIO ONLY                [true / false]
CLASSIFICATION BASIS REFERENCES [LCA / MODULE DECISION, ja piemērojams]
CLASSIFICATION BASIS CURRENT [true / false, ja piemērojams]
SUPERSEDED BY RESULT ID      [ja piemērojams]
```

## 22.1. Scenārija un aizstātas klasifikācijas rezultāti

Ja `SCENARIO ONLY = true`:
- rezultāts ir hipotētisks un nav actual requirement result;
- to nedrīkst mantot citā TASK kā faktisku rezultātu;
- vēlākai faktiskai piemērojamībai rada jaunu REQUIREMENT RESULT.

Ja klasifikācija tiek aizstāta materiāla FACT PROFILE maiņas dēļ:
- vecais rezultāts paliek vēsturē;
- `CLASSIFICATION BASIS CURRENT = false`;
- ja radīts jauns rezultāts, norāda `SUPERSEDED BY RESULT ID`;
- vecais rezultāts nedrīkst tikt attēlots kā aktuālais gala rezultāts.

## 23. `REQUIREMENT LEVEL` / `GOVERNANCE STATUS` nosacījumu shēma

Kanoniskie juridiskie `REQUIREMENT LEVEL`:

```text
MANDATORY EXTERNAL
MANDATORY INTERNAL
NEGOTIABLE
```

Canonical `GOVERNANCE STATUS`:
```text
UNCLASSIFIED
```

Mašīnvalidējami starplauku invarianti:

```text
IF GOVERNANCE STATUS = UNCLASSIFIED
THEN REQUIREMENT LEVEL MUST BE UNSET

IF GOVERNANCE STATUS != UNCLASSIFIED
THEN REQUIREMENT LEVEL MUST CONTAIN EXACTLY ONE OF:
  MANDATORY EXTERNAL
  MANDATORY INTERNAL
  NEGOTIABLE
```

Derīgas kombinācijas:

```text
UNCLASSIFIED + empty level     → valid
no UNCLASSIFIED + one level    → valid
UNCLASSIFIED + populated level → invalid
no UNCLASSIFIED + empty level  → invalid
```

Tukšs REQUIREMENT LEVEL nav jauns statuss.

## 24. Prasības tips (`REQUIREMENT TYPE`)

```text
POSITIVE / NEGATIVE
```

## 25. Prasības statuss (`REQUIREMENT STATUS`)

```text
IZPILDĪTS / NAV IZPILDĪTS / NAV PIERĀDĪTS
```

Citas vērtības netiek ieviestas.

## 26. Verifikācijas līmenis (`VERIFICATION LEVEL`)

```text
EVIDENCE BOUND — AI PROPOSED
HUMAN VERIFIED
```

## 27. Salikta prasība

```text
REQUIREMENT
├── COMPONENT
├── COMPONENT
└── COMPONENT
```

Katram komponentam:

```text
COMPONENT ID
COMPONENT DESCRIPTION
COMPONENT STATUS
EVIDENCE IDS
VERIFICATION LEVEL
```

`COMPONENT DESCRIPTION` nāk no apstiprinātās prasību bāzes, nevis AI interpretācijas.

## 28. Saliktas prasības agregācija

Augstākā līmeņa `REQUIREMENT STATUS` tiek agregēts deterministiski:

```text
visi komponenti IZPILDĪTS
→ IZPILDĪTS

vismaz viens komponents NAV IZPILDĪTS
→ NAV IZPILDĪTS

pārējos gadījumos
→ NAV PIERĀDĪTS
```

## 29. Saliktas prasības verifikācija

Augstākā līmeņa prasība nekļūst `HUMAN VERIFIED` tikai tādēļ, ka verificēti atsevišķi komponenti.

Parent `HUMAN VERIFIED` prasa `VERIFICATION EVENT`, kas aptver gala secinājumu un visus statusu noteicošos komponentus.

## 30. Verifikācijas notikums (`VERIFICATION EVENT`)

```text
VERIFICATION EVENT ID
TARGET OBJECT ID
TARGET OBJECT TYPE
VERIFICATION METHODS                 [1..n]
VERIFICATION SCOPE
VERIFIED BY
VERIFIED AT
RESULT
RESULTING VERIFICATION LEVEL
SOURCE / EVIDENCE REFERENCES
VERIFICATION SCOPE RECORD REFERENCES [ja piemērojams]
NOTES                                [ja nepieciešams]
```

Verifikācijas vēsture netiek klusējot pārrakstīta.

## 31. Verifikācijas vēsture

Verifikācijas līmenis pieaug tikai ar faktisku verifikācijas aktu.

Piemērs:

```text
T1: FND-0042 → EVIDENCE BOUND — AI PROPOSED
T2: VERIFICATION EVENT VER-0017
T3: FND-0042 → HUMAN VERIFIED
```

## 32. Prasību verifikācijas izdošanas vārti

Šis vārti attiecas tikai uz prasībām, kurām frozen `PROFESSIONAL_SCOPE_v1.4` 16.3. slieksnis prasa `HUMAN VERIFIED`.

Tas nav universāls vārti visiem `FINDING`.

Ja kāda piemērojamā prasība ir:
- `MANDATORY EXTERNAL`;
- `MANDATORY INTERNAL`;
- `GOVERNANCE STATUS = UNCLASSIFIED`; vai
- jebkura `NEGATIVE REQUIREMENT`;

un tā vēl ir `EVIDENCE BOUND — AI PROPOSED`, tad piemēro `HUMAN VERIFICATION REQUIRED` un materiāls rezultāts netiek izlaists.

`UNCLASSIFIED` vienlaikus prasa cilvēka verifikāciju pēc šī punkta un saglabā atsevišķo 33. punkta blocking gate. Verifikācija ir nepieciešama, bet nav pietiekama klasifikācijas bloķējuma noņemšanai.

ANALYSE / EXTRACT / COMPARE FINDING drīkst būt `EVIDENCE BOUND — AI PROPOSED`, ja uz to neattiecas cits obligāts human-verification noteikums.

## 33. `UNCLASSIFIED` izdošanas vārti

Ja `GOVERNANCE STATUS = UNCLASSIFIED`, prasība nav uzskatāma par klasificētu un materiāls rezultāts netiek izlaists, kamēr klasifikācija nav veikta REQUIREMENTS_MATRIX pārvaldībā.

AI konkrētā TASK ietvaros nedrīkst izvest prasību no `UNCLASSIFIED`.

## 34. Pamatieraksts (`CORE RECORD`)

Obligāts katram materiālam uzdevumam:

```text
TASK
CLASSIFICATION
AI GOVERNANCE
SOURCE-LEVEL DATA CLASSES
MODULES
SOURCES
FINDINGS
EVIDENCE REFERENCES
VERIFICATION SCOPE RECORD REFERENCES  [ja piemērojams]
UNRESOLVED ISSUES
ESCALATIONS
HUMAN DECISIONS
OUTPUTS
LEGAL STATUS REFERENCE
```

`AI GOVERNANCE` ietver `AI USED`, `AI USE DECLARED BY`, `AI USE DECLARED AT` un, tikai ja `AI USED = true`, 6. punktā noteiktos AI rīka, modeļa un politikas laukus.

## 35. Paplašinātais ieraksts (`EXTENDED RECORD`)

Papildus uz prasībām balstītos uzdevumos:

```text
REQUIREMENTS SET
REQUIREMENT RESULTS
REQUIREMENT COMPONENTS
COMPLETENESS CONTROL
REQUIREMENT-LEVEL VERIFICATION EVENTS
VERIFICATION SCOPE RECORDS             [ja piemērojams]
```

## 36. Cilvēka lēmuma ieraksts (`HUMAN DECISION RECORD`)

```text
DECISION ID
DECISION
DECIDED BY
ROLE
DATE
BASIS
RELATED FINDING
RELATED REQUIREMENT
RELATED ISSUE
RELATED TRACE OBJECT REFERENCES  [ja piemērojams]
ASSIGNMENT AUTHORITY BASIS SOURCE REFERENCE
  [obligāts, ja HUMAN DECISION tiek izmantots kā action owner vai resolution authority assignment pamats]
```

AI nekad nav DECIDED BY.

RELATED TRACE OBJECT REFERENCES = vienīgais autoritatīvais attiecību avots.

RELATED FINDING, RELATED REQUIREMENT un RELATED ISSUE = compatibility views.

Ja kāds compatibility view ir aizpildīts, RELATED TRACE OBJECT REFERENCES obligāti satur tieši atbilstošu typed reference.

Ja compatibility view konfliktē ar RELATED TRACE OBJECT REFERENCES, HUMAN DECISION RECORD ir INVALID.

ASSIGNMENT AUTHORITY BASIS SOURCE REFERENCE ir §5.1 reference ar target SOURCE.


## 37. Eskalācijas ieraksts (`ESCALATION RECORD`)

```text
ESCALATION ID
ISSUE
REASON
TARGET FUNCTION
SUSPENSION STATE
ESCALATION REFERENCE
RESPONSE REFERENCE
```

SUSPENSION STATE drīkst izmantot tikai frozen vērtības.

## 38. Neatrisināta jautājuma ieraksts (`UNRESOLVED ISSUE RECORD`)

```text
ISSUE ID
DESCRIPTION
IMPACT
RELATED TRACE OBJECT REFERENCES
REQUIRED ACTION
ACTION OWNER
ACTION OWNER BASIS REFERENCE
RESOLUTION AUTHORITY KNOWN
RESOLUTION AUTHORITY                  [obligāts, ja RESOLUTION AUTHORITY KNOWN = true]
RESOLUTION AUTHORITY BASIS REFERENCE  [obligāts, ja RESOLUTION AUTHORITY KNOWN = true]
```

Atsevišķs Issue Status netiek ieviests.

RELATED TRACE OBJECT REFERENCES satur vienu vai vairākas §5.1 noteiktās references.

ACTION OWNER ir persona, loma vai organizatoriska funkcija, kas uzņēmusies vai ar autoritatīvu pamatu ir saņēmusi pienākumu izpildīt REQUIRED ACTION. TASK atbildīgais jurists nekļūst par ACTION OWNER automātiski.

ACTION OWNER BASIS REFERENCE un RESOLUTION AUTHORITY BASIS REFERENCE ir §5.1 references ar atļautiem target tipiem:

```text
SOURCE
HUMAN DECISION
```

Ja ACTION OWNER BASIS REFERENCE vai RESOLUTION AUTHORITY BASIS REFERENCE target ir HUMAN DECISION, referenced HUMAN DECISION obligāti satur ASSIGNMENT AUTHORITY BASIS SOURCE REFERENCE. Tas ir §36 prasības tiešs turpinājums.

Noklusējuma režīms ir INTRA-RECORD; CROSS-RECORD izmanto tikai tad, ja konkrētais target atrodas citā Trace Record vai versijā.

RESOLUTION AUTHORITY KNOWN ir boolean. Ja tā vērtība ir true, RESOLUTION AUTHORITY un RESOLUTION AUTHORITY BASIS REFERENCE ir obligāti. Ja vērtība ir false, abi authority lauki nav norādāmi un REQUIRED ACTION ietver resolution authority noskaidrošanu. Sistēma nedrīkst izdomāt action owner vai resolution authority, kā arī izmantot UNKNOWN, TBD, N/A vai citu placeholder.


## 39. Neatrisināta jautājuma slēgšana

OPEN / CLOSED statuss netiek ieviests.

Jautājums ir atrisināts jaunā Traceability Record versijā, kur tas vairs nav UNRESOLVED ISSUES un ir atsauce uz HUMAN DECISION, ESCALATION RESPONSE vai citu dokumentētu pamatu, kas to atrisināja.

Iepriekšējā versija saglabā sākotnējo jautājumu.

## 40. Rezultāta ieraksts (`OUTPUT RECORD`)

```text
OUTPUT ID
OUTPUT TYPE
CREATED AT
SOURCE SET REFERENCE
RELATED FINDINGS
RELATED REQUIREMENTS
LEGAL CLASSIFICATION ASSESSMENT REFERENCES [ja piemērojams]
MODULE SCREENING RECORD REFERENCES [ja piemērojams]
MODULE SCREENING SUMMARY              [obligāts, ja veikts screening]
  SCREENED MODULES
  TRIGGER SET ID / VERSION
  SCREENING RESULT
  MODULE SCREENING RECORD ID
COMPLETENESS CONTROL REFERENCE  [ja piemērojams]
VERIFICATION SUMMARY
OUTPUT REFERENCE
INTENDED USE
DATA CLASS EVENT REFERENCES     [ja piemērojams]
VERIFICATION SCOPE RECORD REFERENCES [ja piemērojams]
```

## 41. Rezultāta verifikācijas kopsavilkums

Rezultāts nesaņem vienu universālu verification level.

Kopsavilkumā atsevišķi atspoguļo:
```text
HUMAN VERIFIED FINDINGS
AI PROPOSED FINDINGS
HUMAN VERIFIED REQUIREMENTS
AI PROPOSED REQUIREMENTS
```

Tas nepieļauj verifikācijas statusa nepamatotu pārnesi.

## 42. Juridiskā statusa atsauce (`LEGAL STATUS REFERENCE`)

Traceability Record juridisko statusu nepiešķir.

Ja atsauce ir `LEGAL APPROVED`, obligāti:

```text
SOURCE SYSTEM / CHANNEL
REFERENCE
DATE
BY
```

Bez SOURCE SYSTEM / CHANNEL un REFERENCE `LEGAL APPROVED` atsauci pievienot nedrīkst.

## 43. Darba turpināšanas atsauce (`BUSINESS PROCEEDED REFERENCE`)

Ja piemērojams:

```text
LEGAL POSITION: NOT APPROVED
BUSINESS PROCEEDED: YES
DECISION SOURCE
REFERENCE
DATE
```

Tas ir uzskaites ieraksts, nevis riska pieņemšanas process.

## 44. Ieraksta versija (`RECORD VERSION`)

```text
TRACE RECORD ID
RECORD VERSION
PREVIOUS VERSION
```

Iepriekšējā versija netiek klusējot pārrakstīta.

## 45. Jaunu izsekojamības ieraksta versiju izraisa

Ja pēc materiāla rezultāta mainās kāds no šiem elementiem, tiek radīta jauna versija:

```text
SOURCE SET
SOURCE DATA CLASS
DATA CLASS EVENT
REQUIREMENTS SET VERSION
MODULE STATUS
APPLICABILITY AUTHORITY
CONFIRMED BY
MATERIAL FINDING
REQUIREMENT STATUS
REQUIREMENT COMPONENT STATUS
EVIDENCE REFERENCE, ja izmaiņa maina secinājuma nozīmi
VERIFICATION SCOPE RECORD REFERENCE, ja izmaiņa maina pārbaudīto tvērumu
VERIFICATION LEVEL
HUMAN DECISION
UNRESOLVED ISSUE resolution
MATERIAL OUTPUT
LEGAL STATUS REFERENCE
```

## 46. Minimālais saturs pa operācijām

Ja uzdevumam piemērojams `LEGAL INTAKE`, zemāk norādītajam operācijas minimumam papildus pievieno:
```text
CONTRACT TYPE                         [ja OBJECT = CONTRACT]
LEGAL CLASSIFICATION ASSESSMENTS      [ja piemērojams]
MODULE STATUS / AUTHORITY DECISIONS   [ja piemērojams]
REQUIREMENTS SET SELECTION REFERENCES [ja piemērojams]
```

### ANALYSE
```text
SOURCES
FINDINGS
EVIDENCE
UNRESOLVED ISSUES
HUMAN DECISIONS
OUTPUT
```

### VERIFY
```text
REQUIREMENTS SET
REQUIREMENT RESULTS
COMPONENTS
FINDINGS
EVIDENCE
COMPLETENESS CONTROL
VERIFICATION EVENTS
VERIFICATION SCOPE RECORDS [ja piemērojams]
```

### DRAFT
```text
SOURCES
FINDINGS
PROPOSED TEXT
LEGAL BASIS / PURPOSE
DEVIATION FROM CURRENT TEXT
ALTERNATIVE ACCEPTABLE TEXT  [ja piemērojams]
UNRESOLVED RISK
```

### COMPARE
```text
SOURCE A
SOURCE B
FINDINGS
EVIDENCE REFERENCES
OUTPUT
```

### EXTRACT
```text
SOURCE
FINDINGS
EVIDENCE REFERENCES
VERIFICATION LEVEL
```

## 47. Kanonisko statusu princips

Kanoniskie semantiskie statusi un uzskaitījumu (`enum`) vērtības ir tieši tās, ko nosaka `PROFESSIONAL_SCOPE_v1.4`.

Šis dokuments neievieš paralēlas statusu kopas.

Tehniskās mašīnatslēgas (`machine keys`) drīkst tikt definēti vēlāk `TERMINOLOGY_AND_ENUMS_v1`, ja tie nemaina canonical nozīmi.

## 48. Metadatu ieraksta (`META-RECORD`) robeža

Traceability Record nav vieta:
- pilnam juridiskajam atzinumam;
- pilnam līguma redakciju salīdzinājumam (`redline`);
- pilnam dokumenta tekstam;
- pilnai sarakstei;
- pilnam evidence fragmentam.

Tas satur metadatus, references, secinājumu sasaistes, juridiskās klasifikācijas izvērtējumus, verifikācijas aktus, verifikācijas tvēruma ierakstus un cilvēka lēmumu saites.

Evidence fragments dzīvo atsevišķā Evidence Object. Verifikācijas pārbaudītais tvērums, ja piemērojams, dzīvo atsevišķā VERIFICATION SCOPE RECORD.

## 49. Atvērts pārvaldības jautājums — bloķētājs pirms produkcijas ieviešanas

Pirms produkcijas ieviešanas bankai jānosaka:

```text
Kas drīkst rediģēt Traceability Record?
Kas drīkst dzēst Traceability Record?
Kas drīkst rediģēt vai dzēst Evidence Objects?
Kas drīkst rediģēt vai dzēst Verification Scope Records?
Kāds ir Traceability Record glabāšanas termiņš?
Kāds ir Evidence Object glabāšanas termiņš?
Kāds ir Verification Scope Record glabāšanas termiņš?
Vai Legora nodrošina pietiekamu versiju un audita vēsturi?
Vai nepieciešams nemainīgu vai arhīva momentuzņēmumu ārpus Legora?
```

Šis jautājums nav arhitektūras iesaldēšanas bloķētājs, bet ir produkcijas ieviešanas blocker.

## 50. Pilota 1 robeža

Pilots 1 attiecas tikai uz:

```text
ANALYSE
EXTRACT
```

Pilots 1 validē:
- SOURCE identitāti;
- neversētu dokumentu identitāti;
- DATA CLASS deklarāciju un atļaujas pārbaudi;
- FINDINGS;
- pierādījuma objektu un tā noturību;
- izsekojamības atsauces uz pierādījumiem;
- PRIOR TASK OUTPUT izcelsmes izsekojamību starp diviem uzdevumiem;
- materiālā output robežu;
- Traceability Record ģenerēšanu.

Pilots 1 obligāti ietver simulētu `DATA CLASS MISMATCH SUSPECTED` gadījumu, lai pārbaudītu propagāciju uz atkarīgajiem FINDINGS un OUTPUTS, `BLOCK`, cilvēka resolution un vēstures saglabāšanu.

Pilots 1 **nevalidē** prasību cilvēka verifikācijas izdošanas vārtus. Tas paliek neizmēģināts līdz Pilot 2 pēc `VERIFICATION_PROTOCOL_v1`.

## 51. Mērķa datu modelis

```text
TASK
├── CLASSIFICATION
├── MODULES
├── AI GOVERNANCE
│   └── DATA CLASS EVENTS
├── SOURCES
│   ├── DATA CLASS
│   ├── PERMISSION CHECK
│   └── PRIOR TASK PROVENANCE
├── FINDINGS
│   └── EVIDENCE REFERENCES
├── VERIFICATION SCOPE RECORDS
├── EVIDENCE STORE
│   └── EVIDENCE OBJECTS
├── REQUIREMENTS SET
├── REQUIREMENT RESULTS
│   ├── COMPONENTS
│   ├── EVIDENCE REFERENCES
│   ├── VERIFICATION EVENTS
│   └── VERIFICATION SCOPE RECORD REFERENCES
├── HUMAN DECISIONS
├── ESCALATIONS
├── UNRESOLVED ISSUES
├── OUTPUTS
└── LEGAL STATUS REFERENCE
```

## 52. Arhitektūras apspriešanas statuss

Šis dokuments ir `MELNRAKSTS — ARHITEKTŪRAS APSPRIEŠANAI`.

v0.6 mērķis ir pievienot juridiskās klasifikācijas izsekojamības slāni, nemainot v0.5 frozen pierādījumu, verifikācijas un statusu semantiku.

Pirms iesaldēšanas nepieciešams:
1. konsenss par `PROFESSIONAL_SCOPE_v1.4`;
2. saderība ar `TERMINOLOGY_AND_ENUMS_v1 v0.4`;
3. saderība ar `OPERATION_WORKFLOWS_v1` un `LEGAL_RESEARCH_METHOD_v1`;
4. mehāniskais audits;
5. lietotāja skaidrs freeze apstiprinājums.

Iepriekšējā `Arhitektūra v0.5` paliek iesaldētā autoritatīvā versija līdz v0.6 apstiprināšanai.
