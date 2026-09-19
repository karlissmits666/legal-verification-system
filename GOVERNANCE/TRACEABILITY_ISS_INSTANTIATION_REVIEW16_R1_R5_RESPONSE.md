# REVIEW #16 — FORMĀLA ATBILDE UZ R1–R5 — v4

**Statuss:** REVIEW RESPONSE v4 — POZĪCIJA FIKSĒTA, KONSENSS PENDING, IMPLEMENTATION NAV APSTIPRINĀTA
**Datums:** 2026-09-19
**Versija:** v4
**Atbildes bāze:** `GOVERNANCE/TRACEABILITY_ISS_INSTANTIATION_REVIEW16_R1_R5_V3_RESPONSE_REVIEW.md`
**v3 recenzētais commits:** `314aefee27d79e8790f54ffc9454f44b7404f436`
**Implementation:** NAV VEIKTA
**Freeze:** NAV APSTIPRINĀTS

## 1. Atbildes robeža

[PĀRBAUDĪTS FAKTS] Neatkarīgā v3 recenzija atgrieza `CHANGES REQUIRED` ar K1 BLOCKING; K2–K3 HIGH; K4–K5 MEDIUM; K6–K7 LOW.

[DOKUMENTĒTS LĒMUMS] v4 ir tikai review-response artefakts. Tas nemaina arhitektūras draftus vai frozen baseline. Jau pārbaudītie J2, J3, J7, J8 risinājumi un J9 noraidījums netiek semantiski atvērti no jauna.

## 2. K1 — relationship lauku diskriminators

**PIEŅEMTS.**

[PRIEKŠLIKUMS] Šīs Review #16 paketes ietvaros pašreizējam TR v0.6 izmanto šādu deterministisku klasifikācijas secību:

```text
1. Objekta paša ID lauku nosaka T&E §30.1 mapping. Tas nav relationship lauks.

2. Persistēts relationship lauks ar galotni ID vai IDS ir BARE INTRA-RECORD ID,
   ja vien šajā paketē nav eksplicīti noteikta konversija.

3. Persistēts lauks ar galotni REFERENCE vai REFERENCES ir reference candidate:
   a) ja target ir T&E §25 TRACE OBJECT TYPE -> §5.1 TRACE-OBJECT REFERENCE;
   b) ja target ir external system, evidence store, registry/taxonomy value,
      artifact location vai cita ne-trace identitāte -> NON-TRACE REFERENCE.

4. Persistēts relationship lauks bez ID(S) / REFERENCE(S) galotnes netiek
   klasificēts pēc nosaukuma; tā kategorija ir eksplicīti norādīta §3 matricā.

5. Vienīgā šajā paketē apstiprinātā BARE ID -> STRUCTURED REFERENCE konversija
   ir TR §14 ORIGIN TASK / OUTPUT / OBJECT.

6. Eksplicītā §3 matrica ir prioritāra pār visiem iepriekšējiem noklusējumiem.
```

Šis ir šīs amendment paketes noteikums faktiskajam TR v0.6 lauku kopumam. Tas nav jauna globāla `TERMINOLOGY_AND_ENUMS_v1 §4` lauku-nosaukumu konvencija.

Tādējādi v3 D/F pretruna tiek izņemta: target tips vairs pats par sevi nepārkvalificē `ID/IDS` lauku par §5.1 reference.

## 3. K2 — pilnā TR v0.6 relationship-field klasifikācija

**PIEŅEMTS.**

Kategorijas:
- `OWN ID` — objekta paša ID; kontrolē §30.1;
- `BARE ID` — intra-record identitātes lauks, ne §5.1 structure;
- `TREF-INTRA` — §5.1 trace-object reference, pēc noklusējuma INTRA-RECORD;
- `TREF-CROSS` — §5.1 cross-record reference;
- `NREF` — non-trace reference; saglabā owner shēmu;
- `VIEW` — compatibility / relationship view, ne jauna §5.1 structure;
- `REG/META` — registry, version, evidence-set vai cita ne-trace identitāte;
- `SUMMARY` — strukturāls kopsavilkuma/versiju-triggera lauks, kura semantika mantota no detalizētā owner lauka.

