# ICT-DORA autoritātes reprezentācija — Review #15 konsolidētais rezultāts

**Review datums:** 2026-09-18  
**Pārbaudītais commits:** `bb6a456b1635965b5d98640266fb9b94a126e9f2`  
**Review secinājumi:** lietotāja apstiprināti 2026-09-18  
**Baseline statuss:** NAV GROZĪTS  
**Freeze:** NAV APSTIPRINĀTS  
**Final cleanup:** NAV VEIKTS

## 1. Apstiprinātais arhitektūras secinājums

1. `ICT_DORA_MODULE_AUTHORITY_INPUT_REQUEST_v0.1.md` netiek pieņemts kā mērķa arhitektūras objekts.
2. Mērķa reprezentācija ir frozen arhitektūrā jau esošais `UNRESOLVED ISSUE` modelis.
3. Jauns `GOVERNANCE INPUT REGISTER` netiek ieviests.
4. Faktisks `ISS-` ieraksts vēl netiek veidots, jo nav izpildīti visi obligātie TASK, Traceability Record un references priekšnoteikumi.
5. Priekšlaicīgais standalone fails pagaidām paliek repo tikai satura saglabāšanai līdz drošai migrācijai.

## 2. Kāpēc standalone reprezentācija ir noraidīta

Standalone fails dublē `UNRESOLVED ISSUE` funkciju, tam nav frozen shēmā noteikta objekta tipa, ID, lifecycle vai atrisināšanas modeļa, un tas izmanto statusveidīgus apzīmējumus ārpus frozen reģistra.

Autoritātes noteikšana ir jānošķir no konkrēta pakalpojuma moduļa piemērojamības lēmuma:

```text
AUTHORITY DETERMINATION
!=
MODULE APPLICABILITY DECISION
```

`module_applicability` nevar izmantot autoritātes noteikšanai, jo tas radītu cilpu: lēmuma tips prasītu autoritāti, kuru šis pats lēmums tikai mēģina noteikt.

## 3. TASK lifecycle

Governance TASK nav obligāti jātur atvērts līdz bankas atbildes saņemšanai. TASK drīkst pabeigt ar materiālu rezultātu, kas dokumentē neatrisināto jautājumu. Jautājums paliek attiecīgā Traceability Record `UNRESOLVED ISSUES` sadaļā, un pēc dokumentēta atrisinājuma tiek radīta jauna Traceability Record versija.

Šis secinājums pats par sevi neļauj pašlaik izveidot faktisku `ISS-` ierakstu, jo repo nav derīgas TASK / Traceability Record instances.

## 4. Cietie priekšnoteikumi pirms faktiskas ISS- reģistrācijas

1. Jānosaka `AI TOOL USAGE POLICY VERSION` aizpildīšanas ceļš, kamēr attiecīgā politika nav apstiprināta vai AI netiek izmantots.
2. Ar cilvēka lēmumu jānosaka `RESPONSIBLE FUNCTION`; `TASK RESPONSIBLE LAWYER` automātiski nepārnesas uz šo lauku.
3. Jādefinē `RELATED OBJECT` references semantika.
4. Jānovērš tas, ka frozen `MODULE RECORD` nav `MODULE ID`, lai gan `MODULE` ir trace-object tips un tam paredzēts `MOD-` prefikss.
5. Jāizveido faktiska TASK un Traceability Record instance.
6. Faktiskie `ISS-` ID jāpiešķir no reālās necaurspīdīgo identifikatoru secības; semantisks ID nav pieļaujams.

## 5. Pagaidu containment

Līdz priekšnoteikumu izpildei:

- standalone fails netiek dzēsts;
- fails ir skaidri marķēts `PREMATURE DRAFT COMMIT`, `NOT APPROVED`, `NOT FROZEN`, `NOT AUTHORITATIVE`;
- roadmap un amendment nedrīkst to uzrādīt kā apstiprinātu reprezentāciju;
- ICT-DORA production aktivizācija nav pieļaujama, kamēr autoritāte nav dokumentēta;
- COMMON CONTRACT REVIEW turpinās;
- frozen baseline netiek mainīts.

## 6. Nākamais arhitektūras uzdevums

Nākamais uzdevums ir kritiski izvērtēt, kā papildināt `TRACEABILITY_RECORD_v1_v0.6`, lai varētu derīgi izveidot governance TASK un `UNRESOLVED ISSUE` ierakstus. Vienotais problēmas tvērums:

- `MODULE ID`;
- `RELATED OBJECT` reference noteikumi;
- `RESPONSIBLE FUNCTION` nozīme un authority;
- `AI TOOL USAGE POLICY VERSION` aizpildīšanas ceļš, ja politika vēl nav apstiprināta vai AI netiek izmantots.

Šis review ieraksts neapstiprina attiecīgos shēmas labojumus. Tie jāizstrādā kā drafts, jāprezentē, kritiski jārecenzē un tikai pēc lietotāja apstiprinājuma drīkst tikt commitoti vai frozen.

## 7. Procesa statuss

```text
REVIEW #15 SECINĀJUMI: APSTIPRINĀTI
BASELINE AMENDMENT: NAV VEIKTS
CONTAINMENT: ATĻAUTS
STANDALONE FAILA DZĒŠANA: NAV ATĻAUTA
FINAL CLEANUP: NAV ATĻAUTS
FREEZE: NAV APSTIPRINĀTS
```
