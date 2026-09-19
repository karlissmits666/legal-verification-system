# NEW_CHAT_START_TASK

## Atkārtojamais uzdevums katras jaunas projekta sarunas sākumam

**Statuss:** OBLIGĀTS PROJEKTA CONTINUITY UZDEVUMS
**Lietošana:** izpildīt katras jaunas būtiskas projekta sarunas sākumā pirms jebkuras satura maiņas
**Procesa owner:** `PROJECT_EXECUTION_PROTOCOL.md`
**Aktuālā stāvokļa navigācija:** `PROJECT_CURRENT_STATE.md`

## 1. Mērķis

Atjaunot jaunajā sarunā pārbaudāmu projekta kontekstu tādā apjomā, lai darbs turpinātos no pēdējā dokumentētā punkta bez information gap, statusu sajaukšanas vai veca handoff aklas izmantošanas.

Šis uzdevums nav arhitektūras lēmums un pats neatļauj implementation vai freeze. Tas nosaka konteksta atjaunošanu un tikai pēc tam pāreju uz jau autorizēto nākamo darbību.

## 2. Obligātais uzdevums jaunajam čatam

Izpildi turpmāko secību pilnībā.

### A. Pārbaudi repo faktisko stāvokli

1. Strādā repo `https://github.com/karlissmits666/legal-verification-system`, branch `main`.
2. Nosaki:
   - GitHub `main` current commit pilno SHA;
   - `PROJECT_CURRENT_STATE.md` jaunākā commita SHA;
   - GitHub Actions pārbaudes `Continuity Validation` rezultātu tieši current `main` commitam;
   - jaunākos relevant commitus.
3. Primārais režīms ir `GITHUB`: ja `Continuity Validation` ir sekmīga tieši current `main` commitam, norādi `CONTINUITY VALIDATION: PASS (GITHUB)`. Lokāls klons un lokāla darba koka pārbaude šajā režīmā nav vajadzīga.
4. Ja darbs faktiski notiek lokālā klonā, alternatīvi izpildi `powershell -NoProfile -ExecutionPolicy Bypass -File .\TOOLS\validate_project_continuity.ps1 -Mode Handoff`; tikai šajā režīmā obligāti pārbaudi `HEAD = origin/main` un tīru darba koku.
5. Ja current `main` GitHub pārbaude nav sekmīga vai attiecas uz citu SHA, norādi `CONTINUITY VALIDATION: FAIL`; neizmanto lokāla klona neesamību kā kļūdas pamatu.
6. Pirms konteksta atjaunošanas neko nerediģē un necommito. Esošas lietotāja izmaiņas nedrīkst pārrakstīt nevienā piekļuves režīmā.

### B. Izlasi obligātos kontroles dokumentus šādā secībā

1. `PROJECT_CONSTITUTION_v1.md` — stabilais mērķis un principi;
2. `PROJECT_EXECUTION_PROTOCOL.md` — obligātā darba procedūra;
3. `PROJECT_CURRENT_STATE.md` — pēdējais dokumentētais handoff;
4. `PROJECT_ROADMAP_v1.md` — 13 dokumentu programma un aktuālais programmas statuss;
5. `README.md` — repo frozen baseline un galvenās ieejas;
6. `PROJECT_CURRENT_STATE.md` sadaļā `REQUIRED READING FOR NEXT TASK` uzskaitītos failus pilnā apjomā;
7. šo failu norādītos tiešos frozen, draft, review un audita dependencies, ciktāl tie nepieciešami aktuālā uzdevuma pilnīgai izpratnei.

Failu drīkst uzskatīt par izlasītu tikai tad, ja ir izlasīts viss uzdevumam relevantais saturs, nevis tikai virsraksts, meklējuma fragments vai pēdējās rindas.

### C. Validē handoff pret repo

Nosaki `PROJECT_CURRENT_STATE.md` pēdējo mainošo commit ar Git vēsturi. Salīdzini state faila apgalvojumus ar:

- current `HEAD` un commit vēsturi pēc state faila pēdējā atjauninājuma;
- pašu artefaktu headeriem;
- roadmap statusiem;
- frozen baseline;
- jaunākajiem review / audit failiem.

Ja current `HEAD` ir jaunāks par state faila pēdējo commit:

