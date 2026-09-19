# REVIEW #16 — FORMĀLA ATBILDE UZ R1–R5 — v3

**Statuss:** REVIEW RESPONSE v3 — POZĪCIJA FIKSĒTA, KONSENSS PENDING, IMPLEMENTATION NAV APSTIPRINĀTA
**Datums:** 2026-09-19
**Versija:** v3
**Atbildes bāze:** `GOVERNANCE/TRACEABILITY_ISS_INSTANTIATION_REVIEW16_R1_R5_V2_RESPONSE_REVIEW.md`
**Iepriekšējā neatkarīgā recenzija (F1–F12):** `GOVERNANCE/TRACEABILITY_ISS_INSTANTIATION_REVIEW16_R1_R5_RESPONSE_REVIEW.md`
**v2 recenzētais commits:** `12b4ff32e15644737edf546644722b5b442341db`
**v3 pārbaudītā bāze (owner shēmas):** `1783c50b7ad7c45bba5b468e74ba4ac6d2364147`
**Implementation:** NAV VEIKTA
**Freeze:** NAV APSTIPRINĀTS

## 1. Atbildes robeža

[PĀRBAUDĪTS FAKTS] Neatkarīgā v2 recenzija R1–R5 arhitektūras virzienu saglabāja, bet v2 atzina par nepietiekami deterministisku vienam atomāram implementation commitam un identificēja J1–J9.

[DOKUMENTĒTS LĒMUMS] v3 ir tikai review-response artefakts. Tā nemaina nevienu arhitektūras draftu, frozen failu, amendment statusu, faktisku TASK/MOD/ISS instanci vai production konfigurāciju. Tā fiksē projekta pozīciju un vienu precīzu, deterministisku piedāvāto delta.

[DOKUMENTĒTS LĒMUMS] Visi šīs v3 formulējumi ir pārbaudīti pret faktiskajām owner shēmām commitā `1783c50`, nevis pret nosaukumu loģiku. Katra J-atbilde 10. sadaļā norāda pārbaudīto owner sadaļu.

## 2. R1 — saistītā freeze secība

**Pozīcija: PIEŅEMTS.** Precizēts pēc F2 un J8.

[PRIEKŠLIKUMS] `GOVERNANCE/LEGAL_CLASSIFICATION_BASELINE_AMENDMENT_v0.2.md` papildina ar jaunu numurētu apakšsadaļu `§9.1 Freeze priekšnosacījumi`, kuras pilnais saturs ir:

```text
FREEZE PRECONDITION:
TRACEABILITY_RECORD_v1 v0.6 freeze nav pieļaujams
pirms vai atsevišķi no
PROFESSIONAL_SCOPE_v1.4 UN TERMINOLOGY_AND_ENUMS_v1 v0.4 freeze.

Šī ir amendment procesa precondition.
Tā nav record-level BLOCK, SUSPENSION STATE vai jauns canonical statuss.
```

Pamatojums:
- TR v0.6 §6 un §34 `AI USED` modelis balstās uz PS v1.4;
- TR v0.6 §5.1 un §9 izmanto T&E v0.4 reģistrētos trace-object tipus, ID prefiksus un `CONTENT HASH ALGORITHM` governance;
- frozen PS v1.3 un T&E v0.3 šo modeli nesatur.

Owner sadaļas izvēles pamatojums (J8): amendment §9 "Autoritatīvais statuss" ir tieši tā sadaļa, kas pārvalda, kas paliek autoritatīvs līdz freeze lēmumam; freeze precondition ir tās pašas sadaļas priekšmets. Amendment §11 "Go-live priekšnosacījumi" pārvalda ICT-DORA moduļa **operacionālo** aktivizāciju, nevis dokumentu freeze, tādēļ nav derīgs owner. Formulējums "gala amendment acceptance kontrole" tiek izņemts pilnībā — repo tādas sadaļas nav.

## 3. R2 — neversēta avota identitāte

**Pozīcija: PIEŅEMTS.** Izvēlētais risinājums: recenzenta variants (b). Nemainīts kopš v2.

[PRIEKŠLIKUMS] `TRACEABILITY_RECORD_v1 v0.6 §11` saglabā pietiekamas identitātes kombinācijas modeli:

```text
IF VERSION is absent AND EFFECTIVE DATE is absent
THEN source revision identity MUST be established
through a sufficient documented combination of available identity fields

IF source revision identity is insufficient
THEN create UNRESOLVED ISSUE
```

`CONTENT HASH` un `CONTENT HASH ALGORITHM` drīkst būt šīs kombinācijas daļa, bet netiek padarīti absolūti obligāti visiem neversētiem avotiem.

Hash cross-field noteikums netiek dublēts §11. Tas paliek owner vietās: `TRACEABILITY_RECORD_v1 v0.6 §9` un `TERMINOLOGY_AND_ENUMS_v1 v0.4 §26.3`.

[PRIEKŠLIKUMS] `TRACEABILITY_ISS_INSTANTIATION_REVIEW16_DELTA_REVIEW_RESPONSE.md §6` akcepta kritērijs 8 tiek aizstāts ar:

```text
8. Ja VERSION un EFFECTIVE DATE nav norādīti, konkrētās avota redakcijas
   identitātei jābūt pietiekami dokumentētai ar §11 atļauto identitātes
   lauku kombināciju; ja identitāte nav pietiekama, nepieciešams
   UNRESOLVED ISSUE.
```

Jauns automātisks release gate netiek radīts.

