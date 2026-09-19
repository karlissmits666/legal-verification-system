# PROJECT_CONSTITUTION_v1

## Juridiskās pārbaudes sistēmas projekta konstitūcija

**Statuss:** AKTĪVS — LIETOTĀJA APSTIPRINĀTS PROJEKTA PRINCIPU DOKUMENTS  
**Versija:** v1.0  
**Spēkā no:** 2026-09-19  
**Repo:** `https://github.com/karlissmits666/legal-verification-system`  
**Mērķa izpildvide:** Legora

## 1. Loma un robeža

Šī konstitūcija nosaka projekta stabilo identitāti, mērķi, autoritātes robežas un neaizskaramos drošības principus.

Tā atbild uz jautājumiem:

- kāpēc projekts pastāv;
- kādu rezultātu tas drīkst un nedrīkst radīt;
- kur beidzas AI un sākas cilvēka autoritāte;
- kādi principi ierobežo arhitektūru un ieviešanu;
- kā savstarpēji sadalīta projekta dokumentu atbildība.

Šī konstitūcija:

- nav 14. obligātais arhitektūras pamatdokuments;
- nav current-state manifests;
- pati neapstiprina konkrētu drafta arhitektūras risinājumu;
- neaizstāj frozen baseline vai konkrētā owner dokumenta semantiku;
- nedublē detalizēto darba procedūru, ko nosaka `PROJECT_EXECUTION_PROTOCOL.md`;
- nedublē programmas statusu un secību, ko nosaka `PROJECT_ROADMAP_v1.md`.

Dokumentu atbildības robeža:

```text
PROJECT_CONSTITUTION_v1
= KĀPĒC + NEAIZSKARAMIE PRINCIPI + AUTORITĀTES ROBEŽAS

PROJECT_EXECUTION_PROTOCOL
= KĀ STRĀDĀJAM + REVIEW / KONSENSS / COMMIT / AUDITS / FREEZE PROCEDŪRA

PROJECT_ROADMAP_v1
= KAS IR PROGRAMMĀ + AKTUĀLAIS STATUSS + SECĪBA + DEPENDENCIES

13 PAMATDOKUMENTI
= KONKRĒTĀ SISTĒMAS ARHITEKTŪRA UN SEMANTIKA
```

## 2. Projekta identitāte

Projekta nosaukums ir **Juridiskās pārbaudes sistēma**.

Darba koncepts:

```text
BANK LEGAL WORK / ANALYSIS & VERIFICATION SYSTEM
```

Projekts nav tikai:

- līgumu pārbaudes saraksts;
- EBA outsourcing vai DORA pārbaudītājs;
- Legora uzvedņu komplekts;
- AI juridiskais asistents;
- automātisks compliance engine.

Tas ir strukturēts AI atbalstīta juridiskā darba, analīzes, pārbaudes, izsekojamības un cilvēka lēmumu kontroles sistēmas projekts.

## 3. Projekta galvenais mērķis

Izveidot praktiski lietojamu, izsekojamu un augstas uzticamības sistēmu bankas juristam, kurā AI palīdz:

- analizēt un verificēt;
- sagatavot juridisku tekstu;
- salīdzināt dokumentus;
- izgūt strukturētu informāciju;
- identificēt un pārbaudīt juridiskās prasības;
- strukturēt juridisko izpēti;
- sasaistīt secinājumus ar avotiem;
- sagatavot cilvēka lēmumam vajadzīgo informāciju.

Sistēmai jāsamazina risks, ka AI:

- halucinē vai izmanto nepilnīgu kontekstu;
- izlaiž obligātu prasību;
- nepamatoti secina, ka prasība ir izpildīta;
- nepamana definīciju, cross-reference vai pielikuma nozīmi;
- piedāvā juridiski neatbilstošu formulējumu;
- pats sev piešķir juridisku autoritāti;
- aizvieto bankas governance lēmumu;
- pārvērš neskaidrību pozitīvā secinājumā.

## 4. Galvenais projekta invariants

Sistēmas mērķis nav panākt, lai AI vienmēr sniegtu atbildi.

Ja atbilde tiek izdota kā materiāls juridisks rezultāts, jābūt rekonstruējamam vismaz:

- uzdevumam;
- atļautajiem ievaddatiem;
- izmantotajai darba plūsmai;
- piemērojamajai klasifikācijai un modulim;
- avotiem un to identitātei;
- atradumiem un pierādījumiem;
- prasību pārbaudei;
- nepieciešamajai cilvēka verifikācijai;
- cilvēka lēmumiem;
- neatrisinātajiem jautājumiem un eskalācijām;
- Traceability Record;
- izdošanas vārtu rezultātam.

