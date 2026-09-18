# LEGAL_RESEARCH_METHOD_v1

Juridiskās izpētes un argumentētas juridiskās klasifikācijas metodoloģija

**Statuss:** MELNRAKSTS — KONSOLIDĒTS v0.2 PAKETEI  
**Versija:** v0.2  
**Bāze:**  
- `PROFESSIONAL_SCOPE_v1.4` — MELNRAKSTS  
- `TRACEABILITY_RECORD_v1 — Arhitektūra v0.6` — MELNRAKSTS  
- `TERMINOLOGY_AND_ENUMS_v1 — v0.4` — MELNRAKSTS  
- `OPERATION_WORKFLOWS_v1 — v0.1` — MELNRAKSTS

## 1. Mērķis

Šis dokuments nosaka, kā sistēma un jurists:
- nosaka piemērojamos juridiskos avotus;
- izpēta juridisku / regulatīvu klasifikācijas jautājumu;
- nošķir saistošu avotu no palīgmateriāla;
- identificē argumentus par un pret klasifikāciju;
- fiksē neskaidrības un trūkstošos faktus;
- sagatavo `LEGAL CLASSIFICATION ASSESSMENT`;
- izmanto kvalitatīvu varbūtības novērtējumu bez pseidoprecīziem procentiem.

## 2. Pamatprincips

Juridiskā klasifikācija nav atslēgvārdu meklēšana.

Secinājumu veido:
```text
FACTS
+
APPLICABLE LEGAL SOURCES
+
OFFICIAL INTERPRETIVE MATERIALS
+
CASE LAW / SUPERVISORY PRACTICE
+
INTERNAL GOVERNANCE, ja piemērojams
+
PERSUASIVE SECONDARY MATERIALS
+
COUNTERARGUMENTS
+
UNCERTAINTY
```

Nevienu palīgmateriālu nedrīkst pasniegt kā saistošu ārējo tiesību avotu, ja tas tāds nav.

## 3. Avotu lomas

Avotu svaru nosaka ne tikai kvalitāte, bet arī tas, ko ar tiem mēģina pierādīt.

### A. Primārie saistošie ārējie avoti

Piemēri:
- ES regulas un citi tieši piemērojami akti;
- piemērojamie nacionālie tiesību akti;
- citi saistoši normatīvie akti;
- tiesu nolēmumi tajā apjomā, kādā tiem konkrētajā jurisdikcijā ir autoritatīva nozīme.

Tie ir primārais pamats ārējās juridiskās klasifikācijas secinājumam.

### B. Oficiāli interpretējoši un uzraudzības avoti

Piemēri:
- EBA / EIOPA / ESMA vadlīnijas un Q&A;
- ECB vai nacionālā uzrauga vadlīnijas;
- Eiropas Komisijas oficiāli skaidrojumi;
- uzraudzības iestāžu publicēta prakse vai interpretācijas.

Tie var būt ļoti nozīmīgi klasifikācijas interpretācijā, bet to juridiskā saistošuma raksturs jānorāda precīzi.

### C. Tiesu un administratīvā prakse

Jānorāda:
- jurisdikcija;
- instance;
- datums;
- faktiskā līdzība;
- vai nolēmums ir saistošs, autoritatīvs vai tikai pārliecinošs.

Atšķirīgs faktiskais konteksts nedrīkst tikt ignorēts.

### D. Bankas iekšējie avoti

Piemēri:
- Outsourcing Policy;
- ICT / DORA politika;
- Procurement Policy;
- Third Party Risk Policy;
- apstiprināti checklist;
- iekšēji metodiskie materiāli.

Tie var noteikt bankas iekšējo procesu un klasifikācijas kārtību.

Tie paši par sevi nepierāda ārējo tiesību saturu.

### E. Juridiskā doktrīna un profesionāli komentāri

Piemēri:
- juridiskie komentāri;
- profesionāli raksti;
- atzītu juridisko izdevēju materiāli;
- praktiskie skaidrojumi.

Tie ir palīgavoti interpretācijas izvērtēšanai, ne saistošs pamats.

### F. Nozares prakse

Piemēri:
- tirgus standarti;
- profesionālo asociāciju materiāli;
- tipveida līgumi;
- publiski aprakstīta banku / finanšu nozares prakse.

Nozares prakse var palīdzēt saprast robežgadījumu vai tirgus interpretāciju, bet nevar aizstāt saistošu normu.

### G. Citi palīgmateriāli

Var izmantot tikai ar skaidru avota kvalitātes ierobežojumu.

## 4. Avotu konflikts

Ja avoti konfliktē:
- saistošāks un kompetentāks avots parasti prevalē pār zemāka autoritātes avotu;
- jaunāks avots prevalē tikai tad, ja tas tiešām aizstāj vai aktualizē iepriekšējo;
- iekšējais bankas noteikums nevar samazināt ārēju saistošu prasību;
- nozares prakse nevar atcelt tiesību aktu vai oficiālu regulatora interpretāciju.

Konflikts jāatspoguļo `LEGAL CLASSIFICATION ASSESSMENT`, nevis jāpaslēpj.

