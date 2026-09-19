# REVIEW #16 — R1–R5 RESPONSE v4 SAGATAVOŠANAS UZDEVUMS

**Statuss:** AKTĪVS REVIEW-RESPONSE UZDEVUMS
**Primārais roadmap dokuments:** `TRACEABILITY_RECORD_v1` v0.6 juridiskās klasifikācijas amendment paketē
**Ievades review:** `GOVERNANCE/TRACEABILITY_ISS_INSTANTIATION_REVIEW16_R1_R5_V3_RESPONSE_REVIEW.md`
**Recenzējamais response artefakts:** `GOVERNANCE/TRACEABILITY_ISS_INSTANTIATION_REVIEW16_R1_R5_RESPONSE.md`
**Režīms:** review-response only; arhitektūras implementation nav autorizēta

## 1. Uzdevums

Sagatavot response v4 kā formālu projekta atbildi uz K1–K7, saglabājot jau pārbaudītos J1, J2, J3, J7, J8 risinājumus un J9 noraidījumu.

Katram K1–K7 norādīt procesa statusu un vienu precīzu delta. Atbilde nedrīkst atstāt implementation laikā izlemjamu references semantiku.

## 2. K1 — viennozīmīgs relationship lauku diskriminators

Nedrīkst paļauties tikai uz target tipu.

v4 jāfiksē šīs paketes deterministisks noteikums pašreizējam TR v0.6:

1. lauki ar `ID` / `IDS`, kas nav objekta paša ID lauks, pēc noklusējuma ir bare intra-record identitātes lauki un nav §5.1 strukturētas references;
2. lauki ar `REFERENCE` / `REFERENCES` ir reference kandidāti, kuru režīmu nosaka target semantika;
3. ja target ir T&E §25 TRACE OBJECT TYPE, reference kandidāts ir §5.1 trace-object reference;
4. ja target ir external system, evidence store, taxonomy/registry value, artefakta atrašanās vieta vai cita ne-trace identitāte, tas nav §5.1 reference un saglabā owner shēmu;
5. §14 `ORIGIN ... ID` ir vienīgā šajā paketē apstiprinātā bare-ID → structured-reference konversija;
6. lauki bez `ID(S)` vai `REFERENCE(S)` galotnes, bet ar relationship semantiku, jāklasificē eksplicīti.

Šis ir Review #16 delta tvēruma noteikums pašreizējam TR v0.6, ne jauna globāla T&E §4 nosaukumu konvencija.

## 3. K2 — pilnīga mehāniski pārbaudāma klasifikācija

Izveidot vienu tabulu/matricu, kurā katrs TR v0.6 relationship kandidāts ir tieši vienā kategorijā:
- OWN ID;
- BARE INTRA-RECORD ID;
- §5.1 TRACE-OBJECT REFERENCE (INTRA / CROSS);
- NON-TRACE REFERENCE;
- COMPATIBILITY / RELATIONSHIP VIEW;
- REGISTRY / VERSION / EXTERNAL IDENTIFIER.

Obligāti aptvert arī recenzenta atrastos laukus:
- §9 / §11 `DOCUMENT MANAGEMENT REFERENCE`;
- §9 `LOCATION / REFERENCE`;
- §15 `DATA CLASS EVENT REFERENCES`, `VERIFICATION SCOPE RECORD IDS`;
- §17 `RELATED FINDING / REQUIREMENT / COMPONENT`;
- §20.1 `SOURCE SET REFERENCE`, `RELATED FINDING / REQUIREMENT / COMPONENT`;
- §22 `SUPERSEDED BY RESULT ID`;
- §34 `EVIDENCE REFERENCES`, `VERIFICATION SCOPE RECORD REFERENCES`, `LEGAL STATUS REFERENCE`;
- §38 `ACTION OWNER BASIS REFERENCE`, `RESOLUTION AUTHORITY BASIS REFERENCE`;
- §45 `LEGAL STATUS REFERENCE`;
- §46 `EVIDENCE REFERENCES`, `REQUIREMENTS SET SELECTION REFERENCES`.

Apgalvojumu “neklasificētu lauku nav” drīkst saglabāt tikai kopā ar mehānisku completeness testu.

