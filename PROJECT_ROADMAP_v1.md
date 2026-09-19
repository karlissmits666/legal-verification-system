# PROJECT_ROADMAP_v1

## Juridiskās pārbaudes sistēma — kopējais projekta uzdevums

**Statuss:** AKTĪVS  
**Bāze:** `PROFESSIONAL_SCOPE_v1.3` — APSTIPRINĀTS, PAMATVERSIJA IESALDĒTA

Šis dokuments nosaka projekta kopējo dokumentu kopu un izstrādes secību. Tā mērķis ir vienā vietā fiksēt, kas vēl jāizveido, kuri dokumenti ir priekšnoteikumi citiem slāņiem un kuriem nepieciešama praktiska pilotēšana pirms freeze.

Projekta stabilos mērķus, autoritātes robežas un neaizskaramos principus nosaka `PROJECT_CONSTITUTION_v1.md`; izpildi regulē `PROJECT_EXECUTION_PROTOCOL.md`. Šis roadmap paliek programmas līmeņa kontroles plakne un aktuālā statusa avots. Konstitūcija un protokols nav 14. vai 15. obligātais arhitektūras pamatdokuments.

Starpčatu continuity nodrošina `NEW_CHAT_START_TASK.md` un `PROJECT_CURRENT_STATE.md`. Tie ir procesa un navigācijas artefakti, ne jauni pamatdokumenti un ne arhitektūras autoritātes avoti.

## 1. Kopējais dokumentu komplekts

| # | Dokuments | Mērķis | Statuss | Pilots |
|---|---|---|---|---|
| 1 | `PROFESSIONAL_SCOPE_v1.3` | Sistēmas profesionālais tvērums, kompetences, invarianti un slēgtie statusi | **v1.3 IESALDĒTA; v1.4 — KONSOLIDĒTS v0.2 PAKETEI** | Nē |
| 2 | `TRACEABILITY_RECORD_v1` | Izsekojamības datu modelis katram materiālam juridiskā darba rezultātam | **v0.5 IESALDĒTA; v0.6 — REVIEW #16 DELTA IMPLEMENTĒTS, AUDITS PENDING** | **Jā — 1. pilots: ANALYSE + EXTRACT** |
| 3 | `AI_TOOL_USAGE_POLICY_v1` | Bankas apstiprināto MI rīku lietošanas gadījumu, datu klašu un atļauju strukturēta politika un sasaistes modelis | **JĀIZSTRĀDĀ** | Nē — nepieciešams bankas governance apstiprinājums |
| 4 | `VERIFICATION_PROTOCOL_v1` | Precīza `HUMAN VERIFIED`, semantiskās verifikācijas, verifikācijas dziļuma un izdošanas vārtu kārtība | **PABEIGTS — IESALDĒTS (v0.5)** | **Jā — 2. pilots** |
| 5 | `REQUIREMENTS_MATRIX_GOVERNANCE_v1` | Prasību ievade, līmeņu piešķiršana, komponenti, versēšana, pārskatīšana un UNCLASSIFIED pārvaldība | **v0.3 — KONSOLIDĒTS v0.2 PAKETEI** | Netieši, caur prasību matricu pilotiem |
| 6 | `OPERATION_WORKFLOWS_v1` | Detalizētas plūsmas ANALYSE / VERIFY / DRAFT / COMPARE / EXTRACT | **v0.2 — KONSOLIDĒTS v0.2 PAKETEI** | **Jā** |
| 7 | `LEGAL_RESEARCH_METHOD_v1` | Juridiskās izpētes, avotu prioritātes, alternatīvu interpretāciju un risinājumu analīzes metodoloģija | **v0.1 — ARHITEKTŪRAS APSPRIEŠANĀ** | **Jā** |
| 8 | `TERMINOLOGY_AND_ENUMS_v1` | Kanoniskie termini, uzskaitījumu (enum) vērtības un mašīnlasāmās sasaistes noteikumi | **v0.3 IESALDĒTA; v0.4 — KONSOLIDĒTS v0.2 PAKETEI** | Nē |
| 9 | `COMMON_CONTRACT_REVIEW_CHECKLIST_v1` | Universālā līgumu juridiskā pārbaude neatkarīgi no specializētajiem moduļiem | **JĀIZSTRĀDĀ** | **Jā** |
| 10 | `EBA_REQUIREMENTS_MATRIX_v1` | Apstiprināta ārpakalpojumu/EBA līgumisko prasību kopa | **JĀIZSTRĀDĀ** | **Jā** |
| 11 | `DORA_REQUIREMENTS_MATRIX_v1` | Apstiprināta IKT/DORA līgumisko prasību kopa | **JĀIZSTRĀDĀ** | **Jā** |
| 12 | `LEGORA_IMPLEMENTATION_SPEC_v1` | Legora izpildes kodola, projekta struktūras, uzvedņu, darba plūsmu, noteikumu kopu (`playbooks`), strukturētās pārbaudes, izsekojamības un izdošanas vārtu mērķa arhitektūra | **MĒRĶA ARHITEKTŪRA DEFINĒTA — IEVIEŠANA NAV PABEIGTA** | **Jā — obligāts end-to-end pilots** |
| 13 | `PILOT_AND_ACCEPTANCE_PLAN_v1` | Pilotu scenāriji, metrikas, pieņemšanas kritēriji un freeze nosacījumi | **JĀIZSTRĀDĀ** | Šis dokuments definē pilotus |

