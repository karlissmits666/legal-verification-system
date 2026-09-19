# REVIEW #16 — FORMĀLA ATBILDE UZ R1–R5 — v3

**Statuss:** REVIEW RESPONSE v3 — POZĪCIJA FIKSĒTA, KONSENSS PENDING, IMPLEMENTATION NAV APSTIPRINĀTA  
**Datums:** 2026-09-19  
**Versija:** v3  
**Atbildes bāze:** `GOVERNANCE/TRACEABILITY_ISS_INSTANTIATION_REVIEW16_R1_R5_V2_RESPONSE_REVIEW.md`  
**v2 recenzētais commits:** `12b4ff32e15644737edf546644722b5b442341db`  
**v3 owner-shēmu pārbaudes bāze:** `1783c50b7ad7c45bba5b468e74ba4ac6d2364147`  
**Implementation:** NAV VEIKTA  
**Freeze:** NAV APSTIPRINĀTS

## 1. Atbildes robeža

[PĀRBAUDĪTS FAKTS] Neatkarīgā v2 recenzija saglabāja R1–R5 arhitektūras virzienu, bet atgrieza `CHANGES REQUIRED` ar J1–J9.

[DOKUMENTĒTS LĒMUMS] Šis v3 ir tikai review-response artefakts. Tas nemaina arhitektūras draftus, frozen baseline, amendment statusu, faktisku TASK/MOD/ISS instanci vai production konfigurāciju. Tas fiksē projekta pozīciju un precīzu piedāvāto delta nākamai neatkarīgai pārbaudei.

## 2. J1 — T&E mapping struktūra

**PIEŅEMTS.**

[PRIEKŠLIKUMS] `TERMINOLOGY_AND_ENUMS_v1 v0.4` pēc §30 pievieno jaunu §30.1:

### 30.1. TRACE OBJECT TYPE → ID FIELD MAPPING

Šī tabula ir atvasināts kontrolēts indekss §26.1 invarianta mehāniskai pārbaudei. Tā nav lauku definīciju owner un nerada paralēlu canonical reģistru. Lauka faktiskā definīcija paliek `ID FIELD SCHEMA OWNER` norādītajā dokumentā un sadaļā. Ja mapping un owner shēma atšķiras, autoritatīva ir owner shēma un neatbilstība ir repo līmeņa defekts.

Tabulas kolonnas ir tieši:

```text
TRACE OBJECT TYPE | ID PREFIX | ID FIELD NAME | ID FIELD SCHEMA OWNER
```

Mapping:

| TRACE OBJECT TYPE | ID PREFIX | ID FIELD NAME | ID FIELD SCHEMA OWNER |
|---|---|---|---|
| TASK | `TASK-` | TASK ID | `TRACEABILITY_RECORD_v1 v0.6 §6` |
| SOURCE | `SRC-` | SOURCE ID | `TRACEABILITY_RECORD_v1 v0.6 §9` |
| MODULE | `MOD-` | MODULE ID | `TRACEABILITY_RECORD_v1 v0.6 §8` |
| FINDING | `FND-` | FINDING ID | `TRACEABILITY_RECORD_v1 v0.6 §15` |
| EVIDENCE | `EVD-` | EVIDENCE ID | `TRACEABILITY_RECORD_v1 v0.6 §17` |
| REQUIREMENTS SET | `RQS-` | REQUIREMENTS SET ID | `TRACEABILITY_RECORD_v1 v0.6 §21` |
| REQUIREMENT | `REQ-` | REQUIREMENT ID | `TRACEABILITY_RECORD_v1 v0.6 §22` |
| REQUIREMENT COMPONENT | `CMP-` | COMPONENT ID | `TRACEABILITY_RECORD_v1 v0.6 §27` |
| VERIFICATION EVENT | `VER-` | VERIFICATION EVENT ID | `TRACEABILITY_RECORD_v1 v0.6 §30` |
| VERIFICATION SCOPE RECORD | `VSR-` | VERIFICATION SCOPE RECORD ID | `TRACEABILITY_RECORD_v1 v0.6 §20.1` |
| LEGAL CLASSIFICATION ASSESSMENT | `LCA-` | LEGAL CLASSIFICATION ASSESSMENT ID | `TRACEABILITY_RECORD_v1 v0.6 §7.1` |
| MODULE SCREENING RECORD | `MSR-` | MODULE SCREENING RECORD ID | `TRACEABILITY_RECORD_v1 v0.6 §7.2` |
| MODULE TRIGGER SET | `MTR-` | TRIGGER SET ID | `MODULE_TRIGGER_REGISTRY_v1 §2` |
| HUMAN DECISION | `DEC-` | DECISION ID | `TRACEABILITY_RECORD_v1 v0.6 §36` |
| ESCALATION | `ESC-` | ESCALATION ID | `TRACEABILITY_RECORD_v1 v0.6 §37` |
| UNRESOLVED ISSUE | `ISS-` | ISSUE ID | `TRACEABILITY_RECORD_v1 v0.6 §38` |
| OUTPUT | `OUT-` | OUTPUT ID | `TRACEABILITY_RECORD_v1 v0.6 §40` |
| DATA CLASS EVENT | `DCE-` | EVENT ID | `TRACEABILITY_RECORD_v1 v0.6 §13` |
| TRACE RECORD | `TR-` | TRACE RECORD ID | `TRACEABILITY_RECORD_v1 v0.6 §44` |