## 5. Fail-closed drošība

Ja materiālu juridisku jautājumu nevar droši atrisināt, sistēma neizdomā atbildi.

Tā izmanto spēkā esošajā canonical arhitektūrā paredzēto reprezentāciju trūkstošai informācijai, neatrisinātam jautājumam, cilvēka lēmumam, ārējam ievaddatam, eskalācijai, nepierādītam vai neskaidram stāvoklim.

Pārliecinošs AI teksts nav pierādījums. Nezināms fakts netiek pārvērsts ticamā pieņēmumā tikai tādēļ, lai pabeigtu shēmu vai darba plūsmu.

## 6. Cilvēka autoritāte

AI ir atbalsta instruments, nevis juridiska vai governance autoritāte.

AI nedrīkst pats:

- izsniegt vai aizvietot `LEGAL APPROVED`;
- noteikt cilvēka kompetenci;
- izdomāt bankas apstiprināšanas funkciju;
- noteikt CIF statusu bez dokumentētas autoritātes;
- radīt neesošu risk acceptance;
- paaugstināt savu verifikācijas līmeni;
- pārvērst priekšlikumu cilvēka lēmumā;
- aizstāt ārēju bankas governance ievaddatu.

```text
AI SECINĀJUMS != HUMAN DECISION
AI MODEĻU PIEKRIŠANA != HUMAN VERIFIED
AI PRIEKŠLIKUMS != BANKAS GOVERNANCE LĒMUMS
```

## 7. Reālā darba vide un moduļu robeža

Sistēma tiek izstrādāta bankas jurista reālam darbam, tostarp iepirkumiem, ārpakalpojumiem, IKT pakalpojumiem, DORA, piegādātāju un saimnieciskajiem līgumiem, juridiskai analīzei, izpētei un tekstu sagatavošanai.

Arhitektūru nedrīkst optimizēt tikai vienam specializētam modulim. `OUTSOURCING-EBA` un `ICT-DORA` ir svarīgi moduļi, bet tie nav visa projekta definīcija.

Universālā līgumu juridiskā pārbaude nav atkarīga no specializēta regulatory module statusa. Specializētais modulis papildina common contract review, nevis to aizvieto.

## 8. Galvenais riska modelis

Svarīgākais identificētais risks ir situācija, kurā AI palaiž garām obligātu juridisku prasību un vienlaikus rada pārliecinošu rezultātu, kas izraisa kļūdainu drošības sajūtu.

Tādēļ sistēmas drošības karkass balstās uz:

- iepriekš definētu uzdevumu un kompetences robežu;
- AI un datu permission kontroli;
- identificētiem, versētiem avotiem;
- pierādījumiem un strukturētiem atradumiem;
- prasību kopām un pilnīguma kontroli;
- kontrolētiem statusiem;
- cilvēka verifikāciju un lēmumiem;
- neatrisinātiem jautājumiem un eskalācijām;
- izsekojamības ierakstu;
- izdošanas vārtiem.

Konkrēto objektu shēmas, statusus un vārtus nosaka attiecīgie frozen vai apstiprinātie 13 pamatdokumenti, nevis šī konstitūcija.

## 9. GitHub un Legora lomas

GitHub ir projekta governance, arhitektūras un versiju kontroles avots. Tas glabā frozen dokumentus, draftus, review un audita pierādījumus, implementation specifications, roadmap un vēsturiskās versijas.

Legora ir mērķa darba izpildvide. Tā nedrīkst kļūt par vienīgo governance source of truth.

```text
GITHUB
→ nosaka apstiprināto arhitektūru un artefaktu versijas

LEGORA
→ izpilda apstiprināto runtime konfigurāciju
```

Specifikācijas vai dokumenta esība repo nav pierādījums faktiskai ieviešanai Legora.

## 10. Autoritātes un statusu princips

Dokumenta esība repo pati nenosaka tā autoritāti. Vienmēr jānošķir vismaz draft, reviewed, user-approved, committed, frozen, implemented, piloted un production-accepted stāvokļi.

```text
COMMIT EXISTS != APPROVED
REVIEW RESULT != USER APPROVAL
MECHANICAL AUDIT PASS != ARCHITECTURE APPROVAL
ARCHITECTURE APPROVAL != FROZEN
FROZEN != IMPLEMENTED
IMPLEMENTED != VALIDATED
VALIDATED != PRODUCTION APPROVED
```