## 4. R3 — HUMAN DECISION attiecību autoritāte

**Pozīcija: PIEŅEMTS.** Nemainīts kopš v2.

[PRIEKŠLIKUMS] `TRACEABILITY_RECORD_v1 v0.6 §36` esošais attiecību skaidrojums tiek **aizstāts** ar:

```text
RELATED TRACE OBJECT REFERENCES
= vienīgais autoritatīvais attiecību avots

RELATED FINDING
RELATED REQUIREMENT
RELATED ISSUE
= compatibility views

IF any compatibility view is populated
THEN an exactly matching typed reference MUST exist in
RELATED TRACE OBJECT REFERENCES

IF a compatibility view conflicts with
RELATED TRACE OBJECT REFERENCES
THEN the HUMAN DECISION RECORD is INVALID
```

`RELATED TRACE OBJECT REFERENCES [ja piemērojams]` paliek nosacīts lauks, bet kļūst obligāts, ja ir aizpildīts jebkurš compatibility view.

## 5. R4 — TRACE OBJECT TYPE → ID FIELD mapping

**Pozīcija: PIEŅEMTS.** Pārstrādāts pēc J1, J2, J3 un J9.

### 5.1. §26.1 precīzais aizstājējteksts

[PRIEKŠLIKUMS] `TERMINOLOGY_AND_ENUMS_v1 v0.4 §26.1` pilnais teksts tiek **aizstāts** ar:

```text
### 26.1. Objekta ID lauka invariants

Katram `TRACE OBJECT TYPE` patstāvīgam ierakstam ir obligāts tā tipam
atbilstošs ID lauks.

`MODULE RECORD` tādēļ ir obligāts `MODULE ID` ar `MOD-` prefiksu; lauks
`MODULE` saglabā atsevišķu canonical taxonomy vērtību. `MODULE ID` un
`MODULE` nav savstarpēji aizstājami.

Katram 25. punktā reģistrētam `TRACE OBJECT TYPE`, kuram 26. punktā ir
piešķirts ID prefikss, ir tieši viens mehāniski pārbaudāms ID lauka
nosaukums tā objekta owner shēmā.

Sasaisti TRACE OBJECT TYPE → ID PREFIX → ID FIELD NAME → ID FIELD SCHEMA
OWNER uztur viens kontrolēts mapping 30.1. punktā.
```

Salīdzinājums pret pašreizējo §26.1 (J3 kontrole):
- obligātuma teikums — SAGLABĀTS 1. rindkopā;
- `MODULE ID` / `MOD-` / taxonomy `MODULE` nodalījums — SAGLABĀTS 2. rindkopā, papildināts ar skaidru neaizstājamības teikumu;
- jauns saturs — tikai 3. un 4. rindkopa (mehāniskā viennozīmība un mapping uzturēšana).

`MODULE` piemērs netiek pārvietots citā sadaļā.

### 5.2. Jauna T&E apakšsadaļa §30.1 — mapping mērķa vieta

[PRIEKŠLIKUMS] `TERMINOLOGY_AND_ENUMS_v1 v0.4` tiek **papildināts** ar jaunu numurētu apakšsadaļu `§30.1 TRACE OBJECT TYPE → ID FIELD MAPPING` tūlīt pēc §30 tabulas.

Struktūras izvēle ir viena un galīga. Formulējums "vai līdzvērtīgu mehāniski viennozīmīgu lauku" tiek izņemts pilnībā.

Pamatojums (J1): T&E §30 tabulas atslēga ir `Controlled field` ar kolonnām `Controlled field | Owning document | Registry`. Visi 19 trace-object tipi §30 ir pārstāvēti ar vienu rindu `TRACE OBJECT TYPE`. Tabula ar atslēgu `TRACE OBJECT TYPE` un 19 rindām nav savietojama ar §30 atslēgu, tādēļ kolonnas pievienošana §30 nav izpildāma. §30.1 ir atsevišķa tabula ar savu atslēgu, kas paliek §30 reģistru indeksa pārvaldībā.

`§30.1` normatīvais ievadteksts:

```text
### 30.1. TRACE OBJECT TYPE → ID FIELD MAPPING

Šī tabula ir atvasināts kontrolēts indekss 26.1. punkta invarianta
mehāniskai pārbaudei. Tā nav lauku definīciju owner un nerada paralēlu
canonical reģistru.

Lauka faktiskā definīcija paliek kolonnā ID FIELD SCHEMA OWNER norādītajā
dokumentā un sadaļā. Ja tabula un owner shēma atšķiras, autoritatīva ir
owner shēma, un neatbilstība ir repo līmeņa defekts (RMT3).

Kolonna ID FIELD SCHEMA OWNER norāda tikai ID lauka shēmas īpašnieku.
Reģistra governance owner paliek 30. punkta indeksā un netiek dublēts šeit.
```

Mapping (pārbaudīts pret faktiskajām owner shēmām commitā `1783c50`):

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

Owner nodalījums `MODULE TRIGGER SET` rindai (J1.4):

```text
ID FIELD SCHEMA OWNER:        MODULE_TRIGGER_REGISTRY_v1 §2
REĢISTRA GOVERNANCE OWNER:    REQUIREMENTS_MATRIX_GOVERNANCE_v1
                              (paliek T&E §30 indeksā, rinda MODULE TRIGGER SET)
```

