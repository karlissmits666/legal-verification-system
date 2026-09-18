# OUTSOURCING_EBA_MODULE_TRIGGER_SET_v0.1

OUTSOURCING-EBA kandidātmoduļa screening triggeru kopa

**Statuss:** MELNRAKSTS — RECENZIJAI; lifecycle = null  
**Versija:** v0.1  
**Datums:** 2026-09-18  
**Owner:** REQUIREMENTS_MATRIX_GOVERNANCE_v1  
**Module:** OUTSOURCING-EBA  
**Approval authority:** jurists + outsourcing manager  
**Production use:** AIZLIEGTS līdz source review + cilvēka apstiprinājumam

## 1. Mērķis

Šī kopa nosaka konservatīvus screening triggerus, kas atbild tikai uz jautājumu:

> Vai ir pietiekams pamats veikt FULL LEGAL CLASSIFICATION ASSESSMENT par iespējamu OUTSOURCING-EBA piemērojamību?

Šī kopa pati nepiešķir:
- APPLICABLE;
- NOT APPLICABLE;
- UNCLEAR;
- LEGAL APPROVED.

```text
TRIGGER IDENTIFIED
≠ OUTSOURCING CONFIRMED

NO TRIGGER IDENTIFIED
≠ NOT APPLICABLE
```

## 2. Pašreizējais ārējais regulējuma pamats

Pašreizējā drafta juridiskais pamats ir EBA/GL/2019/02 Guidelines on outsourcing arrangements, kas 2026-09-18 joprojām ir piemērojamas.

2026-09-18 EBA publicēja galīgās Guidelines on the sound management of third-party risk related to non-ICT services. Tās vēl nav piemērojamas un, kad kļūs piemērojamas, aizstās EBA/GL/2019/02.

Tādēļ šai trigger kopai ir:
```text
CURRENT BASIS: EBA/GL/2019/02
TRANSITION WATCH: REQUIRED
```

Pirms production aktivizācijas jāpārbauda, vai EBA jaunajām third-party risk vadlīnijām jau ir noteikts piemērošanas datums un vai trigger loģika nav jāmaina.

## 3. Avotu bāze

### S1 — EBA/GL/2019/02
Galvenā outsourcing definīcija:
ārpakalpojums ir arrangement, kur service provider veic procesu, pakalpojumu vai darbību, ko citādi veiktu pati iestāde.

### S2 — EBA/GL/2019/02, para. 26
Klasifikācijā jāvērtē:
- vai funkcija / tās daļa tiek veikta recurrent vai ongoing basis;
- vai funkcija parasti ietilptu tādu funkciju lokā, ko iestāde veiktu vai reāli varētu veikt pati, arī ja iepriekš pati to nav veikusi.

### S3 — EBA Single Rulebook Q&A 2020_5220
EBA atkārtoti apstiprina para. 26 pieeju un to, ka cloud / cits pakalpojuma veids pats par sevi neatrisina outsourcing klasifikāciju.

### S4 — EBA Single Rulebook Q&A 2020_5100
Trešo personu CDD reliance AMLD izpratnē nav automātiski outsourcing; tas ir piemērs, ka ārēja pakalpojuma esamība pati par sevi nav pietiekama.

### S5 — EBA/GL/2019/02 para. 28
Pastāv atsevišķi gadījumi, kas nav uzskatāmi par outsourcing. Screening nedrīkst ignorēt para. 28 exclusion review.

### S6 — 2026 EBA final Guidelines on third-party risk
Nav vēl piemērojamas. Tās ir transition watch avots, ne pašreizējais production classification basis.

## 4. Triggeru dizaina princips

Triggeri ir apzināti jutīgi un konservatīvi.

Mērķis nav "pierādīt outsourcing", bet samazināt risku, ka iespējams outsourcing netiek nosūtīts uz FULL LCA.

Trigger var būt:
- pozitīvs fakta signāls;
- kombinēts fakta + juridiska avota signāls;
- exclusion uncertainty signāls.

## 5. Triggeri

### OEB-T01 — ārējs service provider veic institūcijas procesu / pakalpojumu / darbību

```text
TRIGGER:
Trešā persona faktiski veic procesu, pakalpojumu, darbību vai tās daļu,
kas pēc būtības varētu piederēt bankas pašas darbībai.
```

Source basis:
- EBA/GL/2019/02 outsourcing definition;
- EBA Q&A 2020_5220.

Screening evidence:
- līguma priekšmets;
- service description / SoW;
- business owner input;
- cits avots, kas apraksta faktisko funkciju.

### OEB-T02 — funkcija tiek sniegta recurrent vai ongoing basis

```text
TRIGGER:
Pakalpojums / funkcija nav tikai vienreizējs izolēts rezultāts,
bet tiek sniegta atkārtoti vai pastāvīgi.
```

Source basis:
- EBA/GL/2019/02 para. 26;
- EBA Q&A 2020_5220.

