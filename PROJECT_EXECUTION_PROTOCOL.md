# PROJECT_EXECUTION_PROTOCOL

## Juridiskās pārbaudes sistēmas izpildes kārtība

**Statuss:** AKTĪVS — LIETOTĀJA NOTEIKTA PROJEKTA IZPILDES KĀRTĪBA  
**Spēkā no:** 2026-09-19  
**Augstāka līmeņa principi:** `PROJECT_CONSTITUTION_v1.md`
**Programmas kontroles plakne:** `PROJECT_ROADMAP_v1.md`  
**Tvērums:** visi projekta uzdevumi, recenzijas, dokumentu grozījumi, auditi, piloti, ieviešana un freeze lēmumi

## 1. Mērķis un statuss

Šis protokols novērš situāciju, kurā dokumenta izstrāde, recenzija, lietotāja konsenss, ieviešana, commits un freeze tiek sajaukti vienā nenodalītā darbībā.

`PROJECT_EXECUTION_PROTOCOL.md`:

- nosaka, **kā** projekts tiek izpildīts;
- nav 14. obligātais arhitektūras pamatdokuments;
- nerada jaunu juridisku statusu, trace object vai governance reģistru;
- neaizstāj `PROJECT_ROADMAP_v1.md` kā programmas līmeņa kontroles plakni;
- nepadara draftu autoritatīvu un pats par sevi nemaina frozen baseline.

Protokols īsteno `PROJECT_CONSTITUTION_v1.md` principus darba procedūrā. Ja abi dokumenti šķiet pretrunīgi, darbu aptur pie pretrunas, nosaka katra dokumenta atbildības robežu un neprasa procesa protokolam klusējot pārrakstīt konstitucionālu principu.

Protokols ir obligāts darba process asistentam un visiem repo sagatavotajiem review / implementation uzdevumiem. Ja lietotājs dod tiešu, konkrētam uzdevumam paredzētu norādījumu, tas ir prioritārs pār šo vispārīgo procesu, bet atkāpe jānosauc darba kopsavilkumā.

## 2. Autoritātes nošķīrums

### 2.1. Projekta procesa autoritāte

```text
LIETOTĀJA TIEŠS NORĀDĪJUMS
> PROJECT_CONSTITUTION
> PROJECT_EXECUTION_PROTOCOL
> PROJECT_ROADMAP
> KONKRĒTĀ UZDEVUMA / REVIEW INSTRUCTION
> DARBA PIEZĪMES
```

### 2.2. Arhitektūras un satura autoritāte

```text
FROZEN BASELINE
> LIETOTĀJA APSTIPRINĀTS AMENDMENT / KONSENSA LĒMUMS
> REVIEW APSTIPRINĀTS KONSOLIDĒTS DRAFTS
> DRAFTS
> ROADMAP STATUSA SKATS
> REVIEW / ATBILDES / UZDEVUMA FAILI
> PAGaidu VAI PREMATURE ARTEFAKTI
```

Review fails ir pierādījums par review rezultātu, nevis pats arhitektūras normas avots. Commit esība nav approval, konsensa, freeze, pilota vai produkcijas gatavības pierādījums.

## 3. Statusu disciplīna

Katram dokumentam vai problēmai lieto tikai faktiski sasniegto statusu.

| Statuss | Nozīme |
|---|---|
| DRAFT | Saturs tiek izstrādāts; nav apstiprināts |
| REVIEW REQUESTED | Repo ir konkrēts review uzdevums ar pārbaudāmu commit SHA |
| REVIEWED | Recenzenta rezultāts saņemts; tas vēl nav lietotāja konsenss |
| CHANGES REQUIRED | Pirms konsensa vai freeze vajadzīgi labojumi |
| REVIEW RESPONSE | Atbilde recenzentam; tā vēl nav ieviests arhitektūras labojums |
| CONSENSUS PENDING | Recenzenta un projekta pozīcija vēl nav noslēgta |
| CONSENSUS REACHED | Nav atvērtu blocking arhitektūras domstarpību; lietotājs konsensu ir pieņēmis |
| APPROVED FOR IMPLEMENTATION | Lietotājs ir skaidri atļāvis ieviest saskaņoto delta |
| IMPLEMENTED / COMMITTED | Delta ir iestrādāta repo konkrētā commitā |
| AUDITED | Mehāniskais un semantiskais audits veikts pret konkrētu commit |
| FREEZE APPROVED | Lietotājs atsevišķi un skaidri atļāvis freeze |
| FROZEN | Autoritatīva pamatversija ar dokumentētu freeze lēmumu un commit |
| PILOTED | Izpildīts apstiprinātais pilots un saglabāti rezultāti |
| ACCEPTED FOR PRODUCTION | Izpildīti acceptance un regresijas kritēriji; nav sinonīms `FROZEN` |

