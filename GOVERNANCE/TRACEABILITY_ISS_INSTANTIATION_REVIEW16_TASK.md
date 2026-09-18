# CRITICAL ARCHITECTURE REVIEW #16 — UZDEVUMS

## Governance TASK un UNRESOLVED ISSUE derīgas instances priekšnoteikumi

**Uzdevuma statuss:** REVIEW INSTRUCTION — NOT A GOVERNANCE BASELINE  
**Repo:** `https://github.com/karlissmits666/legal-verification-system`  
**Branch:** `main`  
**Atskaites commits:** `2be87d54bfb85b3f74b25a8d56d1e6714063fff3`  
**Datums:** 2026-09-18  
**Darba režīms:** tikai lasīšana; neko nerediģēt, necommitot un nefreezeot

---

## 1. Recenzijas mērķis

Veikt neatkarīgu, kritisku arhitektūras recenziju par vienu problēmu:

> Kāds ir minimālais, fail-closed un ar frozen baseline saderīgais shēmas papildinājums, lai varētu derīgi izveidot governance `TASK`, Traceability Record un `UNRESOLVED ISSUE` instanci?

Review #15 secināja, ka neatrisinātais ICT-DORA autoritātes jautājums konceptuāli jāreprezentē ar esošo `UNRESOLVED ISSUE` modeli, nevis ar standalone input-request failu vai jaunu `GOVERNANCE INPUT REGISTER`.

Tomēr faktiska `ISS-` instance vēl nav izveidojama. Šīs recenzijas uzdevums ir pārbaudīt četrus savstarpēji saistītus shēmas priekšnoteikumus:

1. `MODULE ID` trūkums `MODULE RECORD`;
2. `RELATED OBJECT` references semantika;
3. `RESPONSIBLE FUNCTION` nozīme un autoritāte;
4. `AI TOOL USAGE POLICY VERSION` aizpildīšanas ceļš.

Recenzijai jānosaka, vai šie četri jautājumi tiešām ir viena instantiation problēma un kāds ir mazākais drošais labojums. Nedrīkst automātiski pieņemt, ka visiem vajadzīgs viens un tas pats dokuments vai viens enum.

---

## 2. Autoritātes un versiju prioritāte

### Frozen baseline

Obligāti pārbaudīt:

1. `GOVERNANCE/PROFESSIONAL_SCOPE_v1.3.md`
2. `GOVERNANCE/TRACEABILITY_RECORD_v1_v0.5.md`
3. `GOVERNANCE/TERMINOLOGY_AND_ENUMS_v1_v0.3.md`
4. `GOVERNANCE/VERIFICATION_PROTOCOL_v1.md`

### Pašreizējie drafti

Obligāti pārbaudīt:

1. `GOVERNANCE/PROFESSIONAL_SCOPE_v1.4.md`
2. `GOVERNANCE/TRACEABILITY_RECORD_v1_v0.6.md`
3. `GOVERNANCE/TERMINOLOGY_AND_ENUMS_v1_v0.4.md`
4. `GOVERNANCE/LEGAL_CLASSIFICATION_BASELINE_AMENDMENT_v0.2.md`
5. `GOVERNANCE/ICT_DORA_AUTHORITY_REPRESENTATION_REVIEW15.md`
6. `PROJECT_ROADMAP_v1.md`

### Pagaidu containment fails

Kontekstam pārbaudīt:

`GOVERNANCE/ICT_DORA_MODULE_AUTHORITY_INPUT_REQUEST_v0.1.md`

Šis fails ir:

```text
PREMATURE DRAFT COMMIT
NOT APPROVED
NOT FROZEN
NOT AUTHORITATIVE
```

Tas nav arhitektūras avots. Tā saturs drīkst palīdzēt identificēt vajadzīgo informāciju, bet nedrīkst pārrakstīt frozen shēmu.

Prioritāte:

```text
FROZEN BASELINE
> APSTIPRINĀTS REVIEW SECINĀJUMS PAR MĒRĶA VIRZIENU
> DRAFTI
> ROADMAP / IMPLEMENTATION SKATI
> PREMATURE DRAFT COMMIT
```

Commita esība nav approval vai freeze pierādījums.

