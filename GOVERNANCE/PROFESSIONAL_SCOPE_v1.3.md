PROFESSIONAL_SCOPE_v1.3
Bankas jurista profesionālais darba tvērums AI atbalstītai juridiskā darba videi

Statuss: APSTIPRINĀTS — PAMATVERSIJA (IESALDĒTA) [`APPROVED — BASELINE (FROZEN)`]
Versija: 1.3
Iesaldēšanas datums: 2026-09-18


1. DOKUMENTA MĒRĶIS

Šis dokuments nosaka profesionālo tvērumu jurista darbam, kuram tiek veidota Legora balstīta juridiskā darba un pārbaudes sistēma.

Dokuments neatrisina konkrētus juridiskus jautājumus un nenosaka detalizētu darba plūsmu.

Tā funkcija ir noteikt: kādus juridiskos uzdevumus sistēmai jāatbalsta; kāda ir jurista kompetence; kādas ir citu bankas funkciju kompetences; kādi rezultāti tiek sagaidīti; kuros jautājumos nepieciešama eskalācija; kāda loma ir Legora; kādi invarianti ir saistoši zemāka līmeņa dokumentiem.

16.–19. punkta invarianti un 30. punkta statusu reģistrs ir saistoši. Zemāka līmeņa dokumenti tos konkretizē un drīkst padarīt stingrākus, bet nedrīkst vājināt vai paplašināt bez šī dokumenta grozījuma.


2. PROFESIONĀLĀ LOMA

Jurists strādā bankas juridiskajā funkcijā ar specializāciju: iepirkumos; pakalpojumu un citos saimnieciskos līgumos; ārpakalpojumu jeb ārpakalpojumu (outsourcing) jautājumos; IKT pakalpojumu jautājumos DORA kontekstā; juridiskā atbalsta sniegšanā sadarbībai ar bankas preču un pakalpojumu sniedzējiem; citu juridisku jautājumu un risinājumu analīzē savas kompetences ietvaros.

Darbs aptver Latvijas banku, Latvijas grupas sabiedrības, Baltijas līmeņa un atsevišķus grupas projektus sadarbībā ar Zviedrijas kolēģiem.


3. PROFESIONĀLĀS ATBILDĪBAS ROBEŽA

Jurists savas kompetences ietvaros pats veic juridisko izvērtējumu un var sniegt gala juridisko apstiprinājumu līgumam.

Juridiskais apstiprinājums neietver automātisku visu bankas riska kategoriju apstiprināšanu.

Jurista kompetencē ietilpst galvenokārt: juridiskā atbilstība; iepirkumu jautājumi; outsourcing juridiskais regulējums; ārējo tiesību aktu prasības viņa kompetences jomā; attiecīgās bankas iekšējās procedūras.

Citas funkcijas atbild par savām riska kategorijām: riska vadība, atbilstības kontrole, informācijas drošība, datu aizsardzība, biznesa īpašnieks, citas specializētās funkcijas.

LEGAL APPROVED:
Juridiskais apstiprinājums tiek dots un fiksēts bankas faktiskajā procesā — e-pastā, līgumu pārvaldības sistēmā vai citā bankas noteiktā veidā.

Šajā AI sistēmā LEGAL APPROVED pastāv tikai kā atsauce uz šo ārējo apstiprinājumu, nevis kā jauns apstiprināšanas mehānisms. Sistēma apstiprinājumu neizsniedz, nepiešķir un neaizvieto.


4. LĒMUMU KOMPETENCES SADALĪJUMS

4.1. Jurists

Jurists: izvērtē juridisko pieņemamību; identificē juridiskos riskus; interpretē piemērojamos juridiskos un iekšējos noteikumus; pārbauda līguma juridisko saturu; veic vai piedalās outsourcing klasifikācijā; var sniegt LEGAL APPROVED 3. punkta izpratnē.

4.2. Ārpakalpojuma (outsourcing) klasifikācija

To, vai sadarbība kvalificējas kā outsourcing, nosaka jurists kopā ar outsourcing manager. Sistēmas autoritāte noteikta 13. punktā.

4.3. Kritiska vai svarīga funkcija (CIF — Critical or Important Function)

CIF statuss nav jurista individuāls lēmums un nav sistēmas lēmums.

  CIF STATUS
    Value:            CRITICAL / IMPORTANT
                      NOT CRITICAL / IMPORTANT
                      NOT YET DETERMINED
    Source:           [bankas procesa vai sistēmas ieraksts]
    Determined by:    [atbildīgā funkcija]
    Date:             [...]
    System authority: EXTERNAL INPUT ONLY

Ja CIF STATUS = NOT YET DETERMINED un uzdevumam šis statuss ir nepieciešams, attiecīgā moduļa statuss ir UNCLEAR un aptures stāvoklis ir HUMAN INPUT REQUIRED (30. punkts).

Sistēma drīkst sagatavot informāciju lēmuma pieņemšanai, bet nedrīkst savu analīzi pārvērst par CIF statusu.

Ja CIF STATUS datums ir agrāks par būtiskām izmaiņām pakalpojuma tvērumā, statuss tiek norādīts kā pārbaudāms atsevišķs jautājums, nevis klusējot izmantots.