Šī ir vienīgā rinda, kurai abi owner atšķiras. Pārējām 18 rindām ID lauka shēmas owner un tipa reģistra owner nav pretrunā, tādēļ atsevišķa kolonna netiek radīta.

### 5.3. §30 indeksa papildinājums

[PRIEKŠLIKUMS] `TERMINOLOGY_AND_ENUMS_v1 v0.4 §30` tabulai **pievieno** vienu rindu:

| Controlled field | Owning document | Registry |
|---|---|---|
| ID FIELD NAME | `TERMINOLOGY_AND_ENUMS_v1` | TRACE OBJECT TYPE → ID FIELD MAPPING (§30.1) |

Esošās §30 rindas netiek mainītas. Esošās kolonnas netiek mainītas.

### 5.4. REQUIREMENT COMPONENT — izvēle fiksēta

[PRIEKŠLIKUMS] Izvēlēts recenzenta variants **(a)**: mapping rinda ir `COMPONENT ID`. Lauks netiek pārsaukts.

Pamatojums:
- TR v0.6 §27 faktiskais lauku bloks: `COMPONENT ID`, `COMPONENT DESCRIPTION`, `COMPONENT STATUS`, `EVIDENCE IDS`, `VERIFICATION LEVEL`;
- lauks `REQUIREMENT COMPONENT ID` repo neeksistē;
- TR §35 lieto kolekcijas nosaukumu `REQUIREMENT COMPONENTS`, ne lauka nosaukumu;
- tipa kontrole jau ir mehāniska ar `CMP-` prefiksu (T&E §26; TR §5 piemērs `CMP-0082`);
- pārsaukšana būtu atsevišķa arhitektūras delta, kas nav Review #16 lietotāja apstiprinātajā deltā (amendment §14).

H3 fakta noraidījums paliek spēkā. R4 ir owner/mapping formulējuma precizējums, ne jauna semantika.

## 6. R5 — atomāra shēmas un validācijas implementation

**Pozīcija: PIEŅEMTS.**

Pēc konsensa un atsevišķa implementation approval viena atomāra implementation commit robežā jābūt:

1. shēmas labojumiem;
2. cross-field invariantiem;
3. mehāniski pārbaudāmiem validācijas noteikumiem;
4. negatīvajiem un repo līmeņa testiem;
5. same-package dependency dokumentu konsekvences labojumiem;
6. review, amendment, roadmap un current-state statusa atjauninājumam atbilstoši faktiskajai implementation.

Implementation nedrīkst atstāt repo pusvalidējamā stāvoklī.

## 7. Pilnais atomārās korekciju paketes tvērums

### 7.1. BL3 — reference mode precizējums

Owner sadaļas:
- `GOVERNANCE/TRACEABILITY_RECORD_v1_v0.6.md §5.1`;
- `GOVERNANCE/TERMINOLOGY_AND_ENUMS_v1_v0.4.md §26.2`.

Abās operācija ir **AIZSTĀŠANA**, ne papildinājums (J5).

**TR §5.1 — aizstājamais teksts:**

```text
```text
TRACE RECORD ID
RECORD VERSION
OBJECT TYPE
OBJECT ID
```

Visi četri lauki ir obligāti. `OBJECT TYPE` izmanto `TERMINOLOGY_AND_ENUMS_v1`
reģistrētu `TRACE OBJECT TYPE`; `OBJECT ID` prefiksam jāatbilst tipam, un
objektam jāeksistē norādītajā `TRACE RECORD ID` un `RECORD VERSION`.
```

**TR §5.1 — aizstājējteksts:**

```text
Atsauce tiek glabāta vienā no diviem režīmiem.

INTRA-RECORD REFERENCE (mērķis ir tajā pašā immutable record versijā):
OBJECT TYPE
OBJECT ID
`TRACE RECORD ID` un `RECORD VERSION` tiek mantoti no containing record
versijas un netiek glabāti atkārtoti.

CROSS-RECORD REFERENCE (mērķis ir citā record vai citā versijā):
TRACE RECORD ID
RECORD VERSION
OBJECT TYPE
OBJECT ID
Visi četri lauki ir obligāti.

Abos režīmos `OBJECT TYPE` izmanto `TERMINOLOGY_AND_ENUMS_v1` 25. punktā
reģistrētu `TRACE OBJECT TYPE`; `OBJECT ID` prefiksam jāatbilst tipam
(26. punkts) un jāatbilst 30.1. punktā reģistrētajam ID lauka nosaukumam
owner shēmā; target objektam jāeksistē attiecīgajā record versijā.

Nepilnīga cross-record reference ir INVALID.
Atsauce uz `current`, `latest` vai citu kustīgu mērķi nav derīga saglabāta
atsauce nevienā režīmā.
```

Paliek nemainīts TR §5.1 noslēguma rindkopas teksts par governance dokumentu kā `SOURCE`.

**T&E §26.2 — aizstājamais teksts:** rindkopa "Persistēta trace-object reference ir viena strukturēta vērtība:" kopā ar tai sekojošo četru lauku bloku un rindkopu "Reference ir piesprausta konkrētai Traceability Record versijai. ... target objektam jāeksistē norādītajā record versijā."

**T&E §26.2 — aizstājējteksts:** tas pats teksts, kas TR §5.1 aizstājējtekstā, vārds vārdā. Abas sadaļas pēc implementation ir teksta ziņā identiskas; atšķirība ir RMT2 FAIL.

Paliek nemainīta T&E §26.2 noslēguma rindkopa par governance dokumentu kā `SOURCE`.