## 2. Nosacīts papildu dokuments

`RULE_BASED_DETERMINATION_VALIDATION_v1` tiek izveidots tikai tad, ja sistēmā faktiski tiek ieviesta `RULE-BASED DETERMINATION` autoritāte kādam modulim vai lēmumam.

Pašreizējā iesaldētā pamatversija nevienam modulim šāda autoritāte nav piešķirta, tādēļ šis dokuments nav daļa no obligātajiem 13.

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

### 1. pilots — izsekojamība un pamatdarba plūsma

Mērķis:
- pārbaudīt, vai izsekojamības ieraksts (`Traceability Record`) ir praktiski aizpildāms;
- pārbaudīt `FINDING` / `EVIDENCE` / `VERIFICATION` sasaisti;
- pārbaudīt, vai izsekojamība nerada nesamērīgu manuālo slodzi;
- pārbaudīt, vai materiāla rezultāta izdošanas vārti darbojas.

Ieteicamais apjoms:
- 5–10 jau pabeigti vai droši atkārtoti analizējami uzdevumi.

### 2. pilots — līgumu verifikācija

Komponenti:
- `VERIFICATION_PROTOCOL_v1`
- `VERIFY` darba plūsmu no `OPERATION_WORKFLOWS_v1`
- `COMMON_CONTRACT_REVIEW_CHECKLIST_v1`

Mērķis:
- salīdzināt sistēmas atradumus ar jurista zināmu rezultātu;
- izmērīt kļūdaini pozitīvos rezultātus;
- pārbaudīt, vai nepamanītu obligāto prasību netiek palaists garām;
- pārbaudīt HUMAN VERIFIED sliekšņus un izdošanas vārtus.

### 3. pilots — regulatīvās prasības

Komponenti:
- `EBA_REQUIREMENTS_MATRIX_v1`
- `DORA_REQUIREMENTS_MATRIX_v1`
- `REQUIREMENTS_MATRIX_GOVERNANCE_v1`

Mērķis:
- pārbaudīt prasību kopas pilnīgumu pret apstiprināto kopu;
- pārbaudīt saliktās prasības un komponentu agregāciju;
- pārbaudīt versēšanu;
- pārbaudīt nepamanīto obligāto prasību īpatsvaru.

Galvenais drošības KPI:
- nepamanītu obligātu prasību skaits.