4.4. Citi riski

Citas profesionālās funkcijas sniedz apstiprinājumu savā kompetences jomā. Personas datu apstrādes specifiski juridiskie jautājumi ir datu aizsardzības jurista kompetencē.


5. GALVENĀS JURIDISKĀ DARBA KATEGORIJAS

5.1. Vispārīga juridiskā analīze

Juridiska jautājuma identificēšana, strukturēšana, piemērojamo avotu noteikšana, tiesiskā regulējuma analīze, iekšējo noteikumu analīze, interpretāciju identificēšana, risku identificēšana, risinājumu izstrāde. Nav obligāti saistīts ar līgumu.

5.2. Juridiska risinājuma meklēšana

  JURIDISKAIS JAUTĀJUMS
  ↓
  KOMPETENCES PĀRBAUDE (23. punkts)
  ↓
  FAKTU NOSKAIDROŠANA
  ↓
  PIEMĒROJAMIE AVOTI
  ↓
  IESPĒJAMĀS INTERPRETĀCIJAS
  ↓
  IESPĒJAMIE RISINĀJUMI
  ↓
  KATRA RISINĀJUMA JURIDISKAIS PAMATS
  ↓
  RISKI UN IEROBEŽOJUMI
  ↓
  NEATBILDĒTIE JAUTĀJUMI
  ↓
  JURISTA IZVĒRTĒJUMS

Kompetences pārbaude notiek pirms analīzes.

Ja ir vairākas juridiski pamatotas iespējas, sistēma nedrīkst klusējot pasniegt vienu no tām kā vienīgo.


6. LĪGUMU JURIDISKAIS DARBS

Pakalpojumu līgumi; preču pirkuma līgumi; būvniecības līgumi; licences līgumi; mācību līgumi; SaaS/cloud līgumi; IT development; IT support; konsultāciju līgumi; audita pakalpojumi; facility/security; marketing; citi bankas saimnieciskās darbības līgumi.

Aptuveni puse gadījumu var būt piegādātāja sagatavots līgums, nevis bankas veidne.


7. VISPĀRĪGĀ LĪGUMU JURIDISKĀ PĀRBAUDE

Pārbaudes tvērumā ietilpst vismaz: līguma priekšmets; pušu pienākumi; pakalpojuma apjoms; cena; norēķinu kārtība; SLA un KPI; atbildība; zaudējumu atlīdzināšana; konfidencialitāte; personas datu apstrādes noteikumi; audit/access rights; apakšuzņēmēji; incidentu ziņošana; darbības nepārtrauktība; līguma izbeigšana; exit assistance; piemērojamās tiesības; jurisdikcija; izmaiņu vadība; sadarbība ar regulatoriem; bankas interešu aizsardzība; atbilstība riska apetītei.

Pārbaude nedrīkst aprobežoties ar klauzulu esamības pārbaudi. Jāvērtē arī: līguma kopējā juridiskā loģika; risku sadalījums; pretrunīgi noteikumi; definīcijas; cross-references; neskaidri formulējumi; bankai nelabvēlīgi noteikumi; neatrunāti jautājumi.

Definīcijas un cross-references ir pierādījuma sastāvdaļa (16.2.).


8. IEPIRKUMU JURIDISKAIS ATBALSTS

Jurists var: izvērtēt vendor noteikumus pirms izvēles; piedalīties sarunās; izvērtēt līguma juridisko risku; nodrošināt atbilstību procurement iekšējiem noteikumiem.

Iesaiste var būt atkarīga no līguma vērtības, vendor risk classification un iepirkuma rakstura.


9. ĀRPAKALPOJUMU / EBA DARBA TVĒRUMS

Bankai ir: outsourcing policy; outsourcing checklist; ārējo prasību kopums; minimum contractual requirements.

Jurists pārbauda atbilstību EBA prasībām, tostarp: access, information and audit rights; competent authority access; subcontracting conditions; data location; business continuity; termination rights; exit strategy; service levels; security requirements.

Jurists ir atbildīgs par EBA prasīto līguma nosacījumu pārbaudi; cita funkcija to paralēli neveic.

INVARIANTS (kopīgs ar 10. punktu):
Līguma klauzulas esamība apliecina tikai līgumiska nosacījuma esamību. Tā pati par sevi nepierāda attiecīgā operacionālā, drošības vai cita riska faktisku kontroli.


10. IKT / DORA DARBA TVĒRUMS

Bankai ir DORA līguma klauzulu pārbaudes saraksts un DORA pielikuma veidnes kritiskiem/svarīgiem un nekritiskiem/nesvarīgiem gadījumiem.

Jurista uzdevums: IKT apakšuzņēmēju nosacījumi; audita, piekļuves un testēšanas tiesības; incidentu paziņošana; datu atrašanās vieta; apstrādes vietas; izbeigšana; iziešanas atbalsts.

Sistēma drīkst secināt, vai līgumā ir ietverts nepieciešamais juridiskais nosacījums. Sistēma nedrīkst secināt, ka attiecīgais tehniskais vai operacionālais risks ir kontrolēts.


11. IEKŠĒJAIS BANKAS REGULĒJUMS

