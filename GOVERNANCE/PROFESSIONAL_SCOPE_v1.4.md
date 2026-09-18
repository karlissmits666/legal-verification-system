PROFESSIONAL_SCOPE_v1.4
Bankas jurista profesionālais darba tvērums AI atbalstītai juridiskā darba videi

Statuss: MELNRAKSTS — KONSOLIDĒTS v0.2 PAKETEI
Versija: 1.4
Bāze: `PROFESSIONAL_SCOPE_v1.3` — APSTIPRINĀTS, PAMATVERSIJA IESALDĒTA


1. DOKUMENTA MĒRĶIS

Šis dokuments nosaka profesionālo tvērumu jurista darbam, kuram tiek veidota Legora balstīta juridiskā darba un pārbaudes sistēma.

Dokuments neatrisina konkrētus juridiskus jautājumus un nenosaka detalizētu darba plūsmu.

Tā funkcija ir noteikt: kādus juridiskos uzdevumus sistēmai jāatbalsta; kāda ir jurista kompetence; kādas ir citu bankas funkciju kompetences; kādi rezultāti tiek sagaidīti; kuros jautājumos nepieciešama eskalācija; kāda loma ir Legora; kādi invarianti ir saistoši zemāka līmeņa dokumentiem.

16.–19. punkta invarianti un 30. punkta statusu reģistrs ir saistoši. Zemāka līmeņa dokumenti tos konkretizē un drīkst padarīt stingrākus, bet nedrīkst vājināt vai paplašināt bez šī dokumenta grozījuma.

Šķērsgriezuma governance invariants: neviens governance artefakts nedrīkst kļūt ACTIVE, ja tajā palicis placeholder, TBD vai neatrisināta obligāta atsauce. Pirms aktivizācijas šāds elements tiek aizpildīts ar identificējamu avotu / lēmumu vai izņemts ar dokumentētu pamatu.


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

Jurists: izvērtē juridisko pieņemamību; identificē juridiskos riskus; interpretē piemērojamos juridiskos un iekšējos noteikumus; pārbauda līguma juridisko saturu; nosaka vai apstiprina līguma juridisko klasifikāciju savas kompetences ietvaros; veic vai piedalās outsourcing klasifikācijā; izvērtē IKT / DORA kvalifikācijas juridiskos priekšnoteikumus; var sniegt LEGAL APPROVED 3. punkta izpratnē.

Juridiskā klasifikācija ir profesionāls juridisks secinājums, nevis tehnisks dokumenta tags. Sistēma drīkst sagatavot argumentētu klasifikācijas izvērtējumu, bet gala klasifikācijas autoritāti nosaka šis dokuments un bankas faktiskais governance process.

4.2. Ārpakalpojuma (outsourcing) klasifikācija

To, vai sadarbība kvalificējas kā outsourcing, nosaka jurists kopā ar outsourcing manager. Sistēma drīkst sniegt argumentētu klasifikācijas priekšlikumu, norādot pazīmes par un pret klasifikāciju, izmantotos avotus, neskaidrības un trūkstošo informāciju. Sistēmas priekšlikums nav gala statuss.

Sistēmas autoritāte noteikta 13. punktā.

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

4.3.a. IKT / DORA juridiskā kvalifikācija

Jānošķir divi lēmumi.

A. IKT PAKALPOJUMA JURIDISKĀ KVALIFIKĀCIJA

Jurists savas kompetences ietvaros drīkst veikt un apstiprināt juridisku izvērtējumu par to, vai konkrētais pakalpojums kvalificējas kā IKT pakalpojums piemērojamā DORA regulējuma izpratnē.

Šis jurista juridiskais secinājums ir HUMAN DECISION un nav pats par sevi ICT-DORA MODULE STATUS.

Jurista IKT pakalpojuma juridiskā kvalifikācija ir obligāts ievaddats ICT-DORA MODULE STATUS lēmumam. Moduļa apstiprinošā funkcija apstiprina moduļa statusu savas kompetences ietvaros un nepārskata jurista juridisko kvalifikāciju.