Piezīme:
viens pats šis trigger nepierāda outsourcing.

### OEB-T03 — funkciju banka veic vai reāli varētu veikt pati

```text
TRIGGER:
Funkcija ietilpst tādu funkciju lokā, ko banka veic, būtu varējusi veikt
vai reāli varētu veikt pati, pat ja vēsturiski to nav darījusi.
```

Source basis:
- EBA/GL/2019/02 para. 26;
- EBA Q&A 2020_5220.

### OEB-T04 — nav nepārprotami konstatējams, ka piegādātājs tikai piegādā preci / licenci / neatkarīgu konsultāciju

```text
TRIGGER:
No FACT PROFILE nav nepārprotami konstatējams, ka piegādātāja loma aprobežojas
tikai ar preces piegādi, licences piešķiršanu vai neatkarīgu konsultāciju /
eksperta rezultātu un ka piegādātājs neveic bankas procesa, pakalpojuma vai
darbības daļas faktisku izpildi.
```

Source basis:
- konservatīvs screening noteikums, kas operacionalizē EBA outsourcing definīcijas robežu.

Screening rule:
- ja no faktiem ir nepārprotami redzams tikai preces/licences/neatkarīgas konsultācijas modelis, T04 nav;
- ja tas nav nepārprotami nosakāms no FACT PROFILE, T04 = identified → FULL LCA.

T04 klātbūtne neprasa juridisku spriedumu screening posmā; neskaidrība pati aktivizē FULL LCA.

### OEB-T05 — FACT PROFILE rāda atkārtotu iesaisti bankas operacionāla procesa izpildē

```text
TRIGGER:
FACT PROFILE satur vismaz vienu konkrētu pazīmi, ka piegādātāja darbība atkārtoti
piedalās bankas procesa izpildē, piemēram:
- piegādātājs periodiski veic procesa soli;
- piegādātāja rezultāts regulāri tiek izmantots nākamajā bankas procesa solī;
- bankas darbinieki atkārtoti paļaujas uz piegādātāja izpildi, lai pabeigtu procesu;
- piegādātājs uztur nepārtrauktu operacionālu funkciju, ne tikai nodod vienreizēju rezultātu.
```

Source basis:
- EBA para. 26 recurrent / ongoing criterion;
- faktos balstīta screening operacionalizācija.

Ja no FACT PROFILE nav iespējams noteikt, vai šāda atkārtota operacionāla iesaiste pastāv:
→ T05 = identified screening vajadzībām
→ FULL LCA.

### OEB-T06 — neskaidrs, vai funkcija ietilpst para. 28 izņēmumā

```text
TRIGGER:
Pastāv pamatota neskaidrība, vai pakalpojums ir viens no EBA/GL/2019/02
para. 28 gadījumiem, kas nav uzskatāmi par outsourcing.
```

Sekas:
```text
UNCERTAIN EXCLUSION
→ FULL LCA
```

Šis trigger novērš kļūdu:
```text
"izskatās pēc parasta pirkuma"
→ automātiski NOT OUTSOURCING
```

### OEB-T07 — bankas iekšējā outsourcing politika / checklist signalizē par izvērtējumu

```text
TRIGGER:
Bankas apstiprināts iekšējais outsourcing dokuments, checklist vai process
paredz, ka konkrētais pakalpojuma veids / fakti jānosūta outsourcing klasifikācijai.
```

Source basis:
- BANK INTERNAL SOURCE REQUIRED.

Status:
```text
PLACEHOLDER — NOT OPERATIONALLY USABLE
```

Līdz faktiskā bankas avota pievienošanai šo trigger nevar izmantot kā source-based trigger.

Pirms trigger set drīkst iegūt lifecycle = ACTIVE, OEB-T07:
- vai nu tiek aizpildīts ar konkrētu bankas iekšējā avota identitāti, versiju un source basis;
- vai tiek izņemts no trigger set.

Placeholder nedrīkst pāriet ACTIVE versijā.

## 6. Kas NAV trigger pēc noklusējuma

Šādas pazīmes vienas pašas nedrīkst aktivizēt outsourcing LCA:

- līguma nosaukumā ir "service";
- līgums ir SaaS / cloud;
- pakalpojums ir IT;
- pakalpojums ir ilgtermiņa;
- piegādātājs ir ārēja juridiska persona;
- līgumā ir SLA;
- ir personas datu apstrāde;
- ir apakšuzņēmēji.

Tās var būt FACT PROFILE elementi un kombinācijā kļūt materiālas, bet pašas par sevi nepierāda EBA outsourcing.

## 7. Screening loģika

```text
FOR EACH ACTIVE TRIGGER:
  evaluate against traceable FACT PROFILE

IF one or more triggers identified:
  → TRIGGERS IDENTIFIED = [IDs]
  → FULL LCA

IF no triggers identified:
  → TRIGGERS IDENTIFIED = []
  → screening complete
  → this is NOT MODULE STATUS = NOT APPLICABLE
```

