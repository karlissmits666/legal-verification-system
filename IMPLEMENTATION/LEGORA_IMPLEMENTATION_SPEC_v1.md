# LEGORA_IMPLEMENTATION_SPEC_v1

## Mērķa loģiskā arhitektūra Legal Verification System ieviešanai Legora vidē

**Statuss:** TARGET ARCHITECTURE — IMPLEMENTATION PENDING  
**Loma projektā:** ieviešamais beigu stāvoklis  
**Bāze:** `PROFESSIONAL_SCOPE_v1.3 — APPROVED — BASELINE (FROZEN)`  
**Saistītais projekta plāns:** `PROJECT_ROADMAP_v1.md`

---

## 1. Dokumenta mērķis

Šis dokuments definē gala loģisko arhitektūru, kā Legal Verification System ir jāievieš Legora vidē, lai juridiskie uzdevumi tiktu izpildīti pēc iespējas konsekventi, izsekojami un ar obligātiem cilvēka kontroles punktiem.

Mērķis nav vienkārši ievietot projekta dokumentus Legora mapē. Mērķis ir pārvērst tos par izpildāmu sistēmu, kur:

- lietotājam ir viens kontrolēts ieejas punkts;
- katrs uzdevums tiek klasificēts pirms būtiskas analīzes;
- AI izmanto tikai uzdevumam nepieciešamos noteikumus un avotus;
- findings, prasības, evidence references un verifikācija tiek glabāti strukturēti;
- obligātas kontroles nevar tikt apietas ar brīvu promptu;
- materiāls output tiek izdots tikai pēc release gate;
- katram materiālam output ir Traceability Record;
- AI secinājums nekļūst par juridisku apstiprinājumu tikai tādēļ, ka sistēma to ir ģenerējusi.

Šis dokuments ir mērķa arhitektūra. Precīzie Legora klikšķi, konfigurācijas lauki un tenant-specifiskie ierobežojumi tiek validēti implementācijas un pilotu laikā.

---

## 2. Galvenais arhitektūras princips

Legal Verification System Legora vidē nedrīkst būt “dokumentu kolekcija + brīvs čats”.

Tā jāievieš kā izpildes sistēma:

```text
USER TASK
   ↓
BANK LEGAL CORE
   ↓
GOVERNANCE GATES
   ↓
TASK ROUTER
   ↓
OPERATION WORKFLOW
   ↓
APPLICABLE MODULES
   ↓
STRUCTURED FINDINGS / REQUIREMENTS
   ↓
EVIDENCE REFERENCES
   ↓
VERIFICATION
   ↓
TRACEABILITY RECORD
   ↓
RELEASE GATE
   ↓
MATERIAL OUTPUT
```

---

## 3. Kontroles hierarhija

Katram uzdevumam piemēro šādu prioritāti:

```text
1. PROFESSIONAL_SCOPE invarianti
2. AI TOOL governance un datu atļaujas
3. canonical terminology / enums
4. verification rules
5. execution workflow
6. applicable modules / requirements / playbooks
7. lietotāja konkrētais uzdevums
```

Lietotājs nosaka, **ko** nepieciešams panākt.

Execution Kernel nosaka, **kā** uzdevumu drīkst izpildīt.

Lietotāja prompts nedrīkst atcelt augstāka līmeņa governance vai verification noteikumus.

---

## 4. Legora lomu sadalījums

### 4.1. Workflows

Workflows ir galvenais control-flow un orchestration slānis.

Tie nosaka:

- obligāto izpildes secību;
- task routing;
- moduļu aktivizēšanu;
- obligātos starprezultātus;
- human review punktus;
- traceability izveidi;
- release gate.

### 4.2. Prompts

Prompts ir mazas, versētas izpildes instrukcijas workflow iekšienē.

Prompts nedrīkst būt visas sistēmas vienīgais kontroles mehānisms.

Prompts izmanto, piemēram:

- task classification;
- finding generation;
- evidence binding;
- source assessment;
- legal research;
- drafting;
- comparison;
- traceability compilation;
- release-gate checks.

### 4.3. Playbooks