Ja moduļa apstiprinošā funkcija nepiekrīt juridiskajai kvalifikācijai:
→ juridiskais secinājums netiek klusējot pārrakstīts;
→ ESCALATION REQUIRED;
→ abas pozīcijas un lēmuma pamats tiek saglabāti izsekojamībā.

B. ICT-DORA MODUĻA PIEMĒROJAMĪBA

ICT-DORA moduļa gala statusam saglabājas HUMAN CONFIRMATION REQUIRED.

Pirms šā moduļa production aktivizācijas bankas governance ir konkrēti jānosauc funkcija vai funkciju kombinācija, kas apstiprina ICT-DORA MODULE STATUS. Placeholder formulējums "papildu funkcija, ja to prasa bankas process" nav pietiekams production lēmuma noteikums.

Kamēr šī funkcija nav nosaukta:
  ICT-DORA MODULE STATUS
  → UNCLEAR
  → HUMAN CONFIRMATION REQUIRED

Sistēma drīkst sagatavot argumentētu klasifikācijas priekšlikumu, bet nedrīkst pati piešķirt gala moduļa statusu.

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

Sistēmai pirms specializētas prasību kopas izvēles jānošķir divi jautājumi:

1. CONTRACT TYPE — kāda veida līgums vai jaukta līguma struktūra tas ir pēc juridiskā un ekonomiskā satura;
2. LEGAL / REGULATORY CLASSIFICATION — kādi īpaši tiesiskie vai regulatīvie režīmi tam var būt piemērojami.

CONTRACT TYPE pats par sevi nenosaka regulatīvo režīmu.

Piemēram:
- SaaS / cloud līgums nav automātiski ICT-DORA;
- pakalpojumu līgums nav automātiski outsourcing;
- facility līgums var būt vai nebūt outsourcing atkarībā no faktiskās funkcijas un piemērojamā regulējuma.

Atbalstāmais līgumu loks ietver vismaz: pakalpojumu līgumus; preču pirkuma/piegādes līgumus; būvniecības līgumus; licences līgumus; mācību līgumus; SaaS/cloud līgumus; IT development; IT support; konsultāciju līgumus; audita pakalpojumus; facility/security; marketing; citus bankas saimnieciskās darbības līgumus.

Viens līgums drīkst būt jaukts un saturēt vairākus CONTRACT TYPE raksturlielumus. CONTRACT TYPE detalizēto tehnisko taxonomy nosaka OPERATION_WORKFLOWS_v1 un TERMINOLOGY_AND_ENUMS_v1.

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


12. UZDEVUMA KLASIFIKĀCIJA UN NOSACĪTAIS LEGAL INTAKE

Sistēmas sākumpunkts ir saņemts juridisks uzdevums, nevis saņemts līgums.

Visiem uzdevumiem obligāti:
  LEGAL TASK RECEIVED
  ↓
  TASK CLARIFICATION
  ↓
  COMPETENCE CHECK
  ↓
  AI TOOL PERMISSION CHECK
  ↓
  OBJECT IDENTIFICATION

Tālāk LEGAL INTAKE ir nosacīts pēc OBJECT un uzdevuma būtības.

A. OBJECT = CONTRACT
  → CONTRACT TYPE
  → FACT PROFILE
  → CANDIDATE-MODULE SCREENING
  → SHORT vai FULL INTAKE
  → COMMON CONTRACT REVIEW vienmēr piemērojams
  → specializēti moduļi tikai pēc attiecīgā lēmuma

B. OBJECT = CLAUSE / DOCUMENT SET
  → CONTRACT TYPE un contract-specific LEGAL INTAKE tikai tad,
    ja līguma konteksts ir materiāls uzdevuma atrisināšanai.