---

## 3. Fiksētie Review #15 secinājumi

Review #15 secinājumi ir apstiprināti tikai šādā tvērumā:

1. standalone input-request fails nav mērķa arhitektūras objekts;
2. mērķa reprezentācija ir esošais `UNRESOLVED ISSUE` modelis;
3. jauns `GOVERNANCE INPUT REGISTER` netiek ieviests;
4. faktiska `ISS-` reģistrācija vēl nav veikta;
5. standalone fails pagaidām paliek repo līdz drošai satura migrācijai;
6. frozen baseline nav mainīts;
7. freeze nav apstiprināts.

Šī recenzija nedrīkst atkārtoti atvērt standalone faila vai generic governance-input register izvēli, ja vien netiek pierādīts jauns blocking fakts, kas padara `UNRESOLVED ISSUE` modeli principiāli neizmantojamu.

---

## 4. Problēma A — MODULE ID

Frozen `TERMINOLOGY_AND_ENUMS_v1_v0.3`:

- reģistrē `MODULE` kā `TRACE OBJECT TYPE`;
- paredz `MOD-` ID prefiksu.

Frozen `TRACEABILITY_RECORD_v1_v0.5` §8 `MODULE RECORD` satur:

```text
MODULE
MODULE STATUS
APPLICABILITY AUTHORITY
PROPOSED BY
CONFIRMED BY
CONFIRMATION DATE
SOURCE / REFERENCE
```

bet nesatur `MODULE ID`.

Jāatbild:

1. Vai `MODULE RECORD` ir patstāvīgs trace object, kam obligāts `MODULE ID`?
2. Ja jā, vai minimālais labojums ir pievienot `MODULE ID` kā pirmo obligāto lauku?
3. Vai `MODULE` laukā glabā module taxonomy vērtību, piemēram, `ICT-DORA`, bet `MODULE ID` glabā instances identifikatoru?
4. Vai vienā TASK drīkst būt tikai viena konkrētā module veida instance, vai iespējamas vairākas?
5. Kā tiek saglabāta identitāte starp Traceability Record versijām?
6. Vai draft v0.6 jau satur netiešas prasības, kuru izpilde bez `MODULE ID` nav iespējama?
7. Kāds ir migrācijas risks iepriekšējiem ierakstiem, ja tādi ārpus repo eksistē?

Nedrīkst sajaukt:

```text
MODULE ID       = instances necaurspīdīgs identifikators
MODULE          = canonical module taxonomy vērtība
MODULE STATUS   = APPLICABLE / NOT APPLICABLE / UNCLEAR
```

---

## 5. Problēma B — RELATED OBJECT references semantika

Frozen `UNRESOLVED ISSUE RECORD` satur obligātu lauku:

```text
RELATED OBJECT
```

Frozen baseline nenosaka:

- pieļaujamo target objektu tipus;
- vai jānorāda ID vai objekta nosaukums;
- cardinality;
- vai drīkst atsaukties uz versionētu governance artefaktu;
- vai drīkst atsaukties uz citu issue;
- vai referencei jānorāda tips un versija;
- kā validēt, ka target eksistē.

Jāatbild:

1. Vai `RELATED OBJECT` drīkst saturēt tikai canonical trace-object ID?
2. Vai governance artefakta reference ir cita references klase, ko nedrīkst ievietot tajā pašā laukā?
3. Vai vajadzīgi divi atsevišķi lauki, piemēram:

```text
RELATED TRACE OBJECT REFERENCES
RELATED GOVERNANCE ARTIFACT REFERENCES
```

4. Ja piedāvā jaunus laukus, kāpēc esošo lauku nevar droši precizēt bez shēmas paplašināšanas?
5. Vai vienam issue drīkst būt vairākas references? Ja jā, laukam jābūt sarakstam vai plural formā?
6. Kā atsaukties uz objektu konkrētā Traceability Record versijā?
7. Kā atsaukties uz current objektu, nezaudējot vēsturisko interpretējamību?
8. Vai `RELATED OBJECT` vispār ir pareizais universālais nosaukums, vai tas slēpj atšķirīgas attiecību semantikas?
9. Kāds ir minimālais validācijas noteikums, kas nepieļauj brīvteksta failu, lauku nosaukumu un ID sajaukumu?

