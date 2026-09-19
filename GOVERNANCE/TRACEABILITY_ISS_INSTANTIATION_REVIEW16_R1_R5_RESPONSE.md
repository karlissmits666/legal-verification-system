# REVIEW #16 — FORMĀLA ATBILDE UZ R1–R5

**Statuss:** REVIEW RESPONSE — POZĪCIJA FIKSĒTA, KONSENSS PENDING, FREEZE NAV APSTIPRINĀTS  
**Datums:** 2026-09-19  
**Atbildes bāze:** `GOVERNANCE/TRACEABILITY_ISS_INSTANTIATION_REVIEW16_DELTA_RESPONSE_REVIEW.md`  
**Pārbaudītā integrētā bāze:** `2db5a4bbbbe9e094e4d98ca212ddc9bb2b9d7c4f`  
**Iepriekšējā response:** `37608deb9c3a23423bd98f129aba1bfb6470687a`  
**Implementation:** NAV VEIKTA  
**Freeze:** NAV APSTIPRINĀTS

## 1. Atbildes robeža

[PĀRBAUDĪTS FAKTS] Otrās kārtas recenzents pieņēma iepriekšējo Review #16 atbildi, apstiprināja BL1 un H3 noraidījumu pamatojumu, apstiprināja BL2 novēršanu un pievienoja piecus jaunus punktus R1–R5.

[DOKUMENTĒTS LĒMUMS] Šī atbilde fiksē projekta pozīciju uz R1–R5. Tā pati neveic nevienu arhitektūras drafta labojumu, nerada faktisku `TASK-`, `MOD-` vai `ISS-` instanci, nemaina frozen baseline un nav freeze lēmums.

[PRIEKŠLIKUMS] Pilnā korekciju pakete drīkst tikt implementēta tikai pēc neatkarīgas recenzenta pārbaudes, konsensa noslēgšanas un atsevišķa lietotāja implementation approval.

## 2. R1 — saistītā freeze secība

**Pozīcija: PIEŅEMT.**

[PĀRBAUDĪTS FAKTS] `TRACEABILITY_RECORD_v1_v0.6` nosacītais AI lauku modelis ir veidots kopā ar `PROFESSIONAL_SCOPE_v1.4`, bet pašreizējais frozen scope ir `PROFESSIONAL_SCOPE_v1.3`.

[PRIEKŠLIKUMS] `LEGAL_CLASSIFICATION_BASELINE_AMENDMENT_v0.2` implementation paketē skaidri jānosaka:

```text
TRACEABILITY_RECORD_v1_v0.6 freeze nav pieļaujams
pirms vai atsevišķi no PROFESSIONAL_SCOPE_v1.4 freeze.
```

[PRIEKŠLIKUMS] Gala amendment audita akcepta kritērijam jāverificē, ka šī dependency ir dokumentēta un ka TR v0.6 netiek iesaldēts starpstāvoklī pret PS v1.3.

## 3. R2 — avota identitāte un jauna izdošanas vārta risks

**Pozīcija: PIEŅEMT RECENZENTA VARIANTU (b).**

[PĀRBAUDĪTS FAKTS] Pašreizējais `TRACEABILITY_RECORD_v1_v0.6` §11 izmanto “pietiekamas identitātes kombinācijas” modeli neversētam dokumentam un paredz `UNRESOLVED ISSUE`, ja konkrēto redakciju nevar pietiekami identificēt.

[PRIEKŠLIKUMS] Saglabāt šo modeli; neieviest šajā Review #16 paketē absolūtu `CONTENT HASH` obligātumu visiem neversētiem avotiem un neieviest jaunu automātisku izdošanas vārtu ārpus frozen `VERIFICATION_PROTOCOL_v1`.

Precizētais invariants:

```text
IF VERSION is absent AND EFFECTIVE DATE is absent
THEN source revision identity MUST be established
through a sufficient documented combination of available identity fields

IF source revision identity is insufficient
THEN create UNRESOLVED ISSUE

CONTENT HASH + CONTENT HASH ALGORITHM
MAY be part of the sufficient identity combination

IF CONTENT HASH is present
THEN CONTENT HASH ALGORITHM is required
```