Objekta paša 19 ID lauki nav atkārtoti dublēti zemāk; tos pilnībā nosaka jau pārbaudītais §30.1 mapping.

| TR sadaļa | Lauks | Kategorija | Target / semantika |
|---|---|---|---|
| §6 | FACT PROFILE FINDING IDS | BARE ID | FINDING, intra-record |
| §6 | MODULE SCREENING RECORD IDS | BARE ID | MODULE SCREENING RECORD, intra-record |
| §7.1 | TASK ID | BARE ID | TASK, intra-record |
| §7.1 | CONTRACT TYPE REFERENCES | NREF | controlled CONTRACT TYPE registry |
| §7.1 | RELEVANT FACT FINDING REFERENCES | TREF-INTRA | FINDING |
| §7.1 | MATERIAL ASSUMPTION FINDING REFERENCES | TREF-INTRA | FINDING |
| §7.1 | SUPPORTING SOURCE REFERENCES | TREF-INTRA | SOURCE |
| §7.1 | COUNTERVAILING SOURCE REFERENCES | TREF-INTRA | SOURCE |
| §7.1 | HUMAN DECISION REFERENCE | TREF-INTRA | HUMAN DECISION |
| §7.1 | RELATED MODULE ID | BARE ID | MODULE |
| §7.1 | SUPERSEDES LCA ID | BARE ID | LEGAL CLASSIFICATION ASSESSMENT |
| §7.1 | RECLASSIFICATION REVIEW DECISION ID | BARE ID | HUMAN DECISION |
| §7.2 | TASK ID | BARE ID | TASK |
| §7.2 | TRIGGER REGISTRY ID / VERSION | REG/META | trigger registry identity |
| §7.2 | trigger id → FINDING ID map | REG/META + BARE ID | trigger registry key → FINDING |
| §7.2 | RELATED FACT FINDING IDS | BARE ID | FINDING |
| §7.2 | SCREENING DECISION ID | BARE ID | HUMAN DECISION |
| §7.2 | HUMAN DECISION RELATED TRACE OBJECT REFERENCES uz MSR | TREF-INTRA | MODULE SCREENING RECORD |
| §8 | SOURCE / REFERENCE | NREF | legacy provenance field; šajā paketē netiek pārveidots par §5.1 |
| §8 | CLASSIFICATION ASSESSMENT REFERENCES | TREF-INTRA | LEGAL CLASSIFICATION ASSESSMENT |
| §9 | DOCUMENT MANAGEMENT REFERENCE | NREF | external document-management reference |
| §9 | LOCATION / REFERENCE | NREF | source location / external reference |
| §11 | DOCUMENT MANAGEMENT REFERENCE | NREF | external document-management reference |
| §13 | SOURCE ID | BARE ID | SOURCE |
| §13 | RESOLUTION REFERENCE | NREF | resolution provenance; nav §25 trace-object tips |
| §14 | ORIGIN TASK REFERENCE | TREF-CROSS | TASK; konvertēts no ORIGIN TASK ID |
| §14 | ORIGIN OUTPUT REFERENCE | TREF-CROSS | OUTPUT; konvertēts no ORIGIN OUTPUT ID |
| §14 | ORIGIN OBJECT REFERENCE | TREF-CROSS | konkrēts §25 trace object; konvertēts no ORIGIN OBJECT ID |
| §15 | SOURCE IDS | BARE ID | SOURCE |
| §15 | EVIDENCE IDS | BARE ID | EVIDENCE |
| §15 | RELATED REQUIREMENT | VIEW | compatibility relationship view |
| §15 | RELATED OUTPUT | VIEW | compatibility relationship view |
| §15 | DATA CLASS EVENT REFERENCES | TREF-INTRA | DATA CLASS EVENT |
| §15 | VERIFICATION SCOPE RECORD IDS | BARE ID | VERIFICATION SCOPE RECORD |
| §17 | SOURCE ID | BARE ID | SOURCE |
| §17 | RELATED FINDING / REQUIREMENT / COMPONENT | VIEW | compatibility relationship view |
| §17 | EVIDENCE STORE REFERENCE | NREF | evidence store |
| §17 | EVIDENCE SET / REVIEW ID | REG/META | evidence-store/review identity |
| §20 | EVIDENCE STORE REFERENCE | NREF | evidence store |
| §20 | EVIDENCE SET / REVIEW ID | REG/META | evidence-store/review identity |
| §20 | EVIDENCE IDS | BARE ID | EVIDENCE |
| §20.1 | SOURCE SET REFERENCE | NREF | source-set provenance; SOURCE SET nav §25 trace object |
| §20.1 | RELATED FINDING / REQUIREMENT / COMPONENT | VIEW | compatibility relationship view |
| §22 | REQUIREMENT ID | BARE ID | REQUIREMENT |
| §22 | EVIDENCE IDS | BARE ID | EVIDENCE |
| §22 | DATA CLASS EVENT REFERENCES | TREF-INTRA | DATA CLASS EVENT |
| §22 | CLASSIFICATION BASIS REFERENCES | TREF-INTRA | LCA / HUMAN DECISION / MODULE decision target as registered trace object |
| §22 | SUPERSEDED BY RESULT ID | BARE ID | REQUIREMENT result identity |
| §27 | EVIDENCE IDS | BARE ID | EVIDENCE |
| §30 | TARGET OBJECT ID + TARGET OBJECT TYPE | BARE ID + TYPE | typed intra-record target pair; nav §5.1 structure |
| §30 | SOURCE / EVIDENCE REFERENCES | TREF-INTRA | SOURCE / EVIDENCE |
| §30 | VERIFICATION SCOPE RECORD REFERENCES | TREF-INTRA | VERIFICATION SCOPE RECORD |
| §34 | EVIDENCE REFERENCES | TREF-INTRA | EVIDENCE aggregate |
| §34 | VERIFICATION SCOPE RECORD REFERENCES | TREF-INTRA | VSR aggregate |
| §34 | LEGAL STATUS REFERENCE | NREF | external legal-status reference |
| §36 | RELATED FINDING / REQUIREMENT / ISSUE | VIEW | compatibility views |
| §36 | RELATED TRACE OBJECT REFERENCES | TREF-INTRA | typed §25 trace objects |
| §36 | ASSIGNMENT AUTHORITY BASIS SOURCE REFERENCE (jaunais lauks) | TREF-INTRA | SOURCE |
| §37 | ESCALATION REFERENCE | NREF | external/process escalation provenance |
| §37 | RESPONSE REFERENCE | NREF | external/process response provenance |
| §38 | RELATED TRACE OBJECT REFERENCES | TREF-INTRA | typed §25 trace objects |
| §38 | ACTION OWNER BASIS REFERENCE | TREF-INTRA | SOURCE |
| §38 | RESOLUTION AUTHORITY BASIS REFERENCE | TREF-INTRA | SOURCE |
| §40 | SOURCE SET REFERENCE | NREF | source-set provenance; SOURCE SET nav §25 trace object |
| §40 | RELATED FINDINGS | VIEW | relationship view |
| §40 | RELATED REQUIREMENTS | VIEW | relationship view |
| §40 | LEGAL CLASSIFICATION ASSESSMENT REFERENCES | TREF-INTRA | LCA |
| §40 | MODULE SCREENING RECORD REFERENCES | TREF-INTRA | MSR |
| §40 | TRIGGER SET ID / VERSION | REG/META | MODULE TRIGGER SET registry identity |
| §40 | MODULE SCREENING RECORD ID | BARE ID | MSR |
| §40 | COMPLETENESS CONTROL REFERENCE | NREF | completeness-control provenance; nav §25 trace object |
| §40 | OUTPUT REFERENCE | NREF | output artefact location/reference |
| §40 | DATA CLASS EVENT REFERENCES | TREF-INTRA | DATA CLASS EVENT |
| §40 | VERIFICATION SCOPE RECORD REFERENCES | TREF-INTRA | VSR |
| §42 | SOURCE SYSTEM / CHANNEL + REFERENCE | NREF | external legal-status system |
| §43 | DECISION SOURCE + REFERENCE | NREF | external business-decision provenance |
| §44 | PREVIOUS VERSION | REG/META | Trace Record version identity; nav §5.1 object reference |
| §45 | EVIDENCE REFERENCE | SUMMARY | version-trigger alias; semantika = EVIDENCE reference |
| §45 | VERIFICATION SCOPE RECORD REFERENCE | SUMMARY | version-trigger alias; semantika = VSR reference |
| §45 | LEGAL STATUS REFERENCE | SUMMARY | version-trigger alias; semantika = §42 NREF |
| §46 | REQUIREMENTS SET SELECTION REFERENCES | TREF-INTRA | REQUIREMENTS SET |
| §46 | EVIDENCE REFERENCES | TREF-INTRA | EVIDENCE |
| §51 | diagrammas *REFERENCES lauki | SUMMARY | strukturāls kopsavilkums, ne jauna persistēta owner shēma |