### 7.1.1. BL3 mantošanas tvērums — deterministiska klasifikācija

Klasifikācija pret faktisko `TRACEABILITY_RECORD_v1_v0.6.md` commitā `1783c50` (J4).

**A. §5.1 trace-object references — manto BL3 režīmu:**

```text
§5   noslēguma rindkopa — piesprausta SOURCE atsauce governance dokumentam
§7.2 noslēguma rindkopa — HUMAN DECISION RELATED TRACE OBJECT REFERENCES
                          ar atsauci uz konkrēto MODULE SCREENING RECORD ID
§36  RELATED TRACE OBJECT REFERENCES
§38  RELATED TRACE OBJECT REFERENCES
```

**B. Skaidri IZSLĒGTS no §5.1 režīma — evidence-store references:**

```text
§17  EVIDENCE STORE REFERENCE, EVIDENCE SET / REVIEW ID, GENERATED AT
§20  EVIDENCE STORE REFERENCE, EVIDENCE SET / REVIEW ID, GENERATED AT
```

Šie lauki identificē ārēju evidence glabātuvi, ne trace-object. To shēma netiek mainīta.

**C. Skaidri IZSLĒGTS no §5.1 režīma — ārējas sistēmas references:**

```text
§42  SOURCE SYSTEM / CHANNEL, REFERENCE, DATE, BY
§43  DECISION SOURCE, REFERENCE, DATE
§40  OUTPUT REFERENCE          (rezultāta artefakta atrašanās vieta)
§7.1 CONTRACT TYPE REFERENCES  (kontrolēta reģistra vērtība, ne trace-object)
```

**D. Bare ID lauki — paliek bare ID lauki:**

```text
§6   FACT PROFILE FINDING IDS, MODULE SCREENING RECORD IDS
§7.1 TASK ID, RELATED MODULE ID, SUPERSEDES LCA ID,
     RECLASSIFICATION REVIEW DECISION ID
§7.2 TASK ID, TRIGGER REGISTRY ID, TRIGGER REGISTRY VERSION,
     RELATED FACT FINDING IDS, SCREENING DECISION ID
§13  SOURCE ID
§15  SOURCE IDS, EVIDENCE IDS
§17  SOURCE ID
§20  EVIDENCE IDS
§22  REQUIREMENT ID, EVIDENCE IDS
§27  EVIDENCE IDS
§30  TARGET OBJECT ID + TARGET OBJECT TYPE
§40  MODULE SCREENING SUMMARY / MODULE SCREENING RECORD ID
```

Šie lauki identificē objektu tā paša ieraksta ietvaros ar necaurspīdīgu ID un netiek pārveidoti par §5.1 strukturētām atsaucēm šajā paketē. To semantika ir ekvivalenta intra-record režīmam: mantots `TRACE RECORD ID` un `RECORD VERSION`, tips izriet no ID prefiksa (T&E §26) un lauka nosaukuma (§30.1).

**E. Vienīgā bare → reference konversija šajā paketē:**

```text
§14  ORIGIN TASK ID, ORIGIN OUTPUT ID, ORIGIN OBJECT ID
     → ORIGIN TASK REFERENCE, ORIGIN OUTPUT REFERENCE, ORIGIN OBJECT REFERENCE
     visas kā pilnas CROSS-RECORD references (šīs v3 §7.5, H4)
```

**F. Noklusējuma noteikums pārējiem "... REFERENCES" laukiem:**

```text
Ja persistēta references lauka mērķis ir TERMINOLOGY_AND_ENUMS_v1 25. punktā
reģistrēts TRACE OBJECT TYPE, lauks ir 5.1. punkta trace-object reference.
Tā noklusējuma režīms ir INTRA-RECORD, ja vien owner sadaļa skaidri neprasa
CROSS-RECORD režīmu.

Ja mērķis nav 25. punktā reģistrēts trace-object (kontrolēta reģistra vērtība,
evidence-store, ārēja sistēma, artefakta atrašanās vieta), lauks nav 5.1.
punkta reference un saglabā savu esošo shēmu.
```

Noteikums attiecas uz: §7.1 (`RELEVANT FACT FINDING REFERENCES`, `MATERIAL ASSUMPTION FINDING REFERENCES`, `SUPPORTING SOURCE REFERENCES`, `COUNTERVAILING SOURCE REFERENCES`, `HUMAN DECISION REFERENCE`), §8 (`SOURCE / REFERENCE`, `CLASSIFICATION ASSESSMENT REFERENCES`), §13 (`RESOLUTION REFERENCE`), §22 (`DATA CLASS EVENT REFERENCES`, `CLASSIFICATION BASIS REFERENCES`), §30 (`SOURCE / EVIDENCE REFERENCES`, `VERIFICATION SCOPE RECORD REFERENCES`), §37 (`ESCALATION REFERENCE`, `RESPONSE REFERENCE`), §40 (`SOURCE SET REFERENCE`, `RELATED FINDINGS`, `RELATED REQUIREMENTS`, `LEGAL CLASSIFICATION ASSESSMENT REFERENCES`, `MODULE SCREENING RECORD REFERENCES`, `COMPLETENESS CONTROL REFERENCE`, `DATA CLASS EVENT REFERENCES`, `VERIFICATION SCOPE RECORD REFERENCES`).

Neklasificētu lauku nav. Implementation laikā izlemjamu režīma izvēļu nav.