`MODULE TRIGGER SET` gadījumā ID lauka shēmas owner ir `MODULE_TRIGGER_REGISTRY_v1 §2`; reģistra governance owner paliek `REQUIREMENTS_MATRIX_GOVERNANCE_v1`, kā norādīts T&E §30. Abi owner netiek sajaukti.

T&E §30 tabulai pievieno vienu rindu:

| Controlled field | Owning document | Registry |
|---|---|---|
| ID FIELD NAME | `TERMINOLOGY_AND_ENUMS_v1` | TRACE OBJECT TYPE → ID FIELD MAPPING (§30.1) |

Formulējums “vai līdzvērtīgu mehāniski viennozīmīgu lauku” tiek izņemts.

## 3. J2 — REQUIREMENT COMPONENT ID lauks

**PIEŅEMTS.**

Mapping rinda ir `COMPONENT ID`; TR v0.6 §27 lauks netiek pārsaukts. `REQUIREMENT COMPONENT ID` repo shēmā neeksistē, un pārsaukšana būtu jauna arhitektūras delta ārpus pašreizējā Review #16 tvēruma.

## 4. J3 — T&E §26.1 invarianti

**PIEŅEMTS.**

[PRIEKŠLIKUMS] T&E §26.1 pilnais teksts tiek aizstāts ar:

```text
### 26.1. Objekta ID lauka invariants

Katram TRACE OBJECT TYPE patstāvīgam ierakstam ir obligāts tā tipam
atbilstošs ID lauks.

MODULE RECORD tādēļ ir obligāts MODULE ID ar MOD- prefiksu; lauks
MODULE saglabā atsevišķu canonical taxonomy vērtību. MODULE ID un
MODULE nav savstarpēji aizstājami.

Katram 25. punktā reģistrētam TRACE OBJECT TYPE, kuram 26. punktā ir
piešķirts ID prefikss, ir tieši viens mehāniski pārbaudāms ID lauka
nosaukums tā objekta owner shēmā.

Sasaisti TRACE OBJECT TYPE → ID PREFIX → ID FIELD NAME →
ID FIELD SCHEMA OWNER uztur viens kontrolēts mapping 30.1. punktā.
```

Tādējādi tiek saglabāts obligāta ID lauka invariants un `MODULE ID` / taxonomy `MODULE` nodalījums.

## 5. J4 un J5 — BL3 reference mode un tvērums

**J4: PIEŅEMTS.**  
**J5: PIEŅEMTS.**

TR §5.1 un T&E §26.2 operācija abās vietās ir **AIZSTĀŠANA**, ne papildinājums.

Aizstājējteksta references modelis:

