# PROJECT_ROADMAP_v1

## Legal Verification System — kopējais projekta uzdevums

**Statuss:** ACTIVE  
**Bāze:** `PROFESSIONAL_SCOPE_v1.3 — APPROVED — BASELINE (FROZEN)`

Šis dokuments nosaka projekta kopējo dokumentu kopu un izstrādes secību. Tā mērķis ir vienā vietā fiksēt, kas vēl jāizveido, kuri dokumenti ir priekšnoteikumi citiem slāņiem un kuriem nepieciešama praktiska pilotēšana pirms freeze.

## 1. Kopējais dokumentu komplekts

| # | Dokuments | Mērķis | Statuss | Pilots |
|---|---|---|---|---|
| 1 | `PROFESSIONAL_SCOPE_v1.3` | Sistēmas profesionālais tvērums, kompetences, invarianti un slēgtie statusi | **DONE — FROZEN** | Nē |
| 2 | `TRACEABILITY_RECORD_v1` | Izsekojamības datu modelis katram materiālam juridiskā darba rezultātam | **v0.4 FREEZE CANDIDATE — MECHANICAL AUDIT PASS** | **Jā** |
| 3 | `AI_TOOL_USAGE_POLICY_v1` | Bankas apstiprināto AI rīku lietošanas gadījumu, datu klašu un atļauju strukturēta politika / mapping | TODO | Nē — nepieciešams bankas governance apstiprinājums |
| 4 | `VERIFICATION_PROTOCOL_v1` | Precīza HUMAN VERIFIED, semantic verification, verification depth un release-gate kārtība | TODO | **Jā** |
| 5 | `REQUIREMENTS_MATRIX_GOVERNANCE_v1` | Prasību ievade, līmeņu piešķiršana, komponenti, versēšana, pārskatīšana un UNCLASSIFIED pārvaldība | TODO | Netieši, caur requirements matrix pilotiem |
| 6 | `OPERATION_WORKFLOWS_v1` | Detalizētas plūsmas ANALYSE / VERIFY / DRAFT / COMPARE / EXTRACT | TODO | **Jā** |
| 7 | `LEGAL_RESEARCH_METHOD_v1` | Juridiskās izpētes, avotu prioritātes, alternatīvu interpretāciju un risinājumu analīzes metodoloģija | TODO | **Jā** |
| 8 | `TERMINOLOGY_AND_ENUMS_v1` | Canonical termini, enum vērtības un machine-readable mapping noteikumi | TODO | Nē |
| 9 | `COMMON_CONTRACT_REVIEW_CHECKLIST_v1` | Universālā līgumu juridiskā pārbaude neatkarīgi no specializētajiem moduļiem | TODO | **Jā** |
| 10 | `EBA_REQUIREMENTS_MATRIX_v1` | Apstiprināta outsourcing/EBA contractual prasību kopa | TODO | **Jā** |
| 11 | `DORA_REQUIREMENTS_MATRIX_v1` | Apstiprināta ICT/DORA contractual prasību kopa | TODO | **Jā** |
| 12 | `LEGORA_IMPLEMENTATION_SPEC_v1` | Legora execution kernel, projekta struktūra, prompts, workflows, playbooks, structured review, traceability un release-gate mērķa arhitektūra | **TARGET ARCHITECTURE DEFINED — IMPLEMENTATION PENDING** | **Jā — obligāts end-to-end pilots** |
| 13 | `PILOT_AND_ACCEPTANCE_PLAN_v1` | Pilotu scenāriji, metrikas, pieņemšanas kritēriji un freeze nosacījumi | TODO | Šis dokuments definē pilotus |

## 2. Nosacīts papildu dokuments

`RULE_BASED_DETERMINATION_VALIDATION_v1` tiek izveidots tikai tad, ja sistēmā faktiski tiek ieviesta `RULE-BASED DETERMINATION` autoritāte kādam modulim vai lēmumam.

Pašreizējā frozen baseline nevienam modulim šāda autoritāte nav piešķirta, tādēļ šis dokuments nav daļa no obligātajiem 13.

## 3. Pilotu kopa

Atsevišķi pilotējamie dokumenti / slāņi:

1. `TRACEABILITY_RECORD_v1`
2. `VERIFICATION_PROTOCOL_v1`
3. `OPERATION_WORKFLOWS_v1`
4. `LEGAL_RESEARCH_METHOD_v1`
5. `COMMON_CONTRACT_REVIEW_CHECKLIST_v1`
6. `EBA_REQUIREMENTS_MATRIX_v1`
7. `DORA_REQUIREMENTS_MATRIX_v1`
8. `LEGORA_IMPLEMENTATION_SPEC_v1`

Šie nav astoņi pilnīgi neatkarīgi piloti. Tos apvieno četros pilota posmos.

### PILOT 1 — Traceability un pamatworkflow

Mērķis:
- pārbaudīt, vai Traceability Record ir praktiski aizpildāms;
- pārbaudīt FINDING / EVIDENCE / VERIFICATION sasaisti;
- pārbaudīt, vai izsekojamība nerada nesamērīgu manuālo slodzi;
- pārbaudīt, vai materiāla output release gate darbojas.

Ieteicamais apjoms:
- 5–10 jau pabeigti vai droši atkārtoti analizējami uzdevumi.

### PILOT 2 — Contract verification

Komponenti:
- `VERIFICATION_PROTOCOL_v1`
- VERIFY workflow no `OPERATION_WORKFLOWS_v1`
- `COMMON_CONTRACT_REVIEW_CHECKLIST_v1`

