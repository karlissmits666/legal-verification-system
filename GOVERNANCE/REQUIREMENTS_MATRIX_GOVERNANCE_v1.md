# REQUIREMENTS_MATRIX_GOVERNANCE_v1

Juridiskās pārbaudes sistēmas prasību kopu un prasību pārvaldības kārtība

**Statuss:** MELNRAKSTS — ARHITEKTŪRAS APSPRIEŠANAI  
**Versija:** v0.2  
**Bāze:**  
- `PROFESSIONAL_SCOPE_v1.4` — MELNRAKSTS  
- `TRACEABILITY_RECORD_v1 — Arhitektūra v0.6` — MELNRAKSTS  
- `TERMINOLOGY_AND_ENUMS_v1 — v0.4` — MELNRAKSTS  
- `VERIFICATION_PROTOCOL_v1 — v0.5` — IESALDĒTS  
- `OPERATION_WORKFLOWS_v1 — v0.1` — MELNRAKSTS  
- `LEGAL_RESEARCH_METHOD_v1 — v0.1` — MELNRAKSTS

## 1. Mērķis

Šis dokuments nosaka, kā tiek:
- izveidota un apstiprināta prasību kopa;
- identificēta un formulēta prasība;
- piesaistīts juridiskais / governance pamats;
- noteikts `REQUIREMENT LEVEL`;
- pārvaldīts `UNCLASSIFIED`;
- noteikts `REQUIREMENT TYPE`;
- veidoti saliktu prasību komponenti;
- versētas un pārskatītas prasības;
- pārvaldīta avotu aktualitāte;
- izvēlēta pareizā REQUIREMENTS SET konkrētam TASK pēc LEGAL INTAKE.

Šis dokuments nenosaka līguma veidu vai gala regulatīvo klasifikāciju.

## 2. Arhitektūras robeža

`REQUIREMENTS_MATRIX_GOVERNANCE_v1` saņem jau noteiktu vai apstiprinātu:

```text
OBJECT
CONTRACT TYPE                       [ja piemērojams]
LEGAL CLASSIFICATION ASSESSMENT    [ja piemērojams]
MODULE STATUS
APPLICABILITY AUTHORITY / DECISION
```

un tikai pēc tam nosaka:

```text
KURU REQUIREMENTS SET
+
KURU REQUIREMENT VERSIJU
+
KĀDĀ TVĒRUMĀ
```

Tas nedrīkst pats no jauna izlemt:
- vai līgums ir outsourcing;
- vai pakalpojums ir IKT pakalpojums;
- vai DORA modulis ir piemērojams;
- citu profesionālu moduļa klasifikāciju.

## 3. Obligātā secība

```text
LEGAL INTAKE
↓
CONTRACT TYPE
↓
LEGAL / REGULATORY CLASSIFICATION
↓
HUMAN / EXTERNAL DECISION
↓
MODULE STATUS
↓
REQUIREMENTS SET SELECTION
↓
REQUIREMENT REVIEW
```

Specializēta prasību kopa nav moduļa klasifikācijas mehānisms.

## 4. REQUIREMENTS SET izvēles noteikums

Specializētu REQUIREMENTS SET drīkst aktivizēt kā gala piemērojamo prasību kopu tikai tad, ja attiecīgais `MODULE STATUS = APPLICABLE`.

Ja:
```text
MODULE STATUS = NOT APPLICABLE
```
attiecīgā specializētā prasību kopa netiek aktivizēta.

Ja:
```text
MODULE STATUS = UNCLEAR
```
attiecīgo prasību kopu drīkst izmantot tikai skaidri marķētai scenārija analīzei. Tā nedrīkst tikt pasniegta kā gala piemērojamā prasību bāze.

Universāla `COMMON CONTRACT REVIEW` kopa drīkst būt piemērojama CONTRACT objektam neatkarīgi no specializēta moduļa, ja to nosaka tās governance.

## 5. REQUIREMENTS SET SELECTION minimums

TASK ietvaros fiksē vismaz:

```text
REQUIREMENTS SET ID
REQUIREMENTS SET VERSION
SELECTION BASIS
RELATED MODULE                  [ja piemērojams]
MODULE STATUS                   [ja piemērojams]
CLASSIFICATION / DECISION REFERENCE [ja piemērojams]
SELECTED AT
```