```text
INTRA-RECORD REFERENCE:
OBJECT TYPE
OBJECT ID

TRACE RECORD ID un RECORD VERSION tiek mantoti no containing immutable
record versijas un netiek glabāti atkārtoti.

CROSS-RECORD REFERENCE:
TRACE RECORD ID
RECORD VERSION
OBJECT TYPE
OBJECT ID

Cross-record režīmā visi četri lauki ir obligāti.

Abos režīmos OBJECT TYPE ir T&E §25 TRACE OBJECT TYPE, OBJECT ID
prefikss atbilst T&E §26, target objektam jāeksistē attiecīgajā record
versijā, un moving target current/latest nav pieļaujams.

Nepilnīga cross-record reference ir INVALID.
```

TR §5.1 un T&E §26.2 reference-mode definīcijām pēc implementation jābūt teksta ziņā identiskām. To atšķirība ir RMT2 FAIL.

### 5.1. Deterministisks reference lauku tvērums

**§5.1 trace-object references:**
- §5 governance dokumenta piespraustā SOURCE atsauce;
- §7.2 HUMAN DECISION `RELATED TRACE OBJECT REFERENCES` uz MODULE SCREENING RECORD;
- §36 `RELATED TRACE OBJECT REFERENCES`;
- §38 `RELATED TRACE OBJECT REFERENCES`.

**Nav §5.1 references — evidence-store:**
- §17 `EVIDENCE STORE REFERENCE`, `EVIDENCE SET / REVIEW ID`, `GENERATED AT`;
- §20 tie paši evidence-store lauki.

**Nav §5.1 references — ārējas sistēmas / citu tipu references:**
- §42 `SOURCE SYSTEM / CHANNEL`, `REFERENCE`, `DATE`, `BY`;
- §43 `DECISION SOURCE`, `REFERENCE`, `DATE`;
- §40 `OUTPUT REFERENCE`;
- §7.1 `CONTRACT TYPE REFERENCES`.

**Bare ID lauki paliek bare ID lauki šajā paketē:**
- §6 `FACT PROFILE FINDING IDS`, `MODULE SCREENING RECORD IDS`;
- §7.1 `TASK ID`, `RELATED MODULE ID`, `SUPERSEDES LCA ID`, `RECLASSIFICATION REVIEW DECISION ID`;
- §7.2 `TASK ID`, `TRIGGER REGISTRY ID`, `TRIGGER REGISTRY VERSION`, `RELATED FACT FINDING IDS`, `SCREENING DECISION ID`;
- §13 `SOURCE ID`;
- §15 `SOURCE IDS`, `EVIDENCE IDS`;
- §17 `SOURCE ID`;
- §20 `EVIDENCE IDS`;
- §22 `REQUIREMENT ID`, `EVIDENCE IDS`;
- §27 `EVIDENCE IDS`;
- §30 `TARGET OBJECT ID` + `TARGET OBJECT TYPE`;
- §40 MODULE SCREENING SUMMARY / `MODULE SCREENING RECORD ID`.

Šo bare ID lauku semantika ir intra-record: record ID/version tiek mantots no containing record; tips izriet no kontrolētā lauka un ID prefiksa. Tie netiek pārveidoti par §5.1 strukturētām references šajā paketē.

**Vienīgā bare → structured reference konversija šajā paketē:** TR §14 `ORIGIN TASK ID`, `ORIGIN OUTPUT ID`, `ORIGIN OBJECT ID` tiek aizstāti ar `ORIGIN TASK REFERENCE`, `ORIGIN OUTPUT REFERENCE`, `ORIGIN OBJECT REFERENCE` kā pilnas CROSS-RECORD references.

**Noklusējuma noteikums citiem persistētiem `...REFERENCES` laukiem:** ja mērķis ir T&E §25 reģistrēts TRACE OBJECT TYPE, lauks ir §5.1 trace-object reference un pēc noklusējuma INTRA-RECORD, ja owner sadaļa skaidri neprasa CROSS-RECORD. Ja mērķis nav §25 trace object, lauks saglabā savu owner shēmu un nav §5.1 reference.