Obligāti ņemami vērā vismaz: Outsourcing Policy; Procurement Policy; Third Party Risk Policy; DORA / IKT trešo pušu riska politika; obligātās līguma klauzulas; apstiprināšanas matrica; līgumu veidnes.

Tie ir saistoši un izmantojami Legora vidē 19. punkta ietvaros. Katram dokumentam fiksējama versija un spēkā stāšanās datums (20. punkts).


12. UZDEVUMA KLASIFIKĀCIJA

Sistēmas sākumpunkts ir saņemts juridisks uzdevums, nevis saņemts līgums.

  OPERĀCIJA   ANALYSE / VERIFY / DRAFT / COMPARE / EXTRACT
  OBJEKTS     QUESTION / CONTRACT / CLAUSE / INTERNAL POLICY /
              EXTERNAL SOURCE / DOCUMENT SET
  MODUĻI      PROCUREMENT / OUTSOURCING-EBA / ICT-DORA /
              DATA-PROTECTION / INFOSEC / OTHER

Darba plūsmu nosaka kombinācija, nevis viena kategorija.

Piemēri:
  VERIFY  + CONTRACT        + [OUTSOURCING-EBA, ICT-DORA]
  ANALYSE + QUESTION        + [PROCUREMENT]
  DRAFT   + CLAUSE          + [OUTSOURCING-EBA]
  COMPARE + DOCUMENT SET    + [ICT-DORA]
  EXTRACT + EXTERNAL SOURCE + [OTHER]

EXTRACT ir nodalīts no ANALYSE apzināti: iegūtajam faktam vienmēr jābūt piesaistītam avota fragmentam.

Ja uzdevumu nevar viennozīmīgi novietot uz visām trim asīm: TASK CLARIFICATION REQUIRED.

INVARIANTS — verifikācijas līmenis un nodošana:
Rezultāts, kas izmantots kā ievaddati citam uzdevumam, saglabā savu verifikācijas līmeni (16.3.). Verifikācijas līmenis pieaug tikai ar faktisku verifikācijas aktu attiecībā uz konkrēto apgalvojumu, nevis ar apgalvojuma nodošanu citam uzdevumam, citam kontekstam vai citam dokumentam.

Neverificēts EXTRACT rezultāts paliek neverificēts arī tad, ja to izmanto VERIFY uzdevumā. Ja cilvēks vēlāk verificē pašu apgalvojumu, līmenis mainās uz HUMAN VERIFIED ar attiecīgu ierakstu.


13. MODUĻU PRINCIPS UN AUTORITĀTE

  UNIVERSAL LEGAL CORE
        ↓
  TASK COMBINATION (12. punkts)
        ↓
  APPLICABLE REGULATORY MODULES

13.1. Moduļa statuss

  APPLICABLE
  NOT APPLICABLE
  UNCLEAR

UNCLEAR nav rezultāts, bet aptures stāvoklis. Tam vienmēr pievienojams attiecīgais 30. punkta aptures stāvoklis: HUMAN INPUT REQUIRED (ja trūkst ārēja ievaddata) vai HUMAN CONFIRMATION REQUIRED (ja trūkst apstiprinājuma).

13.2. Moduļa autoritāte

  APPLICABILITY AUTHORITY
    SYSTEM PROPOSAL ONLY
    HUMAN CONFIRMATION REQUIRED
    EXTERNAL INPUT ONLY
    RULE-BASED DETERMINATION

Nozīme:

  SYSTEM PROPOSAL ONLY
    Sistēma drīkst piedāvāt statusu. Gala statuss netiek piešķirts
    sistēmā. Piedāvājumu apstiprina atbildīgais jurists parastajā
    LAWYER REVIEW solī. Atsevišķa citas funkcijas iesaiste nav
    nepieciešama.

  HUMAN CONFIRMATION REQUIRED
    Gala statusu apstiprina konkrēta norādīta funkcija, kas var būt
    plašāka par juristu. Ierakstā fiksē CONFIRMED BY un datumu.

  EXTERNAL INPUT ONLY
    Statuss netiek noteikts šajā sistēmā vispār; tas tiek saņemts
    no bankas procesa kā ievaddats.

  RULE-BASED DETERMINATION
    Gala statusu drīkst noteikt deterministisks noteikumu kopums bez
    cilvēka, ja izpildīti visi nosacījumi:
      - noteikumu kopums ir iepriekš apstiprināts un versēts;
      - tā piemērošanai nav nepieciešams profesionāls juridisks
        spriedums;
      - tas ir validēts attiecīgajam moduļa tipam.
    Neviens modulis šajā versijā nav piešķirts šai autoritātei.

Nevienā gadījumā AI secinājums pats par sevi nav gala moduļa statuss.

13.3. Sākotnējais piešķīrums

  CIF                 → EXTERNAL INPUT ONLY
  OUTSOURCING-EBA     → HUMAN CONFIRMATION REQUIRED
  ICT-DORA            → HUMAN CONFIRMATION REQUIRED
  DATA-PROTECTION     → HUMAN CONFIRMATION REQUIRED
  INFOSEC             → HUMAN CONFIRMATION REQUIRED
  PROCUREMENT         → SYSTEM PROPOSAL ONLY
  OTHER               → SYSTEM PROPOSAL ONLY


