# REVIEW #16 — R1–R5 RESPONSE v3 SAGATAVOŠANAS UZDEVUMS

**Statuss:** AKTĪVS REVIEW-RESPONSE UZDEVUMS  
**Primārais roadmap dokuments:** `TRACEABILITY_RECORD_v1` v0.6 juridiskās klasifikācijas amendment paketē  
**Ievades review:** `GOVERNANCE/TRACEABILITY_ISS_INSTANTIATION_REVIEW16_R1_R5_V2_RESPONSE_REVIEW.md`  
**Recenzējamais response artefakts:** `GOVERNANCE/TRACEABILITY_ISS_INSTANTIATION_REVIEW16_R1_R5_RESPONSE.md`  
**Režīms:** review-response only; arhitektūras implementation nav autorizēta

## 1. Uzdevums

Sagatavot `TRACEABILITY_ISS_INSTANTIATION_REVIEW16_R1_R5_RESPONSE.md` v3 kā formālu projekta atbildi uz neatkarīgās v2 recenzijas J1–J9.

Katram finding norādīt vienu procesa statusu:

```text
PIEŅEMTS
DAĻĒJI PIEŅEMTS
NORAIDĪTS AR PĀRBAUDĀMU PAMATOJUMU
JAU NOVĒRSTS KONKRĒTĀ COMMITĀ
```

Atbilde pati nemaina arhitektūras shēmu. Tā fiksē projekta pozīciju un vienu precīzu, deterministisku piedāvāto delta nākamai neatkarīgai pārbaudei.

## 2. Obligāti pārbaudāmie jautājumi

### J1 — mapping struktūra
Noteikt vienu konkrētu T&E struktūru bez formulējuma “vai līdzvērtīgu”. Skaidri nošķirt:
- TRACE OBJECT TYPE;
- ID PREFIX;
- faktisko ID FIELD NAME;
- ID lauka shēmas owner dokumentu un sadaļu;
- ja vajadzīgs, reģistra/governance owner no shēmas owner.

Neradīt paralēlu canonical reģistru.

### J2 — REQUIREMENT COMPONENT ID lauks
Pārbaudīt faktisko owner shēmu TR v0.6 §27. Ja nav materiāla iemesla shēmu pārsaukt, mappingam jāatspoguļo faktiskais `COMPONENT ID`. Jebkurš pārsaukums būtu atsevišķi pamatots arhitektūras delta.

### J3 — T&E §26.1 invarianti
Precīzajā aizstājējtekstā saglabāt:
- obligātu tipam atbilstošu ID lauku katram patstāvīgam TRACE OBJECT TYPE ierakstam;
- `MODULE ID` ar `MOD-` prefiksu;
- `MODULE ID` un taxonomy lauka `MODULE` nodalījumu;
- mapping sasaistes noteikumu.

### J4 — BL3 references tvērums
Pret faktisko TR v0.6 klasificēt, kuri lauki ir §5.1 trace-object references un kuri ir:
- bare ID lauki;
- ārējas sistēmas references;
- evidence-store references;
- cits references tips.

Nedrīkst §5.1 režīmu piemērot laukiem, kas nav trace-object references. Nedrīkst arī atstāt neklasificētus laukus, kuru persistētā semantika implementation laikā būtu jāizdomā.

### J5 — aizstāšana vai papildināšana
TR §5.1 un T&E §26.2 delta jāpasaka kā precīza aizstāšana vai precīzs papildinājums. Nedrīkst atstāt esošo četru lauku obligātuma tekstu tiešā pretrunā intra-record režīmam.

### J6 — RMT1 tvērums
Repo-level testam definēt precīzu failu kopu vai izslēgšanas noteikumu tā, lai vēsturiskie review / response artefakti neradītu false failure.

### J7 — N8 līmenis
Nodalīt:
- record-instance validāciju;
- repo / registry completeness validāciju.

Reģistra mapping trūkums pats par sevi nav konkrēta record instances `INVALID` rezultāts.

### J8 — freeze precondition owner
Norādīt vienu konkrētu amendment sadaļu, kurā dzīvos saistītās freeze paketes precondition. Nenorādīt neeksistējošu “gala acceptance kontroli”.

### J9 — EVENT ID
Pārbaudīt, vai `DATA CLASS EVENT → EVENT ID` ir faktiski korekts mapping. Lauka pārsaukšanu neiekļaut tikai pašidentificējamības dēļ, ja nav pierādīta semantiska vai mehāniska problēma. Ja finding tiek noraidīts, pamatot ar owner shēmu un ID prefiksa kontroli.

## 3. Acceptance kritērijs response v3

v3 ir gatava neatkarīgai recenzijai tikai tad, ja:

1. katram J1–J9 ir fiksēts procesa statuss;
2. J1–J5 neatstāj nevienu implementation laikā izlemjamu shēmas izvēli;
3. type → ID field mapping ir pārbaudīts pret faktiskajām owner shēmām;
4. BL3 references tvērums ir deterministisks pret faktisko TR v0.6;
5. record-level, repo-level un freeze-process validācijas nav sajauktas;
6. frozen baseline nav mainīts;
7. arhitektūras drafti nav mainīti;
8. implementation un freeze nav pasludināti par autorizētiem.

## 4. Aizliegtās darbības

Šajā uzdevumā nedrīkst:
- mainīt `TRACEABILITY_RECORD_v1_v0.6.md`, `TERMINOLOGY_AND_ENUMS_v1_v0.4.md` vai citus arhitektūras draftus;
- mainīt frozen baseline;
- radīt faktisku TASK-, MOD- vai ISS- instanci;
- dzēst standalone containment failu;
- pasludināt lietotāja konsensu;
- veikt implementation;
- freezeot amendment paketi;
- pāriet uz nākamo roadmap dokumentu.

## 5. Nākamais solis pēc v3

Pēc v3 review-response commita sagatavot atsevišķu neatkarīgās recenzijas uzdevumu ar konkrētu pārbaudāmo commit SHA. Recenzents pārbauda v3 pret J1–J9 un faktiskajām owner shēmām.
