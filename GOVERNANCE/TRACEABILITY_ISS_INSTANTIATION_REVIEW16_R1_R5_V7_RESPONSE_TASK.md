# REVIEW #16 — R1–R5 RESPONSE v7 SAGATAVOŠANAS UZDEVUMS

**Statuss:** AKTĪVS REVIEW-RESPONSE UZDEVUMS  
**Primārais roadmap dokuments:** `TRACEABILITY_RECORD_v1` v0.6 juridiskās klasifikācijas amendment paketē  
**Ievades review:** `GOVERNANCE/TRACEABILITY_ISS_INSTANTIATION_REVIEW16_R1_R5_V6_RESPONSE_REVIEW.md`  
**Režīms:** review-response only; arhitektūras implementation nav autorizēta

## 1. Uzdevums

Sagatavot response v7 kā vienu pašpietiekamu pilno delta dokumentu, saglabājot visus iepriekš akceptētos risinājumus un lokāli novēršot P1–P4.

## 2. P1 — RMT4

Faktiski svītrot RMT4 kandidātu kopas rindu:
`slash-composite relationship labels in persisted schema`.

RMT4 kandidātu kopa pēc labojuma:
- field token `ID` vai `IDS`;
- field token `REFERENCE` vai `REFERENCES`;
- `RELATED` relationship semantics.

Slash simbols pats par sevi nav relationship pazīme.

## 3. P2 — §8 LEGAL CLASSIFICATION ASSESSMENT

Izvēlētais risinājums: recenzenta variants (i).

`TR §8 LEGAL CLASSIFICATION ASSESSMENT, ja mainās materiāls klasifikācijas secinājums`
ir nosacījuma / semantikas piezīme MODULE RECORD shēmā, ne persistēts
relationship lauks un ne §5.1 reference.

Persistētā MODULE → LCA saite ir tikai:
`CLASSIFICATION ASSESSMENT REFERENCES` = TREF-INTRA uz pinned
LEGAL CLASSIFICATION ASSESSMENT objektu(-iem).

Sekas:
- §8 LEGAL CLASSIFICATION ASSESSMENT matricas rindu izņemt;
- “current/material pointer” formulējumu pilnībā izņemt;
- §7 6. punkts neattiecas uz šo rindu, jo tā nav relationship lauks;
- §7 7. punkts paliek spēkā: §14 ir vienīgā bare-ID → structured-reference konversija paketē;
- netiek radīts otrs MODULE→LCA patiesības avots.

## 4. P3 — statusa etiķetes

Saskaņot visu response dokumentu ar v7:
- L1 pašpietiekamības teksts attiecas uz v7;
- K/J/F statusu formulējumos nelietot novecojušu v5 etiķeti, ja tā nav vēsturiska fakta daļa;
- `ATOMIC IMPLEMENTATION READINESS` = PENDING independent v7 review;
- `COMMIT AUTHORIZED` attiecas uz review-response v7 un procesa artefaktiem;
- next step = independent v7 review.

## 5. P4 — continuity

Pēc v7 response un v7 review task commitiem atjaunināt
`PROJECT_CURRENT_STATE.md` uz v7 faktisko stāvokli un nākamo uzdevumu.

## 6. Acceptance

v7 gatava neatkarīgai recenzijai tikai tad, ja:
- P1 faktiski izpildīts RMT4 normatīvajā blokā;
- §8 LCA ir nepārprotami nosacījuma piezīme, ne relationship lauks;
- vienīgā persistētā MODULE→LCA saite ir CLASSIFICATION ASSESSMENT REFERENCES;
- nav v5/v6 statusa etiķešu, kas maldina par aktuālo posmu;
- v7 paliek pašpietiekama;
- arhitektūras drafti un frozen baseline nav mainīti.
