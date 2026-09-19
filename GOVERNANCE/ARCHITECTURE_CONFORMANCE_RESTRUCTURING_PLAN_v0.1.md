# ARCHITECTURE CONFORMANCE RESTRUCTURING PLAN v0.1

## Juridiskās pārbaudes sistēma — pēc Review #16 freeze ieviešamais starpdokumentu amendment plāns

**Statuss:** APSTIPRINĀTS NĀKAMAIS PROGRAMMAS POSMS — IZPILDE BLOĶĒTA LĪDZ REVIEW #16 FREEZE  
**Datums:** 2026-09-19  
**Veids:** starpdokumentu amendment / implementation planning artefakts; NAV 14. pamatdokuments  
**Triggeris:** Review #16 saistītās paketes freeze  
**Mērķis:** samazināt cilvēka/AI interpretācijas brīvību starp normative dokumentiem un implementation, pārvēršot kritiskos invariantus machine-readable, traceable un executable kontrolēs.
**Lietotāja apstiprinājums:** ACCEPT — 2026-09-19; WS1–WS5 struktūra un anti-overengineering princips pieņemti izpildei pēc Review #16 freeze.

## 1. Pamatprincips

Esošā 13 dokumentu arhitektūra paliek sistēmas autoritatīvā dokumentu struktūra.

Netiek pārņemts ārējs governance vai legal domēna modelis kopumā. No publiskiem projektiem tiek pārņemti tikai konkrēti arhitektūras patterni:

- AGCP: specification → machine-readable schema/registry → RTM → conformance test → release evidence;
- Murdock: AI candidate output → deterministic validation/compilation → strict canonical state → human review gate;
- BHANUJ: versioned governance assets → evidence → deterministic policy → decision lineage / audit.

Ārējo projektu termini, lifecycle statusi, datu modeļi un tehnoloģiskais stack netiek automātiski importēti.

## 2. Autoritātes modelis

Pēc restrukturizācijas autoritātes slāņi:

```text
FROZEN / APPROVED 13-DOCUMENT NORMATIVE LAYER
↓
MACHINE-READABLE CONTRACT LAYER
  schemas
  registries
  mappings
↓
TRACEABILITY / REQUIREMENT LINKAGE LAYER
  requirement → source → schema → test → evidence
↓
CONFORMANCE LAYER
  positive tests
  negative tests
  cross-document integrity tests
↓
RUNTIME ADAPTER LAYER
  AI candidate → deterministic validator/compiler → canonical state
↓
AUDIT / RELEASE EVIDENCE
```

Markdown dokuments paliek juridiskās un governance semantikas owner. Machine-readable artefakts nedrīkst klusējot radīt jaunu normu.

## 3. Pieci obligātie workstreami

### WS1 — Machine-readable Schema & Registry Layer

Mērķis:
kritiskos enums, ID mappings, reference contracts un strukturētos record laukus pārvērst par mašīnlasāmiem kontraktiem.

Sākotnējais tvērums:
- TRACE OBJECT TYPE registry;
- ID PREFIX registry;
- TRACE OBJECT TYPE → ID FIELD mapping;
- reference-mode contract;
- canonical status / enum registries;
- core Traceability Record object schemas.

Owner dokumenti:
- TERMINOLOGY_AND_ENUMS_v1;
- TRACEABILITY_RECORD_v1;
- PROFESSIONAL_SCOPE_v1, kur tas definē canonical statusus.

Repo target struktūra:
```text
schemas/
  traceability/
  governance/
registries/
  trace_object_types.*
  id_prefixes.*
  enums.*
catalog/
  schema_catalog.*
```

Noteikumi:
1. machine-readable artefakts vienmēr satur owner-document + owner-section atsauci;
2. katram artefaktam ir version;
3. neatbilstība pret owner Markdown = FAIL;
4. nav dublētu canonical registry avotu.

Acceptance:
- visi Review #16 RMT3/RMT4 tipa noteikumi pārnesami uz deterministisku validatoru;
- nav jāparsē brīvteksta review response, lai noteiktu shēmas faktu.

### WS2 — Requirement → Source → Schema → Test → Evidence Traceability

Mērķis:
izveidot vienu kontrolētu sasaistes modeli, kas ļauj katrai materiālai normai pierādīt:
- kur tā radusies;
- kur sistēmā tā implementēta;
- kā tā tiek testēta;
- kāds evidence pierāda testa rezultātu.

Minimālais ieraksts:
```text
REQUIREMENT ID
OWNER DOCUMENT
OWNER SECTION
SOURCE / LEGAL BASIS
TARGET SCHEMA / REGISTRY
VALIDATION / TEST ID
POSITIVE TEST
NEGATIVE TEST
EVIDENCE EXPECTATION
STATUS
```