14. LEGORA PROFESIONĀLĀ LOMA

Legora ir jurista darba atbalsta instruments, nevis profesionālās atbildības aizstājējs.

Legora drīkst: iegūt informāciju; strukturēt; analizēt; meklēt juridiskus risinājumus; salīdzināt dokumentus; identificēt iespējamās problēmas; sagatavot juridiska teksta projektu; piedāvāt alternatīvas.

Legora rezultāts pats par sevi nav juridisks apstiprinājums.


15. ZINĀMAIS LEGORA KĻŪDU PROFILS

Halucinācijas; pārāk šaura analīze; nepilnīgs konteksts; nespēja integrēt savstarpēji saistītus jautājumus; nepamanīta trūkstoša klauzula; kļūdaini secinājumi par prasības izpildi; nepamanīta definīcija, kas maina nozīmi; juridiski nepiemērota nosacījuma piedāvāšana.

Visbīstamākais kļūdas veids: nepamanīta neatbilstība obligātajai prasībai.

16. un 17. punkts ir tiešā atbilde uz šo profilu.


16. PRASĪBU PĀRBAUDES PRINCIPS

Sistēmas prioritāte ir nepieļaut kļūdaini pozitīvu secinājumu par obligātas prasības izpildi.

16.0. Tvērums

Trīsstatusu modelis (16.1.) attiecas uz visām prasībām apstiprinātajā prasību bāzē neatkarīgi no to līmeņa. Līmenis (18. punkts) nemaina statusu kopu — tas nosaka statusa sekas un nepieciešamo verifikācijas līmeni.

NEGOTIABLE prasības gadījumā papildus statusam fiksē 18. punktā noteikto pozīcijas formu. Statusa modelis un pozīcijas forma nav alternatīvas.

16.1. Statusi

  IZPILDĪTS
    Ir pozitīvs un verificējams pierādījums, ka prasība ir izpildīta.

  NAV IZPILDĪTS
    Ir verificējams pamats secināt neatbilstību,
    vai pārbaude ir pietiekami pilnīga, lai konstatētu
    prasītā nosacījuma neesamību.

  NAV PIERĀDĪTS
    Nav pietiekama pierādījuma ne izpildei, ne neizpildei.

Divi noklusējumi:
  Pierādījuma trūkums nekad netiek interpretēts kā prasības izpilde.
  "Legora neatrada" pēc noklusējuma ir NAV PIERĀDĪTS, nevis NAV IZPILDĪTS.

Ceturtais statuss netiek ieviests. Formulējumi "šķiet izpildīts", "daļēji izpildīts", "PARTIAL" vai "atbilst kopumā" nav pieļaujami ne kā statuss, ne kā rezultāta virsraksts.

16.2. Pierādījuma forma

- pierādījums var sastāvēt no vairākiem fragmentiem;
- ja secinājums ir atkarīgs no definīcijas vai cross-reference, tā fiksējama kopā ar pamata fragmentu;
- brīvs kopsavilkums bez fragmenta nav pierādījums.

16.3. Verifikācijas līmenis

  VERIFICATION LEVEL
    EVIDENCE BOUND — AI PROPOSED
    HUMAN VERIFIED

EVIDENCE BOUND — AI PROPOSED ir starpstāvoklis. Tas nav gala statuss tur, kur piemērojams minimālais slieksnis.

MINIMUM HUMAN VERIFICATION THRESHOLD

HUMAN VERIFIED ir obligāts:
  - MANDATORY EXTERNAL
  - MANDATORY INTERNAL
  - UNCLASSIFIED
  - jebkura NEGATIVE REQUIREMENT tipa prasība neatkarīgi no līmeņa

Vienīgais līmenis, kur gala statuss var palikt EVIDENCE BOUND — AI PROPOSED, ir NEGOTIABLE, jo tā neizpilde nerada regulatīvu neatbilstību un pozīciju jebkurā gadījumā izvērtē jurists LAWYER REVIEW solī.

Slieksnis nosaka, vai cilvēka verifikācija notiek. Cik dziļa tā ir — pilna teksta pārlasīšana vai secinājuma pārbaude pret piesaistīto fragmentu — nosaka zemāka līmeņa verifikācijas protokols. Protokols slieksni drīkst paplašināt, bet ne samazināt.

16.4. Negatīvas prasības

Negatīva prasība ir prasība, ka līgumā NAV noteikta ierobežojuma vai nosacījuma. Tas ir prasības tips, nevis līmenis; tas var būt jebkurā līmenī.

Šādu prasību nevar pierādīt ar fragmentu, un meklēšanas terminu tvērums nav pietiekams pierādījums — ierobežojums var būt formulēts pilnīgi citiem vārdiem.

  NEGATIVE REQUIREMENT → HUMAN VERIFICATION REQUIRED (17.3.)

Sistēma drīkst veikt priekšpārbaudi un iezīmēt iespējamos atradumus, bet tā nav gala pierādījums. Automatizēta negatīvu prasību pierādīšana šajā sistēmas versijā netiek ieviesta.

16.5. Saliktas prasības