`SELECTION BASIS` nav brīva iespēja AI izdomāt regulatīvu piemērojamību. Tai jāatsaucas uz apstiprinātu moduļa statusu, universāla review noteikumu vai citu iepriekš apstiprinātu governance pamatu.

## 6. REQUIREMENTS SET

Katram apstiprinātam prasību kopumam ir:

```text
REQUIREMENTS SET ID
REQUIREMENTS SET NAME
REQUIREMENTS SET VERSION
SCOPE
APPLICABLE MODULE               [ja piemērojams]
SELECTION RULE
SOURCE UNIVERSE
EFFECTIVE DATE
APPROVAL AUTHORITY REFERENCE
APPROVED BY
APPROVAL REFERENCE
LAST REVIEW DATE
NEXT REVIEW DATE                [ja piemērojams]
PREVIOUS VERSION                [ja piemērojams]
```

`APPROVAL AUTHORITY REFERENCE` norāda bankas governance pamatu, kas nosaka, kam ir tiesības apstiprināt konkrēto prasību kopu.

Šis dokuments neizdomā bankas amata / funkciju matricu.

## 7. SOURCE UNIVERSE

Katram REQUIREMENTS SET jābūt definētam avotu tvērumam:

> pret kuriem autoritatīvajiem avotiem prasību kopas pilnīgums ir pārskatīts?

Tas var ietvert:
- tiesību aktus;
- regulatīvās vadlīnijas;
- bankas iekšējās politikas;
- apstiprinātus standartus;
- vairākus savstarpēji saistītus avotus.

SOURCE UNIVERSE nav apgalvojums, ka aptverts viss iespējamais regulējums ārpus definētā tvēruma.

## 8. Prasību kopas pilnīguma kontroles robeža

TASK `COMPLETENESS CONTROL` pierāda tikai:
- visas prasības no konkrētās izmantotās kopas versijas tika pārbaudītas.

Tas nepierāda:
- ka pati prasību kopa ir juridiski pilnīga;
- ka nav jauna regulējuma;
- ka SOURCE UNIVERSE ir perfekts;
- ka prasību interpretācija ir pareiza.

Prasību kopas pilnīgums ir governance kontrole.

## 9. REQUIREMENT RECORD

Minimāli:

```text
REQUIREMENT ID
REQUIREMENT TITLE
REQUIREMENT STATEMENT
REQUIREMENT LEVEL
GOVERNANCE STATUS
REQUIREMENT TYPE
APPLICABLE MODULE              [ja piemērojams]
APPLICABILITY CONDITIONS       [ja piemērojams]
SOURCE BASIS
COMPONENTS                     [ja piemērojams]
INTERPRETATION NOTE            [ja nepieciešams]
NEGOTIABLE POSITION FIELDS     [ja definēti]
VALID FROM
VALID TO                       [ja piemērojams]
REQUIREMENT RECORD VERSION
PREVIOUS REQUIREMENT VERSION   [ja piemērojams]
```

TASK statusi, evidence un verification level nav master prasības ieraksta daļa.

## 10. REQUIREMENT ID

`REQUIREMENT ID` ir noturīgs identifikators.

Tas pats ID drīkst turpināties jaunā versijā tikai tad, ja juridiskā testa semantiskā identitāte saglabājas.

Ja izmaiņa:
- pievieno būtiski jaunu juridisku nosacījumu;
- sadala vienu juridisku testu vairākos neatkarīgos testos;
- apvieno juridiski atšķirīgus testus;
- būtiski maina prasības tvērumu;

tiek radīts jauns REQUIREMENT ID.

Tikai redakcionāls vai precizējošs labojums, kas nemaina juridisko testu, drīkst saglabāt ID.

Ja ir pamatotas šaubas par identitāti, izmanto jaunu ID un saglabā sasaisti ar iepriekšējo prasību.

## 11. REQUIREMENT STATEMENT

REQUIREMENT STATEMENT ir normalizēts juridiskās prasības formulējums, kuru sistēma pārbauda.

Tas nav obligāti verbatim citāts.

Tam jābūt:
- pietiekami precīzam statusa piešķiršanai;
- ne plašākam par juridiski pamatoto avota nozīmi;
- ne šaurākam tādā veidā, kas varētu palaist garām prasības daļu;
- nodalītam no interpretācijas piezīmes.