[DOKUMENTĒTS LIETOTĀJA LĒMUMS] Šī delta maina Review #16 sākotnēji apstiprinātajā integrācijas lēmumā fiksēto četru lauku glabāšanas reprezentāciju intra-record references gadījumā. Lietotāja gala konsensam jāattiecas arī uz šo delta. Pēc konsensa joprojām nepieciešams atsevišķs implementation approval.

### 7.2. H1 — assignment authority basis

Owner sadaļas:
- `TRACEABILITY_RECORD_v1 v0.6 §36` — HUMAN DECISION shēma;
- `TRACEABILITY_RECORD_v1 v0.6 §38` — ACTION OWNER / RESOLUTION AUTHORITY basis references.

`HUMAN DECISION RECORD` pievieno strukturētu `ASSIGNMENT AUTHORITY BASIS SOURCE REFERENCE`. Ja HUMAN DECISION kalpo par action owner vai resolution authority assignment pamatu, šī piespraustā `SOURCE` atsauce ir obligāta.

### 7.3. H2 — necaurspīdīgs MTR ID

Owner faili:
- `GOVERNANCE/MODULE_TRIGGER_REGISTRY_v1.md §6`;
- `GOVERNANCE/OUTSOURCING_EBA_MODULE_TRIGGER_SET_v0.1.md`.

Visas semantiskās `MTR-OUTSOURCING-001` vērtības šajos divos failos aizstāj ar `MTR-0001`. Jauns trigger-set objekts netiek radīts.

Faktiskais stāvoklis commitā `1783c50`: `MTR-OUTSOURCING-001` sastopams 3 reizes aktīvajos draftos (`MODULE_TRIGGER_REGISTRY_v1.md` — 1; `OUTSOURCING_EBA_MODULE_TRIGGER_SET_v0.1.md` — 2) un 4 reizes review / response artefaktos, kur tas ir leģitīma vēsturiska atsauce un netiek mainīts.

### 7.4. R4 — owner-document ID invariants

Ieviest šīs v3 §5.1 §26.1 aizstājējtekstu, §5.2 jauno T&E §30.1 apakšsadaļu ar 19 rindu mapping un §5.3 vienu jaunu §30 indeksa rindu. `REQUIREMENT COMPONENT` rinda ir `COMPONENT ID`; TR §27 lauks netiek pārsaukts. `DATA CLASS EVENT` rinda ir `EVENT ID`; TR §13 lauks netiek pārsaukts. H3 fakta noraidījums paliek nemainīts.

### 7.5. H4 — PRIOR TASK OUTPUT references

Owner sadaļa:
- `TRACEABILITY_RECORD_v1 v0.6 §14`.

**Aizstāj** bare origin ID laukus `ORIGIN TASK ID`, `ORIGIN OUTPUT ID`, `ORIGIN OBJECT ID [ja piemērojams]` ar:
- `ORIGIN TASK REFERENCE`;
- `ORIGIN OUTPUT REFERENCE`;
- `ORIGIN OBJECT REFERENCE [ja piemērojams]`;

visas kā pilnas CROSS-RECORD references uz konkrētu izcelsmes record versiju. `SOURCE TYPE: PRIOR TASK OUTPUT` un `INHERITED VERIFICATION LEVEL` paliek nemainīti.

### 7.6. M1/R3 — HUMAN DECISION attiecību autoritāte

Owner sadaļa: `TRACEABILITY_RECORD_v1 v0.6 §36`. Ieviest šīs v3 §4 aizstājējtekstu.

### 7.7. M2/R2 — neversēta avota identitāte

Owner sadaļas: `TRACEABILITY_RECORD_v1 v0.6 §11`; hash invarianti paliek `TR §9` un `T&E §26.3`. Papildus aizstāj iepriekšējās review-response akcepta kritēriju 8, kā noteikts šīs v3 §3.

### 7.8. R1 — freeze dependency

Owner: `LEGAL_CLASSIFICATION_BASELINE_AMENDMENT_v0.2.md` — jauna apakšsadaļa `§9.1 Freeze priekšnosacījumi` (šīs v3 §2 teksts).

Vienīgais owner. Atsauce uz "gala amendment acceptance kontroli" izņemta. Amendment §11 "Go-live priekšnosacījumi" netiek mainīts.

### 7.9. R5 — validation specification

Visas iepriekš minētās shēmas korekcijas, validācijas noteikumi un testi tiek ieviesti vienā atomārā implementation commitā.

### 7.10. Review un statusa konsekvence

Tajā pašā implementation vienībā atjaunina Review #16 integrācijas ierakstu, amendment statusu, roadmap un `PROJECT_CURRENT_STATE.md` tikai atbilstoši faktiskajai implementation. Frozen baseline statusu nemaina bez atsevišķa freeze lēmuma.

## 8. Dependency karte