### 4. pilots — Legora pilnais process

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
1. PROFESSIONAL_SCOPE_v1.3                     PABEIGTS / IESALDĒTS
2. TRACEABILITY_RECORD_v1                     PABEIGTS / IESALDĒTS (v0.5)
3. TERMINOLOGY_AND_ENUMS_v1                 PABEIGTS / IESALDĒTS (v0.3)
4. VERIFICATION_PROTOCOL_v1                 PABEIGTS / IESALDĒTS (v0.5)
5. REQUIREMENTS_MATRIX_GOVERNANCE_v1
6. OPERATION_WORKFLOWS_v1
7. LEGAL_RESEARCH_METHOD_v1
8. COMMON_CONTRACT_REVIEW_CHECKLIST_v1
9. EBA_REQUIREMENTS_MATRIX_v1
10. DORA_REQUIREMENTS_MATRIX_v1
11. AI_TOOL_USAGE_POLICY_v1
12. LEGORA_IMPLEMENTATION_SPEC_v1                 MĒRĶA ARHITEKTŪRA DEFINĒTA
13. PILOT_AND_ACCEPTANCE_PLAN_v1
→ PABEIGT UN IESALDĒT VISUS ATBALSTA DOKUMENTUS
→ IEVIEST LEGORA_IMPLEMENTATION_SPEC_v1
→ IZPILDĪT PILOTUS
→ IZLABOT KONSTATĒTĀS KĻŪDAS
→ REGRESIJAS PĀRBAUDE
→ PIEŅEMŠANAS PĀRBAUDE
→ IESALDĒT IZPILDVIDES MANIFESTU
```

`AI_TOOL_USAGE_POLICY_v1` saturs nevar tikt izdomāts sistēmas iekšienē. Tas jābalsta bankas faktiskajos governance lēmumos un apstiprinātajos AI lietošanas noteikumos.

## 4.1. Obligātais post-Review #16 architecture conformance restructuring posms

Pēc Review #16 saistītās paketes freeze un pirms nākamā lielā 13 dokumentu roadmap dokumenta pilna dzīves cikla obligāti izpilda:

`GOVERNANCE/ARCHITECTURE_CONFORMANCE_RESTRUCTURING_PLAN_v0.1.md`

Šis nav 14. pamatdokuments. Tas ir starpdokumentu amendment / implementation plāns, kas ievieš piecus atbalsta workstreamus:

1. Machine-readable Schema & Registry Layer;
2. Requirement → Source → Schema → Test → Evidence Traceability;
3. AI Candidate → Canonical State Boundary;
4. Executable Conformance Suite;
5. Repository Integrity Manifest & Release Evidence.

Programmas secība šajā punktā:

```text
REVIEW #16 FREEZE
→ ARCHITECTURE CONFORMANCE RESTRUCTURING WS1–WS5
→ AUDIT + USER CONSENSUS
→ NEXT 13-DOCUMENT ROADMAP UNIT
```

Restrukturizācijas mērķis ir samazināt manuāla review slodzi un interpretācijas brīvību, nepārņemot ārēju projektu domēna modeļus vai tehnoloģisko stacku un nemainot 13 pamatdokumentu skaitu.

## 5. Projekta progresa kopsavilkums

**Obligātie pamatdokumenti:** 13  
**Pabeigti / iesaldēti:** 4  
**Izstrādē:** 6  
**Atlikuši obligātie dokumenti:** 9  
**Dokumenti/slāņi, kuriem nepieciešama praktiska pilotēšana:** 8  
**Plānotie pilotu posmi:** 4  
**Nosacīts papildu dokuments:** 1

## 6. Projekta pabeigtības princips

Projekts nav uzskatāms par pabeigtu tikai tāpēc, ka visi dokumenti ir uzrakstīti.

Pabeigtība nozīmē:

1. visi obligātie dokumenti ir apstiprināti;
2. visi savstarpējie atsauces ir konsekventas;
3. kanoniskie statusi un uzskaitījumu (enum) vērtības nesadalās paralēlās sistēmās;
4. pilotu rezultāti atbilst `PILOT_AND_ACCEPTANCE_PLAN_v1` kritērijiem;
5. Legora pilnā darba plūsma strādā praksē;
6. nav neatrisinātu bloķējošu arhitektūras pretrunu;
7. apstiprinātās pamatversijas ir iesaldētas un izsekojamas Git vēsturē.


## 7. Gala ieviešanas uzdevums

Projekta gala implementācijas mērķi nosaka:

`IMPLEMENTATION/LEGORA_IMPLEMENTATION_SPEC_v1.md`

Tas ir mērķa stāvoklis, kas jāsasniedz pēc visu atbalsta dokumentu pabeigšanas.

Gala secība:

```text
PABEIGT UN IESALDĒT VISUS ATBALSTA DOKUMENTUS
→ IEVIEST LEGORA_IMPLEMENTATION_SPEC_v1 LEGORA VIDĒ
→ IZPILDĪT PILOT_AND_ACCEPTANCE_PLAN_v1
→ IZLABOT KONSTATĒTĀS KĻŪDAS
→ IZPILDĪT REGRESIJAS PĀRBAUDI
→ APSTIPRINĀT PRODUKCIJAS KONFIGURĀCIJU
→ IESALDĒT IZPILDVIDES MANIFESTU
```

Sistēma nav uzskatāma par ieviestu tikai tādēļ, ka dokumenti ir uzrakstīti. Tā ir ieviesta tikai tad, kad Legora produkcijas konfigurācija atbilst mērķa arhitektūrai un ir izgājusi pieņemšanas un regresijas pārbaudi.


## Izsekojamības posms

`TRACEABILITY_RECORD_v1 — Arhitektūra v0.5` ir apstiprināts kā iesaldētā pamatversija.

- Mehāniskais audits pret `PROFESSIONAL_SCOPE_v1.3`: PASS
- Bloķējošas pretrunas ar pamatversiju: 0
- Jauni kanoniskie statusi: 0
- Iesaldēšana: APSTIPRINĀTS — PAMATVERSIJA (IESALDĒTA), 2026-09-18
- Pilota 1 tvērums: ANALYSE + EXTRACT
- 1. pilotā obligāts simulēts `DATA CLASS MISMATCH SUSPECTED` testa gadījums


## Terminoloģijas posms

`TERMINOLOGY_AND_ENUMS_v1 — v0.3` ir apstiprināts kā iesaldētā pamatversija.

- Mehāniskais audits pret `PROFESSIONAL_SCOPE_v1.3` un `TRACEABILITY_RECORD_v1 v0.4`: IZTURĒTS
- Bloķējošas pretrunas ar pamatversijām: 0
- Jauni frozen canonical statusi: 0
- LV lietotāja saskarnes apzīmējumu slānis: definēts
- Ārējo kontrolēto reģistru īpašnieki: definēti
- Iesaldēšana: APSTIPRINĀTS — PAMATVERSIJA (IESALDĒTA), 2026-09-18


## Verifikācijas protokola posms

Pēc arhitektūras review #8–#10 ir sasniegts konsenss par `VERIFICATION_PROTOCOL_v1 v0.5`.

- `VERIFICATION_PROTOCOL_v1 v0.5`: APSTIPRINĀTS — PAMATVERSIJA (IESALDĒTA).
- `TRACEABILITY_RECORD_v1 — Arhitektūra v0.5`: APSTIPRINĀTS — PAMATVERSIJA (IESALDĒTA).
- `TERMINOLOGY_AND_ENUMS_v1 — v0.3`: APSTIPRINĀTS — PAMATVERSIJA (IESALDĒTA).
- Iepriekšējās `TRACEABILITY_RECORD_v1 v0.4` un `TERMINOLOGY_AND_ENUMS_v1 v0.2` paliek nemainīgas Git vēsturē.
- Mehāniskie auditi: IZTURĒTI.
- Atvērtas arhitektūras domstarpības: 0.
- Iesaldēšanas datums: 2026-09-18.


## Juridiskās klasifikācijas amendment pakete

2026-09-18 konsolidēta `GOVERNANCE/LEGAL_CLASSIFICATION_BASELINE_AMENDMENT_v0.2.md` pēc Critical architecture review #11 un #12.

Pakete izstrādā:
- `PROFESSIONAL_SCOPE_v1.4`;
- `TRACEABILITY_RECORD_v1 v0.6`;
- `TERMINOLOGY_AND_ENUMS_v1 v0.4`;
- `OPERATION_WORKFLOWS_v1 v0.2`;
- `LEGAL_RESEARCH_METHOD_v1 v0.2`;
- `REQUIREMENTS_MATRIX_GOVERNANCE_v1 v0.3`;
- `MODULE_TRIGGER_REGISTRY_v1 v0.1`.

Pamatsecība:
```text
CONTRACT TYPE
→ LEGAL / REGULATORY CLASSIFICATION ASSESSMENT
→ HUMAN / EXTERNAL DECISION
→ MODULE STATUS
→ REQUIREMENTS SET SELECTION
→ OPERATION
```

Review #16 response v7 saskaņotais delta ir atomāri implementēts amendment paketes draftos. Jaunās versijas joprojām nav frozen. Iepriekšējās apstiprinātās pamatversijas paliek autoritatīvas līdz atsevišķam freeze lēmumam.


### SHORT INTAKE operacionālais priekšnoteikums

`MODULE_TRIGGER_REGISTRY_v1 v0.1` governance struktūra ir izveidota, bet OUTSOURCING-EBA trigger set vēl nav ACTIVE. Līdz source-based triggeru apstiprināšanai SHORT INTAKE šim modulim nav pieejams un sistēma izmanto FULL LCA.

Arhitektūras domstarpības pēc review #12: 0.


### Neatrisinātais governance jautājums — ICT-DORA autoritāte

`GOVERNANCE/ICT_DORA_MODULE_AUTHORITY_INPUT_REQUEST_v0.1.md` pastāv kā `PREMATURE DRAFT COMMIT`. Tas nav apstiprināts, nav frozen, nav autoritatīvs un pagaidām tiek saglabāts tikai līdz derīgā satura migrācijai.

- arhitektūras mehāniskais audits pēc Review #14: PASS;
- ICT-DORA moduļa autoritāte nav dokumentēta;
- mērķa reprezentācija ir esošais `UNRESOLVED ISSUE` modelis, bet faktiska reģistrācija vēl nav veikta;
- Review #16 shēmas delta ir lietotāja apstiprināts un integrēts draftos: `MODULE ID`, pinned trace-object references, conditional AI governance lauki un nodalīts action owner / resolution authority modelis;
- Review #16 integrācija nav freeze un nemaina frozen baseline;
- ICT-DORA production aktivizācija nav pieļaujama, kamēr autoritātes avots nav dokumentēts;
- COMMON CONTRACT REVIEW turpinās.

Nākamais arhitektūras solis: atsevišķi izlemt globālā module activation gate arhitektūru. Faktiska `UNRESOLVED ISSUE` reģistrācija gaida derīgu TASK / MODULE kontekstu un dokumentētu bankas assignment par action owner un resolution authority. Bankas iekšējo outsourcing avotu pievienošana un OUTSOURCING-EBA trigger set kalibrācijas pilots paliek atsevišķi atvērti darbi.
