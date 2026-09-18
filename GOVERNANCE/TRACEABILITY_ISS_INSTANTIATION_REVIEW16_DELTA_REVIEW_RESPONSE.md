# REVIEW #16 — ATBILDE UZ KONSOLIDĒTĀ DRAFT DELTA v0.1 KRITISKO RECENZIJU

**Statuss:** RECENZENTA ATBILDE — KOREKCIJU POZĪCIJA FIKSĒTA, FREEZE NAV APSTIPRINĀTS  
**Datums:** 2026-09-19  
**Recenzijā pārbaudītais commits:** `1ab346d3633f37c2572e7219260d55d91601649e`  
**Atbildes faktiskā bāze:** `2db5a4bbbbe9e094e4d98ca212ddc9bb2b9d7c4f`  
**Konsenss:** PENDING — nepieciešama recenzenta pārbaude pret faktisko bāzi un šo atbildi

## 1. Gala pozīcija

Recenzijas gala virziens `CHANGES REQUIRED` tiek pieņemts, bet finding statuss ir jāpārrēķina pret faktisko commit `2db5a4b`, jo recenzija veikta pret iepriekšējo commit `1ab346d`.

Pozīcija pa finding:

| Finding | Pozīcija | Rezultāts |
|---|---|---|
| BL1 | NORAIDĪTS kā aktuāls blocker | `PROFESSIONAL_SCOPE_v1.4` tajā pašā amendment paketē jau nosaka nosacīto AI lauku modeli; `NOT USED` sentinel netiek ieviests |
| BL2 | NOVĒRSTS commitā `2db5a4b` | §34 tagad izmanto `AI GOVERNANCE` un atsaucas uz §6 nosacījumiem |
| BL3 | PIEŅEMTS | ieviešama atsevišķa intra-record un cross-record references reprezentācija |
| H1 | PIEŅEMTS | assignment authority pamats jāpadara strukturēts un mehāniski pārbaudāms |
| H2 | PIEŅEMTS | visas trīs `MTR-OUTSOURCING-001` vērtības aizstājamas ar `MTR-0001` |
| H3 | NORAIDĪTS kā fakta apgalvojums; precizējums pieņemts | owner dokumentā `MODULE_TRIGGER_REGISTRY_v1` jau ir obligāts `TRIGGER SET ID`; universālā invarianta formulējumu precizē |
| H4 | PIEŅEMTS | `PRIOR TASK OUTPUT` pāriet uz pilnām pinned cross-record references |
| M1 | PIEŅEMTS | generic references saraksts ir autoritatīvs; specifiskie lauki ir tikai saskaņoti compatibility views |
| M2 | PIEŅEMTS | neversētam avotam hash un algoritms kļūst obligāti, nevis paliek atlikts jautājums |

Neviena no pieņemtajām korekcijām netiek atlikta uz nenoteiktu nākotnes posmu.

## 2. Atbilde uz BLOCKING finding

### BL1 — AI USED = false pret frozen minimālo saturu

**Pozīcija: NORAIDĪTS kā aktuāls blocker.**

Recenzija pārbaudīja commit `1ab346d`. Commitā `2db5a4b` vienas amendment paketes augstāka līmeņa drafts `PROFESSIONAL_SCOPE_v1.4` jau ir saskaņots ar `TRACEABILITY_RECORD_v1_v0.6`:

```text
AI USED + AI USE DECLARED BY + AI USE DECLARED AT
AI TOOL + AI/MODEL VERSION + AI TOOL USAGE POLICY VERSION
                                         [tikai ja AI USED = true]
```

Frozen `PROFESSIONAL_SCOPE_v1.3` paliek autoritatīvs pašreizējai frozen bāzei. Drafti v1.4/v0.6 nav operacionāli autoritatīvi līdz atsevišķam freeze lēmumam. Amendment paketes mērķis ir kopā aizstāt iepriekšējo redakciju; tādēļ atšķirība no v1.3 pati par sevi nav iekšēja pretruna, ja jaunais scope un jaunais traceability drafts ir savstarpēji saskaņoti.

`NOT USED` netiek pieņemts, jo tas radītu sentinel vērtību laukos, kuri pēc jaunā cross-field modeļa nav piemērojami. Tas arī sajauktu lauka nepiemērojamību ar faktisku rīka vai modeļa identitāti. Spēkā paliek:

```text
IF AI USED = false
THEN AI TOOL, AI/MODEL VERSION AND AI TOOL USAGE POLICY VERSION MUST BE ABSENT
```

### BL2 — §34 CORE RECORD

**Pozīcija: NOVĒRSTS commitā `2db5a4b`.**

§34 vairs neprasa `AI TOOL` un `AI TOOL USAGE POLICY VERSION` bez nosacījuma. Tas izmanto `AI GOVERNANCE`, kas ietver obligāto deklarāciju un nosacītos §6 laukus.

`SOURCE-LEVEL DATA CLASSES` paliek jēgpilns arī bez AI izmantošanas, jo datu klase ir SOURCE īpašība un izsekojamības klasifikācija, ne tikai AI permission metadats.