C. OBJECT = QUESTION / INTERNAL POLICY / EXTERNAL SOURCE
  → CONTRACT TYPE nav obligāts;
  → LEGAL CLASSIFICATION ASSESSMENT tiek veikts tikai tad,
    ja pats juridiskais jautājums prasa klasifikāciju.

Uzdevuma pamatass:
  OPERĀCIJA   ANALYSE / VERIFY / DRAFT / COMPARE / EXTRACT
  OBJEKTS     QUESTION / CONTRACT / CLAUSE / INTERNAL POLICY /
              EXTERNAL SOURCE / DOCUMENT SET
  MODUĻI      PROCUREMENT / OUTSOURCING-EBA / ICT-DORA /
              DATA-PROTECTION / INFOSEC / OTHER

CONTRACT TYPE nav MODULE un nav OBJECT.

LEGAL / REGULATORY CLASSIFICATION nav prasības statuss. Tā ir juridiska analīze, kas pamato iespējamu moduļa piemērojamību.

Ja pats uzdevums ir klasifikācijas jautājums, attiecīgā ANALYSE operācija drīkst būt klasifikācijas darba galvenais rezultāts.

Ja uzdevumu nevar viennozīmīgi novietot uz nepieciešamajām asīm: TASK CLARIFICATION REQUIRED.

12.1. FACT PROFILE

FACT PROFILE nav brīvs MI kopsavilkums. Tas sastāv no izsekojamu FINDING atsaucēm.

Katram klasifikācijai materiālam faktam jābūt nosakāmai izcelsmei:
- biznesa / lietotāja deklarēts ievaddats;
- no avota izgūts FINDING ar EVIDENCE BINDING;
- jurista konstatējums ar avota atsauci;
- pieņēmums (ASSUMPTION = true);
- trūkstoša informācija / UNRESOLVED ISSUE.

Ja klasifikācijai materiāls fakts ir ASSUMPTION = true, QUALITATIVE LIKELIHOOD nevar būt LIKELY vai UNLIKELY, ja vien pilnvarotais cilvēks lēmumā šo pieņēmumu nav tieši pieņēmis un fiksējis. Citādi QUALITATIVE LIKELIHOOD = INDETERMINATE.

12.2. CANDIDATE-MODULE SCREENING

SHORT INTAKE drīkst izmantot tikai pret versētu un apstiprinātu MODULE TRIGGER REGISTRY.

Screening rezultāts "trigger nav identificēts" nav MODULE STATUS = NOT APPLICABLE.

Screening ierakstam jānorāda vismaz:
- SCREENED MODULES;
- TRIGGER REGISTRY VERSION;
- TRIGGERS IDENTIFIED;
- SCREENED BY;
- SCREENED AT.

Tukšs TRIGGERS IDENTIFIED lauks ir derīgs tikai tad, ja tas ir apzināti fiksēts kā rezultāts pret pilnībā izpildītu attiecīgās versijas trigger sarakstu. Neaizpildīts lauks nav negatīvs rezultāts.

Ja modulim nav apstiprināta ACTIVE trigger saraksta, SHORT ceļš šim modulim nav pieejams; piemēro FULL LCA.

Trigger saraksta governance un apstiprināšanas autoritāti nosaka REQUIREMENTS_MATRIX_GOVERNANCE_v1. Trigger sarakstu apstiprina tā pati vai līdzvērtīga governance autoritāte, kurai pieder attiecīgā moduļa piemērojamības lēmums.

12.3. SHORT INTAKE / FULL INTAKE

SHORT INTAKE:
- CONTRACT TYPE;
- īss, izsekojams FACT PROFILE;
- CANDIDATE-MODULE SCREENING pret ACTIVE trigger registry;
- HUMAN DECISION ar DECISION TYPE = screening_confirmation un RELATED OBJECT = MODULE SCREENING RECORD;
- COMMON CONTRACT REVIEW turpinās.