1. pārbaudi visus starplaika commitus;
2. izlasi tajos mainītos relevant failus;
3. nosaki, vai `PROJECT_CURRENT_STATE.md` ir stale;
4. neatgriez repo vecākā stāvoklī;
5. pirms satura darba atjauno konteksta secinājumu pēc faktiskā `main`.

`PROJECT_CURRENT_STATE.md` ir navigācijas un continuity ieraksts, ne arhitektūras authority. Konflikta gadījumā izmanto `PROJECT_CONSTITUTION_v1.md` un `PROJECT_EXECUTION_PROTOCOL.md` noteikto autoritātes kārtību, atzīmē `[PRETRUNA]` un pasaki, kurš statusa fails jālabo.

### D. Pierādi, ka konteksts ir atjaunots

Pirms darba sniedz tieši šo bloku:

```text
CONTEXT RESTORED: YES / NO
REPOSITORY ACCESS MODE: GITHUB / LOCAL
CONTINUITY VALIDATION: PASS (GITHUB) / PASS (LOCAL) / FAIL
CURRENT MAIN COMMIT:
VALIDATED COMMIT:
WORKTREE: NOT APPLICABLE (GITHUB) / CLEAN (LOCAL) / DIRTY (LOCAL)
STATE FILE LAST COMMIT:

CURRENT ROADMAP DOCUMENT:
CURRENT VERSION / STATUS:
CURRENT OBJECTIVE:
FROZEN BASELINE DEPENDENCIES:
DRAFT / SAME-PACKAGE DEPENDENCIES:
CURRENT REVIEW / TASK:

LAST COMPLETED MILESTONE:
USER-APPROVED DECISIONS IN FORCE:
OPEN BLOCKERS:
UNCOMMITTED / PENDING PROPOSALS:
NEXT BLOCKED DOCUMENT:

EXACT NEXT TASK:
IMPLEMENTATION AUTHORIZED: YES / NO
COMMIT AUTHORIZED: YES / NO
FREEZE AUTHORIZED: YES / NO
```

`CONTEXT RESTORED: YES` drīkst norādīt tikai tad, ja:

1. current `main` commitam ir `CONTINUITY VALIDATION: PASS (GITHUB)` vai lokālā režīmā validators ir atgriezis `PASS (LOCAL)`;
2. repo un state fails ir savstarpēji salīdzināti;
3. nav neizskaidrotu commit vai statusu atšķirību;
4. ir izlasīti nākamajam uzdevumam nepieciešamie faili;
5. ir identificēts viens konkrēts nākamais uzdevums;
6. ir skaidri nodalīts, kas ir apstiprināts, commitēts, frozen un tikai piedāvāts.

Ja kāds nosacījums nav izpildīts, norādi `CONTEXT RESTORED: NO`, izskaidro gap un vispirms novērs to. Neuzsāc arhitektūras vai implementation darbu ar neatjaunotu kontekstu.

### E. Turpini tikai autorizēto posmu

Kad konteksts atjaunots:

1. izpildi tikai `EXACT NEXT TASK`;
2. nelec uz nākamo major document vai freeze;
3. neuztver handoff tekstu kā jaunu lietotāja approval;
4. implementation veic tikai tad, ja state fails un lietotāja norādījums kopā apliecina autorizāciju;
5. ja nākamais solis prasa trūkstošu lietotāja vai ārēju bankas lēmumu, sagatavo konkrēto lēmuma jautājumu, bet neizdomā atbildi.

## 3. Obligātais continuity noslēgums

Ja sarunas laikā mainās projekta stāvoklis, pirms noslēguma:

1. atjaunini `PROJECT_CURRENT_STATE.md`;
2. fiksē tikai dokumentētus faktus un lietotāja faktiskos lēmumus;
3. norādi vienu konkrētu `EXACT NEXT TASK`;
4. atjaunini `REQUIRED READING FOR NEXT TASK` līdz minimālajai pilnajai kopai;
5. iekļauj state failu tajā pašā commitā, kas rada jauno stāvokli, vai atsevišķā tūlītējā continuity commitā;
6. pārbaudi, ka roadmap un artefaktu statusi nav pretrunā ar state failu;
7. pirms `REQUIRED — READY` sagaidi sekmīgu GitHub `Continuity Validation` tieši current `main` commitam; lokālā režīmā alternatīvi izpildi validatoru `Handoff` režīmā;
8. noslēdz sesiju ar `PROJECT_EXECUTION_PROTOCOL.md` obligāto beigu bloku.