§4 centrālā koka references un §51 diagrammas lauki ir strukturāli kopsavilkumi; tie nerada atsevišķu persistence shēmu un manto detalizēto owner sadaļu semantiku.

[DOKUMENTĒTS LĒMUMS] Šī matrica ir Review #16 implementation specifikācijas daļa. Implementation laikā nav atļauts pārklasificēt lauku citā kategorijā bez jauna review delta.

## 4. K3 — OBJECT ID vērtība un ID FIELD NAME

**PIEŅEMTS.**

TR §5.1 un T&E §26.2 identiskajā aizstājējtekstā iepriekšējais kļūdainais teikums tiek aizstāts ar:

```text
OBJECT ID prefiksam jāatbilst OBJECT TYPE prefiksam 26. punktā.

OBJECT ID vērtība ir tā vērtība, kas target objekta owner shēmā glabāta
30.1. punktā šim OBJECT TYPE reģistrētajā ID FIELD NAME laukā.

Target objektam jāeksistē attiecīgajā record versijā.
```

§30.1 mapping pilnīgumu validē RMT3; OBJECT ID vērtība netiek salīdzināta ar lauka nosaukuma tekstu.

Pilnais reference-mode aizstājējteksts abās owner sadaļās paliek identisks:

```text
Atsauce tiek glabāta vienā no diviem režīmiem.

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

OBJECT TYPE izmanto T&E §25 reģistrētu TRACE OBJECT TYPE.
OBJECT ID prefiksam jāatbilst OBJECT TYPE prefiksam T&E §26.
OBJECT ID vērtība ir tā vērtība, kas target objekta owner shēmā glabāta
T&E §30.1 šim OBJECT TYPE reģistrētajā ID FIELD NAME laukā.
Target objektam jāeksistē attiecīgajā record versijā.

Nepilnīga cross-record reference ir INVALID.
Atsauce uz current, latest vai citu kustīgu mērķi nav derīga.
```