FULL INTAKE ir obligāts, ja:
- identificēts vismaz viens moduļa trigger;
- klasifikācija ir neskaidra;
- jaukta / neparasta līguma struktūra var materiāli ietekmēt regulatīvo režīmu;
- trūkstošs fakts var mainīt moduļa piemērojamību;
- lietotājs uzdod klasifikācijas jautājumu;
- iekšējais noteikums prasa pilnu klasifikācijas izvērtējumu;
- attiecīgajam modulim nav ACTIVE trigger saraksta.

FULL INTAKE ietver LEGAL CLASSIFICATION ASSESSMENT un attiecīgās autoritātes lēmumu.

12.4. COMMON CONTRACT REVIEW

Ja OBJECT = CONTRACT, COMMON CONTRACT REVIEW ir vienmēr piemērojams un nav atkarīgs no specializēta MODULE STATUS.

Specializētās prasību kopas ir papildinājums, nevis aizstājējs.

COMMON CONTRACT REVIEW drīkst turpināties arī tad, ja kāda specializēta moduļa statuss ir UNCLEAR.

INVARIANTS — verifikācijas līmenis un nodošana:
Rezultāts, kas izmantots kā ievaddati citam uzdevumam, saglabā savu verifikācijas līmeni. Verifikācijas līmenis pieaug tikai ar faktisku verifikācijas aktu attiecībā uz konkrēto apgalvojumu.


13. MODUĻU PRINCIPS UN AUTORITĀTE

  UNIVERSAL LEGAL CORE
        ↓
  TASK COMBINATION (12. punkts)
        ↓
  APPLICABLE REGULATORY MODULES

13.0. LEGAL / REGULATORY CLASSIFICATION ASSESSMENT

Pirms moduļa gala statusa sistēma drīkst izveidot strukturētu LEGAL CLASSIFICATION ASSESSMENT.

Tas satur vismaz:
- CLASSIFICATION QUESTION;
- CANDIDATE CLASSIFICATION;
- RELEVANT FACTS;
- SUPPORTING AUTHORITIES;
- SUPPORTING ARGUMENTS;
- COUNTERVAILING AUTHORITIES;
- COUNTERARGUMENTS;
- UNCERTAINTIES;
- MISSING INFORMATION;
- QUALITATIVE LIKELIHOOD;
- AUTHORITY REQUIRED;
- HUMAN DECISION REFERENCE [ja pieejama].

QUALITATIVE LIKELIHOOD ir argumentētas analīzes kopsavilkums, ne gala juridiskais statuss un ne statistiska varbūtība.

Atļautās vērtības un to tehnisko reprezentāciju nosaka LEGAL_RESEARCH_METHOD_v1 un TERMINOLOGY_AND_ENUMS_v1.

Procentuālu varbūtību sistēma nedrīkst ģenerēt, ja nav iepriekš validēta un kalibrēta statistiska mehānisma.

LEGAL CLASSIFICATION ASSESSMENT nekad automātiski nepārvēršas par MODULE STATUS.

CIF STATUS nav LEGAL CLASSIFICATION ASSESSMENT rezultāts. ICT-DORA klasifikācijas LCA izvērtē, vai pakalpojums ir IKT pakalpojums / vai ICT-DORA modulis ir piemērojams. CIF STATUS paliek EXTERNAL INPUT ONLY.

DORA prasību kopas izvēle drīkst būt atkarīga gan no ICT-DORA MODULE STATUS, gan no CIF STATUS un citiem iepriekš apstiprinātiem SELECTION CONDITIONS.

Ja ICT-DORA = APPLICABLE:
- CIF-INDEPENDENT DORA REQUIREMENTS SET tiek aktivizēts neatkarīgi no CIF statusa;
- CIF-DEPENDENT REQUIREMENTS SET tiek izvēlēts tikai pēc CIF statusa.

Ja CIF STATUS = NOT YET DETERMINED:
  CIF-INDEPENDENT SET → turpinās;
  CIF-DEPENDENT SET → HUMAN INPUT REQUIRED.