Jāsniedz precīzs machine-readable reference modelis, ne tikai prose skaidrojums.

Nedrīkst izmantot semantisku ID, lai aizvietotu attiecību lauku. ID paliek necaurspīdīgs.

---

## 6. Problēma C — RESPONSIBLE FUNCTION

Frozen `UNRESOLVED ISSUE RECORD` prasa:

```text
RESPONSIBLE FUNCTION
```

Taču nav noteikts, vai tas nozīmē:

- funkciju, kas veic nepieciešamo darbību;
- funkciju, kas ir issue procesa owner;
- funkciju, kurai ir autoritāte sniegt atbildi;
- funkciju, kas pieņem resolution lēmumu;
- eskalācijas target function.

Jāatbild:

1. Kāda ir precīza `RESPONSIBLE FUNCTION` semantika?
2. Vai tā ir action owner, resolution authority vai abi?
3. Vai `TASK RESPONSIBLE LAWYER` drīkst automātiski kļūt par `RESPONSIBLE FUNCTION`? Provizoriskā atbilde ir “nē”, ja nav atsevišķa cilvēka lēmuma.
4. Vai laukā jābūt cilvēka vārdam, lomai, organizatoriskai funkcijai vai atsaucei uz controlled function registry?
5. Kā rīkoties, ja tieši atbildīgā funkcija ir tas, kas nav zināms?
6. Vai tukšs lauks, `null`, `UNKNOWN`, `TBD` vai cits placeholder būtu pieļaujams? Provizoriskā atbilde ir “nē”, ja tas nav skaidri reģistrēts un pamatots.
7. Vai šādā gadījumā issue nevar izveidot, vai arī jānošķir:

```text
ACTION OWNER
RESOLUTION AUTHORITY
```

8. Ja tiek piedāvāts nošķīrums, kurš lauks ir obligāts instantiation brīdī un kāda autoritāte to nosaka?
9. Kā novērst situāciju, kur sistēma izdomā funkciju tikai tāpēc, lai izpildītu shēmu?

Nedrīkst automātiski pieņemt, ka jurists, DORA funkcija, ICT risks, outsourcing manager vai cita funkcija ir owner vai authority.

---

## 7. Problēma D — AI TOOL USAGE POLICY VERSION

Frozen `TASK RECORD` obligāti prasa:

```text
AI TOOL
AI/MODEL VERSION
AI TOOL USAGE POLICY VERSION
```

Repo `AI_TOOL_USAGE_POLICY_v1` vēl nav izstrādāts un apstiprināts. Frozen `PROFESSIONAL_SCOPE_v1.3` vienlaikus nosaka:

```text
PERMISSION UNKNOWN → BLOCK
NOT ALLOWED → BLOCK
```

un atļauj juridisko darbu turpināt ārpus AI rīka.

Jāatbild atsevišķi vismaz par trim situācijām:

### D1 — TASK izmanto AI

1. Vai bez apstiprinātas AI usage policy jebkura AI apstrāde šā TASK ietvaros ir bloķēta?
2. Vai arhitektūras izstrādes/review darbs atrodas tās pašas permission governance tvērumā kā production juridiskais darbs?
3. Ja nē, kur ir dokumentēta šī robeža? To nedrīkst izdomāt recenzijā.
4. Vai `AI TOOL USAGE POLICY VERSION: NOT ESTABLISHED` būtu aizliegts jauns stāvoklis, kas tikai maskē `PERMISSION UNKNOWN`?

### D2 — TASK neizmanto AI

1. Kā aizpilda obligātos laukus `AI TOOL`, `AI/MODEL VERSION` un `AI TOOL USAGE POLICY VERSION`?
2. Vai lauki kļūst nosacīti obligāti?
3. Vai vajadzīga canonical `NOT APPLICABLE` reprezentācija?
4. Vai `null` ir piemērojams tikai ar skaidru cross-field invariantu?
5. Kā pierāda, ka AI tiešām nav izmantots?

### D3 — AI tika izmantots pirms permission neatbilstības konstatēšanas