Detalizēto statusu vārdnīcu un pārejas nosaka `PROJECT_EXECUTION_PROTOCOL.md`.

## 11. Frozen baseline prioritāte

Frozen dokuments ir autoritatīvs, līdz to aizstāj skaidrs, apstiprināts un atbilstoši iesaldēts grozījums.

```text
FROZEN BASELINE > DRAFT
FROZEN BASELINE > REVIEW PROPOSAL
```

Review, roadmap ieraksts, implementation note vai commits nedrīkst klusējot mainīt frozen semantiku.

Ja šī konstitūcija atklāj pretrunu ar spēkā esošu frozen sistēmas semantiku, pretruna jāfiksē un jāatrisina ar amendment procesu. Konstitūcija pati klusējot nepārraksta frozen pamatdokumentu.

## 12. 13 obligāto dokumentu programma

Projekta pamatprogrammu veido 13 dokumenti:

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

Šī kopa nosaka programmas obligāto struktūru. Dokumentu mērķus, aktuālās versijas, statusus, dependencies, izstrādes secību un pilotus pārvalda `PROJECT_ROADMAP_v1.md`.

Jauns obligāts pamatdokuments netiek radīts tikai tādēļ, ka esošā shēma ir neērta. Pirms jauna governance artefakta jānosaka, vai vajadzību jau droši pārvalda kāds no 13 dokumentiem, esošs trace object, reģistrs vai workflow objekts.

Nosacīts papildu dokuments ir pieļaujams tikai ar skaidru funkciju, owner, lifecycle un pierādījumu, ka tas nedublē esošu slāni.

## 13. Aktuālā stāvokļa disciplīna

Šī konstitūcija nav current-state manifests. Tajā netiek uzturēts:

- aktuālais HEAD;
- aktīvais review numurs;
- konkrētu draftu statuss;
- pabeigtības procents;
- nākamais uzdevums.

Aktuālo stāvokli nosaka no current `main`, `README.md`, `PROJECT_ROADMAP_v1.md`, attiecīgajiem frozen dokumentiem, current draftiem, jaunākajiem review un audita failiem un, ja vajadzīgs, Git vēstures.

Progresu nedrīkst secināt no commit vai failu skaita, dokumentu garuma, review numura vai AI recenzentu piekrišanas. Ja pabeigtības metrika nav apstiprināta, neizmanto izdomātu procentu.

Ja current-state avoti konfliktē, konfliktu marķē un atrisina; vienu avotu klusējot nepārraksta ar citu.

## 14. Source of truth robežas

Projekta procesa autoritātes kārtību nosaka `PROJECT_EXECUTION_PROTOCOL.md`. Sistēmas satura autoritātes pamatkārtība ir:

```text
FROZEN BASELINE
> LIETOTĀJA DOKUMENTĒTS, SPĒKĀ ESOŠS ARHITEKTŪRAS LĒMUMS
> APSTIPRINĀTS NON-FROZEN GOVERNANCE LĒMUMS
> CURRENT DRAFT
> REVIEW / AUDIT PRIEKŠLIKUMS
> ROADMAP KOPSAVILKUMS
> IMPLEMENTATION PIEZĪME
> HISTORICAL / PREMATURE DRAFT
```

Artefakta konkrēto versiju un statusu vispirms pārbauda pašā artefaktā. Ja prioritāte nav viennozīmīga, jāfiksē pretruna, nevis jāizdomā risinājums.

## 15. Pierādījumu un avotu princips

Evidence ir konkrēts avota saturs. AI summary, AI secinājums vai search result pats par sevi nav Evidence.

Materiālam secinājumam jābūt sasaistāmam ar avota identitāti, versiju vai citu pietiekamu redakcijas identifikāciju, atrašanās vietu, izmantoto saturu un saistību ar finding vai requirement.

Ja secinājuma jēgu maina definīcija, cross-reference, pielikums vai cits dokuments, arī tas ietilpst pierādījuma kontekstā.

Avota identitāte, avota versija un avota spēkā esamība ir atšķirīgi jēdzieni. Jauna upload kopija vai `ModifiedAt` timestamp pats nepierāda jaunu juridisko redakciju.

Aktuāls, būtisks ārējā regulējuma apgalvojums jāpārbauda pret autoritatīvu avotu, prioritāti dodot primāriem tiesību aktiem, regulatora oficiālajiem avotiem, oficiālām vadlīnijām un Q&A, judikatūrai un jautājumam atbilstošiem apstiprinātiem bankas avotiem.