Playbooks glabā atkārtojamas juridiskās pozīcijas un review loģiku, piemēram:

- common contract positions;
- preferred wording;
- fallback wording;
- non-negotiable positions;
- bankas līgumu pārbaudes standarti.

### 4.4. Tabular Review

Tabular Review ir strukturētās prasību pārbaudes darba virsma.

Primārie lietojumi:

- common contract review;
- EBA requirements;
- DORA requirements;
- saliktu prasību komponenti;
- statusi;
- evidence references;
- verification level;
- reviewer / verifier informācija.

### 4.5. Lists

Lists ir strukturētais darba stāvokļa reģistrs.

Primārie objekti:

- FINDINGS;
- HUMAN DECISIONS;
- ESCALATIONS;
- UNRESOLVED ISSUES;
- DATA CLASS EVENTS;
- task-level metadata, ja tas praktiski nepieciešams.

### 4.6. Search tools

Database search, Legal research un Web search izmanto tikai caur attiecīgo workflow un `LEGAL_RESEARCH_METHOD_v1`.

Search rezultāts pats par sevi nav verified legal conclusion.

### 4.7. Editor / Word

Editor vai Word ir gala darba produkta sagatavošanas slānis.

Tas atrodas pēc:

- findings;
- requirements review;
- evidence binding;
- verification;
- Traceability Record;
- release gate.

Editor nedrīkst būt materiāla output primārais sākumpunkts, apejot sistēmas kontroli.

### 4.8. Project Files

Project Files glabā konkrētās lietas ievaddatus, Traceability Record un gala rezultātus.

Shared/frozen sistēmas dokumenti tiek turēti organizācijas/library līmenī, ja Legora tenant to praktiski atbalsta. Ja tas nav iespējams, tie tiek ievietoti projektā kā kontrolētas, versētas runtime kopijas.

---

## 5. GitHub un Legora lomu nodalījums

### GitHub = source of truth sistēmas specifikācijai

GitHub glabā:

- frozen governance dokumentus;
- workflow specifikācijas;
- prompt source tekstus;
- schemas;
- playbook source;
- requirements matrices source;
- change history;
- pilotu rezultātu kopsavilkumus;
- acceptance lēmumus.

GitHub neglabā bankas konkrēto juridisko lietu konfidenciālo saturu, ja vien tam nav atsevišķas bankas atļaujas.

### Legora = runtime execution environment

Legora glabā:

- apstiprinātas runtime dokumentu kopijas;
- prompts;
- workflows;
- playbooks;
- project-specific source documents;
- Tabular Reviews;
- Lists;
- Traceability Records;
- final work products.

---

## 6. Runtime manifest

Lai Legora nekad neizpildītu uzdevumu pret neskaidru dokumentu kopumu, katrai production konfigurācijai jābūt Runtime Manifest.

Runtime Manifest ir tehnisks artefakts, nevis jauns governance dokuments.

Tas satur vismaz:

```text
SYSTEM VERSION

PROFESSIONAL_SCOPE VERSION
TRACEABILITY_RECORD VERSION
AI_TOOL_USAGE_POLICY VERSION
VERIFICATION_PROTOCOL VERSION
TERMINOLOGY_AND_ENUMS VERSION
OPERATION_WORKFLOWS VERSION
REQUIREMENTS_MATRIX_GOVERNANCE VERSION
LEGAL_RESEARCH_METHOD VERSION
COMMON_CONTRACT_REVIEW_CHECKLIST VERSION
EBA_REQUIREMENTS_MATRIX VERSION
DORA_REQUIREMENTS_MATRIX VERSION
LEGORA_IMPLEMENTATION_SPEC VERSION

PROMPT SET VERSION
WORKFLOW SET VERSION
PLAYBOOK SET VERSION
TABULAR TEMPLATE VERSION
LIST TEMPLATE VERSION
```

Materiāls output ir sasaistāms ar konkrēto Runtime Manifest versiju.

---

## 7. Viens obligāts ieejas punkts

Production darba primārais ieejas punkts:

```text
BANK LEGAL CORE
```

Lietotājs nedrīkst būt spiests zināt, kuru no 13 dokumentiem vai kuru promptu izvēlēties.