1. Kā fiksē jau notikušu apstrādi, nelegalizējot to ar retrospektīvu statusu?
2. Vai TASK drīkst turpināties tikai ārpus AI?
3. Kāds Traceability Record minimums saglabā pārkāpuma vai neatbilstības faktu?

Recenzija nedrīkst vājināt permission gate tikai tādēļ, lai varētu tehniski aizpildīt TASK RECORD.

---

## 8. Cross-field invarianti, kas obligāti jāpārbauda

Jāizvērtē vismaz šādi invarianti:

```text
IF trace_object_type = module
THEN MODULE ID is required
AND MODULE ID uses the MOD- prefix
AND MODULE remains a separate taxonomy field
```

```text
IF RELATED OBJECT contains a trace-object reference
THEN referenced object ID must exist
AND its prefix/type must match the referenced object type
```

```text
IF governance-artifact reference is allowed
THEN artifact identity, version and status must be explicit
AND it must not be represented as a trace-object ID
```

```text
IF AI was used
THEN AI TOOL, AI/MODEL VERSION and applicable policy reference are required
AND missing permission must remain fail-closed
```

```text
IF AI was not used
THEN non-applicability must be represented by an approved cross-field rule
AND not by an ad hoc placeholder
```

```text
IF RESPONSIBLE FUNCTION is not documented
THEN the system must not invent it
AND the review must explain whether ISSUE instantiation is blocked
or which approved alternative field model applies
```

Šie ir pārbaudāmie jautājumi, ne iepriekš apstiprināti noteikumi. Recenzentam tie jāpieņem, jālabo vai jānoraida ar pamatojumu.

---

## 9. Objekti, kurus nedrīkst sajaukt

Recenzijā skaidri jānošķir:

```text
TASK RESPONSIBLE LAWYER
!=
ISSUE ACTION OWNER
!=
ISSUE RESOLUTION AUTHORITY
!=
ESCALATION TARGET FUNCTION
```

```text
MODULE ID
!=
MODULE taxonomy value
!=
MODULE STATUS
```

```text
TRACE-OBJECT REFERENCE
!=
GOVERNANCE ARTIFACT REFERENCE
!=
SOURCE REFERENCE
```

```text
AI TOOL NOT USED
!=
AI USE NOT PERMITTED
!=
AI PERMISSION UNKNOWN
!=
AI POLICY NOT YET ESTABLISHED
```

Nedrīkst ieviest jaunu statusu tikai ar prose formulējumu.

---

## 10. Recenzijas robežas

Šī recenzija:

- neizvēlas faktisko ICT-DORA apstiprinošo funkciju;
- nepiešķir `ISS-` numurus;
- neveido TASK vai Traceability Record instanci;
- nedzēš standalone failu;
- neveic final cleanup;
- neapstiprina `AI_TOOL_USAGE_POLICY_v1` saturu;
- neievieš jaunu governance-input reģistru;
- nemaina frozen baseline;
- nefreezeo draft v0.6;
- neimplementē izmaiņas Legora.

Ja recenzija konstatē, ka kāds no četriem jautājumiem pieder citam governance dokumentam, jānorāda pareizais owner dokuments un dependency, bet nedrīkst klusējot paplašināt recenzijas tvērumu.

---

## 11. Risku testi

Katrs piedāvātais risinājums jāpārbauda vismaz pret šādiem failure modes:

1. issue tiek izveidots bez derīga TASK;
2. module reference norāda uz taxonomy vārdu, ne instances ID;
3. saite pēc jaunās Traceability Record versijas kļūst neskaidra;
4. vienā laukā sajauc trace object, failu un source reference;
5. atbildīgā funkcija tiek izdomāta, lai izpildītu obligātu lauku;
6. `null`, `N/A`, `TBD` vai `NOT ESTABLISHED` kļūst par slēptu statusu;
7. AI permission gate tiek apiets ar tehnisku placeholder;
8. AI neizmantošanas gadījums kļūdaini izskatās pēc permission approval;
9. ārējs governance avots tiek sajaukts ar HUMAN DECISION;
10. semantisks ID tiek izmantots attiecību glabāšanai;
11. draft reference tiek uztverta kā frozen authority;
12. mehāniska validācija nevar noteikt references tipu vai target eksistenci.