Aizliegts savstarpēji aizvietot:

```text
COMMITTED != APPROVED
APPROVED FOR IMPLEMENTATION != FROZEN
REVIEW ACCEPTED != USER CONSENSUS
FROZEN != PILOTED
PILOTED != ACCEPTED FOR PRODUCTION
DOCUMENTED != IMPLEMENTED IN LEGORA
```

## 4. PROJECT EXECUTION DISCIPLINE — 13 DOCUMENTS

Projekts sastāv no 13 obligātajiem pamatdokumentiem, kas definēti `PROJECT_ROADMAP_v1.md`.

Asistentam nepārtraukti jāsaglabā izpratne par visu 13 dokumentu programmu, ne tikai par dokumentu, kas konkrētajā brīdī tiek recenzēts.

13 dokumentu kopa:

1. `PROFESSIONAL_SCOPE_v1`
2. `TRACEABILITY_RECORD_v1`
3. `AI_TOOL_USAGE_POLICY_v1`
4. `VERIFICATION_PROTOCOL_v1`
5. `REQUIREMENTS_MATRIX_GOVERNANCE_v1`
6. `OPERATION_WORKFLOWS_v1`
7. `LEGAL_RESEARCH_METHOD_v1`
8. `TERMINOLOGY_AND_ENUMS_v1`
9. `COMMON_CONTRACT_REVIEW_CHECKLIST_v1`
10. `EBA_REQUIREMENTS_MATRIX_v1`
11. `DORA_REQUIREMENTS_MATRIX_v1`
12. `LEGORA_IMPLEMENTATION_SPEC_v1`
13. `PILOT_AND_ACCEPTANCE_PLAN_v1`

Katram aktuālajam uzdevumam obligāti:

1. identificēt, kuram no 13 dokumentiem uzdevums pieder;
2. identificēt frozen un draft dokumentus, no kuriem tas ir atkarīgs;
3. identificēt, vai uzdevums bloķē citu dokumentu;
4. pabeigt aktuālo dokumentu vai problēmu pirms pārejas tālāk;
5. klusējot neizlaist nepabeigtu obligāto dokumentu;
6. neveidot jaunu standalone governance dokumentu, ja prasību droši var pārvaldīt kāds no 13 dokumentiem vai esošs trace object;
7. pēc katra apstiprināta dokumenta līmeņa milestone atjaunot projekta stāvokļa izpratni pret `PROJECT_ROADMAP_v1.md`;
8. nepasludināt arhitektūru par pabeigtu, kamēr obligātie dokumenti nav atrisināti.

Normālā izpildes secība:

```text
CURRENT DOCUMENT / PROBLEM
→ REVIEW
→ USER CONSENSUS
→ CONSOLIDATED DRAFT
→ MECHANICAL / SEMANTIC AUDIT
→ USER FREEZE APPROVAL
→ NEXT DEPENDENT DOCUMENT
```

Uz nākamo lielo dokumentu nepāriet tikai tādēļ, ka pašreizējais review šķiet pieņemams.

Vienā dokumentā arī nepaliek bezgalīgi: kad tā blocking arhitektūras jautājumi ir atrisināti un lietotājs ir apstiprinājis milestone, darbs atgriežas pie 13 dokumentu roadmap.