Šis noteikums attiecas uz references laukiem TR §7.1, §8, §13, §22, §30, §37 un §40.

[DOKUMENTĒTS LIETOTĀJA LĒMUMS] BL3 maina iepriekš apstiprināto četru lauku glabāšanas reprezentāciju intra-record references gadījumā. Lietotāja gala konsensam jāattiecas arī uz šo delta. Papildu paralēls approval posms netiek radīts.

## 6. J6 — RMT1 tvērums

**PIEŅEMTS.**

RMT1 validē tikai šo failu kopu:

```text
GOVERNANCE/PROFESSIONAL_SCOPE_v1.4.md
GOVERNANCE/TRACEABILITY_RECORD_v1_v0.6.md
GOVERNANCE/TERMINOLOGY_AND_ENUMS_v1_v0.4.md
GOVERNANCE/REQUIREMENTS_MATRIX_GOVERNANCE_v1.md
GOVERNANCE/OPERATION_WORKFLOWS_v1.md
GOVERNANCE/LEGAL_RESEARCH_METHOD_v1.md
GOVERNANCE/MODULE_TRIGGER_REGISTRY_v1.md
GOVERNANCE/OUTSOURCING_EBA_MODULE_TRIGGER_SET_v0.1.md
GOVERNANCE/LEGAL_CLASSIFICATION_BASELINE_AMENDMENT_v0.2.md
```

Vēsturiskie review / response / audit / task artefakti ir ārpus RMT1 tvēruma un nerada FAIL.

RMT1:
```text
any semantic MTR-<THEME>-<NUMBER> identifier remains in the RMT1 FILE SET
→ FAIL
```

## 7. J7 — record-level un repo-level validācija

**PIEŅEMTS.**

N8 paliek tikai record-instance tests:

```text
instance of a registered TRACE OBJECT TYPE lacks the ID field required
by its owner schema, or its ID prefix does not match §26
→ INVALID
```

Registry completeness tiek pārbaudīta tikai repo līmenī:

```text
RMT3: any §25 TRACE OBJECT TYPE lacks exactly one §30.1 mapping row,
or a §30.1 ID FIELD NAME does not exist in the named
ID FIELD SCHEMA OWNER section
→ FAIL
```

N8 un RMT3 nedublē viens otra atbildības līmeni.

## 8. J8 — freeze precondition owner

**PIEŅEMTS.**

[PRIEKŠLIKUMS] `LEGAL_CLASSIFICATION_BASELINE_AMENDMENT_v0.2.md` pie §9 pievieno jaunu §9.1:

```text
### 9.1. Freeze priekšnosacījumi

FREEZE PRECONDITION:
TRACEABILITY_RECORD_v1 v0.6 freeze nav pieļaujams pirms vai atsevišķi no
PROFESSIONAL_SCOPE_v1.4 un TERMINOLOGY_AND_ENUMS_v1 v0.4 freeze.

Šī ir amendment procesa precondition.
Tā nav record-level BLOCK, SUSPENSION STATE vai jauns canonical statuss.
```

Amendment §11 netiek izmantots šim mērķim, jo tas pārvalda operacionālu go-live, ne dokumentu freeze.

FP1:
```text
attempted TR v0.6 freeze without same-package PS v1.4 and T&E v0.4 freeze
→ FREEZE PRECONDITION NOT MET
```

FP1 nav record-level validators un neizmanto canonical `BLOCK`.

## 9. J9 — DATA CLASS EVENT ID

**NORAIDĪTS AR PĀRBAUDĀMU PAMATOJUMU.**

1. TR v0.6 §13 faktiskais lauka nosaukums ir `EVENT ID`.
2. T&E §26 piešķir DATA CLASS EVENT prefiksu `DCE-`.
3. §30.1 mapping sasaista tipu, prefiksu, lauka nosaukumu un owner sadaļu.
4. Mehāniska vai semantiska problēma pašreizējā repo nav pierādīta.
5. Lauka pārsaukšana uz `DATA CLASS EVENT ID` būtu jauna arhitektūras delta ārpus Review #16 pašreizējā tvēruma.

