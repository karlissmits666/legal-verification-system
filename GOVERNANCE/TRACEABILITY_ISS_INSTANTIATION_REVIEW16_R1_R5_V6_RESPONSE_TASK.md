# REVIEW #16 — R1–R5 RESPONSE v6 SAGATAVOŠANAS UZDEVUMS

**Statuss:** AKTĪVS REVIEW-RESPONSE UZDEVUMS  
**Primārais roadmap dokuments:** `TRACEABILITY_RECORD_v1` v0.6 juridiskās klasifikācijas amendment paketē  
**Ievades review:** `GOVERNANCE/TRACEABILITY_ISS_INSTANTIATION_REVIEW16_R1_R5_V5_RESPONSE_REVIEW.md`  
**Režīms:** review-response only; arhitektūras implementation nav autorizēta

## 1. Uzdevums

Sagatavot response v6 kā vienu pašpietiekamu pilno delta dokumentu, saglabājot v5 saturu un lokāli novēršot M1, M2, N1, N2 un N3.

## 2. M1 — REQUIREMENT ID

Izvēlētais risinājums: variants (a).

- T&E §30.1 rinda `REQUIREMENT → REQUIREMENT ID → TR §22` paliek nemainīta.
- TR §22 `REQUIREMENT ID` ir `OWN ID`, ne relationship lauks.
- §22 `REQUIREMENT ID` rinda tiek izņemta no relationship-field matricas.
- §27 `COMPONENT ID` paliek `OWN ID` pēc §30.1.
- Requirements Matrix Governance master identitātes shēma netiek padarīta par TR trace-object ID schema owner šajā Review #16 delta.

## 3. M2 — RMT4

Svītrot slash-composite relationship labels kritēriju.

RMT4 kandidātu kopu nosaka tikai mehāniski:
- field token `ID` vai `IDS`;
- field token `REFERENCE` vai `REFERENCES`;
- `RELATED` relationship token.

Slash simbols pats par sevi nav relationship pazīme.

Saglabāt existing exclusions.

## 4. N1 — §8 LEGAL CLASSIFICATION ASSESSMENT

Eksplicīti klasificēt:

`TR §8 LEGAL CLASSIFICATION ASSESSMENT = TREF-INTRA → LEGAL CLASSIFICATION ASSESSMENT`.

Tas ir current/material LCA pointer. `CLASSIFICATION ASSESSMENT REFERENCES` paliek TREF-INTRA un var saturēt vienu vai vairākas LCA references. Abi ir strukturētas §5.1 references; singular lauks nav compatibility view.

## 5. N2 — authority-basis nosacījumu harmonizācija

TR §36:
`ASSIGNMENT AUTHORITY BASIS SOURCE REFERENCE` ir obligāts ikreiz, kad HUMAN DECISION tiek izmantots kā action-owner vai resolution-authority assignment pamats.

TR §38:
ja `ACTION OWNER BASIS REFERENCE` vai `RESOLUTION AUTHORITY BASIS REFERENCE` target = HUMAN DECISION, referenced HUMAN DECISION obligāti satur `ASSIGNMENT AUTHORITY BASIS SOURCE REFERENCE`.

Tādējādi §38 noteikums ir §36 prasības sekas, ne šaurāks alternatīvs nosacījums.

## 6. N3 — sākotnējie acceptance kritēriji

v6 jāietver precīzs delta sākotnējam `TRACEABILITY_ISS_INSTANTIATION_REVIEW16_DELTA_REVIEW_RESPONSE.md §6`:

Kritērijs 4:
```text
4. Ja assignment / resolution authority pamats tiek glabāts HUMAN DECISION,
   šim HUMAN DECISION ir obligāta pinned ASSIGNMENT AUTHORITY BASIS SOURCE REFERENCE;
   tieša SOURCE reference ir derīga atbilstoši §38 target set.
```

Kritērijs 5:
```text
5. RMT1 FILE SET aktīvajos amendment draftos vairs nav semantiskas
   MTR-<THEME>-<NUMBER> identitātes; vēsturiskie review/response artefakti
   ir ārpus šī testa tvēruma.
```

Kritērijs 8 paliek v5 R2(b) redakcijā.

## 7. Saglabājamais saturs

Bez atkārtotas atvēršanas saglabāt visu v5 pašpietiekamo delta:
- R1–R5;
- §26.1;
- §30.1 19 mapping rindas;
- §30 index row;
- §5.1 / §26.2;
- H1/H2/H4;
- relationship matrix;
- N1–N11 / RMT1–RMT4 / FP1;
- dependency map;
- J/K/L statusus.

## 8. Acceptance

v6 gatava neatkarīgai recenzijai tikai tad, ja:
- M1/M2 un N1–N3 ir precīzi atrisināti;
- v6 paliek pašpietiekama;
- RMT4 vairs nav cirkulārs vai guaranteed-fail;
- relationship matrix neklasificē OWN ID kā BARE ID;
- nav mainīti arhitektūras drafti vai frozen baseline.