## 4. K3 — OBJECT ID vērtība pret ID FIELD NAME

TR §5.1 un T&E §26.2 identiskajā aizstājējtekstā lietot precīzi:

```text
OBJECT ID prefiksam jāatbilst OBJECT TYPE prefiksam 26. punktā.
OBJECT ID vērtība ir tā vērtība, kas target objekta owner shēmā glabāta
30.1. punktā šim OBJECT TYPE reģistrētajā ID FIELD NAME laukā.
```

Mapping completeness ir repo-level RMT3 kontrole, ne OBJECT ID vērtības salīdzinājums ar lauka nosaukuma tekstu.

## 5. K4 — §30 indeksa rinda

Neizmantot `ID FIELD NAME` kā §30 `Controlled field`, jo tas kļūdaini padara T&E par lauku definīciju owner.

Piedāvātā rinda:

| Controlled field | Owning document | Registry |
|---|---|---|
| TRACE OBJECT TYPE → ID FIELD MAPPING | `TERMINOLOGY_AND_ENUMS_v1` | TRACE OBJECT TYPE → ID FIELD MAPPING (§30.1) |

§30.1 ievadteksts turpina noteikt, ka faktisko ID lauku definīciju owner ir katra objekta shēmas owner.

## 6. K5 — H1 un §38 pilns delta

Precīzi fiksēt:
- TR §36 jaunais `ASSIGNMENT AUTHORITY BASIS SOURCE REFERENCE` ir §5.1 trace-object reference ar target `SOURCE`;
- TR §38 esošie `ACTION OWNER BASIS REFERENCE` un `RESOLUTION AUTHORITY BASIS REFERENCE` ir §5.1 trace-object references ar target `SOURCE`;
- norādīt, vai to owner teksts tiek papildināts vai aizstāts;
- noklusējuma režīms ir INTRA-RECORD, ja SOURCE atrodas containing record versijā; CROSS-RECORD tikai tad, ja konkrēti tiek norādīts source objekts citā record/versijā.

## 7. K6 — cross-record prefix tests

N2 jāattiecas uz abiem reference režīmiem:

```text
N2: any §5.1 reference OBJECT ID prefix/type mismatch -> INVALID
```

## 8. K7 — RMT1 uzturēšana

Saglabāt precīzu failu kopu pašreizējam amendment stāvoklim, bet pievienot invariantu:

```text
If the active same-package architecture draft set changes,
RMT1 FILE SET MUST be reviewed and updated in the same process-state change.
```

Review/response/audit/task vēsture paliek izslēgta.

## 9. Papildu completeness tests

Pievienot repo-level testu, kas novērš K2 atkārtošanos:

```text
RMT4: any persisted TR v0.6 relationship candidate matching
ID / IDS / REFERENCE / REFERENCES / RELATED relationship semantics
has no classification in the approved relationship-field classification
matrix -> FAIL
```

RMT4 validē klasifikācijas pilnīgumu, ne record instanci.

## 10. Saglabājamie v3 risinājumi

Bez semantiskas atkārtotas atvēršanas saglabāt:
- J2 `COMPONENT ID`;
- J3 §26.1 invariantu saglabāšanu;
- 19/19 §30.1 mapping saturu;
- J7 record/repo/freeze līmeņu nošķīrumu;
- J8 amendment §9.1;
- J9 `EVENT ID` noraidījumu;
- R1, R2(b), R3 virzienu.

## 11. Acceptance kritērijs

v4 ir gatava neatkarīgai recenzijai tikai tad, ja:
1. K1–K7 katram ir procesa statuss;
2. K1/K2 klasifikācija ir savstarpēji nepretrunīga un mehāniski complete;
3. K3 formulējums ir identisks TR §5.1 un T&E §26.2;
4. §38 basis references režīms ir precīzs;
5. RMT4 padara “neklasificētu lauku nav” pārbaudāmu;
6. nav mainīti arhitektūras drafti vai frozen baseline;
7. implementation / consensus / freeze nav pasludināti.

## 12. Aizliegtās darbības

Šajā solī nedrīkst mainīt arhitektūras draftus, frozen baseline, radīt instances, dzēst containment failus, pasludināt konsensu vai veikt implementation/freeze.