Tādēļ §30.1 rinda paliek:

```text
DATA CLASS EVENT | DCE- | EVENT ID | TRACEABILITY_RECORD_v1 v0.6 §13
```

Ja nākotnē tiek reģistrēts cits event tipa trace object un rodas faktiska kolīzija, pārsaukšanu izvērtē atsevišķā arhitektūras review ciklā.

## 10. Pārējais R1–R5 delta

### R2 — neversēta avota identitāte

**PIEŅEMTS — variants (b).**

Ja `VERSION` un `EFFECTIVE DATE` nav pieejami, redakcijas identitātei jābūt pietiekami dokumentētai ar TR §11 atļauto lauku kombināciju. Ja identitāte nav pietiekama, rada `UNRESOLVED ISSUE`. `CONTENT HASH` / `CONTENT HASH ALGORITHM` var būt kombinācijas daļa, bet nav universāli obligāti. Hash cross-field invariants paliek TR §9 un T&E §26.3. Jauns release gate netiek radīts.

### R3 — HUMAN DECISION attiecību autoritāte

**PIEŅEMTS.**

TR §36 attiecību noteikums tiek aizstāts ar:

```text
RELATED TRACE OBJECT REFERENCES = vienīgais autoritatīvais attiecību avots.

RELATED FINDING, RELATED REQUIREMENT, RELATED ISSUE = compatibility views.

Ja compatibility view ir aizpildīts, tieši atbilstošai typed reference
jāeksistē RELATED TRACE OBJECT REFERENCES.

Ja compatibility view konfliktē ar RELATED TRACE OBJECT REFERENCES,
HUMAN DECISION RECORD ir INVALID.
```

### H1 — assignment authority basis

TR §36 HUMAN DECISION pievieno `ASSIGNMENT AUTHORITY BASIS SOURCE REFERENCE`. Ja HUMAN DECISION tiek izmantots kā action owner vai resolution authority assignment pamats, šī piespraustā SOURCE reference ir obligāta.

### H2 — opaque MTR ID

Aktīvajos draftos `MTR-OUTSOURCING-001` aizstāj ar `MTR-0001`:
- `MODULE_TRIGGER_REGISTRY_v1.md §6`;
- `OUTSOURCING_EBA_MODULE_TRIGGER_SET_v0.1.md`.

Vēsturiskos review/response artefaktus nemaina.

### H4 — PRIOR TASK OUTPUT references

TR §14:
- `ORIGIN TASK ID` → `ORIGIN TASK REFERENCE`;
- `ORIGIN OUTPUT ID` → `ORIGIN OUTPUT REFERENCE`;
- `ORIGIN OBJECT ID` → `ORIGIN OBJECT REFERENCE`;

visas kā pilnas CROSS-RECORD references uz konkrētu izcelsmes record versiju.

## 11. Validācijas specifikācija

Record-instance testi:

```text
N1  intra-record reference missing OBJECT TYPE → INVALID
N2  intra-record OBJECT ID prefix/type mismatch → INVALID
N3  cross-record missing TRACE RECORD ID → INVALID
N4  cross-record missing RECORD VERSION → INVALID
N5  cross-record target absent in pinned record version → INVALID
N6  HUMAN DECISION compatibility view conflicts with authoritative refs → INVALID
N7  assignment basis without ASSIGNMENT AUTHORITY BASIS SOURCE REFERENCE → INVALID
N8  required owner-schema ID field absent in instance or prefix mismatch → INVALID
N9  PRIOR TASK OUTPUT origin reference lacks pinned origin version → INVALID
N10 CONTENT HASH present without CONTENT HASH ALGORITHM → INVALID
N11 unversioned source identity insufficient → UNRESOLVED ISSUE required
```

Repo-level testi:

```text
RMT1 semantic MTR-<THEME>-<NUMBER> remains in defined RMT1 FILE SET → FAIL
RMT2 TR §5.1 and T&E §26.2 reference-mode definitions differ → FAIL
RMT3 §25 type lacks exactly one §30.1 row, or mapped ID field is absent
     in named owner schema section → FAIL
```