Tipiski lietotāja ievadi:

- “Pārbaudi šo līgumu.”
- “Salīdzini šīs divas versijas.”
- “Sagatavo klauzulu.”
- “Vai šāds risinājums ir juridiski pieņemams?”
- “Atrodi piemērojamo regulējumu.”
- “Izvelc visas termination prasības.”

BANK LEGAL CORE pārvērš lietotāja dabisko uzdevumu strukturētā TASK.

---

## 8. Brīvais čats un materiāls output

Brīvu Legora sarunu drīkst izmantot:

- brainstorming;
- paskaidrojumiem;
- ideju ģenerēšanai;
- sākotnējai orientācijai;
- ne-materiāliem starprezultātiem.

Brīvā čata rezultāts pēc noklusējuma nav materiāls juridiskais output.

Ja rezultātu paredzēts:

- izmantot jurista lēmumā;
- nosūtīt citai funkcijai;
- izmantot sarunās ar darījuma partneri;
- izmantot kā ievaddatus citam juridiskam uzdevumam,

tas jāievada BANK LEGAL CORE plūsmā un jāiziet Traceability + Release Gate.

---

## 9. Task runtime modelis

Centrālā vienība:

```text
TASK
```

TASK satur vai sasaista:

```text
TASK
│
├── CLASSIFICATION
├── MODULES
├── AI GOVERNANCE
├── SOURCES
├── FINDINGS
├── EVIDENCE REFERENCES
├── REQUIREMENTS SET           [ja piemērojams]
├── REQUIREMENT RESULTS        [ja piemērojams]
│   └── COMPONENTS
├── VERIFICATION EVENTS
├── HUMAN DECISIONS
├── ESCALATIONS
├── UNRESOLVED ISSUES
├── TRACEABILITY RECORD
└── OUTPUTS
```

---

## 10. Izpildes fāzes

### PHASE 0 — TASK START

Izveido:

```text
TASK ID
RESPONSIBLE LAWYER
DATE
USER REQUEST
```

### PHASE 1 — HUMAN DECLARATIONS

Pirms AI apstrādes, kur tas tehniski iespējams, cilvēks deklarē:

- datu klases katram ievaddatu avotam;
- known jurisdiction / applicable law, ja zināms;
- ārējos statusus, ja pieejami;
- CIF statusu, ja tas jau noteikts;
- citas bankas procesa ievades, kuras AI nedrīkst pats noteikt.

AI drīkst flagot neatbilstību, bet nevar pats sev piešķirt augstāku atļauju.

### PHASE 2 — AI TOOL PERMISSION GATE

Katram SOURCE:

```text
DATA CLASS
↓
AI_TOOL_USAGE_POLICY
↓
ALLOWED?
```

Ja:

```text
NOT ALLOWED
PERMISSION UNKNOWN
DATA CLASS MISMATCH SUSPECTED
```

piemēro frozen governance sekas.

AI apstrāde ar konkrēto avotu neturpinās, kamēr nav atbilstoša cilvēka lēmuma.

### PHASE 3 — TASK CLARIFICATION

Ja uzdevumu nevar klasificēt, tiek aktivizēts:

```text
TASK CLARIFICATION REQUIRED
```

Sistēma neprasa nevajadzīgu informāciju.

Tā prasa tikai to, kas nepieciešams, lai droši turpinātu.

### PHASE 4 — COMPETENCE / JURISDICTION CHECK

Nosaka:

- jurista kompetence;
- citas funkcijas kompetence;
- kopīga kompetence;
- neskaidra kompetence;
- jurisdikcijas robeža.

Ja nepieciešams:

```text
ESCALATION REQUIRED
```

### PHASE 5 — TASK CLASSIFICATION

Obligāti:

```text
OPERATION
OBJECT
MODULES
```

OPERATION:

```text
ANALYSE
VERIFY
DRAFT
COMPARE
EXTRACT
```

OBJECT:

```text
QUESTION
CONTRACT
CLAUSE
INTERNAL POLICY
EXTERNAL SOURCE
DOCUMENT SET
```

### PHASE 6 — MODULE APPLICABILITY