Ja prasība sastāv no vairākiem komponentiem, katram komponentam piešķir savu statusu pēc 16.1., un prasības statuss tiek agregēts deterministiski:

  visi komponenti IZPILDĪTS
    → IZPILDĪTS

  vismaz viens komponents NAV IZPILDĪTS
    → NAV IZPILDĪTS

  pārējos gadījumos
  (vismaz viens NAV PIERĀDĪTS, neviens NAV IZPILDĪTS)
    → NAV PIERĀDĪTS

Granularitāte tiek saglabāta rezultāta detaļās, nevis jaunā statusā:

  STATUS:   NAV IZPILDĪTS
  DETAIL:   Components satisfied: A, B
            Missing component: C
  EVIDENCE: [fragmenti pa komponentiem]

Komponentu sadalījums nāk no prasību bāzes, nevis no sistēmas interpretācijas.


17. VERIFIKĀCIJAS KONTROLES

Trīs kontroles nav savstarpēji aizstājamas.

17.1. COMPLETENESS CONTROL

Jautājums: vai pārbaudītas visas piemērojamās prasības?

Mehānisms: deterministiska, iepriekš apstiprināta prasību kopa tiek pārbaudīta pret dokumentu, saglabājot pierādījumu par katru pārbaudīto prasību.

Robeža: pierāda tikai to, ka neviena apstiprinātās kopas prasība nav palikusi nepārbaudīta. Nepierāda, ka pati prasību kopa ir pilnīga attiecībā pret spēkā esošo regulējumu. Kopas pilnīgums ir atsevišķa kontrole REQUIREMENTS_MATRIX pārvaldībā: versija, avots, apstiprinātājs, pārskatīšanas datums.

17.2. EVIDENCE BINDING

Jautājums: vai katram secinājumam ir pārbaudāms avota pamats?

Mehānisms: precīzs fragments un atrašanās vieta sākotnējā avotā.

Robeža: pierāda, ko sistēma lasīja un uz kā balstīja secinājumu. Nepierāda, ka juridiskā interpretācija ir pareiza.

17.3. SEMANTIC VERIFICATION

Jautājums: vai secinājums par avota nozīmi ir pareizs?

Mehānisms:
  - cilvēka pārbaude pret sākotnējo avotu; vai
  - iepriekš validēts un attiecīgajam prasības tipam apstiprināts
    ne-AI mehānisms, ja tāds eksistē.

Mehānisms, kas nav iepriekš validēts un apstiprināts konkrētajam prasības tipam, nav semantiskā verifikācija neatkarīgi no tā tehniskās dabas.

Tikai šī kontrole šajā sistēmā tiek saukta par VERIFICATION.

INVARIANTI:
- AI savstarpēja vienprātība nav verifikācija.
- Legora secinājums netiek apstiprināts ar citu Legora secinājumu.
- 17.1. un 17.2. izpilde nedod tiesības rezultātu apzīmēt kā verificētu.
- 17.1. un 17.2. samazina cilvēka pārbaudes apjomu, bet nenoņem to tur, kur tā ir obligāta pēc 16.3.


18. PRASĪBU LĪMEŅI

  MANDATORY EXTERNAL
    Atkāpe nav sistēmas vai jurista brīvas sarunu pozīcijas jautājums.
    Sistēma nemaina prasības statusu.

  MANDATORY INTERNAL
    Atkāpes iespēja izriet tikai no bankas noteiktās iekšējās
    pārvaldības kārtības.
    Ja atkāpe ir pieļauta, jābūt identificējamam tās avotam
    un apstiprinājumam.

  NEGOTIABLE
    Juridiska vai komerciāla pozīcija, kur iespējams profesionāls
    jurista izvērtējums.
    Papildus statusam fiksē: pozīciju; alternatīvu; juridisko
    pamatojumu; būtiskos riskus.

  UNCLASSIFIED
    Statuss:  BLOCKING
    Nozīme:   prasības juridiskā daba nav noteikta.
    Rīcība:   prasību nedrīkst ignorēt;
              atkāpi nedrīkst automātiski pieļaut;
              nepieciešama cilvēka klasifikācija.
    Apstrāde: līdz klasifikācijai prasību apstrādā ar tādu pašu
              konservatīvo kontroli kā MANDATORY EXTERNAL.

UNCLASSIFIED nav ceturtais juridiskais līmenis. Tas ir pārvaldības statuss, kas apzīmē nezināmo, nepasludinot to par ārēju tiesību prasību.

Izvešana no UNCLASSIFIED notiek tikai prasību bāzes pārvaldībā (REQUIREMENTS_MATRIX): klasifikāciju veic pilnvarots cilvēks, tā tiek versēta un attiecas uz prasību, nevis uz vienu uzdevumu. Konkrēta uzdevuma ietvaros prasību no UNCLASSIFIED izvest nedrīkst.

INVARIANTS:
Legora nekad nepārklasificē prasību starp līmeņiem un nekad neizved prasību no UNCLASSIFIED. Līmenis sistēmā ir READ ONLY.


19. AI TOOL GOVERNANCE BOUNDARY

Legora izmantošana pati par sevi ir bankas trešās puses un ICT pārvaldības jautājums.