AI drīkst sagatavot projektu. Gala formulējumu apstiprina pilnvarots cilvēks.

## 12. SOURCE BASIS

SOURCE BASIS drīkst sastāvēt no viena vai vairākiem avotiem.

Minimāli katram nesošam avotam:

```text
SOURCE ID / REFERENCE
SOURCE VERSION / EFFECTIVE DATE       [ja piemērojams]
SOURCE LOCATION
SOURCE FRAGMENT                       [ja avota saturs ir citējams]
AUTHORITY / OWNER
ROLE IN REQUIREMENT
```

Ja prasība izriet no vairāku avotu kopīgas interpretācijas, nevienu no tiem nedrīkst mākslīgi pasludināt par vienīgo avotu. `INTERPRETATION NOTE` dokumentē saikni.

SOURCE BASIS nav TASK `EVIDENCE OBJECT`.

SOURCE BASIS atbild:
> no kurienes radusies master prasība?

TASK EVIDENCE atbild:
> ko konkrētajā pārbaudāmajā dokumentā atradām attiecībā uz šo prasību?

## 13. Avota identitāte

Prasību nedrīkst apstiprināt pret avotu, kura redakciju nav iespējams pietiekami identificēt, ja redakcija ir materiāla prasības nozīmei.

Kur iespējams, fiksē:
- versiju;
- dokumenta datumu;
- effective date;
- oficiālu identifikatoru;
- publicēšanas / pārbaudes datumu.

## 14. REQUIREMENT LEVEL

Atļautās canonical vērtības:
```text
MANDATORY EXTERNAL
MANDATORY INTERNAL
NEGOTIABLE
```

`UNCLASSIFIED` nav REQUIREMENT LEVEL.

AI drīkst ierosināt līmeni prasību matricas sagatavošanas procesā, bet nedrīkst to gala veidā apstiprināt.

## 15. MANDATORY EXTERNAL

Nepieciešams:
- identificēts ārējais autoritatīvais pamats;
- piemērojamā redakcija;
- SOURCE BASIS;
- pilnvarota cilvēka klasifikācija.

Piegādātāja pretošanās vai biznesa ērtības nepadara prasību NEGOTIABLE.

## 16. MANDATORY INTERNAL

Nepieciešams:
- identificēts bankas iekšējais avots;
- piemērojamā redakcija;
- SOURCE BASIS;
- pilnvarota cilvēka klasifikācija.

Atkāpes iespēja no iekšējas prasības nemaina pašu REQUIREMENT LEVEL.

Atkāpe, ja bankas process to pieļauj, tiek fiksēta ārējā bankas governance procesā.

## 17. NEGOTIABLE

NEGOTIABLE ir profesionāla juridiska vai komerciāla pozīcija, kur iespējama alternatīva.

Prasību nedrīkst klasificēt NEGOTIABLE tikai tāpēc, ka:
- vendor nepiekrīt;
- prasību ir grūti panākt;
- biznesam tā ir neērta;
- agrāk pieļauts kompromiss.

Klasifikācijai jābūt pozitīvi pamatotai.

## 18. NEGOTIABLE pozīcijas lauki

Šie lauki ir izvēles, ne obligāti katrai NEGOTIABLE prasībai:

```text
DEFAULT POSITION
ACCEPTABLE ALTERNATIVE
LEGAL RATIONALE
MATERIAL RISKS / CONSIDERATIONS
```

Tos aizpilda tikai tad, ja bankai faktiski ir apstiprināta vai dokumentēta standarta pozīcija.

Lauka neesamība nenozīmē, ka AI drīkst izgudrot standarta pozīciju.

## 19. UNCLASSIFIED

`UNCLASSIFIED` ir `GOVERNANCE STATUS`:

```text
governance_status = unclassified
requirement_level = null
```

Prasību:
- nedrīkst ignorēt;
- nedrīkst automātiski saukt par NEGOTIABLE;
- nedrīkst izvest no UNCLASSIFIED konkrēta TASK laikā;
- nedrīkst AI gala veidā klasificēt.

Līdz klasifikācijai darbojas frozen konservatīvā kontrole.

## 20. Izvešana no UNCLASSIFIED