`PROJECT_ROADMAP_v1.md` ir programmas līmeņa kontroles plakne. Atsevišķie review faili ir tai pakārtoti.

## 5. Obligātais darba sesijas sākums

Katras jaunas būtiskas projekta sarunas sākumā vispirms pārbauda current `main` un izlasa `PROJECT_CONSTITUTION_v1.md`, šo protokolu, `README.md`, `PROJECT_ROADMAP_v1.md` un tikai uzdevumam nepieciešamos frozen, draft, review un audita failus. Vecs sarunas handoff neaizstāj aktuālo repo.

Pirms satura maiņas jānorāda:

```text
CURRENT ROADMAP DOCUMENT:
CURRENT VERSION / STATUS:
CURRENT OBJECTIVE:
DEPENDENCIES:
NEXT BLOCKED DOCUMENT:
```

Ja darbs aptver vairākus dokumentus, norāda vienu primāro dokumentu un visus tieši ietekmētos dokumentus. Review vai procesa fails nav jānosauc par primāro roadmap dokumentu; jānosauc pamatdokuments, kura arhitektūra tiek vērtēta.

## 6. Obligātais darba sesijas noslēgums

Katras būtiskas sesijas beigās jānorāda:

```text
COMPLETED:
EVIDENCE / REVIEW:
UNRESOLVED:
ROADMAP IMPACT:
NEXT FROZEN / REVIEW STEP:
```

Noslēgumam jāpasaka arī:

- precīzs commit SHA, ja commits veikts;
- vai darba koks ir tīrs;
- vai izmaiņas nosūtītas uz `main`;
- vai frozen faili mainīti;
- vai freeze ir vai nav atļauts;
- viens konkrēts nākamais solis.

Statusa ziņojums bez nākamās darbības nav pietiekams.

## 7. Pilnais dokumenta un problēmas dzīves cikls

### 7.1. Uzdevuma fiksēšana

Būtisks review, arhitektūras vai implementation uzdevums tiek saglabāts repo. Uzdevumā norāda:

- primāro roadmap dokumentu;
- mērķi un robežas;
- frozen un draft dependencies;
- pārbaudāmo commit SHA;
- obligātos rezultātus;
- aizliegtās darbības;
- acceptance kritērijus.

### 7.2. Review

Neatkarīgā recenzija vienmēr pārbauda konkrētu commit SHA. Recenzijā jānorāda:

- `ACCEPT`, `CHANGES REQUIRED` vai `REJECT`;
- findings pēc smaguma;
- fails un sadaļa;
- pārkāptais invariants;
- minimālais labojums;
- kas drīkst notikt tālāk.

Recenzents pats nedrīkst pasludināt lietotāja konsensu vai freeze.

### 7.3. Atbilde uz review

Atbildē katram finding norāda vienu no:

```text
PIEŅEMTS
DAĻĒJI PIEŅEMTS
NORAIDĪTS AR PĀRBAUDĀMU PAMATOJUMU
JAU NOVĒRSTS KONKRĒTĀ COMMITĀ
```

Atbilde uz review pati nemaina arhitektūras shēmu. Tā fiksē pozīciju un precīzu piedāvāto delta.

Ja review atbilde rada jaunus būtiskus arhitektūras lēmumus, pirms implementation vajadzīga recenzenta pārbaude vai skaidrs lietotāja lēmums pārtraukt review ciklu un apstiprināt konkrēto risinājumu.

### 7.4. Konsenss

Konsenss ir sasniegts tikai tad, ja:

1. visi blocking findings ir atrisināti;
2. accepted findings ir pārvērsti precīzā delta;
3. nav neatbildētu izvēļu, kas mainītu shēmas semantiku;
4. recenzenta pēdējā pozīcija un projekta atbilde vairs nav pretrunā;
5. lietotājs skaidri pieņem secinājumus.

Ja lietotājs saka “pieņemu secinājumus” vai ekvivalentu formulējumu, tas noslēdz konsensu tikai par skaidri identificēto pēdējo delta. Tas automātiski nav freeze.

### 7.5. Implementation approval