[PĀRBAUDĪTS FAKTS] `DOCUMENT MANAGEMENT REFERENCE`, `FILE NAME`, `RECEIVED AT`, `RECEIVED FROM`, `CONTENT HASH ALGORITHM` un `CONTENT HASH` jau ir §11 identitātes kombinācijas kandidāti.

[PRIEKŠLIKUMS] No iepriekšējās M2 atbildes jāatsauc tikai absolūtais apgalvojums, ka neversēts avots vienmēr ir nederīgs materiāla secinājuma atbalstam bez hash. Nepietiekama identitāte paliek fail-closed kā `UNRESOLVED ISSUE`, bet šajā paketē netiek radīts jauns release gate.

## 4. R3 — HUMAN DECISION attiecību modelis

**Pozīcija: PIEŅEMT.**

[PĀRBAUDĪTS FAKTS] Integrētais §36 šobrīd specifiskos `RELATED FINDING`, `RELATED REQUIREMENT` un `RELATED ISSUE` laukus vēl apraksta kā persistētas references, savukārt iepriekšējā response M1 nosaka generic references sarakstu par vienīgo autoritatīvo attiecību avotu.

[PRIEKŠLIKUMS] §36 esošais skaidrojums jāaizstāj, nevis jāpapildina:

```text
RELATED TRACE OBJECT REFERENCES
= vienīgais autoritatīvais attiecību avots

RELATED FINDING
RELATED REQUIREMENT
RELATED ISSUE
= compatibility views

IF a compatibility view is populated
THEN an exactly matching typed reference MUST exist in
RELATED TRACE OBJECT REFERENCES

IF a compatibility view conflicts with
RELATED TRACE OBJECT REFERENCES
THEN the HUMAN DECISION RECORD is INVALID
```

[PRIEKŠLIKUMS] Compatibility views nedrīkst radīt otru patiesības avotu un nedrīkst tikt validētas neatkarīgi no autoritatīvā saraksta.

## 5. R4 — TRACE OBJECT TYPE un ID lauka mapping

**Pozīcija: PIEŅEMT.**

[PĀRBAUDĪTS FAKTS] `TERMINOLOGY_AND_ENUMS_v1_v0.4` reģistrē `MODULE TRIGGER SET` kā `TRACE OBJECT TYPE` ar `MTR-` prefiksu, bet owner dokumentā shēmas lauka nosaukums ir `TRIGGER SET ID`, nevis `MODULE TRIGGER SET ID`.

[PRIEKŠLIKUMS] T&E implementation paketē jānosaka owner-document princips un explicit mehānisks mapping starp katru reģistrēto trace object type un tā ID lauka nosaukumu.

Minimālais princips:

```text
For each registered TRACE OBJECT TYPE with an ID prefix,
the owner document MUST define the required object ID field.

TRACE OBJECT TYPE -> ID FIELD NAME mapping
must be explicit and mechanically checkable.
```

Obligāti iekļaut vismaz:

```text
MODULE TRIGGER SET -> TRIGGER SET ID
```

[PRIEKŠLIKUMS] §26.1 formulējums jāsaskaņo ar šo owner-document modeli tā, lai kvalifikators “patstāvīgam ierakstam” neradītu neskaidru izņēmumu no reģistrētā mapping.

## 6. R5 — atomāra shēmas un validācijas implementation

**Pozīcija: PIEŅEMT.**

[PRIEKŠLIKUMS] Review #16 korekciju implementation nedrīkst sadalīt tā, ka shēmas lauki tiek commitēti bez tiem nepieciešamajiem cross-field invariantiem un negatīvajiem testiem.

Vienā atomārā implementation commitā jāietver:

1. shēmas lauku labojumi;
2. cross-field invarianti;
3. mehāniski pārbaudāmi validācijas noteikumi;
4. negatīvie testi;
5. savstarpēji atkarīgo same-package draftu statusa un review ierakstu atjauninājumi.