Katram modulim:

```text
MODULE STATUS
APPLICABILITY AUTHORITY
CONFIRMED BY
CONFIRMATION DATE
```

Moduļi:

```text
PROCUREMENT
OUTSOURCING-EBA
ICT-DORA
DATA-PROTECTION
INFOSEC
OTHER
```

AI secinājums pats par sevi nekļūst par gala moduļa statusu.

### PHASE 7 — SOURCE REGISTER

Katrs izmantotais avots tiek reģistrēts.

Avotam jābūt pietiekami identificētam, lai vēlāk var noteikt tieši izmantoto dokumenta redakciju.

Tiek saglabāta atsauce, nevis Traceability Record dublēts viss dokuments.

### PHASE 8 — OPERATION ROUTING

BANK LEGAL CORE izsauc vienu no:

```text
WF_ANALYSE
WF_VERIFY
WF_DRAFT
WF_COMPARE
WF_EXTRACT
```

### PHASE 9 — MODULE ENRICHMENT

Operation workflow pieslēdz tikai piemērojamos:

- playbooks;
- requirements matrices;
- research method;
- checklist;
- internal rules.

Nevajadzīgi moduļi netiek ielādēti.

### PHASE 10 — STRUCTURED FINDINGS

Katrs būtisks AI secinājums kļūst par FINDING.

Minimāli:

```text
FINDING ID
STATEMENT
SOURCE REFERENCES
EVIDENCE REFERENCES
ANALYSIS / INTERPRETATION
VERIFICATION LEVEL
RELATED REQUIREMENT       [ja piemērojams]
```

FINDING ir universālā trace vienība.

### PHASE 11 — REQUIREMENT CHECK

VERIFY vai citā requirements-based plūsmā izmanto Tabular Review.

Katrai prasībai:

```text
REQUIREMENT ID
REQUIREMENT LEVEL
GOVERNANCE STATUS
REQUIREMENT TYPE
REQUIREMENT STATUS
EVIDENCE REFERENCE
VERIFICATION LEVEL
```

Saliktām prasībām:

```text
REQUIREMENT
├── COMPONENT
├── COMPONENT
└── COMPONENT
```

Parent status tiek agregēts pēc frozen noteikumiem.

### PHASE 12 — EVIDENCE BINDING

Katram materiālam FINDING / requirement conclusion jābūt atsaucei uz avota atrašanās vietu.

Traceability Record glabā atsauci, ne pilnu fragmentu.

Ja secinājums ir atkarīgs no:

- definīcijas;
- cross-reference;
- annex;
- cita dokumenta,

arī tam ir jābūt sasaistītam.

### PHASE 13 — VERIFICATION

Tiek piemērots `VERIFICATION_PROTOCOL_v1`.

AI consensus nav verification.

Kur frozen slieksnis prasa HUMAN VERIFIED, jābūt dokumentētam verification event.

### PHASE 14 — UNRESOLVED / ESCALATION CHECK

Pirms materiāla output:

- identificē unresolved issues;
- identificē required escalations;
- pārbauda missing external inputs;
- pārbauda missing confirmations.

### PHASE 15 — LAWYER REVIEW

Atbildīgais jurists:

- verificē obligātos punktus;
- apstiprina profesionālos lēmumus savas kompetences ietvaros;
- pieņem / noraida AI piedāvātos secinājumus;
- reģistrē HUMAN DECISIONS.

### PHASE 16 — BUILD TRACEABILITY RECORD

Tieši pirms materiāla output tiek izveidots:

```text
TRACEABILITY_RECORD_<TASK ID>
```

Tas tiek glabāts konkrētā Legora projekta mapē.

Traceability Record satur tikai nepieciešamos metadatus, references un lēmumu ķēdi.

### PHASE 17 — RELEASE GATE

Sistēma pārbauda:

```text
AI PERMISSION PASSED?
TASK CLASSIFIED?
REQUIRED MODULE INPUTS PRESENT?
MANDATORY REQUIREMENTS CHECKED?
REQUIRED HUMAN VERIFICATION COMPLETE?
UNCLASSIFIED BLOCKERS ABSENT?
REQUIRED ESCALATIONS RESOLVED OR EXPLICITLY REPRESENTED?
TRACEABILITY RECORD CREATED?
```