## 5. K4 — T&E §30 indeksa rinda

**PIEŅEMTS.**

v3 rinda `ID FIELD NAME | TERMINOLOGY_AND_ENUMS_v1 | ...` tiek atsaukta.

Vienīgā piedāvātā §30 rinda ir:

| Controlled field | Owning document | Registry |
|---|---|---|
| TRACE OBJECT TYPE → ID FIELD MAPPING | `TERMINOLOGY_AND_ENUMS_v1` | TRACE OBJECT TYPE → ID FIELD MAPPING (§30.1) |

`TERMINOLOGY_AND_ENUMS_v1` ir mapping indeksa owner, ne katra ID lauka definīcijas owner. Faktiskā lauka owner paliek §30.1 ceturtajā kolonnā norādītais schema owner.

## 6. K5 — H1 un §38 basis references

**PIEŅEMTS.**

TR §36 operācija ir **PAPILDINĀJUMS**:
- pievieno `ASSIGNMENT AUTHORITY BASIS SOURCE REFERENCE [obligāts, ja HUMAN DECISION tiek izmantots action owner vai resolution authority assignment pamatam]`;
- lauka vērtība ir §5.1 trace-object reference ar `OBJECT TYPE = SOURCE`;
- noklusējuma režīms INTRA-RECORD; CROSS-RECORD tikai tad, ja target SOURCE atrodas citā Trace Record / versijā.

