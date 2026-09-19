# REVIEW #16 — R1–R5 RESPONSE v5 SAGATAVOŠANAS UZDEVUMS

**Statuss:** AKTĪVS REVIEW-RESPONSE UZDEVUMS
**Primārais roadmap dokuments:** `TRACEABILITY_RECORD_v1` v0.6 juridiskās klasifikācijas amendment paketē
**Ievades review:** `GOVERNANCE/TRACEABILITY_ISS_INSTANTIATION_REVIEW16_R1_R5_V4_RESPONSE_REVIEW.md`
**Recenzējamais response artefakts:** `GOVERNANCE/TRACEABILITY_ISS_INSTANTIATION_REVIEW16_R1_R5_RESPONSE.md`
**Režīms:** review-response only; arhitektūras implementation nav autorizēta

## 1. Uzdevums

Sagatavot response v5 kā vienu pašpietiekamu pilno konsolidēto delta dokumentu.

v5 nedrīkst atsaukties uz “v3/v4 nemainīto saturu” kā uz ārēju avotu. Viss implementējamais delta jābūt pašā v5 artefaktā.

## 2. Obligāti novēršamie findings

- L1 BLOCKING — atjaunot pilno delta vienā dokumentā;
- L2 HIGH — katram relationship kandidātam tieši viena deklarēta kategorija;
- L3 HIGH — RMT4 definēt kā post-implementation completeness testu; §14 pre→post transformāciju dokumentēt; §5.1/§26.2 component fields izslēgt;
- L4 MEDIUM — §8 SOURCE / REFERENCE klasificēt deterministiski pēc target semantikas;
- L5 MEDIUM — §34 un §46 composition laukus klasificēt kā SUMMARY;
- L6 MEDIUM — §38 basis target semantiku neatļauti nesašaurināt uz SOURCE-only;
- L7 LOW — N1 aptvert abus §5.1 režīmus un missing OBJECT TYPE / OBJECT ID;
- L8 LOW — atjaunot R5 procesa statusu PIEŅEMTS.

## 3. Pilnā delta obligātais saturs

v5 jāietver vismaz:
1. R1 freeze dependency un amendment §9.1 pilnais teksts;
2. R2 variants (b) un akcepta kritērija 8 aizstājējteksts;
3. R3 HUMAN DECISION authority pilnais aizstājējteksts;
4. T&E §26.1 pilnais aizstājējteksts;
5. T&E §30.1 19-rindu mapping;
6. T&E §30 jaunā mapping-index rinda;
7. TR §5.1 / T&E §26.2 identiskais pilnais aizstājējteksts;
8. pilna relationship-field classification matrix;
9. H1, H2, H4, M1, M2 delta;
10. N1–N11, RMT1–RMT4, FP1;
11. dependency karte;
12. J1–J9, K1–K7, L1–L8 un R1–R5 procesa statuss;
13. autorizācijas robežas.

## 4. L2 kategoriju noteikums

Atļautās klasifikācijas kategorijas ir tieši:
- OWN ID
- BARE ID
- TREF-INTRA
- TREF-CROSS
- NREF
- VIEW
- REG/META
- SUMMARY

Neviena matricas rinda nedrīkst saturēt vairāk nekā vienu kategoriju.

Composite shēmas elementus sadala atsevišķās rindās, piemēram:
- `TARGET OBJECT ID` = BARE ID;
- `TARGET OBJECT TYPE` = REG/META.

## 5. L3 / RMT4

RMT4 izpildes brīdis ir pēc Review #16 delta implementation tajā pašā atomārajā commitā.

§14 matrix rindās jāparāda:
`ORIGIN TASK ID -> ORIGIN TASK REFERENCE`,
`ORIGIN OUTPUT ID -> ORIGIN OUTPUT REFERENCE`,
`ORIGIN OBJECT ID -> ORIGIN OBJECT REFERENCE`.

RMT4 relationship candidate kopā neietver §5.1 / T&E §26.2 references struktūras komponentus:
`TRACE RECORD ID`, `RECORD VERSION`, `OBJECT TYPE`, `OBJECT ID`.

## 6. L4

`TR §8 SOURCE / REFERENCE` target ir SOURCE objekts. Klasificēt kā `TREF-INTRA`, ja owner sadaļa nenosaka konkrētu cross-record targetu.

## 7. L5

TR §34 un §46 ir composition/minimum-content sadaļas, ne jauni persistence owner lauki. To relationship etiķetes klasificē kā `SUMMARY`, analogi §4 un §51.

## 8. L6

TR §38:
- `ACTION OWNER BASIS REFERENCE`
- `RESOLUTION AUTHORITY BASIS REFERENCE`

drīkst targetot `SOURCE` vai `HUMAN DECISION`.

Ja target = HUMAN DECISION un tas dokumentē assignment/authority basis, attiecīgajam HUMAN DECISION jābūt izsekojamam uz authority basis SOURCE, ja tāds ārējs/governance pamats ir piemērojams.

Neieviest SOURCE-only ierobežojumu.

## 9. L7

N1:
```text
any §5.1 reference missing OBJECT TYPE or OBJECT ID -> INVALID
```

N2:
```text
any §5.1 reference OBJECT ID prefix/type mismatch -> INVALID
```

## 10. L8

`R5: PIEŅEMTS`.

Atsevišķi norādīt:
`ATOMIC IMPLEMENTATION READINESS: PENDING independent v5 review`.

## 11. Acceptance

v5 ir gatava neatkarīgai recenzijai tikai tad, ja:
- ir pašpietiekama;
- neviena implementējama delta daļa nav pieejama tikai git vēsturē;
- katrs relationship kandidāts target post-implementation shēmā ir tieši vienā kategorijā;
- RMT4 pēc implementation ir izpildāms bez guaranteed FAIL;
- nav jaunu semantisku izvēļu implementation brīdim;
- arhitektūras drafti un frozen baseline nav mainīti.