Freeze-process tests:
```text
FP1 attempted TR v0.6 freeze without same-package PS v1.4 and T&E v0.4 freeze
→ FREEZE PRECONDITION NOT MET
```

## 12. J1–J9 un F1–F12 procesa statuss

```text
J1  PIEŅEMTS
J2  PIEŅEMTS
J3  PIEŅEMTS
J4  PIEŅEMTS
J5  PIEŅEMTS
J6  PIEŅEMTS
J7  PIEŅEMTS
J8  PIEŅEMTS
J9  NORAIDĪTS AR PĀRBAUDĀMU PAMATOJUMU

F1  PIEŅEMTS — BL3 owner un mantošanas tvērums precizēts
F2  PIEŅEMTS — saistītā freeze pakete
F3  PIEŅEMTS — T&E owner/mapping struktūra precizēta
F4  PIEŅEMTS — 19 tipu mapping pārbaudāms pret owner shēmām
F5  PIEŅEMTS — R2 variants (b)
F6  PIEŅEMTS — H3 un R4 nodalīti
F7  DAĻĒJI PIEŅEMTS — BL3 reprezentācijas delta iet gala konsensā;
     papildu paralēls approval posms netiek radīts
F8  PIEŅEMTS — record/repo/freeze validācijas līmeņi nodalīti
F9  PIEŅEMTS — dependency karte saglabāta
F10 PIEŅEMTS — RMT1 tvērums precīzi definēts
F11 PIEŅEMTS — owner faili/sadaļas precizēti
F12 PIEŅEMTS — procesa statusi atbilst PEP §7.3
```

## 13. Dependency un autorizācijas robežas

```text
PRIMARY DOCUMENT:
TRACEABILITY_RECORD_v1 v0.6

SAME-PACKAGE:
PROFESSIONAL_SCOPE_v1.4
TERMINOLOGY_AND_ENUMS_v1 v0.4
REQUIREMENTS_MATRIX_GOVERNANCE_v1 v0.3
MODULE_TRIGGER_REGISTRY_v1 v0.1
OUTSOURCING_EBA_MODULE_TRIGGER_SET_v0.1
LEGAL_CLASSIFICATION_BASELINE_AMENDMENT_v0.2

FROZEN BASELINE:
PROFESSIONAL_SCOPE_v1.3
TRACEABILITY_RECORD_v1 v0.5
TERMINOLOGY_AND_ENUMS_v1 v0.3
VERIFICATION_PROTOCOL_v1 v0.5

IMPLEMENTATION: NAV VEIKTA
ARHITEKTŪRAS DRAFTI: NAV MAINĪTI
FROZEN BASELINE: NAV MAINĪTS
TASK-/MOD-/ISS- INSTANCE: NAV IZVEIDOTA
LIETOTĀJA KONSENSS: NAV PASLUDINĀTS
FREEZE: NAV APSTIPRINĀTS
```

## 14. Nākamais procesa solis

Pēc šī v3 review-response commita jāsagatavo atsevišķs neatkarīgās recenzijas uzdevums pret konkrētu commit SHA.

Recenzentam īpaši jāpārbauda:
1. J1–J8 deterministiska atrisināšana;
2. J9 noraidījuma pamatotība pret TR §13 un T&E §26;
3. vai §30.1 nerada paralēlu canonical reģistru;
4. vai 19-rindu mapping atbilst faktiskajām persistētajām owner shēmām;
5. vai BL3 §5.1 / bare-ID / external-reference klasifikācija ir pilnīga un neievieš slēptu divējādu semantiku;
6. vai RMT1, N8/RMT3 un FP1 atbildības līmeņi ir nodalīti;
7. vai nav palikusi neviena implementation laikā izlemjama arhitektūras izvēle.

```text
COMMIT AUTHORIZED: YES — tikai šis review-response artefakts
IMPLEMENTATION AUTHORIZED: NO
FREEZE AUTHORIZED: NO
KONSENSS: PENDING — v3 NEATKARĪGA PĀRBAUDE
```