```text
PRIMARY DOCUMENT
TRACEABILITY_RECORD_v1 v0.6

FROZEN INPUTS
- PROFESSIONAL_SCOPE_v1.3
- TRACEABILITY_RECORD_v1 v0.5
- TERMINOLOGY_AND_ENUMS_v1 v0.3
- VERIFICATION_PROTOCOL_v1 v0.5

DRAFT INPUTS
- PROFESSIONAL_SCOPE_v1.4
- TERMINOLOGY_AND_ENUMS_v1 v0.4
- REQUIREMENTS_MATRIX_GOVERNANCE_v1 v0.3
- OPERATION_WORKFLOWS_v1 v0.2
- LEGAL_RESEARCH_METHOD_v1 v0.2
- MODULE_TRIGGER_REGISTRY_v1 v0.1
- OUTSOURCING_EBA_MODULE_TRIGGER_SET_v0.1

SAME-PACKAGE DEPENDENCIES
- PROFESSIONAL_SCOPE_v1.4
- TERMINOLOGY_AND_ENUMS_v1 v0.4
- REQUIREMENTS_MATRIX_GOVERNANCE_v1 v0.3
- MODULE_TRIGGER_REGISTRY_v1 v0.1
- OUTSOURCING_EBA_MODULE_TRIGGER_SET_v0.1
- LEGAL_CLASSIFICATION_BASELINE_AMENDMENT_v0.2

DOCUMENTS BLOCKED BY THIS WORK
- juridiskās klasifikācijas amendment paketes gala audits
- PS v1.4 / TR v0.6 / T&E v0.4 freeze lēmums

PILOT / IMPLEMENTATION CONSEQUENCES
- references validatoram jāatšķir intra-record un cross-record režīms
- type → ID field mapping jābūt mehāniski validējamam pret owner shēmām
- repo līmeņa tests nedrīkst pieļaut semantisku MTR ID aktīvajos draftos
- freeze dependency ir amendment procesa precondition, ne runtime suspension state
```

## 9. Negatīvie un mehāniskie testi

### 9.1. Record / schema līmeņa testi

Validē vienu konkrētu record instanci.

```text
N1:  intra-record reference missing OBJECT TYPE -> INVALID
N2:  intra-record OBJECT ID prefix/type mismatch -> INVALID
N3:  cross-record reference missing TRACE RECORD ID -> INVALID
N4:  cross-record reference missing RECORD VERSION -> INVALID
N5:  cross-record target absent in pinned record version -> INVALID
N6:  HUMAN DECISION compatibility view conflicts with authoritative
     RELATED TRACE OBJECT REFERENCES -> INVALID
N7:  HUMAN DECISION used as assignment basis without
     ASSIGNMENT AUTHORITY BASIS SOURCE REFERENCE -> INVALID
N8:  instance of a registered TRACE OBJECT TYPE lacks the ID field named in
     its owner schema, or its ID value prefix does not match §26 -> INVALID
N9:  PRIOR TASK OUTPUT origin reference lacks pinned origin record version
     -> INVALID
N10: CONTENT HASH present without CONTENT HASH ALGORITHM -> INVALID
N11: unversioned source identity insufficient -> UNRESOLVED ISSUE required
```

N8 izmaiņa (J7): reģistra pilnīguma daļa ("no exact §30 ID FIELD NAME mapping") ir izņemta no record-level testiem. Neviena record instance nevar būt `INVALID` tādēļ, ka T&E §30.1 trūkst rindas. Pilnīguma kontrole pārvietota uz RMT3.

### 9.2. Repo / registry līmeņa mehāniskā pārbaude

Validē repo stāvokli, ne record instanci.

```text
RMT1: any semantic MTR-<THEME>-<NUMBER> identifier remains in the RMT1 FILE SET
      -> FAIL
RMT2: TR §5.1 and T&E §26.2 reference-mode definitions differ -> FAIL
RMT3: any §25 TRACE OBJECT TYPE lacks exactly one §30.1 mapping row,
      OR a §30.1 ID FIELD NAME does not exist in the named
      ID FIELD SCHEMA OWNER section
      -> FAIL
```

RMT1 tvērums (J6) — precīza failu kopa, kas nav paplašināma bez atsevišķa lēmuma:

```text
RMT1 FILE SET:
GOVERNANCE/PROFESSIONAL_SCOPE_v1.4.md
GOVERNANCE/TRACEABILITY_RECORD_v1_v0.6.md
GOVERNANCE/TERMINOLOGY_AND_ENUMS_v1_v0.4.md
GOVERNANCE/REQUIREMENTS_MATRIX_GOVERNANCE_v1.md
GOVERNANCE/OPERATION_WORKFLOWS_v1.md
GOVERNANCE/LEGAL_RESEARCH_METHOD_v1.md
GOVERNANCE/MODULE_TRIGGER_REGISTRY_v1.md
GOVERNANCE/OUTSOURCING_EBA_MODULE_TRIGGER_SET_v0.1.md
GOVERNANCE/LEGAL_CLASSIFICATION_BASELINE_AMENDMENT_v0.2.md

RMT1 EXCLUSION RULE:
Visi pārējie repo faili, tostarp jebkurš fails, kura nosaukums satur
_REVIEW, _RESPONSE, _AUDIT vai _TASK. Vēsturiskās atsauces review un
response artefaktos ir leģitīmas un nerada FAIL.
```

### 9.3. Freeze procesa precondition

Validē amendment procesa darbību, ne record instanci un ne repo saturu.

```text
FP1: attempted TR v0.6 freeze without same-package PS v1.4 and T&E v0.4 freeze
     -> FREEZE PRECONDITION NOT MET
```

`FP1` nav record-level validators, neizmanto canonical `BLOCK` un nav repo līmeņa tests. Tā owner ir amendment §9.1.

Trīs līmeņi ir nodalīti: 9.1. = record instance; 9.2. = repo / reģistra pilnīgums; 9.3. = freeze process.

## 10. J1–J9 statusi