Primārie owner:
- REQUIREMENTS_MATRIX_GOVERNANCE_v1;
- EBA_REQUIREMENTS_MATRIX_v1;
- DORA_REQUIREMENTS_MATRIX_v1;
- PILOT_AND_ACCEPTANCE_PLAN_v1.

Šis slānis neaizstāj juridisko requirements matrix. Tas sasaista juridisko prasību ar implementation un verification pierādījumu.

Acceptance:
- neviena obligāta prasība nevar kļūt par production claim bez source + test linkage;
- testam nevar būt normatīva nozīme bez requirement owner atsauces.

### WS3 — AI Candidate → Canonical State Boundary

Mērķis:
nodrošināt, ka LLM output nekad nav automātiski canonical legal/governance state.

Modelis:
```text
SOURCE
→ AI CANDIDATE
→ deterministic structural validation
→ deterministic cross-field validation
→ conflict/review gate
→ human decision where required
→ CANONICAL TRACE / REQUIREMENT / FINDING STATE
```

No Murdock pārņemam tikai tolerant candidate → strict application-owned state principu.

Neimportējam:
- Murdock case model;
- tā UI struktūru;
- datubāzes shēmu;
- konkrēto Next.js/Postgres stack.

Owner dokumenti:
- OPERATION_WORKFLOWS_v1;
- TRACEABILITY_RECORD_v1;
- VERIFICATION_PROTOCOL_v1;
- LEGORA_IMPLEMENTATION_SPEC_v1.

Obligāts invariants:
```text
LLM OUTPUT != CANONICAL STATE
```

Acceptance:
- katram AI radītam materiālam record laukam ir skaidrs compilation/validation ceļš;
- modelis pats nemaina HUMAN DECISION, MODULE STATUS, legal approval vai workflow state, ja owner dokumenti to nepieļauj.

### WS4 — Executable Conformance Suite

Mērķis:
katram kritiskam invariantam pievienot vismaz vienu pozitīvu un vienu negatīvu testu.

Testu slāņi:
```text
L1 Schema validation
L2 Cross-field invariants
L3 Cross-document / registry integrity
L4 Workflow / gate behavior
L5 End-to-end legal workflow conformance
```

Šie līmeņi ir mūsu projekta iekšēja klasifikācija; tie nav AGCP conformance level imports.

Piemēri:
- valid trace-object reference → PASS;
- prefix/type mismatch → FAIL;
- missing mandatory HUMAN DECISION → FAIL;
- unsupported enum → FAIL;
- requirement without source linkage → FAIL;
- AI candidate attempting canonical decision mutation → FAIL.

Owner:
- VERIFICATION_PROTOCOL_v1;
- PILOT_AND_ACCEPTANCE_PLAN_v1;
- LEGORA_IMPLEMENTATION_SPEC_v1;
- repo TOOLS / tests.

Acceptance:
- freeze-ready vai production-ready claim balstās izpildītā test suite, ne tikai manuālā review;
- katram kritiskam invariantam ir executable coverage vai dokumentēts iemesls, kādēļ to nevar automatizēt.

### WS5 — Repository Integrity Manifest & Release Evidence

Mērķis:
katram nozīmīgam frozen / implementation / production milestone pierādīt, kura precīza dokumentu, shēmu, reģistru un testu kopa veido pārbaudīto sistēmu.

Manifestam jāfiksē vismaz:
```text
RELEASE / BASELINE ID
COMMIT SHA
FROZEN DOCUMENT VERSIONS
SCHEMA VERSIONS
REGISTRY VERSIONS
TEST SUITE VERSION
TEST REPORT REFERENCE
KNOWN ACCEPTED NON-BLOCKING ITEMS
IMPLEMENTATION PROFILE / ENVIRONMENT REFERENCE
```

No AGCP pārņemam manifest/conformance evidence principu.
No BHANUJ pārņemam lineage/replay domāšanu tikai tiktāl, cik nepieciešams:
- pierādīt, kas mainījās;
- pierādīt, ar kādiem inputs/policies/tests tika iegūts rezultāts;
- atkārtoti reproducēt governance/validation lēmumu, ja tas tehniski iespējams.

Neimportējam BHANUJ ontology, graph stack, policy engine vai runtime platformu kā obligātu tehnoloģiju.

Owner:
- PROJECT_EXECUTION_PROTOCOL;
- PILOT_AND_ACCEPTANCE_PLAN_v1;
- LEGORA_IMPLEMENTATION_SPEC_v1;
- repo release/audit artefakti.

Acceptance:
- katram freeze / production acceptance milestone ir reproducējams evidence package;
- “commit eksistē” nekad nav vienīgais acceptance pierādījums.

## 4. Izpildes secība pēc Review #16 freeze