---

## 12. Prasītais recenzijas rezultāts

Atbildē obligāti sniegt:

### 12.1. Gala verdikts

Vienu no:

```text
ACCEPT
CHANGES REQUIRED
REJECT
```

### 12.2. Findings pēc smaguma

```text
BLOCKING
HIGH
MEDIUM
LOW
```

Katram finding norādīt:

- failu;
- precīzu sadaļu vai rindu;
- frozen vai draft statusu;
- pārkāpto invariantu;
- minimālo labojumu.

### 12.3. Tiešas atbildes par četriem shēmas jautājumiem

1. Vai jāpievieno `MODULE ID`?
2. Kāda ir precīza `RELATED OBJECT` reference shēma?
3. Ko tieši nozīmē `RESPONSIBLE FUNCTION`?
4. Kā aizpilda AI governance laukus, ja AI ir izmantots, nav izmantots vai permission nav piešķirta?

### 12.4. Precīzs minimālais shēmas delta

Sniegt precīzu lauku projektu un cross-field invariantus. Skaidri nodalīt:

- izmaiņas `TRACEABILITY_RECORD_v1_v0.6`;
- izmaiņas `TERMINOLOGY_AND_ENUMS_v1_v0.4`;
- izmaiņas `PROFESSIONAL_SCOPE_v1.4`, ja tās tiešām nepieciešamas;
- jautājumus, kurus nedrīkst atrisināt šajā paketē.

Pilnus dokumentus neatkārtot, ja pietiek ar delta.

### 12.5. Instances piemērs

Sniegt vienu strukturālu piemēru ar neitrāliem, necaurspīdīgiem ID, kas parāda:

- TASK;
- MODULE RECORD;
- UNRESOLVED ISSUE;
- references;
- AI izmantots / AI nav izmantots gadījumu atšķirību.

Piemērs nav production ieraksts un nedrīkst izdomāt faktisku bankas funkciju.

### 12.6. Validācijas noteikumi

Sniegt mehāniski pārbaudāmus noteikumus un negatīvos testus.

### 12.7. Migrācijas ietekme

Norādīt:

- vai iepriekšēji ieraksti būtu migrējami;
- vai mainās identifikatori;
- kā saglabā versiju vēsturi;
- vai standalone faila droša migrācija pēc šā delta kļūst iespējama.

### 12.8. Nākamais procesa solis

Norādīt:

- vai drīkst sagatavot konsolidētu draft delta;
- vai vajadzīgs vēl viens arhitektūras lēmums;
- vai commits ir pieļaujams;
- vai freeze joprojām nav pieļaujams.

Recenzents nedrīkst pats pasludināt lietotāja konsensu. Paša recenzenta rezultāts jāmarķē kā:

```text
[PRIEKŠLIKUMS]
RECENZENTA SECINĀJUMS
LIETOTĀJA APSTIPRINĀJUMS: NAV SAŅEMTS
KONSENSS: PENDING
```

---

## 13. Apgalvojumu marķējums

Katru būtisku apgalvojumu marķēt kā vienu no:

```text
[PĀRBAUDĪTS FAKTS]
[DOKUMENTĒTS LĒMUMS]
[JURIDISKS SECINĀJUMS]
[PRIEKŠLIKUMS]
[NEATBILDĒTS JAUTĀJUMS]
[PRETRUNA]
```

`[DOKUMENTĒTS LĒMUMS]` drīkst izmantot tikai lēmumam, kas jau dokumentēti pieņemts ārpus šīs recenzijas. Recenzenta paša secinājums nav dokumentēts governance lēmums.

---

## 14. Procesa ierobežojums

Šis ir tikai critical architecture review.

```text
NEKO NEREDIĢĒT
NEKO NECOMMITOT
NEKO NEFREEZEOT
NEVEIDOT FAKTISKU TASK / TRACE RECORD / ISS- INSTANCI
```

Pat ja recenzijas rezultāts ir `ACCEPT`, nākamais solis ir konsolidēta delta prezentēšana lietotājam. Izmaiņas repo un freeze ir pieļaujamas tikai pēc atsevišķa, skaidra lietotāja apstiprinājuma.