Sistēma nedrīkst klusējot izvēlēties non-critical kopu.

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
  OUTSOURCING-EBA     → HUMAN CONFIRMATION REQUIRED (jurists + outsourcing manager)
  ICT-DORA            → HUMAN CONFIRMATION REQUIRED (konkrētā bankas governance funkcija jānosauc pirms production aktivizācijas)
  DATA-PROTECTION     → HUMAN CONFIRMATION REQUIRED
  INFOSEC             → HUMAN CONFIRMATION REQUIRED
  PROCUREMENT         → SYSTEM PROPOSAL ONLY
  OTHER               → SYSTEM PROPOSAL ONLY


13.4. Klasifikācijas un prasību kopas secības invariants

Specializētu REQUIREMENTS SET nedrīkst aktivizēt tikai tādēļ, ka AI klasifikācijas priekšlikums norāda uz iespējamu moduļa piemērojamību.

Secība ir obligāta:

  CONTRACT TYPE
  → LEGAL / REGULATORY CLASSIFICATION ASSESSMENT
  → REQUIRED HUMAN / EXTERNAL DECISION
  → MODULE STATUS
  → REQUIREMENTS SET SELECTION

MODULE STATUS = UNCLEAR gadījumā specializētā prasību kopa netiek pasniegta kā gala piemērojamā prasību bāze. Sistēma drīkst to izmantot tikai scenārija analīzei, skaidri norādot, ka piemērojamība nav apstiprināta.

UNCLEAR bloķē tikai tos downstream rezultātus, kuri pieņem konkrētā moduļa piemērojamību vai nepiemērojamību kā faktu. COMMON CONTRACT REVIEW un cita no šīs klasifikācijas neatkarīga juridiskā analīze turpinās.

Scenārija prasību rezultātiem obligāti:
  scenario_only = true

scenario_only = true rezultāti:
- nav faktiskas prasības izpildes konstatējums;
- vienmēr tiek formulēti nosacīti;
- netiek mantoti citā TASK kā actual REQUIREMENT RESULT;
- uz tiem neattiecas 16.3. HUMAN VERIFIED minimums, jo tie nav actual prasības gala rezultāti;
- ja modulis vēlāk kļūst APPLICABLE, scenārija rezultāti netiek pārklasificēti par actual — tiek radīti jauni REQUIREMENT RESULT parastajā režīmā.


13.5. RECLASSIFICATION TRIGGER

Klasifikācija nav vienreizējs lēmums, ja uzdevuma gaitā mainās materiālie fakti.

Obligāts reclassification review tiek ierosināts, ja:
a) mainās FINDING, uz kuru atsaucas spēkā esošais LCA; vai
b) uzdevumā ar spēkā esošu LCA rodas jauns FINDING, kas skar kādu no attiecīgā MODULE TRIGGER SET tēmām.

(b) gadījumā MODULE TRIGGER SET tiek izmantots tikai kā atbilstības filtrs, nevis kā moduļa statusa noteicējs.

Šis "reclassification review" ir workflow pienākums, ne jauns canonical statuss vai SUSPENSION STATE.

Materialitāti nenosaka AI kā gala lēmumu. To izvērtē cilvēks.

Katrs review rezultāts tiek fiksēts HUMAN DECISION ierakstā arī tad, ja secinājums ir:
  CHANGE NOT MATERIAL TO CLASSIFICATION.

Ja izmaiņa ir materiāla:
- iepriekšējais LCA un cilvēka lēmums paliek vēsturē;
- tiek izveidots jauns LCA / lēmums;
- tiek atkārtoti izvērtēts MODULE STATUS;
- tiek atkārtoti izvēlētas piemērojamās REQUIREMENTS SET;
- rezultāti, kas balstīti uz aizstāto klasifikāciju, saglabā atsauci uz veco LCA un vairs nedrīkst izskatīties kā aktuāli;
- skartās prasības tiek pārrēķinātas / pārbaudītas no jauna.