Nepieciešams:
1. source basis;
2. juridiskās dabas izvērtējums;
3. pilnvarota cilvēka lēmums;
4. jauna prasību kopas versija;
5. iepriekšējās versijas saglabāšana;
6. klasifikācijas pamata dokumentēšana.

## 21. REQUIREMENT TYPE

Atļautās vērtības:
```text
POSITIVE
NEGATIVE
```

REQUIREMENT TYPE ir neatkarīgs no REQUIREMENT LEVEL.

## 22. Salikta prasība

Prasību sadala komponentos tikai tad, ja komponentam:
- var būt savs REQUIREMENT STATUS;
- nepieciešams savs evidence;
- viena komponenta izpilde nenozīmē otra komponenta izpildi.

Komponentu struktūru apstiprina master prasību bāzē, ne TASK laikā.

## 23. COMPONENT RECORD

```text
COMPONENT ID
PARENT REQUIREMENT ID
COMPONENT DESCRIPTION
SOURCE BASIS
COMPONENT ORDER
```

Konkrētā TASK:
```text
REQUIREMENT STATUS
EVIDENCE
VERIFICATION LEVEL
```
paliek Traceability / task slānī.

## 24. Granularitāte

Mērķis ir mazākā praktiski neatkarīgi pārbaudāmā juridiskā vienība.

Nedrīkst:
- apvienot vairākas neatkarīgas prasības vienā statusā;
- sadalīt vienu prasību desmitos tehnisku mikroelementu bez juridiskas nozīmes.

## 25. Requirement-level applicability

Master prasība drīkst saturēt `APPLICABILITY CONDITIONS`, ja daļa prasību vienā apstiprinātā modulī attiecas tikai uz konkrētiem apstākļiem.

Tas nenozīmē MODULE APPLICABILITY.

Piemērs:
```text
ICT-DORA MODULE = APPLICABLE

REQ-DORA-X
applies only if service supports a critical or important function
```

Šāda requirement-level applicability drīkst izmantot deterministisku noteikumu tikai tad, ja:
- ievaddati ir zināmi;
- noteikums ir iepriekš apstiprināts;
- nav vajadzīgs profesionāls juridisks spriedums.

Pretējā gadījumā nepieciešams HUMAN INPUT REQUIRED vai HUMAN CONFIRMATION REQUIRED.

## 26. Requirements Set apstiprināšana

Production prasību kopu nedrīkst izmantot kā apstiprinātu, kamēr nav:

```text
REQUIREMENTS SET VERSION
SOURCE UNIVERSE
APPROVAL AUTHORITY REFERENCE
APPROVED BY
APPROVAL REFERENCE
EFFECTIVE DATE
LAST REVIEW DATE
```

AI ģenerēta matrica bez cilvēka approval nav apstiprināta REQUIREMENTS SET.

## 27. Apstiprinātas versijas nemainīgums

Materiāla izmaiņa rada jaunu versiju.

Materiāla izmaiņa ietver vismaz:
- prasības pievienošanu / izņemšanu;
- REQUIREMENT STATEMENT semantisku maiņu;
- REQUIREMENT LEVEL / GOVERNANCE STATUS maiņu;
- REQUIREMENT TYPE maiņu;
- komponentu semantisku maiņu;
- source basis maiņu, kas maina juridisko pamatu;
- requirement-level applicability maiņu;
- materialu NEGOTIABLE standarta pozīcijas maiņu.

## 28. Redakcionālas izmaiņas

Nemainot juridisko vai tehnisko nozīmi, drīkst labot:
- drukas kļūdas;
- formatējumu;
- skaidrojošu tekstu.

Ja pastāv pamatotas šaubas par semantisku ietekmi, izmaiņu apstrādā kā materiālu.

## 29. Jauna Requirements Set versija

```text
PREPARE
→ LEGAL REVIEW
→ APPROVAL
→ EFFECTIVE DATE
→ NEW ACTIVE VERSION
```

Iepriekšējā versija netiek pārrakstīta.

Jauna versija retroaktīvi nemaina vēsturiska TASK rezultātus.

## 30. Requirement izņemšana

Prasību, kas izmantota materiālā TASK, nedrīkst dzēst tā, ka vēsturisko ierakstu nevar rekonstruēt.