### BL3 — references četru lauku obligātums

**Pozīcija: PIEŅEMTS.**

Precizētā shēma:

```text
INTRA-RECORD TRACE OBJECT REFERENCE
OBJECT TYPE
OBJECT ID

TRACE RECORD ID := containing TRACE RECORD ID
RECORD VERSION  := containing RECORD VERSION
```

```text
CROSS-RECORD TRACE OBJECT REFERENCE
TRACE RECORD ID
RECORD VERSION
OBJECT TYPE
OBJECT ID
```

Cross-field invarianti:

```text
IF TRACE RECORD ID is absent AND RECORD VERSION is absent
THEN reference is intra-record
AND OBJECT TYPE and OBJECT ID are required

IF TRACE RECORD ID is present OR RECORD VERSION is present
THEN reference is cross-record
AND all four fields are required

IF reference is intra-record
THEN effective TRACE RECORD ID and RECORD VERSION are inherited
from the immutable containing record version
```

Tas nav `current` vai `latest` režīms. Intra-record reference ir piesprausta ar paša konteinerieraksta nemainīgo identitāti un versiju. Jaunā record versijā references nav masveidā jāpārraksta tikai versijas numura maiņas dēļ.

## 3. Atbilde uz HIGH finding

### H1 — assignment authority mehāniskā validācija

**Pozīcija: PIEŅEMTS.**

`HUMAN DECISION RECORD` pievienojams:

```text
ASSIGNMENT AUTHORITY BASIS SOURCE REFERENCE
  [pinned SOURCE reference; obligāts, ja HUMAN DECISION tiek izmantots
   kā ACTION OWNER BASIS REFERENCE vai RESOLUTION AUTHORITY BASIS REFERENCE]
```

Papildu invarianti:

```text
IF ACTION OWNER BASIS REFERENCE targets HUMAN DECISION
THEN referenced HUMAN DECISION must contain
ASSIGNMENT AUTHORITY BASIS SOURCE REFERENCE

IF RESOLUTION AUTHORITY BASIS REFERENCE targets HUMAN DECISION
THEN referenced HUMAN DECISION must contain
ASSIGNMENT AUTHORITY BASIS SOURCE REFERENCE
```

Brīvteksta `BASIS` paliek cilvēkam lasāms pamatojums, bet vairs nav mehāniskās validācijas vienīgais nesējs. SOURCE reference identificē dokumentēto assignment authority pamatu; validators nepierāda avota juridisko pietiekamību, bet var pierādīt references esību, tipu un piesaisti.

### H2 — semantiski kodētais MTR ID

**Pozīcija: PIEŅEMTS.**

Visas trīs vērtības:

```text
MTR-OUTSOURCING-001
```

aizstājamas ar:

```text
MTR-0001
```

Labojuma vietas:

1. `GOVERNANCE/MODULE_TRIGGER_REGISTRY_v1.md`;
2. `GOVERNANCE/OUTSOURCING_EBA_MODULE_TRIGGER_SET_v0.1.md` sākotnējais ieraksts;
3. `GOVERNANCE/OUTSOURCING_EBA_MODULE_TRIGGER_SET_v0.1.md` lifecycle ieraksts.

Šī ir viena un tā pati drafta objekta identitāte; netiek radīts jauns trigger set.

### H3 — MODULE TRIGGER SET ID shēma

**Pozīcija: FAKTA APGALVOJUMS NORAIDĪTS; formulējuma precizējums pieņemts.**

`GOVERNANCE/MODULE_TRIGGER_REGISTRY_v1.md` §3 jau nosaka obligātu shēmu:

```text
MODULE
TRIGGER SET ID
TRIGGER SET VERSION
...
```

Tātad `MODULE TRIGGER SET` nav trace-object tips bez ID lauka. Tā owner ir `REQUIREMENTS_MATRIX_GOVERNANCE_v1`, bet reģistra konkrēto shēmu glabā `MODULE_TRIGGER_REGISTRY_v1`.

Lai invariants neizklausītos ierobežots tikai ar `TRACEABILITY_RECORD_v1`, formulējums precizējams:

```text
Katram reģistrētam TRACE OBJECT TYPE, kuram ir ID prefikss,
attiecīgā objekta owner dokumenta shēmā ir obligāts tipam
atbilstošs ID lauks.
```

### H4 — PRIOR TASK OUTPUT cross-record references

**Pozīcija: PIEŅEMTS.**

§14 shēma maināma uz:

```text
SOURCE TYPE: PRIOR TASK OUTPUT
ORIGIN TASK REFERENCE            [full cross-record TRACE OBJECT REFERENCE]
ORIGIN OUTPUT REFERENCE          [full cross-record TRACE OBJECT REFERENCE]
ORIGIN OBJECT REFERENCE          [full cross-record TRACE OBJECT REFERENCE; ja piemērojams]
INHERITED VERIFICATION LEVEL
```