TR §38 operācija ir **ESOŠO LAUKU SEMANTIKAS PRECIZĒJUMS**, lauku nosaukumi netiek mainīti:
- `ACTION OWNER BASIS REFERENCE` = §5.1 trace-object reference ar `OBJECT TYPE = SOURCE`;
- `RESOLUTION AUTHORITY BASIS REFERENCE` = §5.1 trace-object reference ar `OBJECT TYPE = SOURCE`;
- noklusējuma režīms INTRA-RECORD; CROSS-RECORD tikai tad, ja target SOURCE atrodas citā Trace Record / versijā.

Governance dokuments, kas ir faktiskā assignment/resolution authority bāze, saskaņā ar TR §5.1 tiek reģistrēts kā SOURCE; ja tas nav pieejams kā SOURCE objekts, basis reference nav uzskatāma par pilnīgu.

## 7. K6 — cross-record prefiksa tests

**PIEŅEMTS.**

N2 tiek aizstāts ar:

```text
N2: any §5.1 reference OBJECT ID prefix/type mismatch -> INVALID
```

Tas attiecas uz INTRA-RECORD un CROSS-RECORD režīmu.

## 8. K7 — RMT1 uzturēšanas noteikums

**PIEŅEMTS.**

Pašreizējais RMT1 FILE SET paliek precīzi definēts ar deviņiem aktīvajiem amendment draftiem.

Papildu invariants:

```text
IF the active same-package architecture draft set changes
THEN RMT1 FILE SET MUST be reviewed and, if necessary, updated
in the same process-state change before continuity may be marked ready.
```

Review / response / audit / task vēstures artefakti paliek ārpus RMT1.

## 9. RMT4 — relationship klasifikācijas completeness

[PRIEKŠLIKUMS] Pievieno repo-level testu:

```text
RMT4:
For TRACEABILITY_RECORD_v1 v0.6 persisted schema fields, every relationship
candidate matching any of:
- field token ID or IDS;
- field token REFERENCE or REFERENCES;
- RELATED relationship semantics;
- slash-composite relationship labels listed in the schema;

MUST have exactly one classification in the approved relationship-field
classification matrix, excluding:
- the object's own ID field controlled by §30.1;
- explanatory prose;
- structural summary/diagram aliases explicitly classified as SUMMARY.

Missing or multiple classifications -> FAIL.
```

RMT4 ir repo/schema completeness tests, ne record-instance validators.

## 10. K1–K7 statusi

```text
K1  PIEŅEMTS — diskriminators nošķir ID/IDS, REFERENCE(S) un explicit views
K2  PIEŅEMTS — pilna klasifikācijas matrica + RMT4
K3  PIEŅEMTS — OBJECT ID value / ID FIELD NAME formulējums salabots
K4  PIEŅEMTS — §30 kontrolē mapping indeksu, ne ID lauku nosaukumus
K5  PIEŅEMTS — §36 un §38 SOURCE reference semantika precīzi fiksēta
K6  PIEŅEMTS — N2 attiecas uz abiem reference režīmiem
K7  PIEŅEMTS — RMT1 uzturēšana sasaistīta ar same-package draft set izmaiņu
```

## 11. Saglabātie J/R risinājumi