### J1 — mapping mērķa vieta un struktūra
**PIEŅEMTS.** Risinājums: šīs v3 §5.2 jaunā T&E §30.1 apakšsadaļa ar četrām kolonnām `TRACE OBJECT TYPE | ID PREFIX | ID FIELD NAME | ID FIELD SCHEMA OWNER` un §5.3 viena jauna §30 indeksa rinda. Alternatīva "vai līdzvērtīgu" izņemta. Paralēls canonical reģistrs netiek radīts: §30.1 ir atvasināts indekss, konflikta gadījumā autoritatīva ir owner shēma. `MODULE TRIGGER SET` rindai shēmas owner (`MODULE_TRIGGER_REGISTRY_v1 §2`) un reģistra governance owner (`REQUIREMENTS_MATRIX_GOVERNANCE_v1`, T&E §30) ir skaidri nodalīti. Pārbaudīts pret T&E v0.4 §30 faktisko kolonnu struktūru.

### J2 — REQUIREMENT COMPONENT ID lauks
**PIEŅEMTS.** Mapping rinda ir `COMPONENT ID`, owner `TRACEABILITY_RECORD_v1 v0.6 §27`. Pārsaukšana netiek veikta; materiāls iemesls nav konstatēts, un pārsaukums būtu atsevišķa arhitektūras delta ārpus amendment §14 apstiprinātā tvēruma. Pārbaudīts pret TR v0.6 §27 faktisko lauku bloku.

### J3 — §26.1 invarianti
**PIEŅEMTS.** Šīs v3 §5.1 aizstājējteksts satur visus četrus prasītos elementus: obligātu tipam atbilstošu ID lauku katram patstāvīgam ierakstam; `MODULE ID` ar `MOD-` prefiksu; `MODULE ID` / taxonomy `MODULE` nodalījumu ar neaizstājamības teikumu; mapping sasaistes noteikumu uz §30.1. `MODULE` piemērs netiek pārvietots. Semantiskā regresija pret pašreizējo §26.1 ir novērsta.

### J4 — BL3 references tvērums
**PIEŅEMTS.** Šīs v3 §7.1.1 aizstāj v2 sarakstu ar pilnu klasifikāciju pret faktisko TR v0.6: A — §5.1 mantotāji (§5, §7.2, §36, §38); B — evidence-store references izslēgtas (§17, §20); C — ārējas sistēmas references izslēgtas (§42, §43, §40 `OUTPUT REFERENCE`, §7.1 `CONTRACT TYPE REFERENCES`); D — bare ID lauki uzskaitīti un atstāti bare; E — vienīgā konversija ir §14 (H4); F — noklusējuma noteikums pēc references mērķa tipa. Neklasificētu lauku nav.

### J5 — aizstāšana vai papildināšana
**PIEŅEMTS.** Abām sadaļām operācija ir **AIZSTĀŠANA**. Šīs v3 §7.1 citē precīzu aizstājamo tekstu TR §5.1 un T&E §26.2 un sniedz precīzu aizstājējtekstu. Teikums "Visi četri lauki ir obligāti" pašreizējā formā tiek dzēsts un pārceļas uz cross-record režīma bloku. Tieša pretruna ar intra-record režīmu nepaliek.

### J6 — RMT1 tvērums
**PIEŅEMTS.** Šīs v3 §9.2 definē RMT1 FILE SET ar deviņiem konkrētiem failiem un skaidru EXCLUSION RULE. Vēsturiskie review / response / audit artefakti neradīs false failure. Pārbaudīts pret faktisko `MTR-OUTSOURCING-001` sastopamību commitā `1783c50`.

### J7 — N8 līmenis
**PIEŅEMTS.** Šīs v3 §9 nodala trīs līmeņus. N8 paliek tikai record-instance tests (trūkst owner shēmas ID lauka instancē vai prefiksa neatbilstība). Reģistra pilnīguma daļa apvienota ar RMT3, kas papildus pārbauda, vai §30.1 norādītais ID FIELD NAME faktiski eksistē norādītajā owner sadaļā. RMT3 dublēšanās ar N8 novērsta.

### J8 — freeze precondition owner
**PIEŅEMTS.** Viena konkrēta owner sadaļa: jauna `LEGAL_CLASSIFICATION_BASELINE_AMENDMENT_v0.2 §9.1 "Freeze priekšnosacījumi"`. Formulējums "gala amendment acceptance kontrole" izņemts. Amendment §11 nav izvēlēts, jo tas pārvalda ICT-DORA moduļa operacionālo go-live, ne dokumentu freeze. Pārbaudīts pret amendment §9 un §11 faktiskajiem nosaukumiem un saturu.

### J9 — DATA CLASS EVENT ID
**NORAIDĪTS AR PĀRBAUDĀMU PAMATOJUMU.**

Pamatojums:
1. Mapping ir faktiski korekts. TR v0.6 §13 lauka nosaukums ir `EVENT ID`; `DATA CLASS EVENT → EVENT ID` atbilst owner shēmai.
2. Mehāniska pašidentificējamība jau ir nodrošināta ar ID prefiksa kontroli: T&E §26 nosaka `DCE-`, un §30.1 rinda sasaista tipu, prefiksu, lauka nosaukumu un owner sadaļu. N2 un N8 testi tipa neatbilstību noķer bez lauka pārsaukšanas.
3. Semantiska vai mehāniska problēma nav pierādīta. Recenzents norāda iespējamu nākotnes sadursmi ar citiem event objektiem; šodien repo cita event tipa nav, un T&E §25 to nereģistrē.
4. Pārsaukšana būtu arhitektūras delta ārpus Review #16 lietotāja apstiprinātā tvēruma (amendment §14), un šī atbilde arhitektūras shēmu nemaina (PEP §7.3).