Mērķis:
- salīdzināt sistēmas atradumus ar jurista zināmu rezultātu;
- izmērīt false positives;
- pārbaudīt, vai mandatory requirement miss netiek palaists garām;
- pārbaudīt HUMAN VERIFIED sliekšņus un release gates.

### PILOT 3 — Regulatory requirements

Komponenti:
- `EBA_REQUIREMENTS_MATRIX_v1`
- `DORA_REQUIREMENTS_MATRIX_v1`
- `REQUIREMENTS_MATRIX_GOVERNANCE_v1`

Mērķis:
- pārbaudīt requirements completeness pret apstiprināto kopu;
- pārbaudīt saliktās prasības un komponentu agregāciju;
- pārbaudīt versēšanu;
- pārbaudīt mandatory requirement miss rate.

Galvenais drošības KPI:
- nepamanītu obligātu prasību skaits.

### PILOT 4 — Legora end-to-end

Komponenti:
- visi iepriekšējie slāņi;
- `LEGORA_IMPLEMENTATION_SPEC_v1`;
- `LEGAL_RESEARCH_METHOD_v1`;
- visu piecu operāciju darba plūsmas.

Pilna ķēde:

```text
LEGAL TASK
→ TASK CLASSIFICATION
→ AI TOOL PERMISSION CHECK
→ SOURCES
→ OPERATION WORKFLOW
→ FINDINGS / REQUIREMENT RESULTS
→ EVIDENCE REFERENCES
→ VERIFICATION
→ TRACEABILITY RECORD
→ LAWYER REVIEW
→ MATERIAL OUTPUT
```

## 4. Ieteicamā izstrādes secība

```text
1. PROFESSIONAL_SCOPE_v1.3                     DONE / FROZEN
2. TRACEABILITY_RECORD_v1                     IN PROGRESS
3. TERMINOLOGY_AND_ENUMS_v1
4. VERIFICATION_PROTOCOL_v1
5. REQUIREMENTS_MATRIX_GOVERNANCE_v1
6. OPERATION_WORKFLOWS_v1
7. LEGAL_RESEARCH_METHOD_v1
8. COMMON_CONTRACT_REVIEW_CHECKLIST_v1
9. EBA_REQUIREMENTS_MATRIX_v1
10. DORA_REQUIREMENTS_MATRIX_v1
11. AI_TOOL_USAGE_POLICY_v1
12. LEGORA_IMPLEMENTATION_SPEC_v1                 TARGET ARCHITECTURE DEFINED
13. PILOT_AND_ACCEPTANCE_PLAN_v1
→ COMPLETE ALL SUPPORTING DOCUMENTS
→ IMPLEMENT LEGORA_IMPLEMENTATION_SPEC_v1
→ PILOT EXECUTION
→ FIX FAILURES
→ REGRESSION
→ ACCEPTANCE
→ FREEZE RUNTIME MANIFEST
```

`AI_TOOL_USAGE_POLICY_v1` saturs nevar tikt izdomāts sistēmas iekšienē. Tas jābalsta bankas faktiskajos governance lēmumos un apstiprinātajos AI lietošanas noteikumos.

## 5. Projekta progresa kopsavilkums

**Obligātie pamatdokumenti:** 13  
**Pabeigti / frozen:** 1  
**Izstrādē:** 1  
**Atlikuši pēc Traceability:** 11  
**Dokumenti/slāņi, kuriem nepieciešama praktiska pilotēšana:** 8  
**Plānotie pilota posmi:** 4  
**Nosacīts papildu dokuments:** 1

## 6. Projekta pabeigtības princips

Projekts nav uzskatāms par pabeigtu tikai tāpēc, ka visi dokumenti ir uzrakstīti.

Pabeigtība nozīmē:

1. visi obligātie dokumenti ir apstiprināti;
2. visi savstarpējie references ir konsekventi;
3. canonical statusi un enum vērtības nesadalās paralēlās sistēmās;
4. pilotu rezultāti atbilst `PILOT_AND_ACCEPTANCE_PLAN_v1` kritērijiem;
5. Legora end-to-end workflow strādā praksē;
6. nav neatrisinātu blocking arhitektūras pretrunu;
7. apstiprinātās baseline versijas ir iesaldētas un izsekojamas Git vēsturē.


## 7. Gala ieviešanas uzdevums

Projekta gala implementācijas mērķi nosaka:

`IMPLEMENTATION/LEGORA_IMPLEMENTATION_SPEC_v1.md`

Tas ir mērķa stāvoklis, kas jāsasniedz pēc visu atbalsta dokumentu pabeigšanas.

Gala secība:

```text
COMPLETE AND FREEZE SUPPORTING DOCUMENTS
→ IMPLEMENT LEGORA_IMPLEMENTATION_SPEC_v1 IN LEGORA
→ RUN PILOT_AND_ACCEPTANCE_PLAN_v1
→ FIX FAILURES
→ RUN REGRESSION
→ APPROVE PRODUCTION CONFIGURATION
→ FREEZE RUNTIME MANIFEST
```

Sistēma nav uzskatāma par ieviestu tikai tādēļ, ka dokumenti ir uzrakstīti. Tā ir ieviesta tikai tad, kad Legora production konfigurācija atbilst mērķa arhitektūrai un ir izgājusi acceptance/regression pārbaudi.


## Traceability milestone

`TRACEABILITY_RECORD_v1 — Architecture v0.4` ir konsolidēts kā freeze candidate.

- Mechanical audit pret `PROFESSIONAL_SCOPE_v1.3`: PASS
- Blocking baseline conflicts: 0
- New canonical statuses: 0
- Freeze: gaida lietotāja explicit approval
- Pilot 1 scope: ANALYSE + EXTRACT
- Pilot 1 obligāts simulated DATA CLASS MISMATCH SUSPECTED test case