Izņemšanai nepieciešams dokumentēts pamats.

## 31. Source currentness

Katrai prasību kopai jāspēj noteikt:
- izmantotos avotus;
- to redakcijas;
- pēdējo review datumu.

`LAST REVIEW DATE` pats par sevi nepierāda, ka matrica ir aktuāla.

## 32. Avota izmaiņu signāls

Ja konstatēts, ka avots ir:
- grozīts;
- aizstāts;
- atcelts;
- papildināts;
- stājusies spēkā jauna redakcija;

prasību kopa jānosūta cilvēka pārskatīšanai.

AI / monitors drīkst konstatēt iespējamu izmaiņu, bet nedrīkst pats apstiprināt jauno prasību kopu.

## 33. Periodisks pārskats

Pārskatīšanas biežums ir bankas governance ievaddats.

Šis dokuments neizdomā konkrētu periodu.

## 34. SOURCE UNIVERSE pārskats

Pārskatā jāpārbauda ne tikai esošo prasību teksts, bet arī:
- vai SOURCE UNIVERSE joprojām pareizs;
- vai pievienojams jauns avots;
- vai kāds avots vairs nav piemērojams;
- vai mainījusies autoritāte / interpretācija.

## 35. Completeness review

Pilnvarots cilvēks pārskatā apstiprina vismaz:
1. SOURCE UNIVERSE identificēts;
2. identificētie avoti pārskatīti;
3. piemērojamās prasības iekļautas vai dokumentēti izslēgtas;
4. līmeņi klasificēti vai UNCLASSIFIED;
5. komponenti definēti;
6. negatīvās prasības identificētas;
7. kopai ir versija un effective date.

Tas nav absolūts pierādījums, ka regulējumā nekas nav palaists garām.

## 36. EXCLUSION LOG

Izslēgtās potenciālās prasības glabā atsevišķā, ar REQUIREMENTS SET versiju sasaistītā `EXCLUSION LOG`, ne aktīvajā prasību tabulā.

Minimāli:
```text
SOURCE REFERENCE
EXCLUDED ITEM
EXCLUSION BASIS
DECIDED BY
DATE
RELATED REQUIREMENTS SET VERSION
```

Tas ļauj atšķirt:
- izvērtēts un izslēgts;
- nekad nepamanīts.

## 37. AI loma matricas izstrādē

AI drīkst:
- iegūt kandidātprasības;
- piedāvāt REQUIREMENT STATEMENT;
- piedāvāt source basis;
- piedāvāt REQUIREMENT TYPE;
- piedāvāt iespējamu REQUIREMENT LEVEL;
- piedāvāt komponentus;
- salīdzināt versijas;
- meklēt dublikātus;
- identificēt iespējamu trūkstošu prasību;
- identificēt avotu izmaiņas.

Visi ir priekšlikumi.

## 38. AI aizliegumi

AI nedrīkst:
- pats apstiprināt prasību;
- pats gala veidā piešķirt REQUIREMENT LEVEL;
- izvest prasību no UNCLASSIFIED;
- pats pievienot / dzēst production prasību;
- mainīt apstiprinātu komponentu struktūru;
- apstiprināt SOURCE UNIVERSE pilnīgumu;
- pats atzīt veco matricu par aktuālu pēc avota izmaiņas;
- TASK laikā mainīt master matricu;
- pats piešķirt MODULE STATUS, lai aktivizētu sev prasību kopu.

## 39. Kandidātprasība TASK laikā

Ja TASK laikā atklāj potenciālu prasību, kas nav kopā:
- to nedrīkst klusējot pievienot master matricai;
- rada UNRESOLVED ISSUE / governance review ierakstu;
- konkrētā juridiskā analīze drīkst jautājumu ņemt vērā;
- master matrica mainās tikai governance procesā.

## 40. Jaunas prasības ietekme uz aktīvu TASK

Ja jauna prasību kopas versija apstiprināta aktīva TASK laikā, nepieciešams dokumentēts cilvēka lēmums:
- turpināt pret fiksēto sākotnējo versiju un atsevišķi izvērtēt jauno jautājumu; vai
- atkārtot / atjaunot pārbaudi pret jauno versiju.

TASK versiju nedrīkst klusējot nomainīt.

## 41. Fiksēta versija TASK ietvaros

