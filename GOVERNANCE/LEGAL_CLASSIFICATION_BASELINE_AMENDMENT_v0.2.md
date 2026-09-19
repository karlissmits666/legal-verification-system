# LEGAL_CLASSIFICATION_BASELINE_AMENDMENT_v0.2

Juridiskās klasifikācijas slāņa baseline amendment pakete

**Statuss:** REVIEW #16 CORE FREEZE IZPILDĪTS; PĀRĒJIE PAKETES ARTEFAKTI PALIEK AKTĪVI / DRAFT  
**Versija:** v0.2  
**Datums:** 2026-09-18  
**Review bāze:** Critical architecture review #11, #12, #13 un #14

## 1. Mērķis

Pakete ievieš universālu juridiskās klasifikācijas slāni starp uzdevuma objektu un specializētu prasību kopu izvēli, vienlaikus saglabājot cilvēka / ārējās autoritātes gala lēmumu.

## 2. Konsolidētais mugurkauls

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
IF CONTRACT:
  CONTRACT TYPE
  → TRACEABLE FACT PROFILE
  → CANDIDATE-MODULE SCREENING
  → SHORT or FULL INTAKE
  → COMMON CONTRACT REVIEW (always)
  → FULL LCA for triggered / uncertain modules
↓
HUMAN / EXTERNAL AUTHORITY DECISION
↓
MODULE STATUS
↓
REQUIREMENTS SET SELECTION
↓
OPERATION WORKFLOW
```

## 3. Paketes artefakti

1. `PROFESSIONAL_SCOPE_v1.4.md`
2. `TRACEABILITY_RECORD_v1_v0.6.md`
3. `TERMINOLOGY_AND_ENUMS_v1_v0.4.md`
4. `OPERATION_WORKFLOWS_v1.md` — v0.2
5. `LEGAL_RESEARCH_METHOD_v1.md` — v0.2
6. `REQUIREMENTS_MATRIX_GOVERNANCE_v1.md` — v0.3
7. `MODULE_TRIGGER_REGISTRY_v1.md` — v0.1
8. `OUTSOURCING_EBA_MODULE_TRIGGER_SET_v0.1.md` — source-based draft; lifecycle = null; nav apstiprināts

`ICT_DORA_MODULE_AUTHORITY_INPUT_REQUEST_v0.1.md` nav paketes governance artefakts. Tas ir `PREMATURE DRAFT COMMIT`, kas nav apstiprināts, nav frozen un nav autoritatīvs; fails pagaidām saglabāts tikai līdz derīgā satura migrācijai. Mērķa reprezentācija ir esošais `UNRESOLVED ISSUE` modelis, bet faktiska reģistrācija vēl nav veikta.

## 4. Review #11 / #12 konsensa lēmumi

### B1 — nosacīts intake pēc OBJECT
Pieņemts. CONTRACT TYPE un contract-specific intake nav obligāts QUESTION / INTERNAL POLICY / EXTERNAL SOURCE, ja pats jautājums neprasa klasifikāciju. COMPETENCE CHECK saglabāts.

### B2 — FACT PROFILE provenance
Pieņemts. FACT PROFILE ir FINDING references, ne brīvs MI kopsavilkums. Materiālam pieņēmumam ir `ASSUMPTION = true`.

Ja materiāls pieņēmums nav tieši pieņemts cilvēka lēmumā:
```text
QUALITATIVE LIKELIHOOD = INDETERMINATE
```

### B3 — ICT / DORA un CIF nošķīrums
Pieņemts un precizēts Review #13.

```text
ICT SERVICE LEGAL CLASSIFICATION
→ lawyer HUMAN DECISION

ICT-DORA MODULE STATUS
→ HUMAN CONFIRMATION REQUIRED
→ konkrētā bankas governance funkcija jānosauc pirms production