Ja kritisks nosacījums nav izpildīts:

```text
MATERIAL OUTPUT NOT RELEASED
```

Darba draftu jurists drīkst redzēt.

### PHASE 18 — MATERIAL OUTPUT

Tikai pēc release gate tiek radīts:

- Editor file;
- Word file;
- verification report;
- clause;
- legal analysis;
- comparison output;
- cits materiāls work product.

---

## 11. Hard gate un soft gate modelis

Ne visas Legora tenant versijas var nodrošināt tehniski deterministisku conditional stop.

Tāpēc sistēmai jābūt drošai abos režīmos.

### Mode A — Hard Gate

Ja Workflows atbalsta obligātu branching / stop / approval loģiku:

```text
PREPARE
↓
VERIFY
↓
GATE CONDITION
↓
RELEASE
```

### Mode B — Split Workflow Fallback

Ja tehnisks hard stop nav pieejams:

```text
WF_BANK_LEGAL_PREPARE
↓
DRAFT + FINDINGS + TRACEABILITY PREP
↓
HUMAN REVIEW

separate explicit action

WF_BANK_LEGAL_RELEASE
↓
validate required fields / states
↓
generate material output
```

Production sistēma nedrīkst balstīties tikai uz AI instrukciju “please do not continue”.

---

## 12. Operation workflows

### 12.1. WF_ANALYSE

```text
QUESTION
↓
FACTS / ASSUMPTIONS / MISSING INFO
↓
SOURCE PLAN
↓
RESEARCH
↓
INTERPRETATIONS
↓
FINDINGS
↓
ALTERNATIVES
↓
RISKS / LIMITS
↓
EVIDENCE REFERENCES
↓
VERIFICATION GATE
↓
LAWYER REVIEW
```

### 12.2. WF_VERIFY

```text
TARGET DOCUMENT
↓
REQUIREMENTS SET
↓
COMPLETENESS CONTROL
↓
PER-REQUIREMENT CHECK
↓
COMPONENT AGGREGATION
↓
EVIDENCE REFERENCES
↓
VERIFICATION
↓
GAP / NON-COMPLIANCE OUTPUT
```

### 12.3. WF_DRAFT

```text
DRAFT OBJECTIVE
↓
LEGAL BASIS / PURPOSE
↓
APPLICABLE REQUIREMENTS
↓
CURRENT TEXT
↓
PROPOSED TEXT
↓
DEVIATION
↓
ALTERNATIVE ACCEPTABLE TEXT
↓
UNRESOLVED RISK
↓
LAWYER REVIEW
```

### 12.4. WF_COMPARE

```text
SOURCE A
SOURCE B
↓
STRUCTURAL DIFFERENCES
↓
MATERIAL DIFFERENCES
↓
FINDINGS
↓
EVIDENCE REFERENCES
↓
LEGAL IMPACT [ja piemērojams]
↓
OUTPUT
```

### 12.5. WF_EXTRACT

```text
SOURCE
↓
EXTRACTION TARGET
↓
EXTRACTED FINDINGS
↓
SOURCE REFERENCES
↓
VERIFICATION LEVEL
↓
OUTPUT / PRIOR TASK INPUT
```

---

## 13. Module activation

### PROCUREMENT

Aktivizē:

- procurement internal rules;
- approval matrix;
- common contract positions;
- applicable internal checklist.

### OUTSOURCING-EBA

Aktivizē:

- outsourcing classification confirmation;
- `EBA_REQUIREMENTS_MATRIX_v1`;
- related internal outsourcing rules;
- mandatory contractual requirements.

### ICT-DORA

Aktivizē:

- ICT/DORA applicability confirmation;
- CIF external input, ja nepieciešams;
- `DORA_REQUIREMENTS_MATRIX_v1`;
- DORA contractual addendum / checklist.

### DATA-PROTECTION

Sistēma drīkst identificēt jautājumu un strukturēt tā nodošanu.

Gala specializētais secinājums tiek dots atbilstoši bankas kompetences sadalījumam.