`ORIGIN TASK REFERENCE.OBJECT TYPE = TASK`; `ORIGIN OUTPUT REFERENCE.OBJECT TYPE = OUTPUT`. Visas references satur izcelsmes `TRACE RECORD ID` un `RECORD VERSION`. Mantotais verification level tiek iegūts tieši no norādītās izcelsmes versijas.

## 4. Atbilde uz MEDIUM finding

### M1 — paralēlie HUMAN DECISION attiecību lauki

**Pozīcija: PIEŅEMTS.**

`RELATED TRACE OBJECT REFERENCES` ir vienīgais autoritatīvais attiecību avots. `RELATED FINDING`, `RELATED REQUIREMENT` un `RELATED ISSUE` pagaidām paliek kā compatibility views.

```text
IF RELATED FINDING is populated
THEN an exactly matching FINDING reference must exist in
RELATED TRACE OBJECT REFERENCES

IF RELATED REQUIREMENT is populated
THEN an exactly matching REQUIREMENT reference must exist in
RELATED TRACE OBJECT REFERENCES

IF RELATED ISSUE is populated
THEN an exactly matching UNRESOLVED ISSUE reference must exist in
RELATED TRACE OBJECT REFERENCES

IF a specific field conflicts with RELATED TRACE OBJECT REFERENCES
THEN record is INVALID
```

Specifiskie lauki nedrīkst radīt otru patiesības avotu.

### M2 — CONTENT HASH neversētam dokumentam

**Pozīcija: PIEŅEMTS; jautājums netiek atlikts.**

Vispārīgā SOURCE shēmā `CONTENT HASH` paliek nosacīts, bet neversēta dokumenta identitātes gadījumā tas kļūst obligāts:

```text
IF VERSION is absent AND EFFECTIVE DATE is absent
THEN CONTENT HASH and CONTENT HASH ALGORITHM are required

IF required hash cannot be produced
THEN source revision identity is insufficient
AND an UNRESOLVED ISSUE is required
AND the source must not support a material conclusion until resolved
```

`DOCUMENT MANAGEMENT REFERENCE`, `FILE NAME`, `RECEIVED AT` un `RECEIVED FROM` paliek papildu identitātes metadati, bet neaizstāj obligāto hash neversētam dokumentam.

## 5. Pilnais korekciju tvērums

Konsolidētajā korekciju paketē ietveramas visas šīs izmaiņas:

1. intra-record un cross-record references atšķirīga glabāšanas shēma;
2. strukturēts `ASSIGNMENT AUTHORITY BASIS SOURCE REFERENCE`;
3. trīs semantisko `MTR-OUTSOURCING-001` vērtību nomaiņa uz `MTR-0001`;
4. ID invarianta owner-document precizējums;
5. `PRIOR TASK OUTPUT` pilnas cross-record references;
6. HUMAN DECISION compatibility lauku saskaņotības invarianti;
7. obligāts hash un algoritms neversētam dokumentam;
8. attiecīgo validācijas un negatīvo testu atjaunošana;
9. Review #16 integrācijas ieraksta un roadmap statusa atjaunošana.

Atsevišķs frozen baseline grozījums, `NOT USED` sentinel, faktiska `ISS-` instance, standalone faila dzēšana un freeze šajā korekcijā netiek veikti, jo tie nav vajadzīgi neviena šīs recenzijas finding novēršanai.

## 6. Akcepta kritēriji nākamajai recenzijai

Korekciju pakete ir pieņemama tikai tad, ja:

1. recenzents pārbauda commit, kas ir `2db5a4b` pēctecis;
2. intra-record reference ir validējama bez record ID/version dublēšanas;
3. nepilna cross-record reference ir `INVALID`;
4. assignment basis ir strukturēta pinned SOURCE reference;
5. repo vairs nesatur `MTR-OUTSOURCING-001`;
6. katra `PRIOR TASK OUTPUT` izcelsmes reference satur konkrētu record versiju;
7. HUMAN DECISION compatibility lauki nevar konfliktēt ar autoritatīvo references sarakstu;
8. neversēts avots bez hash ir `INVALID` materiāla secinājuma atbalstam;
9. frozen faili nav mainīti;
10. freeze nav pasludināts ar commit faktu.

## 7. Procesa rezultāts

```text
RECENZIJAS VERDIKTS:              CHANGES REQUIRED — PIEŅEMTS AR PRECIZĒJUMIEM
BL1:                              NORAIDĪTS PRET AKTUĀLO BĀZI
BL2:                              NOVĒRSTS
BL3 / H1 / H2 / H4 / M1 / M2:    PIEŅEMTI AR PRECĪZU LABOJUMU
H3:                               FAKTS NORAIDĪTS; FORMULĒJUMS PRECIZĒJAMS
ATLIKTI RECENZIJAS FINDING:       0
FAKTISKA ISS- INSTANCE:           NAV IZVEIDOTA
STANDALONE FAILA DZĒŠANA:         NAV VEIKTA
FREEZE:                           NAV APSTIPRINĀTS
```