[DOKUMENTĒTS LĒMUMS] Šī response commita laikā minētā implementation netiek veikta.

## 7. Pilnais atomārās korekciju paketes tvērums

[PRIEKŠLIKUMS] Pēc konsensa un atsevišķa implementation approval vienā atomārā Review #16 korekciju commitā jāievieš visi zemāk minētie punkti, nevis tikai R1–R5 izolēti:

1. **BL3 — reference mode precizējums**
   - intra-record reference: `OBJECT TYPE + OBJECT ID`, record identity mantojot no containing immutable record version;
   - cross-record reference: pilni `TRACE RECORD ID + RECORD VERSION + OBJECT TYPE + OBJECT ID`;
   - nepilna cross-record reference = `INVALID`.

2. **H1 — assignment authority basis**
   - `HUMAN DECISION RECORD` pievienot strukturētu `ASSIGNMENT AUTHORITY BASIS SOURCE REFERENCE`;
   - ja HUMAN DECISION kalpo kā action owner vai resolution authority assignment pamats, šai SOURCE reference jābūt obligātai.

3. **H2 — necaurspīdīgs MTR ID**
   - visas `MTR-OUTSOURCING-001` vērtības aizstāt ar `MTR-0001`;
   - neveidot jaunu trigger-set objektu.

4. **H3/R4 — owner-document ID invariants**
   - precizēt, ka katra reģistrēta `TRACE OBJECT TYPE` ID lauku nosaka tā owner dokumenta shēma;
   - ieviest explicit type-to-ID-field mapping, tostarp `MODULE TRIGGER SET -> TRIGGER SET ID`.

5. **H4 — PRIOR TASK OUTPUT references**
   - `ORIGIN TASK REFERENCE`, `ORIGIN OUTPUT REFERENCE` un, ja piemērojams, `ORIGIN OBJECT REFERENCE`;
   - visas kā pilnas cross-record references ar konkrētu izcelsmes record versiju.

6. **M1/R3 — HUMAN DECISION attiecību autoritāte**
   - `RELATED TRACE OBJECT REFERENCES` ir vienīgais autoritatīvais attiecību avots;
   - specifiskie RELATED lauki ir tikai compatibility views;
   - konflikts = `INVALID`.

7. **M2/R2 — neversēta avota identitāte**
   - saglabāt pietiekamas identitātes kombinācijas modeli;
   - nepietiekama identitāte → `UNRESOLVED ISSUE`;
   - neieviest jaunu automātisku release gate;
   - saglabāt `IF CONTENT HASH is present THEN CONTENT HASH ALGORITHM is required`.

8. **R1 — freeze dependency**
   - amendment dokumentā noteikt, ka `TRACEABILITY_RECORD_v1_v0.6` nedrīkst freezeot pirms vai atsevišķi no `PROFESSIONAL_SCOPE_v1.4`.

9. **R5 — validācijas specifikācija**
   - visas shēmas korekcijas, cross-field invarianti un negatīvie testi implementēt tajā pašā commitā.

10. **Review un roadmap konsekvence**
    - atjaunināt Review #16 integrācijas ierakstu, amendment ierakstu un roadmap statusu tikai atbilstoši faktiskajai implementation;
    - frozen baseline statusu nemainīt bez atsevišķa freeze lēmuma.

## 8. Minimālie negatīvie testi implementation paketei

[PRIEKŠLIKUMS] Atomārajā implementation commitā vismaz šādi testi ir obligāti:

```text
N1: intra-record reference with missing OBJECT TYPE -> INVALID
N2: intra-record reference with ID prefix/type mismatch -> INVALID
N3: cross-record reference missing TRACE RECORD ID -> INVALID
N4: cross-record reference missing RECORD VERSION -> INVALID
N5: cross-record target absent in pinned record version -> INVALID
N6: HUMAN DECISION compatibility view conflicts with authoritative generic reference -> INVALID
N7: HUMAN DECISION used as assignment basis without ASSIGNMENT AUTHORITY BASIS SOURCE REFERENCE -> INVALID
N8: MODULE TRIGGER SET owner schema lacks mapped TRIGGER SET ID -> INVALID
N9: PRIOR TASK OUTPUT uses bare origin ID without pinned origin record version -> INVALID
N10: CONTENT HASH present without CONTENT HASH ALGORITHM -> INVALID
N11: unversioned source identity insufficient -> UNRESOLVED ISSUE required
N12: attempted TRACEABILITY_RECORD_v1_v0.6 freeze without same-package PROFESSIONAL_SCOPE_v1.4 freeze -> BLOCK
```

## 9. Apzināti ārpus šīs paketes

[DOKUMENTĒTS LĒMUMS] Šī response un nākamā Review #16 korekciju pakete neievieš:

- jaunu automātisku release gate tikai avota hash trūkuma dēļ;
- globālu module activation gate;
- jaunu governance-artifact references klasi;
- function registry;
- faktisku `TASK-`, `MOD-` vai `ISS-` instanci;
- standalone containment faila dzēšanu;
- `NOT USED`, `N/A`, `TBD` vai `NOT ESTABLISHED` sentinel statusus;
- freeze.

## 10. Atbilde R1–R5 īsā formā

```text
R1: PIEŅEMTS
    TR v0.6 freeze nedrīkst notikt pirms vai atsevišķi no PS v1.4.

R2: PIEŅEMTS VARIANTS (b)
    Saglabāt pietiekamas identitātes kombinācijas modeli.
    Nepietiekama identitāte -> UNRESOLVED ISSUE.
    Jauns automātisks release gate netiek ieviests.

R3: PIEŅEMTS
    §36 teksts jāaizstāj.
    RELATED TRACE OBJECT REFERENCES ir vienīgais autoritatīvais avots.
    Specifiskie RELATED lauki ir compatibility views.

R4: PIEŅEMTS
    Ieviest owner-document principu un explicit type -> ID field mapping,
    tostarp MODULE TRIGGER SET -> TRIGGER SET ID.

R5: PIEŅEMTS
    Shēma + invarianti + negatīvie testi vienā atomārā implementation commitā.
```

## 11. Procesa rezultāts

```text
R1:                         PIEŅEMTS
R2:                         PIEŅEMTS — VARIANTS (b)
R3:                         PIEŅEMTS
R4:                         PIEŅEMTS
R5:                         PIEŅEMTS
IEPRIEKŠĒJIE PIEŅEMTIE:    BL3 / H1 / H2 / H4 / M1 / M2 — SAGLABĀTI AR R1–R5 PRECIZĒJUMIEM
BL1 / H3 NORAIDĪJUMI:      PALIEK SPĒKĀ
BL2:                        NOVĒRSTS
IMPLEMENTATION:             NAV VEIKTA
ARHITEKTŪRAS DRAFTI:        NAV MAINĪTI
FROZEN FAILI:               NAV MAINĪTI
ISS- INSTANCE:              NAV IZVEIDOTA
STANDALONE FAILS:           PALIEK REPO
FREEZE:                     NAV APSTIPRINĀTS
KONSENSS:                   PENDING — NEATKARĪGA RECENZENTA PĀRBAUDE
```

## 12. Nākamais procesa solis

[PRIEKŠLIKUMS] Neatkarīgam recenzentam jāpārbauda šī atbilde pret:

1. `TRACEABILITY_ISS_INSTANTIATION_REVIEW16_DELTA_RESPONSE_REVIEW.md`;
2. integrēto bāzi `2db5a4bbbbe9e094e4d98ca212ddc9bb2b9d7c4f`;
3. current amendment draftiem;
4. frozen baseline.

Līdz recenzenta apstiprinājumam un atsevišķam lietotāja implementation approval:

```text
IMPLEMENTATION AUTHORIZED: NO
FREEZE AUTHORIZED: NO
```