### INFOSEC

Tas pats princips.

### OTHER

Izmanto universal legal core un, ja nepieciešams, `LEGAL_RESEARCH_METHOD_v1`.

---

## 14. Requirements architecture Legora

Requirements pārbaude tiek realizēta kā strukturēta Tabular Review šablona instance.

Ieteicamā loģiskā kolonu struktūra:

```text
REQ ID
REQUIREMENT
LEVEL
GOVERNANCE STATUS
TYPE
COMPONENT ID
COMPONENT DESCRIPTION
SOURCE REQUIREMENT
STATUS
EVIDENCE REFERENCE
AI ANALYSIS
VERIFICATION LEVEL
VERIFIED BY
VERIFIED AT
```

Canonical statusi netiek aizstāti ar brīvu teksta formulējumu.

---

## 15. Findings architecture Legora

FINDINGS tiek glabāti strukturēti List vai citā stabilā strukturētā artefaktā.

Ieteicamie lauki:

```text
FINDING ID
STATEMENT
SOURCE REFERENCES
EVIDENCE REFERENCES
ANALYSIS
VERIFICATION LEVEL
RELATED REQUIREMENT
RELATED OUTPUT
```

Garš AI memo nav FINDINGS reģistra aizvietotājs.

---

## 16. Human decisions architecture

HUMAN DECISION ir atsevišķs objekts.

```text
DECISION ID
DECISION
DECIDED BY
ROLE
DATE
BASIS
RELATED FINDING / REQUIREMENT / ISSUE
```

AI nekad nav `DECIDED BY`.

---

## 17. Traceability implementation

Darba gaitā Legora strukturētajos artefaktos tiek uzkrāti:

- TASK metadata;
- sources;
- findings;
- requirements results;
- evidence references;
- verification events;
- human decisions;
- escalations;
- unresolved issues.

Pirms output tiek ģenerēts final snapshot:

```text
TRACEABILITY_RECORD_<TASK ID>
```

Ieteicamā implementācija:

- working state → Lists / Tabular Reviews;
- final Traceability snapshot → Editor file vai cits nemaināms project file formāts;
- evidence → references only.

---

## 18. Project runtime struktūra

Loģiskais projekta izkārtojums:

```text
/00_SYSTEM
    RUNTIME_MANIFEST
    frozen runtime references

/01_INPUT
    matter source documents

/02_WORKING
    Tabular Reviews
    Lists
    research working outputs

/03_TRACE
    TRACEABILITY_RECORD_<TASK ID>

/04_OUTPUT
    released material outputs
```

Ja Legora UI neatbalsta fiziskas apakšmapes, šo struktūru realizē ar:

- naming convention;
- file prefixes;
- Lists / Tabular Review nosaukumiem.

Piemēram:

```text
SYS_
IN_
WRK_
TRACE_
OUT_
```

---

## 19. Shared Library struktūra

Organizācijas/shared līmenī:

```text
SYSTEM DOCUMENTS
PROMPTS
WORKFLOWS
PLAYBOOKS
TABULAR REVIEW TEMPLATES
LIST TEMPLATES
```

Production lietotājam jāizmanto tikai apstiprinātās versijas.

Draft un production versijas nedrīkst būt nosauktas tā, ka tās iespējams sajaukt.

---

## 20. Prompt set

Ieteicamais promptu komplekts:

```text
P01_TASK_INTAKE
P02_TASK_CLASSIFICATION
P03_MODULE_APPLICABILITY
P04_SOURCE_REGISTER
P05_FINDING_GENERATION
P06_EVIDENCE_BINDING
P07_ANALYSE
P08_VERIFY
P09_DRAFT
P10_COMPARE
P11_EXTRACT
P12_LEGAL_RESEARCH
P13_VERIFICATION_PRECHECK
P14_TRACEABILITY_BUILD
P15_RELEASE_GATE
P16_OUTPUT_RENDER
```

Katram promptam:

- ir versija;
- ir skaidrs input/output schema;
- tas nedrīkst paplašināt frozen statusu kopu;
- tas izmanto tikai savam solim nepieciešamo kontekstu.

---

