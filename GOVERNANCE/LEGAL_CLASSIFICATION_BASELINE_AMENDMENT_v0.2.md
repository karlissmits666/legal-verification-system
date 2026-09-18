# LEGAL_CLASSIFICATION_BASELINE_AMENDMENT_v0.2

Juridiskās klasifikācijas slāņa baseline amendment pakete

**Statuss:** KONSOLIDĒTA — KRITISKAI PĀRBAUDEI; NAV IESALDĒTA  
**Versija:** v0.2  
**Datums:** 2026-09-18  
**Review bāze:** Critical architecture review #11, #12 un #13

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
8. `OUTSOURCING_EBA_MODULE_TRIGGER_SET_v0.1.md` — source-based draft, NOT ACTIVE

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

Pakete nav frozen.

Līdz atsevišķam freeze lēmumam autoritatīvas paliek:
- `PROFESSIONAL_SCOPE_v1.3`;
- `TRACEABILITY_RECORD_v1 v0.5`;
- `TERMINOLOGY_AND_ENUMS_v1 v0.3`;
- `VERIFICATION_PROTOCOL_v1 v0.5`.

## 10. Review #13 integrācijas statuss

Review #13 bloķējošie punkti ir iestrādāti draftā:
- ICT-DORA autoritātes etiķete vairs netiek aizpildīta ar nenosauktu funkciju;
- interpretatīvie triggeri pārveidoti par FACT PROFILE noteikumiem / uncertainty triggers;
- jebkura LCA izmantota FINDING maiņa automātiski rada RECLASSIFICATION REVIEW REQUIRED;
- screening summary tiek virzīts uz materiālo OUTPUT;
- MODULE TRIGGER SET un MTR- tiek reģistrēti Terminology;
- trigger lifecycle izmanto ACTIVE / DEPRECATED; neapstiprinātam draftam lifecycle = null;
- screening apstiprinājums izmanto HUMAN DECISION;
- DORA CIF-independent daļa netiek bloķēta CIF gaidīšanas dēļ;
- pirms OUTSOURCING-EBA trigger set ACTIVE nepieciešams 15–20 reālu līgumu kalibrācijas pilots;
- placeholder triggeri pirms ACTIVE jāaizpilda vai jāizņem.

## 11. Nākamais solis

1. Critical architecture review #14 tikai Review #13 labojumu deltai;
2. source / bank-internal review OUTSOURCING-EBA trigger set;
3. mehāniskais audits;
4. tikai pēc tam freeze approval.