## 5. Klasifikācijas izpētes secība

```text
CLASSIFICATION QUESTION
↓
FACTS / ASSUMPTIONS / MISSING FACTS
↓
PRIMARY LEGAL SOURCES
↓
OFFICIAL GUIDANCE / SUPERVISORY MATERIAL
↓
CASE LAW / DECISIONS
↓
INTERNAL GOVERNANCE
↓
DOCTRINE / INDUSTRY PRACTICE
↓
SUPPORTING ARGUMENTS
↓
COUNTERARGUMENTS
↓
UNCERTAINTIES
↓
QUALITATIVE LIKELIHOOD
↓
PROPOSED CLASSIFICATION
↓
HUMAN / EXTERNAL DECISION
```

## 6. Faktiskā pamata disciplīna

Katram klasifikācijas argumentam jāspēj noteikt, vai tas balstās uz:
- VERIFIED FACT;
- USER / BUSINESS INPUT;
- DOCUMENTED SOURCE FACT;
- ASSUMPTION;
- MISSING INFORMATION.

Pieņēmumu nedrīkst klusējot pārvērst par faktu.

Ja trūkstošs fakts var būtiski mainīt klasifikāciju, `QUALITATIVE LIKELIHOOD` nedrīkst būt `LIKELY` vai `UNLIKELY`.

Ja klasifikācijai materiāls FINDING ir `ASSUMPTION = true`, QUALITATIVE LIKELIHOOD = INDETERMINATE, izņemot gadījumu, kad pilnvarotais cilvēks savā lēmumā šo konkrēto pieņēmumu ir tieši pieņēmis un fiksējis.

## 7. Supporting un countervailing analīze

Katram materiālam klasifikācijas jautājumam sistēma meklē ne tikai pamatojumu izvēlētajam secinājumam, bet arī:
- faktus, kas runā pret;
- juridiskus izņēmumus;
- konkurējošu interpretāciju;
- materiālus, kas norāda uz citu klasifikāciju.

AI nedrīkst veikt tikai apstiprinošu meklēšanu.

FULL LCA gadījumā COUNTERARGUMENTS / COUNTERVAILING REVIEW ir obligāti aizpildāms lauks.

Derīgs saturs drīkst būt:
```text
No material counterarguments identified after review of [scope/sources].
```

Tukšs lauks nav derīgs. Ja counterargument review nav pabeigts, QUALITATIVE LIKELIHOOD nevar būt LIKELY vai UNLIKELY; tas paliek INDETERMINATE.

## 8. CLASSIFICATION LIKELIHOOD REGISTRY

Šis dokuments ir `CLASSIFICATION LIKELIHOOD REGISTRY` īpašnieks.

| Canonical | Machine key | LV apzīmējums |
|---|---|---|
| LIKELY | `likely` | Ticami |
| INDETERMINATE | `indeterminate` | Nav pietiekami nosakāms |
| UNLIKELY | `unlikely` | Maz ticami |

### LIKELY

Pieejamie fakti un autoritatīvākie avoti kopumā vairāk atbalsta kandidātklasifikāciju nekā alternatīvu, un nav zināma neatrisināta fakta, kas acīmredzami neļauj izdarīt šo provizorisko secinājumu.

### INDETERMINATE

Vismaz viens no apstākļiem:
- būtiski trūkst faktu;
- autoritatīvie avoti ir neskaidri vai konfliktē;
- argumenti par un pret ir līdzsvaroti;
- pastāv materiāls juridisks robežgadījums.

### UNLIKELY

Pieejamie fakti un autoritatīvākie avoti kopumā vairāk runā pret kandidātklasifikāciju.

## 9. Kvalitatīvā varbūtība nav gala statuss

`LIKELY / INDETERMINATE / UNLIKELY`:
- nav statistiskas varbūtības;
- nav procenti;
- nav `MODULE STATUS`;
- nav `LEGAL APPROVED`;
- neizraisa automātisku prasību kopas aktivizēšanu.

Nav atļauts:
```text
LIKELY → APPLICABLE
UNLIKELY → NOT APPLICABLE
INDETERMINATE → UNCLEAR
```
kā automātiska konversija.

Cilvēka lēmums paliek atsevišķs.

## 10. Procentu aizliegums bez kalibrācijas

Sistēma nedrīkst rakstīt:
```text
82% probability of outsourcing
67% chance that DORA applies
```

ja nav iepriekš validēta statistiska modeļa ar dokumentētu kalibrāciju, mērķpopulāciju, kļūdu metriku un governance apstiprinājumu.

Pašreizējā sistēmas versijā šāda mehānisma nav.

## 11. LEGAL CLASSIFICATION ASSESSMENT minimums

```text
CLASSIFICATION QUESTION
CANDIDATE CLASSIFICATION
RELEVANT FACTS
FACT SOURCES
PRIMARY AUTHORITIES
OFFICIAL GUIDANCE
CASE LAW / SUPERVISORY MATERIAL
INTERNAL GOVERNANCE
SECONDARY / INDUSTRY MATERIALS
SUPPORTING ARGUMENTS
COUNTERARGUMENTS
UNCERTAINTIES
MISSING INFORMATION
QUALITATIVE LIKELIHOOD
PROPOSED CLASSIFICATION
AUTHORITY REQUIRED
```