Šī sistēma pati nenosaka: Legora regulatīvo klasifikāciju; riska līmeni; atļautos datu tipus; atļautos lietošanas gadījumus; datu glabāšanas nosacījumus. Tie ir ārēji bankas apstiprināti ievaddati.

19.1. Atļauju matrica

Governance lēmums tiek pieņemts vienreiz un versēts atsevišķā dokumentā:

  AI_TOOL_USAGE_POLICY_v1

Zemāk redzamā tabula ir tikai struktūras piemērs. ILLUSTRATIVE ONLY — NOT A BANK APPROVAL. Neviena atļauja nav uzskatāma par piešķirtu, kamēr tā nav fiksēta bankas apstiprinātajā AI_TOOL_USAGE_POLICY versijā.

  Document type / data class        Legora
  ----------------------------------------
  Public legal source               [bankas lēmums]
  Internal policy                   [bankas lēmums]
  Vendor contract                   [bankas lēmums]
  Personal data                     [bankas lēmums]
  Special-category personal data    [bankas lēmums]
  ...

Katrs uzdevums pārbauda visu deklarēto ievaddatu klašu atbilstību matricai. Manuāla governance lēmuma pārbaude pirms katra uzdevuma netiek veikta.

Ja kaut viena deklarētā klase nav matricā:  PERMISSION UNKNOWN → BLOCK
Ja kaut viena deklarētā klase ir NOT ALLOWED:  NOT ALLOWED → BLOCK

BLOCK nozīmē: attiecīgie ievaddati netiek apstrādāti AI rīkā un uz tiem balstīts rezultāts netiek izsniegts. Tas neaptur juridisko darbu — jurists drīkst turpināt bez AI rīka.

19.2. Datu klašu noteikšana

Vienu vai vairākas ievaddatu klases deklarē cilvēks, kas uzdevumu iesniedz. Sistēma tās nenosaka pati; ja sistēma pati klasificētu ievaddatus atļaujas piešķiršanas nolūkā, tā faktiski pati sev piešķirtu atļauju.

Vienvirziena mehānisms:

  DECLARED DATA CLASSES — vienu vai vairākas klases nosaka cilvēks

  Sistēma:
    - nedrīkst pazemināt nevienu deklarēto datu klasi;
    - nedrīkst pati piešķirt atļauju;
    - drīkst konstatēt iespējamu neatbilstību vai augstāku
      sensitivitāti nekā deklarēts.

AI apstrāde ir atļauta tikai tad, ja visas uzdevumam piemērojamās deklarētās datu klases ir ALLOWED saskaņā ar spēkā esošo AI_TOOL_USAGE_POLICY. Viena NOT ALLOWED vai PERMISSION UNKNOWN klase izraisa BLOCK.

Ja konstatēta iespējama neatbilstība starp deklarētajām klasēm un faktisko dokumenta saturu:

  DATA CLASS MISMATCH SUSPECTED
  → BLOCK
  → HUMAN CONFIRMATION REQUIRED

Sistēma drīkst norādīt, ka dokumentā, iespējams, ir deklarētajām klasēm neatbilstoši vai augstākas sensitivitātes dati. Sistēma nedrīkst pati mainīt deklarāciju ne uz augšu, ne uz leju.

Robeža: neatbilstība var tikt konstatēta pēc tam, kad dokuments jau ir iesniegts rīkā. Mehānisms ierobežo tālāku apstrādi un rezultāta izmantošanu, bet neatceļ jau notikušo iesniegšanu. Tādēļ visas zināmās datu klases deklarējamas pirms iesniegšanas, kur tas tehniski iespējams.

19.3. Piemērošana

Punkts attiecas uz jebkuru AI rīku darba vidē, ne tikai uz Legora.


20. IZSEKOJAMĪBA

Materiāls darba rezultāts ir jebkurš rezultāts, kas iziet ārpus uzdevuma: tiek izmantots jurista lēmumā, nodots citai funkcijai, izmantots saziņā ar darījuma partneri vai padots kā ievaddati citam uzdevumam. Melnraksti un starprezultāti, kas paliek uzdevuma iekšienē, nav materiāls rezultāts.

Katram materiālajam darba rezultātam jābūt sasaistītam ar standartizētu Traceability Record.

Pilno struktūru nosaka TRACEABILITY_RECORD_v1, kurā jāietver vismaz:

  TASK ID
  OPERATION
  OBJECT
  ACTIVE MODULES + APPLICABILITY AUTHORITY + CONFIRMED BY
  DATE
  RESPONSIBLE LAWYER
  AI TOOL
  AI/MODEL VERSION
  DECLARED DATA CLASSES (19.2.)
  SOURCE SET
    INTERNAL SOURCE — document / version / effective date
    EXTERNAL SOURCE — authority / version or date / verification date
  REQUIREMENTS SET VERSION
  REQUIREMENT STATUS + VERIFICATION LEVEL (16.1., 16.3.)
  UNRESOLVED ISSUES
  ESCALATIONS
  HUMAN DECISIONS
  LEGAL STATUS REFERENCE (3. punkts)
  FINAL OUTPUT REFERENCE

Ja platforma neatklāj modeļa versiju:

  MODEL VERSION: NOT EXPOSED BY PLATFORM