TASK sākumā:
```text
REQUIREMENTS SET ID
REQUIREMENTS SET VERSION
```
tiek fiksēts.

COMPLETENESS CONTROL attiecas tieši uz šo versiju.

## 42. Vairākas prasību kopas

Vienam TASK var piemērot vairākas kopas:

```text
COMMON CONTRACT REVIEW
+
OUTSOURCING-EBA
+
ICT-DORA
```

tikai tiktāl, ciktāl katras kopas activation rule ir izpildīts.

Katrai saglabā atsevišķu izcelsmi, versiju un completeness control.

## 43. Dublikāti un pārklājums

Līdzīgas prasības nekonsolidē automātiski.

Pirms konsolidācijas pārbauda:
- juridisko pamatu;
- tvērumu;
- līmeni;
- piemērojamību;
- verifikācijas testu.

Provenance nedrīkst pazust.

## 44. CHANGE RECORD

Materiālai jaunai versijai:

```text
FROM VERSION
TO VERSION
CHANGED REQUIREMENTS
ADDED REQUIREMENTS
REMOVED REQUIREMENTS
CLASSIFICATION CHANGES
COMPONENT CHANGES
SOURCE BASIS CHANGES
APPLICABILITY CHANGES
CHANGE BASIS
PREPARED BY
APPROVED BY
APPROVAL REFERENCE
EFFECTIVE DATE
```

## 45. Historical reproducibility

Vēsturiskam TASK jāspēj noteikt:
- prasību kopas versiju;
- tās prasības;
- līmeņus;
- komponentus;
- task rezultātus.

Ja veco versiju nevar rekonstruēt, traceability ir nepilnīga.

## 46. Saistība ar LEGAL INTAKE

`OPERATION_WORKFLOWS_v1` nosaka:
- CONTRACT TYPE;
- faktu profilu;
- LEGAL CLASSIFICATION ASSESSMENT;
- cilvēka / ārējo lēmumu;
- MODULE STATUS.

Šis dokuments sāk savu lēmumu loģiku pēc šī punkta.

## 47. Saistība ar VERIFICATION_PROTOCOL

Šis dokuments nosaka, ko pārbaudīt.

`VERIFICATION_PROTOCOL_v1` nosaka, kā un kad gala rezultāts kļūst `HUMAN VERIFIED`.

Matrix governance nedrīkst samazināt verifikācijas slieksni.

## 48. Saistība ar TRACEABILITY

Traceability glabā:
- MODULE STATUS un classification references;
- REQUIREMENTS SET ID / VERSION;
- REQUIREMENT RESULT;
- evidence;
- verification.

Master matrix pati neglabā TASK rezultātus.

## 49. Pilota 3 minimums

Jāpārbauda vismaz:
1. MANDATORY EXTERNAL;
2. MANDATORY INTERNAL;
3. NEGOTIABLE;
4. UNCLASSIFIED un klasifikācija;
5. POSITIVE;
6. NEGATIVE;
7. salikta prasība;
8. multi-source SOURCE BASIS;
9. prasības semantiska maiņa ar jaunu ID;
10. redakcionāla maiņa ar saglabātu ID;
11. avota jauna redakcija;
12. prasības izņemšana;
13. kandidātprasība TASK laikā;
14. jauna set versija aktīva TASK laikā;
15. vairākas sets vienam TASK;
16. SOURCE UNIVERSE review;
17. EXCLUSION LOG;
18. historical reconstruction;
19. MODULE = NOT APPLICABLE → specializēta kopa netiek aktivizēta;
20. MODULE = UNCLEAR → tikai scenārija analīze;
21. AI mēģina aktivizēt prasību kopu no sava LIKELY klasifikācijas priekšlikuma → bloķēts.

## 50. Nākamais pārskata solis

Pirms freeze jāizvērtē:
- REQUIREMENT ID semantiskās identitātes noteikuma praktiskums;
- multi-source SOURCE BASIS slodze;
- approval authority reference modelis;
- EXCLUSION LOG uzturēšanas slodze;
- requirement-level applicability robeža;
- cik bieži universāla common-contract kopa piemērojama automātiski;
- vai Requirements Set Selection nepieciešams atsevišķs Traceability objekts vai pietiek ar TASK metadatiem.