Ne katram laukam obligāti jābūt aizpildītam, ja attiecīgā avotu kategorija nav nepieciešama. Tukšums nedrīkst radīt iespaidu, ka kategorija tika pārbaudīta, ja tā netika pārbaudīta.

## 12. Outsourcing piemērs

Jautājums:
```text
Vai pakalpojums kvalificējas kā outsourcing?
```

Analīzei jāspēj parādīt:
- pakalpojuma faktiskā būtība;
- ilgums un atkārtojamība;
- vai darbība funkcionāli pieder bankas procesam;
- ārējā regulējuma definīcijas;
- EBA vadlīniju piemērojamās pazīmes;
- bankas Outsourcing Policy;
- argumenti par klasifikāciju;
- argumenti pret;
- trūkstošā informācija;
- kvalitatīvais novērtējums.

Gala lēmums paliek juristam + outsourcing manager saskaņā ar `PROFESSIONAL_SCOPE_v1.4`.

## 13. ICT / DORA piemērs

Jautājums:
```text
Vai pakalpojums kvalificējas kā IKT pakalpojums un vai ICT-DORA modulis ir piemērojams?
```

Analīzei jāspēj nošķirt:
- līguma nosaukumu;
- faktisko tehnisko pakalpojumu;
- programmatūras / hostinga / datu apstrādes elementus;
- piemērojamās DORA definīcijas;
- regulatoru / ESA materiālus;
- bankas iekšējo DORA / ICT metodoloģiju;
- robežgadījumus un izņēmumus.

## 14. Avotu aktualitāte

Katram materiālam juridiskajam avotam jāfiksē, kur iespējams:
- avota identitāte;
- versija / redakcija;
- publicēšanas vai spēkā stāšanās datums;
- piekļuves / pārbaudes datums.

Sistēma nedrīkst izmantot vecāku avotu kā aktuālu, ja ir zināma jaunāka piemērojamā redakcija.

## 15. Jurisdikcija

Pirms nacionāla tiesību avota izmantošanas jāpārbauda jurisdikcija.

`PROFESSIONAL_SCOPE_v1.4` jurisdikcijas noklusējumi paliek spēkā.

Citas valsts praksi drīkst izmantot kā salīdzinošu vai pārliecinošu materiālu tikai ar skaidru ierobežojumu.

## 16. Research log minimums

Materiālai klasifikācijas analīzei saglabā vismaz:
- izmantotos avotus;
- būtiskās meklēšanas tēmas;
- galvenos supporting avotus;
- galvenos countervailing avotus;
- avotu aktualitātes informāciju;
- neatbildētos jautājumus.

Search term saraksts pats par sevi nepierāda izpētes pilnīgumu.

## 17. Kad izpēte ir nepietiekama

Rezultāts ir nepietiekams, ja:
- izmantoti tikai sekundārie avoti, lai gan primārie ir pieejami;
- nav pārbaudīta aktuālā redakcija;
- nav analizēti būtiski pretargumenti;
- trūkstošie fakti var mainīt klasifikāciju, bet nav norādīti;
- AI secinājums balstās uz dokumenta nosaukumu, ne faktisko saturu;
- nozares prakse tiek pasniegta kā tiesību norma.

## 17.1. Candidate-module screening robeža

Candidate-module screening nav pilna juridiskā izpēte un neizmanto šo dokumentu kā aizvietotāju MODULE TRIGGER REGISTRY.

Screening atbild tikai:
> vai ir identificēts iepriekš apstiprināts trigger, kas prasa FULL LCA?

Ja trigger identificēts, šī dokumenta metodoloģija piemērojama FULL LCA.

## 18. Dokumenta robeža

Šis dokuments nenosaka gala moduļa autoritāti vai CONTRACT TYPE taxonomy.

Tas nosaka juridiskās izpētes kvalitātes un argumentācijas metodi.

## 19. Pilota mērķi

Pilotā jāpārbauda vismaz:
1. skaidrs outsourcing gadījums;
2. skaidrs non-outsourcing gadījums;
3. robežgadījums ar trūkstošiem faktiem;
4. ICT/DORA robežgadījums;
5. avotu konflikts;
6. vecs regulatora materiāls pret jaunāku;
7. nozares prakse, kas konfliktē ar primāro avotu;
8. AI sākotnēji izvēlas vienu klasifikāciju, bet counterargument research to maina;
9. `LIKELY` gadījums;
10. `INDETERMINATE` gadījums;
11. `UNLIKELY` gadījums.

## 20. Nākamais pārskata solis

Pirms freeze jāizvērtē:
- vai trīs līmeņu likelihood skala ir pietiekama;
- cik obligāta ir counterargument meklēšana vienkāršos gadījumos;
- avotu kategoriju praktiskā pieejamība Legora;
- kā saglabāt research log bez pārmērīgas manuālas slodzes;
- vai konkrētām klasifikācijām nepieciešami atsevišķi mini-playbook.