## 21. Workflow set

Production mērķa komplekts:

```text
WF00_BANK_LEGAL_CORE

WF10_ANALYSE
WF20_VERIFY
WF30_DRAFT
WF40_COMPARE
WF50_EXTRACT

WF60_TRACEABILITY
WF70_RELEASE
```

Ja hard gating nav pieejams:

```text
WF00_BANK_LEGAL_PREPARE
WF70_BANK_LEGAL_RELEASE
```

---

## 22. Playbook set

Minimāli:

```text
PB_COMMON_CONTRACT_REVIEW
PB_BANK_STANDARD_POSITIONS
PB_OUTSOURCING
PB_ICT_DORA
```

Playbook satur juridisko pozīciju.

Tas nedrīkst kļūt par requirements governance aizvietotāju.

---

## 23. Search architecture

Search tiek izmantots šādā prioritātē, kuru detalizē `LEGAL_RESEARCH_METHOD_v1`:

```text
known authoritative internal source
↓
approved legal / regulatory databases
↓
authoritative external legal source
↓
web research, ja nepieciešams
```

Katram materiālam ārējam secinājumam jābūt source reference.

Search engine kopsavilkums nav patstāvīgs authoritative source.

---

## 24. Context minimization

Konsekvence netiek panākta, katru reizi ielādējot visus 13 dokumentus.

Kernel ielādē:

### ALWAYS-ON

```text
PROFESSIONAL_SCOPE
TERMINOLOGY_AND_ENUMS
AI_TOOL_USAGE_POLICY
VERIFICATION_PROTOCOL
TRACEABILITY rules
```

### OPERATION-DEPENDENT

```text
OPERATION_WORKFLOWS
LEGAL_RESEARCH_METHOD
```

### MODULE-DEPENDENT

```text
COMMON_CONTRACT_REVIEW_CHECKLIST
EBA_REQUIREMENTS_MATRIX
DORA_REQUIREMENTS_MATRIX
relevant Playbooks
```

Tas samazina nevajadzīgu kontekstu un pretrunīgu instrukciju risku.

---

## 25. Fail-closed princips

Ja sistēma nevar droši noteikt, vai kritisks nosacījums ir izpildīts, tā nedrīkst klusējot turpināt kā pabeigts materiāls output.

Tipiski fail-closed iemesli:

- permission unknown;
- data class mismatch suspected;
- task classification unclear;
- required module input missing;
- CIF input missing, ja tas nepieciešams;
- UNCLASSIFIED requirement;
- mandatory requirement not HUMAN VERIFIED;
- unresolved competence issue;
- required escalation unresolved;
- Traceability Record nav izveidots.

---

## 26. Output classes

### WORKING DRAFT

Drīkst saturēt neverificētu AI darbu.

Tas:

- paliek task iekšienē;
- nav materiāls output;
- nav LEGAL APPROVED;
- var saturēt HUMAN VERIFICATION REQUIRED.

### MATERIAL OUTPUT

Drīkst iziet ārpus task tikai pēc release gate.

### LEGAL APPROVED

Nav Legora radīts statuss.

Tas ir tikai external bank process reference.

---

## 27. Version promotion process

Katras sistēmas dokumenta dzīves cikls:

```text
DRAFT IN GITHUB
↓
REVIEW
↓
APPROVAL / FREEZE
↓
RUNTIME COPY CREATED IN LEGORA
↓
RUNTIME MANIFEST UPDATED
↓
PILOT / VALIDATION
↓
PRODUCTION
```

Draft versija nedrīkst automātiski aizstāt production runtime versiju.

---

## 28. Change control

Ja mainās frozen dokuments vai production execution artefakts:

- GitHub change history tiek saglabāts;
- tiek noteikts, kuri prompts/workflows/playbooks ir ietekmēti;
- nepieciešamības gadījumā tiek atkārtots regression pilot;
- tikai pēc acceptance tiek atjaunināts Runtime Manifest.

---

## 29. Pilot architecture

### PILOT 1 — TRACEABILITY

Validē:

- findings;
- evidence references;
- human decisions;
- Traceability generation;
- workload.