Ja projekta stāvoklis nav mainījies, state failu nepārraksta tikai datuma vai formulējuma dēļ.

## 4. Jaunā čata trigeris un automātiskais copy-paste ziņojums

Jaunā čata nepieciešamību izvērtē pēc `PROJECT_EXECUTION_PROTOCOL.md` 6.1. punkta.

Ja rezultāts ir `NEW CHAT TRIGGER: REQUIRED — NOT READY`, asistents:

1. neizdod pārejas ziņojumu kā gatavu;
2. nosauc trūkstošo informāciju vai neskaidro nākamo uzdevumu;
3. atjaunina repo artefaktus un `PROJECT_CURRENT_STATE.md`;
4. atkārto readiness pārbaudi.

Ja rezultāts ir `NEW CHAT TRIGGER: REQUIRED — READY`, asistents automātiski izvada lietotājam šādu aizpildītu ziņojumu kopēšanai jaunajā čatā:

```text
Turpini Juridiskās pārbaudes sistēmas projektu no repo
https://github.com/karlissmits666/legal-verification-system, branch main.

Sagaidāmais handoff commits: <PILNS CURRENT HEAD SHA>

Pirms jebkura darba obligāti pilnībā izpildi repo failu
NEW_CHAT_START_TASK.md.

Primārais repo piekļuves režīms ir GitHub. Lokāls klons un lokāla
worktree nav obligāti. Pārbaudi, ka GitHub Actions `Continuity Validation`
ir sekmīga tieši current `main` commitam.

Izmanto PROJECT_CURRENT_STATE.md tikai kā continuity un navigācijas
ierakstu, pārbaudi to pret current main un Git vēsturi un izlasi tajā
norādīto REQUIRED READING FOR NEXT TASK.

Pirmajā atbildē sniedz NEW_CHAT_START_TASK.md prasīto
CONTEXT RESTORED bloku. Ja kontekstu nevar apstiprināt ar
CONTEXT RESTORED: YES, vispirms novērs information gap un neveic
arhitektūras vai implementation izmaiņas.

Pēc konteksta atjaunošanas izpildi tikai PROJECT_CURRENT_STATE.md
norādīto EXACT NEXT TASK un ievēro tajā noteiktās implementation,
commit un freeze autorizācijas robežas.

Šis ziņojums pats nav jauns approval, implementation vai freeze lēmums.
Repo aktuālais stāvoklis ir prioritārs pār šā ziņojuma sagaidāmo SHA,
ja pēc handoff ir veikti jauni dokumentēti commiti.
```

Pirms ziņojuma izdošanas `<PILNS CURRENT HEAD SHA>` obligāti aizstāj ar faktisko pilno SHA. Ja `PROJECT_CURRENT_STATE.md` `EXACT NEXT TASK` nav viennozīmīgs, ziņojumu neizdod un trigeris paliek `REQUIRED — NOT READY`.

## 5. Aizliegtie saīsinājumi

Jaunais čats nedrīkst:

- paļauties tikai uz iepriekšējās sarunas automātisku kopsavilkumu;
- pieņemt, ka state fails ir jaunāks par Git;
- izlasīt tikai roadmap un ignorēt owner dokumentus;
- secināt approval vai freeze no commita;
- atkārtoti atvērt jau dokumentēti noslēgtu lēmumu bez jauna fakta;
- klusējot pazaudēt neatrisinātu finding;
- radīt jaunu current-state failu paralēli `PROJECT_CURRENT_STATE.md`;
- izmantot necommitētu čata secinājumu kā repo governance faktu.

## 6. Veiksmes kritērijs

Continuity ir izdevies, ja jaunais čats bez minējumiem var pateikt:

- ko iepriekšējais čats pabeidza;
- kuri lietotāja lēmumi ir spēkā;
- ko repo faktiski satur;
- kas vēl nav apstiprināts;
- kas bloķē nākamo dokumentu;
- kāds ir viens nākamais uzdevums;
- vai šim uzdevumam drīkst veikt implementation, commit vai freeze.