## 16. Canonical semantikas aizsardzība

Canonical statusus, enum vērtības, machine keys un to validāciju nosaka attiecīgais frozen vai apstiprinātais owner dokuments.

Nedrīkst:

- ieviest paralēlu statusu tikai neērtas situācijas aizpildīšanai;
- padarīt prose formulējumu par slēptu enum;
- sajaukt pierādījuma trūkumu ar pozitīvu vai negatīvu juridisku secinājumu;
- ļaut AI sev piešķirt `HUMAN VERIFIED`;
- izmantot semantisku ID attiecību modeļa vietā;
- klusējot pārrakstīt vēsturisku rezultātu.

Pirms jaunas canonical vērtības pārbauda, vai problēmu neatrisina esoša vērtība, cross-field noteikums, semantiski derīgs null vai cits objekts.

Trace Object ID ir necaurspīdīgs. Attiecības glabā explicit reference laukos.

## 17. Juridiskās un governance robežas

Jānošķir:

```text
CONTRACT TYPE
!= MODULE
!= MODULE STATUS
!= QUALITATIVE LIKELIHOOD
!= HUMAN DECISION
!= LEGAL APPROVED
```

Moduļa piemērojamība nerodas tikai no dokumenta nosaukuma vai tehnoloģijas etiķetes.

Ja būtisks jautājums nav atrisināts, to neaizvieto ar AI pieņēmumu. Ja arhitektūrā jau ir piemērots `UNRESOLVED ISSUE`, pirms jauna input request vai paralēla open-question reģistra izvērtē esošo modeli.

Sistēma neizdomā `RESPONSIBLE FUNCTION`, resolution authority, datu klasi, AI permission, tool approval, retention noteikumu vai allowed use case no amata nosaukuma, industrijas prakses vai varbūtības.

`LEGAL APPROVED` ir reference uz bankas faktisko juridiskā apstiprinājuma procesu, nevis AI vai Legora radīts statuss.

Ja bankas procesā nav dokumentētas formalizētas risk acceptance procedūras, sistēma tādu neizdomā. Juridiskā pozīcija un biznesa lēmums turpināt ir nošķirami.

## 18. Izsekojamība un vēsture

Materiālam juridiskā darba rezultātam jābūt rekonstruējamam saskaņā ar `TRACEABILITY_RECORD_v1`.

Ja mainās secinājums, klasifikācija vai lēmums, veco rezultātu klusējot nedzēš. Saglabā iepriekšējo un jauno stāvokli, izmaiņas iemeslu, lēmuma ķēdi un versiju vēsturi.

Auditability ir svarīgāka par šķietami tīru vēstures pārrakstīšanu.

## 19. Praktiskā lietojamība un sarežģītība

Drošību nedrīkst sasniegt ar sistēmu, kuru jurists praktiski nevar lietot. Vienlaikus usability nedrīkst uzlabot, vājinot obligāto prasību pārbaudes, cilvēka verifikāciju, autoritātes robežas, Evidence, izdošanas vārtus vai izsekojamību.

Katram jaunam tehniskam mehānismam jāpamato:

1. kādu reālu risku tas novērš;
2. vai risks jau nav segts citur;
3. kā mehānisms izskatīsies jurista ikdienā;
4. vai tas ir obligāts drošībai;
5. kā pilots pārbaudīs tā ieguvumu un slodzi.

Arhitektūras sarežģītība pati par sevi nav kvalitāte. Ja vienkāršāks modelis dod līdzvērtīgu drošību un mehānisku pārbaudāmību, priekšroka ir vienkāršākajam modelim.

## 20. Piloti un production readiness

Dokumenta uzrakstīšana, pozitīvs review, audits vai freeze pats nepierāda praktisku kvalitāti vai production readiness.

Empīriskā validācija jāveic atbilstoši `PILOT_AND_ACCEPTANCE_PLAN_v1`. Jāvērtē ne tikai AI precizitāte, bet arī false negatives, false positives, obligāto prasību miss rate, nepamatoti pozitīvi secinājumi, referral rate, jurista darba laiks, manuālā slodze, auditability un praktiskā lietojamība.

Production readiness prasa apstiprinātu arhitektūru, runtime ieviešanu, nepieciešamos bankas governance input, pilotus, acceptance kritērijus, regresijas pārbaudi un produkcijas konfigurācijas pārbaudi.

## 21. Legora ieviešanas princips