21. SAGAIDĀMIE SISTĒMAS REZULTĀTI

Atkarībā no uzdevuma kombinācijas: juridiskā jautājuma strukturēta analīze; piemērojamā regulējuma noteikšana; risinājumu varianti; prasību matrica; līguma atbilstības analīze; gap analysis; trūkstošo prasību saraksts; prasību neatbilstības un nepilnīgas izpildes detaļas (16.5.); riskanto formulējumu identifikācija; neatrisināto jautājumu saraksts; nepieciešamās eskalācijas; pārbaudes ziņojums; juridiska teksta vai klauzulas projekts.

Pilns redline nav obligāts standarta rezultāts.

DRAFT operācijas rezultāta forma:

  PROPOSED TEXT
  LEGAL BASIS / PURPOSE
  DEVIATION FROM CURRENT TEXT
  ALTERNATIVE ACCEPTABLE TEXT (ja piemērojams)
  UNRESOLVED RISK

Piedāvāts teksts bez juridiskā pamata norādes nav pabeigts rezultāts.


22. CILVĒKA APSTIPRINĀJUMA ROBEŽA

Legora nevar: piešķirt LEGAL APPROVED; aizstāt jurista profesionālo spriedumu; pati apstiprināt atkāpi no saistoša tiesību regulējuma; aizvietot citas bankas riska funkcijas; pati noteikt CIF statusu; pati izvest prasību no UNCLASSIFIED; pati piešķirt gala moduļa statusu; pati mainīt deklarēto datu klasi; pasniegt citu riska kategoriju kā apstiprinātu tikai tādēļ, ka līgumā atrodama attiecīga klauzula.

Gala juridisko apstiprinājumu sniedz jurists bankas faktiskajā procesā (3. punkts).


23. ESKALĀCIJAS PRINCIPS

Sistēmai jāatšķir: JURISTA KOMPETENCE / CITAS FUNKCIJAS KOMPETENCE / KOPĪGA KOMPETENCE / NESKAIDRA KOMPETENCE.

Ja jautājums iziet ārpus jurista kompetences, rezultātam nav jāizdomā atbilde. Norāda ESCALATION REQUIRED un, ja iespējams, attiecīgo kompetences jomu.


24. JURISDIKCIJAS NOKLUSĒJUMS

Statuss: SYSTEM DEFAULT — PENDING CONFIRMATION FROM BANK PROCESS

  NON-LV NATIONAL LAW
  → neveidot gala juridisku secinājumu
  → strukturēt jautājumu attiecīgās jurisdikcijas juristam

Izņēmums attiecas tikai uz gadījumiem, kur piemērojamās tiesības ir Latvijas tiesības, vai kur prasība izriet no grupas iekšējā standarta.

Sistēma drīkst interpretēt grupas iekšējo standartu, bet tas nedod tiesības izdarīt secinājumu par citas valsts nacionālo tiesību ievērošanu. Grupas standarta izpilde un nacionālā regulējuma izpilde ir divi atsevišķi jautājumi.


25. JURIDISKĀ RISKA PIEŅEMŠANAS FIKSĒŠANA

Statuss: SYSTEM DEFAULT — PENDING CONFIRMATION FROM BANK PROCESS

  LEGAL POSITION: NOT APPROVED
  BUSINESS PROCEEDED: YES
  DECISION SOURCE: [...]
  DATE: [...]

Tā ir uzskaite, nevis apstiprinājuma ceļš. Statuss RISK ACCEPTED netiek ieviests. Ja banka vēlāk izveido formālu risk acceptance kārtību, DECISION SOURCE kļūst par atsauci uz to.


26. PROFESIONĀLĀ DARBA MUGURKAULS

  LEGAL TASK
  ↓
  TASK CLARIFICATION
  ↓
  COMPETENCE CHECK
  ↓
  TASK CLASSIFICATION (12. punkts)
  ↓
  AI TOOL PERMISSION CHECK (19. punkts)
  ↓
  SOURCE / DOCUMENT SET ESTABLISHED
  ↓
  [OPERATION-SPECIFIC WORKFLOW]
     — ietver 17.1. COMPLETENESS CONTROL, ja piemērojama
     — ietver 17.2. EVIDENCE BINDING visiem secinājumiem
  ↓
  SEMANTIC VERIFICATION GATE (17.3., pēc 16.3. sliekšņa)
  ↓
  UNRESOLVED ISSUES
  ↓
  ESCALATION IF REQUIRED
  ↓
  LAWYER REVIEW
  ↓
  OUTPUT + TRACEABILITY RECORD

17.1. un 17.2. nav atsevišķs solis pēc darba — tās notiek darba gaitā. Kā atsevišķi vārti pastāv tikai 17.3.

Operation-specific workflows tiek definēti zemāka līmeņa dokumentos. Orientējošais tvērums:

  ANALYSE  — juridiskā analīze, alternatīvas, risku identifikācija.
  VERIFY   — prasību statusu piešķiršana (16.), pilnīguma kontrole (17.1.).
  DRAFT    — teksta projekts 21. punkta formā.
  COMPARE  — atšķirību identifikācija; prasību statusu piešķiršana
             nav obligāta.
  EXTRACT  — faktu vai prasību iegūšana ar evidence binding;
             juridiskā analīze nav obligāta.