### PILOT 2 — CONTRACT VERIFY

Validē:

- common checklist;
- verification protocol;
- false positive / false negative profilu;
- human verification gate.

### PILOT 3 — EBA / DORA

Validē:

- requirement completeness pret approved matrix;
- component aggregation;
- mandatory requirement miss rate;
- module activation.

### PILOT 4 — END TO END

Validē visu:

```text
TASK
→ GOVERNANCE
→ ROUTING
→ WORK
→ VERIFICATION
→ TRACEABILITY
→ RELEASE
→ OUTPUT
```

---

## 30. Production acceptance kritēriji

Production ieviešana nav pabeigta, kamēr:

1. BANK LEGAL CORE ir vienots production entry point.
2. Governance gate nevar klusējot tikt apiets.
3. Visas 5 operation plūsmas ir realizētas.
4. FINDINGS ir strukturēti un sasaistīti ar evidence references.
5. VERIFY izmanto versionētu requirements set.
6. Mandatory verification sliekšņi ir realizēti.
7. Traceability Record tiek ģenerēts pirms materiāla output.
8. Release gate ir tehniski vai procesuāli enforceable.
9. Runtime Manifest ir pieejams.
10. Production artefakti atsaucas tikai uz apstiprinātām sistēmas versijām.
11. Pilot/acceptance kritēriji ir izpildīti.
12. Ir veikts vismaz viens pilns regression test pēc production konfigurācijas izveides.

---

## 31. Mērķa production topoloģija

```text
                        LEGORA LIBRARY
┌────────────────────────────────────────────────────────┐
│ Frozen system docs                                     │
│ Versioned prompts                                      │
│ Versioned workflows                                    │
│ Playbooks                                              │
│ Tabular templates                                      │
│ List templates                                         │
└───────────────────────────┬────────────────────────────┘
                            │
                            ▼
                    BANK LEGAL CORE
                            │
             ┌──────────────┴──────────────┐
             ▼                             ▼
      GOVERNANCE GATES                 TASK ROUTER
                                             │
                ┌─────────┬─────────┬────────┼─────────┐
                ▼         ▼         ▼        ▼         ▼
             ANALYSE    VERIFY    DRAFT   COMPARE   EXTRACT
                │         │         │        │         │
                └─────────┴─────────┴────────┴─────────┘
                            │
                            ▼
                    APPLICABLE MODULES
                            │
                            ▼
                FINDINGS / REQUIREMENTS
                            │
                            ▼
                  EVIDENCE REFERENCES
                            │
                            ▼
                       VERIFICATION
                            │
                            ▼
                    LAWYER REVIEW
                            │
                            ▼
                  TRACEABILITY RECORD
                            │
                            ▼
                      RELEASE GATE
                            │
                            ▼
                  EDITOR / WORD OUTPUT
```

---

## 32. Gala arhitektūras invariants

Production sistēmai jāizpilda:

```text
NO MATERIAL OUTPUT
WITHOUT:

KNOWN TASK
+
PERMITTED INPUTS
+
KNOWN APPLICABLE WORKFLOW
+
TRACEABLE MATERIAL FINDINGS
+
REQUIRED EVIDENCE REFERENCES
+
REQUIRED HUMAN VERIFICATION
+
TRACEABILITY RECORD
+
SUCCESSFUL RELEASE GATE
```

Tas ir Legal Verification System galvenais izpildes invariants Legora vidē.

---

## 33. Šī dokumenta loma projekta beigās

Šis dokuments ir projekta gala implementācijas mērķa specifikācija.

Pārējie projekta dokumenti definē atsevišķos noteikumu slāņus.

Kad tie ir pabeigti un apstiprināti, gala uzdevums ir:

```text
IMPLEMENT LEGORA_IMPLEMENTATION_SPEC_v1
↓
RUN PILOT_AND_ACCEPTANCE_PLAN_v1
↓
FIX FAILURES
↓
RUN REGRESSION
↓
APPROVE PRODUCTION CONFIGURATION
↓
FREEZE RUNTIME MANIFEST
```

Tikai pēc šī soļa Legal Verification System ir uzskatāma par ieviestu Legora vidē.