```text
REVIEW #16 FREEZE
↓
WS1 Schema & Registry Layer
↓
WS2 Requirement Traceability Model
↓
WS3 AI Candidate / Canonical State Boundary
↓
WS4 Executable Conformance Suite
↓
WS5 Integrity Manifest & Release Evidence
↓
MECHANICAL + SEMANTIC AUDIT
↓
USER CONSENSUS
↓
INTEGRATE INTO REMAINING 13-DOCUMENT ROADMAP
```

WS1–WS5 nav pieci jauni pamatdokumenti. Katrs workstream rada:
- nepieciešamos machine-readable artefaktus;
- validatorus/testus;
- precīzu delta esošajos owner dokumentos;
- vienu audit record par workstream pabeigšanu.

## 5. Integrācija ar 13 dokumentiem

### Tieši skartie
- PROFESSIONAL_SCOPE_v1
- TRACEABILITY_RECORD_v1
- VERIFICATION_PROTOCOL_v1
- REQUIREMENTS_MATRIX_GOVERNANCE_v1
- OPERATION_WORKFLOWS_v1
- TERMINOLOGY_AND_ENUMS_v1
- EBA_REQUIREMENTS_MATRIX_v1
- DORA_REQUIREMENTS_MATRIX_v1
- LEGORA_IMPLEMENTATION_SPEC_v1
- PILOT_AND_ACCEPTANCE_PLAN_v1

### Netieši skartie
- AI_TOOL_USAGE_POLICY_v1
- LEGAL_RESEARCH_METHOD_v1
- COMMON_CONTRACT_REVIEW_CHECKLIST_v1

Netieši skartajiem machine-readable vai conformance prasības ievieš tikai tad, ja dokumentā ir strukturēti machine-enforceable noteikumi. Netiek automatizēta juridiska interpretācija tikai tādēļ, lai panāktu simetriju.

## 6. Ko apzināti nepārņemam

### No AGCP
Nepārņemam:
- tā control-plane domēna modeli;
- multitenant governance arhitektūru;
- HTTP/API kontraktus;
- tā conformance līmeņus kā mūsu canonical statusus.

Pārņemam:
- normative → schema/registry → RTM → conformance → evidence disciplīnu;
- schema catalog / controlled registry patternu;
- release manifest un executable conformance domāšanu.

### No Murdock
Nepārņemam:
- case-workspace modeli;
- UI;
- Next.js/Postgres implementāciju;
- tā konkrēto Finding/Conflict datu modeli kā mūsu canonical modeli.

Pārņemam:
- tolerant AI candidate → strict app-owned state;
- exact source-span/provenance principu;
- app-computed review gates;
- aizliegumu modelim pašam mutēt juridisko state.

### No BHANUJ
Nepārņemam:
- governance ontology;
- graph database;
- pilnu policy engine;
- agent runtime;
- platformas control-plane topoloģiju.

Pārņemam:
- versioned governance asset principu;
- evidence-backed deterministic decision patternu;
- lineage / replay requirement tur, kur tas dod audit value;
- runtime neatkarību no governance evidence.

## 7. Anti-overengineering gate

Katram pārņemamam patternam pirms implementation jāatbild uz četriem jautājumiem:

1. Kādu konkrētu mūsu projekta kļūdas klasi tas novērš?
2. Kurš no 13 dokumentiem ir semantikas owner?
3. Vai to var mehāniski pārbaudīt?
4. Vai vienkāršāks risinājums dod tādu pašu drošību?

Ja 1. vai 2. nav skaidras atbildes, patternu neievieš.
Ja 4. atbilde ir “jā”, izvēlas vienkāršāko risinājumu.

## 8. Programmas gate

Šis restructuring posms ir obligāts pēc Review #16 freeze un pirms nākamā liela roadmap dokumenta pilna dzīves cikla.

Atļauts pēc #16 freeze:
- analizēt un implementēt WS1–WS5;
- mainīt procesa/validatoru artefaktus;
- sagatavot starpdokumentu amendment delta.

Nav atļauts automātiski:
- atvērt frozen arhitektūras dokumentus bez amendment;
- mainīt 13 dokumentu skaitu;
- importēt ārēju projektu statusu/terminoloģiju kā canonical;
- deklarēt produkcijas gatavību tikai tādēļ, ka conformance infrastruktūra eksistē.

## 9. Pabeigšanas kritērijs

Restructuring posms ir pabeigts, kad:
1. WS1–WS5 katram ir implementation evidence;
2. machine-readable artefakti norāda uz saviem normative owners;
3. requirement→source→schema→test→evidence ķēde ir mehāniski pārbaudāma;
4. AI candidate nevar kļūt par canonical state bez definētā validation/gate ceļa;
5. critical invariants ir conformance testos;
6. integrity manifest reproducē konkrēto baseline;
7. audits neatrod paralēlu source of truth;
8. lietotājs apstiprina milestone.

Pēc tam turpinās 13 dokumentu roadmap ar nākamo dokumentu, izmantojot jauno conformance infrastruktūru.