`LEGORA_IMPLEMENTATION_SPEC_v1` ir mērķa runtime arhitektūra. Specifikācijas esība nav faktiskā implementācija.

Materiāls output nav izdodams bez zināma uzdevuma, atļautiem ievaddatiem, zināmas darba plūsmas, izsekojamiem materiāliem atradumiem, vajadzīgajiem pierādījumiem, cilvēka verifikācijas, Traceability Record un veiksmīga release gate.

Ja Legora nevar realizēt nepieciešamu hard gate, jāizmanto drošs procesuāls sadalījums. AI instrukcija “neturpināt” viena pati nav pietiekama production kontrole.

## 22. Lēmumu robeža starp lietotāju un AI

Lietotājs pieņem lēmumus par:

- projekta mērķi un profesionālajām robežām;
- governance principiem;
- pieņemamo darba slodzi;
- jauniem būtiskiem sistēmas objektiem;
- arhitektūras kompromisiem;
- freeze;
- production acceptance.

AI drīkst patstāvīgi veikt tehnisku konsolidāciju, consistency checks, references pārbaudi, strukturālu analīzi, audit checks un implementation detaļas, ja tās nemaina projekta nozīmi vai cilvēka lēmumu robežas.

Bez skaidras lietotāja piekrišanas AI nedrīkst:

- freezeot dokumentu vai pasludināt draftu par final;
- pieņemt jaunu governance klasi;
- mainīt frozen canonical statusus;
- noteikt bankas governance autoritāti;
- izdomāt projekta progresa KPI;
- pāriet uz nākamo major phase, ja iepriekšējais nav noslēgts;
- dzēst premature vai historical artefaktu pirms drošas migrācijas;
- pielīdzināt mehānisku auditu arhitektūras approval.

## 23. Valoda, stils un dokumentu kvalitāte

Projekta dokumentus pēc noklusējuma raksta precīzā latviešu valodā. Angļu valodu saglabā canonical values, tehniskiem identifikatoriem, filenames, machine keys, Legora terminiem un ārējo avotu oficiālajiem terminiem.

Governance dokumentiem jābūt precīziem, deterministiskiem, strukturētiem, ar skaidrām robežām, statusu, dependencies, owner un lifecycle, ja tie ir vajadzīgi.

Review vēsturi neievieto clean final dokumentā, ja tai ir atsevišķs review vai audit ieraksts.

## 24. Jaunas sarunas un darba procesa robeža

Katra jauna būtiska projekta saruna sāk darbu no faktiskā repo stāvokļa, nevis tikai no iepriekšējās sarunas handoff.

Obligāto jaunā čata konteksta atjaunošanu nosaka `NEW_CHAT_START_TASK.md`, bet pēdējo dokumentēto darba punktu glabā `PROJECT_CURRENT_STATE.md`. Lasīšanas secību, sākuma kopsavilkumu, review procesu, lietotāja konsensu, implementation approval, auditu, freeze un sesijas noslēguma formātu nosaka `PROJECT_EXECUTION_PROTOCOL.md`.

```text
PROJECT CONSTITUTION
= stabilā projekta identitāte un principi

CURRENT MAIN + ROADMAP
= aktuālais projekta stāvoklis

EXECUTION PROTOCOL
= obligātā darba procedūra

PROJECT CURRENT STATE
= pēdējais dokumentētais darba punkts un viens nākamais uzdevums
```

## 25. Konstitūcijas grozīšana

Konstitūciju nemaina katram tehniskam sīkumam. Materiāls grozījums nepieciešams, ja mainās projekta mērķis, 13 dokumentu programmas struktūra, projekta līmeņa autoritātes modelis, source-of-truth modelis, AI lomas robeža vai cits būtisks governance princips.

Konstitūcijas grozījumu izstrādā un apstiprina saskaņā ar `PROJECT_EXECUTION_PROTOCOL.md`, ar skaidru lietotāja lēmumu un atsevišķu commit. Konstitūcijas versija nav arhitektūras pamatdokumenta freeze un nemaina 13 dokumentu skaitu.

## 26. Galīgais dizaina princips

Optimizēt:

```text
JURIDISKO UZTICAMĪBU
+ IZSEKOJAMĪBU
+ CILVĒKA AUTORITĀTI
+ FAIL-CLOSED DROŠĪBU
+ PRAKTISKU LIETOJAMĪBU
```

Neoptimizēt dokumentu skaitu, shēmas sarežģītību, AI autonomiju vai formālu perfekciju pašu par sevi.