```text
J1  SAGLABĀTS ar K4 precizējumu
J2  NOVĒRSTS — COMPONENT ID
J3  NOVĒRSTS — §26.1 invarianti
J4  ATKĀRTOTI ATRISINĀTS ar K1/K2 matricu un RMT4
J5  ATKĀRTOTI ATRISINĀTS ar K3 precīzu aizstājējtekstu
J6  SAGLABĀTS ar K7 uzturēšanas invariantu
J7  NOVĒRSTS
J8  NOVĒRSTS
J9  PAMATOTI NORAIDĪTS — EVENT ID paliek

R1  PIEŅEMTS
R2  PIEŅEMTS — variants (b)
R3  PIEŅEMTS
R4  PIEŅEMTS
R5  PENDING neatkarīga v4 pārbaude
```

19/19 §30.1 mapping rindas paliek nemainītas no v3; neatkarīgā recenzija tās ir pārbaudījusi kā pareizas.

## 12. Validācijas līmeņi pēc v4

### Record-instance
```text
N1  intra-record reference missing OBJECT TYPE -> INVALID
N2  any §5.1 reference OBJECT ID prefix/type mismatch -> INVALID
N3  cross-record missing TRACE RECORD ID -> INVALID
N4  cross-record missing RECORD VERSION -> INVALID
N5  cross-record target absent in pinned record version -> INVALID
N6  HUMAN DECISION compatibility view conflicts with authoritative refs -> INVALID
N7  assignment basis without required SOURCE reference -> INVALID
N8  required owner-schema ID field absent in instance or prefix mismatch -> INVALID
N9  PRIOR TASK OUTPUT origin reference lacks pinned origin version -> INVALID
N10 CONTENT HASH present without CONTENT HASH ALGORITHM -> INVALID
N11 unversioned source identity insufficient -> UNRESOLVED ISSUE required
```

### Repo/schema
```text
RMT1 semantic MTR-<THEME>-<NUMBER> remains in current RMT1 FILE SET -> FAIL
RMT2 TR §5.1 and T&E §26.2 reference-mode definitions differ -> FAIL
RMT3 §25 type lacks exactly one §30.1 mapping row or mapped ID field is absent
     in named owner schema -> FAIL
RMT4 relationship candidate has zero or multiple classifications -> FAIL
```

### Freeze process
```text
FP1 attempted TR v0.6 freeze without same-package PS v1.4 and T&E v0.4 freeze
-> FREEZE PRECONDITION NOT MET
```

## 13. Procesa rezultāts

```text
IMPLEMENTATION:               NAV VEIKTA
ARHITEKTŪRAS DRAFTI:          NAV MAINĪTI
FROZEN BASELINE:              NAV MAINĪTS
TASK-/MOD-/ISS- INSTANCE:     NAV IZVEIDOTA
LIETOTĀJA KONSENSS:           NAV PASLUDINĀTS
FREEZE:                       NAV APSTIPRINĀTS
KONSENSA GATAVĪBA:            PENDING — v4 NEATKARĪGA PĀRBAUDE
```

## 14. Nākamais procesa solis

Pēc v4 review-response commita sagatavot atsevišķu neatkarīgās recenzijas uzdevumu pret konkrēto commit SHA.

Recenzentam obligāti jāpārbauda:
1. K1 diskriminatora un §3 matricas savstarpējā nepretrunība;
2. RMT4 completeness pret faktisko TR v0.6;
3. §8 `SOURCE / REFERENCE`, §13 `RESOLUTION REFERENCE`, §20.1/§40 `SOURCE SET REFERENCE` un §37 process references klasifikācijas pamatotība;
4. §38 basis references SOURCE semantika;
5. K3 formulējuma izpildāmība;
6. K4 §30 owner nodalījums;
7. vai v4 atstāj jebkuru implementation laikā izlemjamu shēmas izvēli.

```text
COMMIT AUTHORIZED: YES — tikai review-response v4 un procesa artefakti
IMPLEMENTATION AUTHORIZED: NO
FREEZE AUTHORIZED: NO
KONSENSS: PENDING
```