Fiksēts kā apzināta izvēle: `DATA CLASS EVENT` rinda §30.1 paliek `EVENT ID`. Ja nākotnē tiek reģistrēts otrs event tipa trace object, lauka pārsaukšana uz `DATA CLASS EVENT ID` tiek izskatīta kā atsevišķa arhitektūras delta ar savu review ciklu.

## 11. F1–F12 statusi (pārnesti no v2, aktualizēti)

```text
F1:  PIEŅEMTS — v3 §7.1 / §7.1.1 (J4, J5 novērsti)
F2:  PIEŅEMTS — v3 §2 / §7.8 / §9.3 FP1
F3:  PIEŅEMTS — v3 §5.1 / §5.2 (J1, J3 novērsti)
F4:  PIEŅEMTS — v3 §5.2 (J2 novērsts; četru elementu sasaiste reģistrēta)
F5:  PIEŅEMTS — v3 §3 / §7.7
F6:  PIEŅEMTS — H3 un R4 nodalīti
F7:  DAĻĒJI PIEŅEMTS — v3 §7.1.1 pakļauj BL3 delta lietotāja konsensam;
     papildu paralēls approval posms netiek radīts
F8:  PIEŅEMTS — v3 §9 trīs līmeņi nodalīti (J7 novērsts)
F9:  PIEŅEMTS — v3 §8 dependency karte
F10: PIEŅEMTS — v3 §9.2 RMT1 FILE SET (J6 novērsts)
F11: PIEŅEMTS — owner faili/sadaļas precizēti (J8 novērsts)
F12: PIEŅEMTS — procesa statusi atbilst PEP §7.3
```

## 12. Procesa rezultāts

```text
J1:                         PIEŅEMTS
J2:                         PIEŅEMTS
J3:                         PIEŅEMTS
J4:                         PIEŅEMTS
J5:                         PIEŅEMTS
J6:                         PIEŅEMTS
J7:                         PIEŅEMTS
J8:                         PIEŅEMTS
J9:                         NORAIDĪTS AR PĀRBAUDĀMU PAMATOJUMU

R1:                         PIEŅEMTS
R2:                         PIEŅEMTS (variants b)
R3:                         PIEŅEMTS
R4:                         PIEŅEMTS
R5:                         PIEŅEMTS
BL3 / H1 / H2 / H4 / M1 / M2:
                            SAGLABĀTI AR v3 PRECIZĒJUMIEM
BL1 / H3 NORAIDĪJUMI:       PALIEK SPĒKĀ
BL2:                        NOVĒRSTS

IMPLEMENTATION:             NAV VEIKTA
ARHITEKTŪRAS DRAFTI:        NAV MAINĪTI
FROZEN BASELINE:            NAV MAINĪTS
TASK- / MOD- / ISS- INSTANCE: NAV IZVEIDOTA
STANDALONE CONTAINMENT FAILS: PALIEK REPO
LIETOTĀJA KONSENSS:         NAV PASLUDINĀTS
FREEZE:                     NAV APSTIPRINĀTS
NĀKAMAIS ROADMAP DOKUMENTS: NAV UZSĀKTS
```

## 13. Acceptance kritēriju pašpārbaude

```text
1. Katram J1–J9 fiksēts procesa statuss             — IZPILDĪTS (§10, §12)
2. J1–J5 neatstāj implementation laikā izlemjamu
   shēmas izvēli                                    — IZPILDĪTS (§5.1, §5.2,
                                                      §5.3, §5.4, §7.1, §7.1.1)
3. Type → ID field mapping pārbaudīts pret
   faktiskajām owner shēmām                         — IZPILDĪTS (§5.2, bāze 1783c50)
4. BL3 references tvērums deterministisks pret
   faktisko TR v0.6                                 — IZPILDĪTS (§7.1.1 A–F)
5. Record-level, repo-level un freeze-process
   validācijas nav sajauktas                        — IZPILDĪTS (§9.1, §9.2, §9.3)
6. Frozen baseline nav mainīts                      — IZPILDĪTS
7. Arhitektūras drafti nav mainīti                  — IZPILDĪTS
8. Implementation un freeze nav pasludināti
   par autorizētiem                                 — IZPILDĪTS (§12)
```

## 14. Nākamais procesa solis

Pēc šīs v3 review-response commita jāsagatavo atsevišķs neatkarīgās recenzijas uzdevums ar konkrētu pārbaudāmo commit SHA. Recenzents pārbauda v3 pret J1–J9 un faktiskajām owner shēmām.

Recenzentam īpaši jāapstiprina:
1. vai J1–J8 risinājumi ir deterministiski vienam atomāram implementation commitam;
2. vai J9 noraidījuma pamatojums ir pārbaudāms pret TR v0.6 §13 un T&E §26;
3. vai §30.1 nerada paralēlu canonical reģistru;
4. vai §7.1.1 klasifikācija ir pilnīga pret faktisko TR v0.6 saturu;
5. vai §9.1 / §9.2 / §9.3 nodalījums ir konsekvents ar PEP §7.8 un F8 principu.

```text
COMMIT AUTHORIZED: YES — tikai šis review-response artefakts
IMPLEMENTATION AUTHORIZED: NO
FREEZE AUTHORIZED: NO
KONSENSS: PENDING — v3 NEATKARĪGA PĀRBAUDE
```