Arhitektūras failus drīkst mainīt, ja lietotājs skaidri apstiprina ieviešanu, piemēram:

```text
APSTIPRINU IEVIEŠANU
IEVIES IZMAIŅAS
VEIC KOREKCIJU COMMIT
```

Ja viens lietotāja formulējums nepārprotami ietver gan secinājumu pieņemšanu, gan ieviešanas pieprasījumu, nav vajadzīgs mākslīgi prasīt divus apstiprinājumus. Freeze joprojām ir atsevišķs lēmums.

### 7.6. Konsolidētais implementation commits

Implementation commitā vienlaikus jāietver:

- apstiprinātās shēmas izmaiņas;
- to validācijas noteikumi;
- nepieciešamie negatīvie testi vai auditējamie invarianti;
- tieši atkarīgo draftu saskaņošana;
- review / amendment statusa atjaunošana;
- roadmap ietekmes atjaunošana.

Nedrīkst commitēt obligātu lauku bez tā validācijas semantikas un atstāt repo apzināti pusvalidējamā stāvoklī.

Review uzdevuma, review atbildes un implementation izmaiņas pēc noklusējuma glabā atsevišķos commitos, lai Git vēsture skaidri nošķirtu lēmumu no ieviešanas.

### 7.7. Mehāniskais un semantiskais audits

Pēc implementation commit obligāti pārbauda:

1. formāta un references kļūdas;
2. frozen failu neaizskaramību, ja to grozījums nav apstiprināts;
3. terminoloģijas un ID konsekvenci;
4. cross-field invariantus;
5. dependency dokumentu saskaņotību;
6. negatīvos testus;
7. roadmap un faktiskā repo stāvokļa sakritību.

Audits identificē precīzu pārbaudīto commit SHA.

### 7.8. Freeze

Freeze drīkst veikt tikai ar atsevišķu, skaidru lietotāja apstiprinājumu pēc audita.

Pirms freeze obligāti nosaka:

- freeze vienību: viens dokuments vai savstarpēji saistīta pakete;
- dependency freeze secību;
- aizstāto frozen versiju;
- audit evidence;
- atlikušos non-blocking jautājumus, ja lietotājs tos ir skaidri pieņēmis.

Ja viena dokumenta jaunā redakcija ir saderīga tikai ar cita dokumenta jauno redakciju, tos nedrīkst freezeot secībā, kas rada starpstāvokļa pretrunu. Tos freezeo kā saistītu paketi vai skaidri nosaka drošu secību.

## 8. Findings un neatrisināto jautājumu disciplīna

Finding nedrīkst pazust no procesa klusējot.

Katram finding līdz milestone beigām jābūt vienam rezultātam:

```text
NOVĒRSTS
NORAIDĪTS AR PIERĀDĪJUMU
LIETOTĀJA APSTIPRINĀTS KĀ NON-BLOCKING AR OWNER UN KONKRĒTU MILESTONE
```

“Atlikts” bez owner, owner dokumenta un konkrēta milestone nav derīgs statuss.

Ja lietotājs nosaka “neko neatlikt”, visi review finding jāatrisina pašreizējā korekciju paketē vai jānoraida ar pārbaudāmu pamatojumu. Nedrīkst izmantot roadmap ierakstu kā aizvietojumu faktiskam labojumam.

Ja nav zināma ārēja bankas autoritāte vai ievaddati, sistēma tos neizdomā. Jautājumu reģistrē ar esošu trace object vai attiecīgajā no 13 owner dokumentiem.

## 9. Jaunu dokumentu un objektu kontrole

Pirms jauna standalone governance faila izveides obligāti pārbauda:

1. vai prasību var pārvaldīt kāds no 13 pamatdokumentiem;
2. vai prasībai jau ir piemērots trace object;
3. vai vajadzīgs tikai review, audit, decision vai implementation record;
4. vai jaunais fails kļūdaini neradītu paralēlu patiesības avotu.

Atļauti pakārtoti procesa artefakti, ja tie ir skaidri marķēti, piemēram:

- review task;
- review result;
- review response;
- audit report;
- amendment decision record;
- migration record.

Šādi artefakti ir pierādījuma un procesa faili, ne jauni obligātie pamatdokumenti.

## 10. Repo un commit disciplīna

1. Katram būtiskam uzdevumam un review jābūt atrodamam repo kopā ar atsauces failiem.
2. Review vienmēr norāda pilnu pārbaudīto commit SHA.
3. Pirms darba pārbauda, vai lokālais `main` atbilst `origin/main` un vai darba koks ir tīrs.
4. Esošas lietotāja izmaiņas nedrīkst pārrakstīt vai sajaukt ar jauno uzdevumu.
5. Frozen failus nemaina bez skaidra amendment un freeze procesa.
6. Premature vai containment failu nedzēš, kamēr tā derīgais saturs nav migrēts un dzēšana nav apstiprināta.
7. Commit message apraksta procesa vienību: task, review response, implementation, audit vai freeze.
8. Pēc commita pārbauda `HEAD`, `origin/main` un darba koka stāvokli.
9. Push uz `main` nenozīmē freeze.

## 11. Roadmap dependency kontrole

Pirms katra milestone jāizveido īsa dependency karte:

```text
PRIMARY DOCUMENT
├── FROZEN INPUTS
├── DRAFT INPUTS
├── SAME-PACKAGE DEPENDENCIES
├── DOCUMENTS BLOCKED BY THIS WORK
└── PILOT / IMPLEMENTATION CONSEQUENCES
```

Ja izmaiņa skar trīs vai vairākus no 13 dokumentiem, tā jāapstrādā kā starpdokumentu amendment pakete, nevis lokāls viena faila labojums.

Pēc milestone `PROJECT_ROADMAP_v1.md` atjaunina tikai ar faktiski sasniegto statusu. Roadmap nedrīkst apsteigt repo pierādījumus.

## 12. Pašreizējā dokumenta pabeigšanas kritērijs

Dokuments vai problēma ir pietiekami pabeigta pārejai uz nākamo roadmap vienību tikai tad, ja:

1. nav neatrisinātu blocking finding;
2. dokumenta shēma un validācija ir savstarpēji saskaņota;
3. tiešie dependency dokumenti nav pretrunā;
4. ir lietotāja apstiprināts milestone;
5. audits ir izturēts;
6. freeze ir veikts, ja roadmap nākamais dokuments balstās uz autoritatīvu, nevis draft dependency;
7. roadmap ir atjaunināts.

Ja nākamais darbs droši var balstīties uz skaidri marķētu draftu, freeze nav mākslīgi jāpieprasa agrāk, bet dependency statusam jābūt nepārprotamam.

## 13. Komunikācijas disciplīna

Lietotājam vienmēr jāsaņem ne tikai statuss, bet arī lēmums un nākamā darbība.

Katrs būtisks kopsavilkums atbild uz pieciem jautājumiem:

1. Kas tieši ir izdarīts?
2. Kā tas darbojas vai ko tas maina?
3. Kas vēl nav pabeigts?
4. Vai drīkst commitēt, implementēt vai freezeot?
5. Kāds ir viens nākamais solis?

Tehniska sarežģītība jāpamato ar precizitātes vai riska samazināšanas ieguvumu. Ja vienkāršāks modelis dod tādu pašu mehānisku pārbaudāmību un drošību, priekšroka dodama vienkāršākajam modelim.

## 14. Protokola kontrole

Šo protokolu drīkst mainīt tikai ar lietotāja skaidru norādījumu vai pēc procesa audita, ko lietotājs apstiprina.

Protokola grozījums:

- nemaina frozen arhitektūras dokumentus;
- tiek commitēts atsevišķi no satura implementation;
- tiek atspoguļots `README.md`, ja mainās projekta pamatdarba kārtība;
- nedrīkst samazināt 13 dokumentu roadmap redzamību vai lietotāja freeze kontroli.
- jāpaliek saderīgam ar `PROJECT_CONSTITUTION_v1.md` vai skaidri jāierosina konstitūcijas grozījums.