CIF STATUS
→ EXTERNAL INPUT ONLY
```

DORA Requirements Set selection:
- CIF-INDEPENDENT set aktivizējas uzreiz, ja ICT-DORA = APPLICABLE;
- CIF-DEPENDENT set gaida CIF.

### B4 — COMMON CONTRACT REVIEW
Pieņemts stingrā formā:
```text
OBJECT = CONTRACT
→ COMMON CONTRACT REVIEW always applicable
```

Specializētās kopas ir papildinājums, ne aizstājējs.

### H1 — candidate-module screening
Review #11 sākotnējais UNLIKELY shortcut ir atsaukts.

Pieņemts:
```text
SCREENING ≠ MODULE STATUS
NO TRIGGER IDENTIFIED ≠ NOT APPLICABLE
```

SHORT INTAKE drīkst izmantot tikai pret ACTIVE, versētu, apstiprinātu MODULE TRIGGER REGISTRY.

Ja modulim nav ACTIVE trigger list:
```text
SHORT PATH UNAVAILABLE
→ FULL LCA
```

### H2 — scenario-only
Pieņemts:
```text
scenario_only = true
```

Scenario rezultāts:
- nav actual result;
- nepakļaujas HUMAN VERIFIED minimumam;
- nemantojas citā TASK kā actual;
- vēlākas piemērojamības gadījumā tiek radīts jauns actual result.

### H3 — CONTRACT TYPE governance
CONTRACT TYPE registry īpašnieks ir `TERMINOLOGY_AND_ENUMS_v1`, ne workflows.

Jaukta līguma baseline contract-type-specific review = visu piešķirto tipu attiecīgo elementu apvienojums.

Tas neaktivizē specializētu regulatory module.

### H4 — counterargument review
FULL LCA gadījumā obligāts.

Tukšs counterargument review:
```text
→ LIKELY / UNLIKELY nav atļauts
→ INDETERMINATE
```

### H5 — cross-reference compatibility
Punktu numerācija v1.4 saglabā kritiskās frozen atsauces.

### H6 — SHORT / FULL intake
Pieņemts ar fail-closed principu.

SHORT tikai tad, ja ACTIVE trigger registry ļauj screening pabeigt.
Citādi FULL LCA.

### A1 — reclassification
Materiāla FACT PROFILE maiņa rada klasifikācijas pārvērtēšanu. Iepriekšējie LCA / lēmumi / rezultāti netiek dzēsti, bet novecojušie rezultāti nedrīkst izskatīties aktuāli.

### A2 — UNCLEAR
UNCLEAR bloķē tikai no konkrētā moduļa klasifikācijas atkarīgo zaru. COMMON CONTRACT REVIEW un neatkarīga juridiskā analīze turpinās.

## 5. OUTSOURCING-EBA trigger set draft

Izveidots pirmais source-based drafts:
`OUTSOURCING_EBA_MODULE_TRIGGER_SET_v0.1.md`.

Pašreizējais juridiskais pamats:
- EBA/GL/2019/02;
- EBA Single Rulebook Q&A 2020_5220;
- EBA Single Rulebook Q&A 2020_5100.

2026-09-18 publicētās EBA third-party risk Guidelines ir transition-watch avots, jo tās vēl nav piemērojamas un vēlāk aizstās 2019 outsourcing Guidelines.

Trigger set:
- nav ACTIVE;
- neaktivizē MODULE STATUS;
- neļauj SHORT INTAKE production režīmā;
- prasa jurista + outsourcing manager review;
- prasa bankas iekšējo outsourcing avotu pievienošanu.

## 6. MODULE TRIGGER REGISTRY stāvoklis

Governance struktūra ir definēta.

OUTSOURCING-EBA sākotnējais trigger set ir:
```text
LIFECYCLE: null
APPROVED BY: null
APPROVAL REFERENCE: null
```

Iemesls: pakete neizdomā bankas vai ārējā regulējuma triggerus bez source-based izstrādes un attiecīgās autoritātes apstiprinājuma.

Tādēļ pašlaik:
```text
OUTSOURCING-EBA SHORT INTAKE
= NOT OPERATIONALLY ENABLED
```

Tas nav arhitektūras konflikts. Tas ir atvērts ieviešanas priekšnoteikums pirms contract-classification pilota.

## 7. v1.3 → v1.4 cross-reference compatibility map

| Atsauce | v1.4 stāvoklis |
|---|---|
| §3 LEGAL APPROVED | semantika saglabāta |
| §4 kompetences | paplašināts ar klasifikācijas robežu |
| §12 task classification | paplašināts ar nosacītu LEGAL INTAKE |
| §13 module status / authority | saglabāts; pievienots LCA / screening slānis |
| §16.1 requirement status | saglabāts |
| §16.3 verification threshold | saglabāts actual results; explicit scenario-only carve-out |
| §16.4 negative requirement | saglabāts |
| §16.5 composite requirement | saglabāts |
| §17 verification controls | saglabāts |
| §18 requirement levels / UNCLASSIFIED | saglabāts |
| §19 AI tool governance | saglabāts |
| §20 traceability | paplašināts |
| §23 competence / escalation | saglabāts |
| §24 jurisdiction | saglabāts |
| §26 backbone | paplašināts |
| §30 closed status registry | nav pievienots jauns frozen status |

## 8. Nemainītās kritiskās robežas

```text
CONTRACT TYPE ≠ MODULE
LEGAL CLASSIFICATION ASSESSMENT ≠ HUMAN DECISION
QUALITATIVE LIKELIHOOD ≠ MODULE STATUS
LIKELY ≠ APPLICABLE
SCREENING NEGATIVE ≠ NOT APPLICABLE
SCREENING CONFIRMATION ≠ MODULE AUTHORITY DECISION
CIF STATUS ≠ LCA RESULT
COMMON CONTRACT REVIEW ≠ specialized module
MODULE AUTHORITY LABEL = faktiski nosauktā apstiprinošā funkcija
```

## 9. Autoritatīvais statuss

Review #16 core freeze ir izpildīts 2026-09-19.

Autoritatīvais core baseline:
- `PROFESSIONAL_SCOPE_v1.4`;
- `TRACEABILITY_RECORD_v1 v0.6`;
- `TERMINOLOGY_AND_ENUMS_v1 v0.4`;
- `VERIFICATION_PROTOCOL_v1 v0.5`.

Šis freeze nepadara par frozen pārējos §3 minētos amendment paketes draftus.
### 9.1. Freeze priekšnosacījumi

```text
FREEZE PRECONDITION:
TRACEABILITY_RECORD_v1 v0.6 freeze nav pieļaujams
pirms vai atsevišķi no
PROFESSIONAL_SCOPE_v1.4 un TERMINOLOGY_AND_ENUMS_v1 v0.4 freeze.
```

Šī ir amendment procesa precondition.
Tā nav record-level BLOCK, SUSPENSION STATE vai jauns canonical statuss.

### 9.2. Review #16 freeze izpilde

Lietotāja freeze approval:
```text
APPROVE FREEZE REVIEW #16 PACKAGE
```

Freeze vienība:
- `PROFESSIONAL_SCOPE_v1.4`;
- `TRACEABILITY_RECORD_v1 v0.6`;
- `TERMINOLOGY_AND_ENUMS_v1 v0.4`.

Review #16 core freeze ir procesa milestone; `REQUIREMENTS_MATRIX_GOVERNANCE_v1`, `OPERATION_WORKFLOWS_v1`, `LEGAL_RESEARCH_METHOD_v1`, trigger registry un trigger set drafti ar šo lēmumu netiek iesaldēti.


## 10. Review #13 integrācijas statuss

Review #13 bloķējošie punkti ir iestrādāti draftā:
- ICT-DORA autoritātes etiķete vairs netiek aizpildīta ar nenosauktu funkciju;
- interpretatīvie triggeri pārveidoti par FACT PROFILE noteikumiem / uncertainty triggers;
- spēkā esoša LCA izmantota FINDING maiņa vai jauns FINDING, kas skar attiecīgā trigger set tēmu, automātiski ierosina obligātu reclassification review;
- screening summary tiek virzīts uz materiālo OUTPUT;
- MODULE TRIGGER SET un MTR- tiek reģistrēti Terminology;
- trigger lifecycle izmanto ACTIVE / DEPRECATED; draftam lifecycle = null tikai saskaņā ar approved_by cross-field invariantu;
- screening apstiprinājums izmanto HUMAN DECISION;
- DORA CIF-independent daļa netiek bloķēta CIF gaidīšanas dēļ;
- pirms OUTSOURCING-EBA trigger set ACTIVE nepieciešams 15–20 reālu līgumu kalibrācijas pilots;
- placeholder triggeri pirms ACTIVE jāaizpilda vai jāizņem.

## 11. Go-live priekšnosacījumi

Pirms ICT-DORA moduļa production lietošanas:
```text
GO-LIVE PRECONDITION:
ICT-DORA MODULE STATUS confirming function named and approved.
```

Kamēr tas nav izpildīts:
- ICT-DORA module nav operacionāli aktivizējams;
- COMMON CONTRACT REVIEW turpinās;
- juriste nedrīkst tikt izmantota kā pagaidu MODULE STATUS apstiprinātāja tikai tādēļ, lai apietu šo priekšnosacījumu.

Pirms OUTSOURCING-EBA SHORT INTAKE:
- trigger set lifecycle = ACTIVE;
- source / bank-internal review pabeigts;
- kalibrācijas false-negative gate izturēts.

## 12. Review #14 integrācijas kopsavilkums

Review #14 labojumi draftā:
- reclassification aptver arī jaunus FINDING, kas skar trigger set tēmas;
- negatīvi formulēta triggera NOT IDENTIFIED prasa supporting FINDING;
- lifecycle null ir cross-field nepiemērojamība, ne jauns stāvoklis;
- HUMAN DECISION ir obligāts DECISION TYPE;
- kalibrācijai ir 100% zināmo outsourcing gadījumu false-negative gate;
- IKT juridiskā kvalifikācija ir obligāts moduļa lēmuma ievaddats; domstarpība → escalation;
- DORA CIF-independent un CIF-dependent prasības ir atsevišķas REQUIREMENTS SET;
- output screening summary satur MSR ID, bet ne obligāti personas vārdu/laiku;
- placeholder aizliegums ir universāls governance invariants.

## 13. Nākamais solis

1. mehāniskais audits pēc Review #14 — PABEIGTS;
2. Review #16 shēmas delta — IMPLEMENTĒTS, AUDITĒTS UN CORE FREEZE IZPILDĪTS 2026-09-19;
3. globālā module activation gate arhitektūra — atsevišķs lēmums;
4. bankas governance jautājums par ICT-DORA resolution authority un action owner nav atrisināts; faktiska `UNRESOLVED ISSUE` instance nav izveidota;
5. bankas iekšējo outsourcing avotu pievienošana un kalibrācijas pilots;
6. gala review / freeze approval tikai pēc iepriekšējā izpildes.

## 14. Review #16 integrācijas kopsavilkums

Review #16 apstiprinātais delta:

- `MODULE RECORD` pievienots obligāts `MODULE ID`;
- trace-object references ir tipētas un piespraustas konkrētai Traceability Record versijai;
- `HUMAN DECISION RECORD` un `UNRESOLVED ISSUE RECORD` izmanto `RELATED TRACE OBJECT REFERENCES`;
- TASK reģistrē `AI USED`, deklarācijas autoru un laiku, bet AI rīka/politikas laukus prasa tikai faktiskas AI izmantošanas gadījumā;
- `RESPONSIBLE FUNCTION` aizstāts ar dokumentētu `ACTION OWNER` un atsevišķu resolution authority modeli;
- `RELATED MODULE` precizēts par `RELATED MODULE ID`;
- `CONTENT HASH` ir sasaistīts ar obligātu kontrolētu algoritmu.

Apstiprinājuma robežas un apzināti neieviestie jautājumi ir fiksēti `GOVERNANCE/TRACEABILITY_ISS_INSTANTIATION_REVIEW16.md`.