Nekas netiek klusējot pārrakstīts.


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

Vienīgais actual prasības līmenis, kur gala statuss var palikt EVIDENCE BOUND — AI PROPOSED, ir NEGOTIABLE, jo tā neizpilde nerada regulatīvu neatbilstību un pozīciju jebkurā gadījumā izvērtē jurists LAWYER REVIEW solī.

Izņēmums: scenario_only = true ieraksts nav actual prasības gala rezultāts un uz to HUMAN VERIFIED minimums neattiecas. Tas nedrīkst tikt pārvērsts par actual rezultātu bez jauna parastā režīma REQUIREMENT RESULT.

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
  CONTRACT TYPE                           [ja OBJECT = CONTRACT]
  LEGAL CLASSIFICATION ASSESSMENTS         [ja piemērojams]
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

Atkarībā no uzdevuma kombinācijas: juridiskā jautājuma strukturēta analīze; līguma veida noteikšana; argumentēts juridiskās / regulatīvās klasifikācijas izvērtējums; piemērojamā regulējuma noteikšana; risinājumu varianti; prasību matrica; līguma atbilstības analīze; gap analysis; trūkstošo prasību saraksts; prasību neatbilstības un nepilnīgas izpildes detaļas (16.5.); riskanto formulējumu identifikācija; neatrisināto jautājumu saraksts; nepieciešamās eskalācijas; pārbaudes ziņojums; juridiska teksta vai klauzulas projekts.

Pilns redline nav obligāts standarta rezultāts.

DRAFT operācijas rezultāta forma:

  PROPOSED TEXT
  LEGAL BASIS / PURPOSE
  DEVIATION FROM CURRENT TEXT
  ALTERNATIVE ACCEPTABLE TEXT (ja piemērojams)
  UNRESOLVED RISK

Piedāvāts teksts bez juridiskā pamata norādes nav pabeigts rezultāts.


22. CILVĒKA APSTIPRINĀJUMA ROBEŽA

Legora nevar: piešķirt LEGAL APPROVED; aizstāt jurista profesionālo spriedumu; pati apstiprināt atkāpi no saistoša tiesību regulējuma; aizvietot citas bankas riska funkcijas; pati noteikt CIF statusu; pati izvest prasību no UNCLASSIFIED; pati piešķirt gala moduļa statusu; pati pārvērst kvalitatīvu klasifikācijas varbūtības novērtējumu par gala juridisku klasifikāciju; pati mainīt deklarēto datu klasi; pasniegt citu riska kategoriju kā apstiprinātu tikai tādēļ, ka līgumā atrodama attiecīga klauzula.

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
  AI TOOL PERMISSION CHECK
  ↓
  OBJECT IDENTIFICATION
  ↓
  OBJECT-DEPENDENT INTAKE
    - CONTRACT: CONTRACT TYPE + FACT PROFILE + MODULE SCREENING
    - citi OBJECT: tikai piemērojamie intake elementi
  ↓
  COMMON CONTRACT REVIEW, ja OBJECT = CONTRACT
  ↓
  FULL LCA / REQUIRED HUMAN OR EXTERNAL DECISION, ja aktualizēts
  ↓
  MODULE STATUS
  ↓
  REQUIREMENTS SET SELECTION
  ↓
  OPERATION-SPECIFIC WORKFLOW
  ↓
  SEMANTIC VERIFICATION GATE, ja piemērojams
  ↓
  UNRESOLVED ISSUES / ESCALATION
  ↓
  LAWYER REVIEW
  ↓
  OUTPUT + TRACEABILITY RECORD

COMMON CONTRACT REVIEW un specializēto moduļu klasifikācija drīkst notikt paralēli, ja tas neietekmē juridiskā darba drošumu.

Neviena plūsma nedrīkst apiet 19. punkta atļauju pārbaudi, 12. punkta klasifikācijas secību vai 16.3. verifikācijas slieksni.

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