## 8. Obligātie FACT PROFILE avoti screening laikā

Screening nedrīkst balstīties tikai uz dokumenta nosaukumu.

Jāpārbauda vismaz, ja pieejams:
- contract subject;
- service description / SoW;
- duration / recurrence;
- business owner description of actual service;
- whether bank currently performs / could realistically perform the function;
- internal outsourcing checklist / policy signal;
- relevant para. 28 exclusion question.

Ja kāds klasifikācijai materiāls fakts ir trūkstošs:
```text
SHORT INTAKE cannot close the module
→ FULL LCA or HUMAN INPUT REQUIRED
```

## 9. Exclusion review

Para. 28 exclusion review ir atsevišķs FULL LCA elements.

Screening nedrīkst pārvērst exclusion piemēru par automātisku NOT APPLICABLE rule.

Īpaši:
- ārējs profesionāls pakalpojums;
- preces / standartizēti produkti;
- cits pakalpojums, ko banka parasti pati neveic,

jāvērtē pret aktuālo EBA para. 28 tekstu un bankas iekšējo metodoloģiju.

## 10. Screening record piemērs

```text
MODULE: OUTSOURCING-EBA
TRIGGER SET ID: MTR-OUTSOURCING-001
TRIGGER SET VERSION: 0.1-draft

SCREENED MODULES:
- OUTSOURCING-EBA

TRIGGERS IDENTIFIED:
- OEB-T01
- OEB-T02
- OEB-T03

SCREENED BY:
[lawyer]

SCREENED AT:
[timestamp]

RESULT:
FULL LCA REQUIRED
```

"RESULT" šeit ir darba plūsmas rezultāts, ne MODULE STATUS.

## 11. Cilvēka apstiprināšanas prasība

Pirms lifecycle = ACTIVE:
1. jurists pārbauda ārējo source basis;
2. outsourcing manager pārbauda praktisko screening atbilstību bankas klasifikācijas procesam;
3. bankas iekšējie avoti tiek pievienoti;
4. OEB-T07 placeholder tiek aizpildīts vai izņemts;
5. tiek pārbaudīta para. 28 exclusion loģika;
6. tiek pārbaudīta saderība ar 2026 EBA third-party risk pāreju;
7. tiek veikts retrospektīvs kalibrācijas pilots pret vismaz 15–20 reāli noslēgtiem līgumiem no pietiekami reprezentatīva perioda;
8. pilotā obligāti ietver:
   - skaidru outsourcing gadījumu;
   - skaidru non-outsourcing gadījumu;
   - robežgadījumu;
   - para. 28 exclusion kandidātu;
   - dažādus CONTRACT TYPE.

Pilotā izmēra vismaz:
- cik % līgumu trigger set nosūta uz FULL LCA;
- kuri triggeri nostrādā visbiežāk;
- false-negative gadījumus;
- false-positive / pārmērīgas eskalācijas gadījumus.

Ja OEB-T03 vai cits triggers nosūta gandrīz visus līgumus uz FULL LCA, trigger set pirms ACTIVE jāpārskata un jebkura sašaurināšana jāpamato avotos.

## 12. Transition watch — 2026 EBA third-party risk Guidelines

2026-09-18 EBA publicēja final Guidelines on sound management of third-party risk related to non-ICT services.

EBA norāda:
- tās vēl nav piemērojamas;
- kad kļūs piemērojamas, tās aizstās 2019 outsourcing guidelines;
- paredzēts divu gadu transition period.

Tāpēc šim trigger set pirms ACTIVE vai katras material review jābūt:
```text
TRANSITION CHECK:
Has the new EBA TPR regime become applicable?
YES → this trigger set must be revalidated before use.
NO  → current basis remains EBA/GL/2019/02.
```

## 13. Atvērtie review jautājumi

1. Vai OEB-T04 un OEB-T05 ir pietiekami precīzi, vai tie dublē T01–T03?
2. Vai para. 28 exclusion review nepieciešams atsevišķs EXCLUSION TRIGGER SET?
3. Kādi bankas iekšējie outsourcing checklist kritēriji jāpievieno kā source-based triggeri?
4. Vai trigger set jāaptver arī group / intra-group arrangements īpaši?
5. Vai triggeri jāpiesaista konkrētiem CONTRACT TYPE tikai kā screening hints, ne kā juridiski noteikumi?
6. Kā 2026 EBA third-party risk režīms mainīs outsourcing jēdziena lomu pēc tā piemērošanas sākuma?

## 14. Statuss

```text
TRIGGER SET ID: MTR-OUTSOURCING-001
VERSION: 0.1-draft
LIFECYCLE: null
APPROVED BY: null
APPROVAL REFERENCE: null
BLOCKING ARCHITECTURE ISSUES: 0
OPEN LEGAL / GOVERNANCE REVIEW: YES
PRODUCTION USE: NO
```