Neviena plūsma nedrīkst apiet 19. punkta atļauju pārbaudi vai 16.3. slieksni.


27. SISTĒMAS PROFESIONĀLAIS MĒRĶIS

Nodrošināt strukturētu, izsekojamu un pārbaudāmu AI atbalstītu bankas jurista darba vidi juridisko jautājumu risināšanai, līgumu analīzei, iepirkumu un outsourcing juridiskajam atbalstam, ICT/DORA līgumu pārbaudei un citiem jurista kompetencē esošiem uzdevumiem, vienlaikus nepieļaujot, ka AI secinājums aizvieto profesionālo juridisko spriedumu vai nepamanīti izlaiž būtisku juridisko prasību.


28. ŠAJĀ DOKUMENTĀ APZINĀTI NAV DEFINĒTS

- precīza Legora promptu struktūra;
- konkrēta Agent konfigurācija;
- konkrēti kvalitātes vārti;
- verifikācijas protokols — cilvēka verifikācijas dziļums un 16.3. sliekšņa paplašinājumi;
- operation-specific workflows (26. punkts);
- EBA un DORA prasību pilnie saraksti;
- līgumu checklist saturs;
- juridiskās izpētes metodoloģija;
- TRACEABILITY_RECORD_v1 pilnā struktūra;
- AI_TOOL_USAGE_POLICY_v1 saturs;
- REQUIREMENTS_MATRIX pārvaldības kārtība, tostarp kopas pilnīguma kontrole (17.1.), līmeņu piešķiršana un UNCLASSIFIED izvešana (18.);
- RULE-BASED DETERMINATION validācijas kārtība (13.2.);
- terminoloģijas pielikums.


29. ATVĒRTIE JAUTĀJUMI

Slēgti: pierādījuma asimetrija, verifikācijas kontroļu nodalījums, prasību līmeņi un UNCLASSIFIED, minimālais verifikācijas slieksnis, moduļu autoritāte, uzdevumu klasifikācija, rīka pārvaldības robeža, datu klases mehānisms, mugurkauls pret operāciju plūsmām, LEGAL APPROVED loma, statusu kopas noslēgtība.

Paliek atvērti (nav bloķējoši freeze):
1. Jurisdikcijas faktiskā robeža bankas procesā.
2. Kas piešķir prasību līmeni un kur prasību bāze tiek uzturēta.
3. Vai business-proceeded fiksēšana kādā formā jau notiek citur bankā.
4. 5–10 reāli "citu juridisko risinājumu" uzdevumi no prakses.


30. STATUSU UN APTURES STĀVOKĻU REĢISTRS

Šis ir slēgts saraksts. Zemāka līmeņa dokumenti nedrīkst ieviest jaunus statusus vai aptures stāvokļus bez šī punkta grozījuma.

PRASĪBAS STATUSS (16.1.)
  IZPILDĪTS / NAV IZPILDĪTS / NAV PIERĀDĪTS

VERIFIKĀCIJAS LĪMENIS (16.3.)
  EVIDENCE BOUND — AI PROPOSED / HUMAN VERIFIED

PRASĪBAS LĪMENIS (18.)
  MANDATORY EXTERNAL / MANDATORY INTERNAL / NEGOTIABLE

PĀRVALDĪBAS STATUSS (18.)
  UNCLASSIFIED

PRASĪBAS TIPS (16.4.)
  POSITIVE / NEGATIVE

MODUĻA STATUSS (13.1.)
  APPLICABLE / NOT APPLICABLE / UNCLEAR

MODUĻA AUTORITĀTE (13.2.)
  SYSTEM PROPOSAL ONLY / HUMAN CONFIRMATION REQUIRED /
  EXTERNAL INPUT ONLY / RULE-BASED DETERMINATION

CIF STATUSS (4.3.)
  CRITICAL / IMPORTANT · NOT CRITICAL / IMPORTANT · NOT YET DETERMINED

ATĻAUJAS STATUSS (19.)
  ALLOWED / NOT ALLOWED / PERMISSION UNKNOWN /
  DATA CLASS MISMATCH SUSPECTED

APTURES STĀVOKĻI
  TASK CLARIFICATION REQUIRED — uzdevums nav klasificējams (12.)
  HUMAN INPUT REQUIRED        — trūkst ārēja ievaddata (4.3., 13.1.)
  HUMAN CONFIRMATION REQUIRED — trūkst noteiktas funkcijas
                                apstiprinājuma (13.2., 19.2.)
  HUMAN VERIFICATION REQUIRED — nepieciešama 17.3. verifikācija (16.3.)
  ESCALATION REQUIRED         — ārpus jurista kompetences (23.)
  BLOCK                       — AI apstrāde neatļauta; juridiskais
                                darbs turpināms bez rīka (19.1.)

JURIDISKĀ STATUSA ATSAUCES (3., 25.)
  LEGAL APPROVED — atsauce uz bankas procesā fiksēto apstiprinājumu
  LEGAL POSITION: NOT APPROVED + BUSINESS PROCEEDED — uzskaites ieraksts
