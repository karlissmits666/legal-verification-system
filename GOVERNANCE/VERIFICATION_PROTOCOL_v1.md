# VERIFICATION_PROTOCOL_v1

Juridiskās pārbaudes sistēmas semantiskās verifikācijas protokols

**Statuss:** MELNRAKSTS — ARHITEKTŪRAS APSPRIEŠANAI  
**Versija:** v0.1  
**Bāze:**  
- `PROFESSIONAL_SCOPE_v1.3` — APSTIPRINĀTS, PAMATVERSIJA IESALDĒTA  
- `TRACEABILITY_RECORD_v1` — Arhitektūra v0.4 — APSTIPRINĀTS, PAMATVERSIJA IESALDĒTA  
- `TERMINOLOGY_AND_ENUMS_v1` — v0.2 — APSTIPRINĀTS, PAMATVERSIJA IESALDĒTA

## 1. Mērķis

Šis dokuments nosaka, kad un kā secinājums drīkst pāriet no:

```text
EVIDENCE BOUND — AI PROPOSED
```

uz:

```text
HUMAN VERIFIED
```

Tas nosaka:
- verifikācijas objektu;
- atļautās verifikācijas metodes;
- minimālo pārbaudes dziļumu;
- verifikācijas prasības dažādiem secinājumu tipiem;
- negatīvu prasību un neesamības secinājumu pārbaudi;
- saliktu prasību verifikāciju;
- verifikācijas notikuma saturu;
- kļūdas / nepietiekama pamata gadījumā piemērojamo rīcību;
- izdošanas vārtu sasaisti ar verifikāciju.

Šis dokuments nenosaka prasību saturu, prasību līmeņus vai datu klašu atļaujas.

## 2. Trīs kontroles paliek nodalītas

`COMPLETENESS CONTROL`, `EVIDENCE BINDING` un `SEMANTIC VERIFICATION` nav savstarpēji aizstājamas.

```text
COMPLETENESS CONTROL
→ vai pārbaudīta visa apstiprinātā prasību kopa?

EVIDENCE BINDING
→ uz kādu precīzu avota fragmentu un vietu balstās secinājums?

SEMANTIC VERIFICATION
→ vai secinājums par avota nozīmi ir pareizs?
```

Tikai trešā kontrole piešķir `HUMAN VERIFIED`.

## 3. Pamatinvarianti

1. MI vienprātība nav verifikācija.
2. Otrs Legora secinājums nav verifikācija.
3. Verifikācijas līmenis palielinās tikai ar dokumentētu `VERIFICATION EVENT`.
4. Verifikācija attiecas uz konkrētu apgalvojumu vai konkrētu prasības rezultātu.
5. Verifikāciju nevar mantot tikai tādēļ, ka rezultāts ievietots citā uzdevumā.
6. `HUMAN VERIFIED` nenozīmē `LEGAL APPROVED`.
7. Cilvēka verifikācija neaizstāj `EVIDENCE BINDING`.
8. Verifikācija nevar izvest prasību no `UNCLASSIFIED`.
9. Verifikācija nevar mainīt `REQUIREMENT LEVEL`.
10. Ja verificētājs nevar droši apstiprināt secinājumu, rezultāts nepaaugstinās līdz `HUMAN VERIFIED`.

## 4. Verifikācijas objekti

Verificēt var:

```text
FINDING
REQUIREMENT
REQUIREMENT COMPONENT
```

`OUTPUT` nesaņem vienu universālu verifikācijas līmeni. Tā verifikācijas kopsavilkums tiek veidots no saistīto objektu faktiskajiem līmeņiem.

## 5. Verifikācijas metožu reģistrs

Šis dokuments ir `VERIFICATION METHOD REGISTRY` īpašnieks.

### 5.1. HUMAN_EVIDENCE_CONTEXT_REVIEW

**LV apzīmējums:** Cilvēka pārbaude pret pierādījumu un nepieciešamo kontekstu  
**Machine key:** `human_evidence_context_review`

Izmanto, ja secinājums ir pozitīvi pamatots ar identificētu evidence un gala nozīmes pārbaudei pietiek ar:
- precīzo fragmentu;
- nepieciešamajām definīcijām;
- cross-reference;
- pielikumiem vai citiem sasaistītiem fragmentiem;
- prasības tekstu un juridisko kontekstu.

Verificētājs atver sākotnējo avotu, nevis paļaujas tikai uz MI kopsavilkumu.

### 5.2. HUMAN_APPLICABLE_SCOPE_REVIEW

**LV apzīmējums:** Cilvēka pārbaude visā piemērojamajā avota tvērumā  
**Machine key:** `human_applicable_scope_review`

Izmanto, ja secinājums ir atkarīgs no tā, vai noteikums / ierobežojums / izņēmums kaut kur piemērojamajā avota tvērumā pastāv vai nepastāv.

Pārbaudes tvērums tiek fiksēts `VERIFICATION EVENT`.

Šī metode ir obligāta vismaz:
- NEGATIVE REQUIREMENT;
- secinājumam `NAV IZPILDĪTS`, ja pamats ir prasītā nosacījuma neesamība;
- jebkuram citam secinājumam par neesamību, kuru nevar pierādīt ar pozitīvu fragmentu.

Meklēšanas rezultāts vai MI apgalvojums “nav atrasts” šo metodi neaizstāj.

### 5.3. HUMAN_SOURCE_SET_REVIEW

**LV apzīmējums:** Cilvēka pārbaude pret visu noteikto avotu kopu  
**Machine key:** `human_source_set_review`

Izmanto, ja secinājums atkarīgs no vairākiem dokumentiem vai dokumentu kopas un nav droši verificējams, pārbaudot tikai vienu avotu.

Piemēri:
- pamatlīgums + pielikumi;
- līgums + definīciju pielikums;
- iekšējā politika + apstiprināšanas matrica;
- vairāki dokumenti, kas kopā nosaka prasības izpildi.

Pārbaudītā avotu kopa jāidentificē Traceability.

### 5.4. VALIDATED_NON_AI_MECHANISM

**LV apzīmējums:** Iepriekš validēts ne-MI verifikācijas mehānisms  
**Machine key:** `validated_non_ai_mechanism`

Šī metode ir rezervēta frozen `PROFESSIONAL_SCOPE_v1.3` 17.3. paredzētajai iespējai.

Pašreizējā sistēmas versijā nav neviena automātiski atļauta mehānisma.

Metodi drīkst aktivizēt tikai tad, ja:
- mehānisms ir iepriekš validēts;
- apstiprināts konkrētajam prasības / secinājuma tipam;
- versēts;
- tam ir noteikts izmantošanas tvērums un ierobežojumi.

Līdz tam metode ir reģistrēta, bet nav `ACTIVE` production lietošanai.

## 6. Minimālais cilvēka verifikācijas slieksnis

Frozen minimums:

`HUMAN VERIFIED` ir obligāts:
- `MANDATORY EXTERNAL`;
- `MANDATORY INTERNAL`;
- jebkurai `NEGATIVE` prasībai neatkarīgi no līmeņa.

`UNCLASSIFIED` ir atsevišķs blocking governance stāvoklis. Konkrēta TASK verifikācija nedrīkst to “izārstēt”; materiāls rezultāts paliek bloķēts līdz prasība klasificēta `REQUIREMENTS_MATRIX` pārvaldībā.

`NEGOTIABLE` pozitīva prasība drīkst palikt `EVIDENCE BOUND — AI PROPOSED`, ja cits noteikums neprasa cilvēka verifikāciju.

Protokols drīkst prasīt cilvēka verifikāciju plašāk, bet nedrīkst samazināt frozen minimumu.

## 7. Prasības statusa un metodes matrica

### 7.1. IZPILDĪTS

Ja statuss balstās uz pozitīvu tekstu:
- minimums: `HUMAN_EVIDENCE_CONTEXT_REVIEW`;
- ja nozīme veidojas no vairākiem avotiem: `HUMAN_SOURCE_SET_REVIEW`.

### 7.2. NAV IZPILDĪTS — pozitīvi pierādāma neatbilstība

Ja ir konkrēts teksts, kas tieši pierāda neatbilstību:
- minimums: `HUMAN_EVIDENCE_CONTEXT_REVIEW`;
- ja neatbilstību nosaka vairāku avotu kombinācija: `HUMAN_SOURCE_SET_REVIEW`.

### 7.3. NAV IZPILDĪTS — nosacījuma neesamība

Ja statuss balstās uz to, ka prasītais nosacījums nav atrodams:
- obligāti: `HUMAN_APPLICABLE_SCOPE_REVIEW`;
- ja prasība var tikt izpildīta vairākos dokumentos: `HUMAN_SOURCE_SET_REVIEW`.

MI vai meklēšanas rīka “not found” nav pietiekams pamats.

### 7.4. NAV PIERĀDĪTS

`NAV PIERĀDĪTS` drīkst kļūt `HUMAN VERIFIED`, ja cilvēks pārbauda, ka ar pieejamo avotu kopu nav pietiekama pamata ne `IZPILDĪTS`, ne `NAV IZPILDĪTS`.

Minimālā metode ir atkarīga no iemesla:
- ja trūkst konkrēta ievaddata / avota: `HUMAN_EVIDENCE_CONTEXT_REVIEW`;
- ja nepietiekamība izriet no vairākiem avotiem: `HUMAN_SOURCE_SET_REVIEW`;
- ja secinājums faktiski balstās uz iespējamu neesamību: `HUMAN_APPLICABLE_SCOPE_REVIEW`.

## 8. Negatīvas prasības

NEGATIVE REQUIREMENT gala statuss vienmēr prasa cilvēka verifikāciju.

Obligāti:
1. noteikt piemērojamo avota tvērumu;
2. pārbaudīt visu šo tvērumu;
3. ņemt vērā sinonīmus, alternatīvus formulējumus, definīcijas, cross-references un pielikumus;
4. fiksēt pārbaudīto tvērumu;
5. fiksēt verifikācijas rezultātu.

Meklēšanas terminu saraksts ir palīglīdzeklis, ne verifikācija.

## 9. Evidence un verifikācijas attiecība

Pirms `HUMAN VERIFIED` piešķiršanas:
- evidence atsaucei jābūt identificējamai;
- verificētājam jāspēj atvērt sākotnējo avotu;
- nepieciešamajiem papildfragmentiem jābūt sasaistītiem;
- verifikācijas notikumam jānorāda, ko tieši cilvēks pārbaudīja.

Ja secinājumam piemēro `HUMAN_APPLICABLE_SCOPE_REVIEW`, viens quoted fragments pats par sevi nav pietiekams, jo secinājums ir par plašāku avota tvērumu.

**Cilvēka semantiskā verifikācija nav aizvietotājs evidence binding vai tā noturībai.**

Ja evidence noturīgā atsauce nav saglabājama atbilstoši sistēmas prasībām, materiāla rezultāta izdošana jābloķē līdz evidence ir saglabāts apstiprinātā noturīgā nesējā vai sistēmas augstāka līmeņa arhitektūra ir grozīta.

## 10. Saliktas prasības

Katram komponentam ir:
- savs statuss;
- savs evidence;
- savs verification level.

Parent status tiek agregēts deterministiski pēc frozen noteikumiem.

Parent prasība drīkst kļūt `HUMAN VERIFIED` tikai ar atsevišķu `VERIFICATION EVENT`, kas aptver:
- gala parent secinājumu;
- visus statusu noteicošos komponentus;
- to evidence / avotu tvērumu.

Atsevišķu komponentu verifikācija automātiski nepaaugstina parent līmeni.

## 11. FINDING verifikācija

FINDING drīkst palikt `EVIDENCE BOUND — AI PROPOSED`, ja frozen vai zemāka līmeņa noteikums neprasa cilvēka verifikāciju.

Ja FINDING tiek paaugstināts uz `HUMAN VERIFIED`, tam piemēro tās pašas metožu prasības:
- pozitīvs secinājums → evidence + context;
- neesamības secinājums → applicable scope review;
- vairāku avotu secinājums → source set review.

## 12. VERIFICATION EVENT

Minimālais ieraksts:

```text
VERIFICATION EVENT ID
TARGET OBJECT ID
TARGET OBJECT TYPE
VERIFICATION METHOD
VERIFICATION SCOPE
VERIFIED BY
VERIFIED AT
RESULT
RESULTING VERIFICATION LEVEL
SOURCE / EVIDENCE REFERENCES
NOTES                       [ja nepieciešams]
```

`RESULT` ir:
- `CONFIRMED`;
- `NOT CONFIRMED`.

Šis ir verifikācijas notikuma tehnisks rezultāts, ne prasības statuss.

Ja `RESULT = NOT CONFIRMED`, `RESULTING VERIFICATION LEVEL` nedrīkst būt `HUMAN VERIFIED`.

## 13. Verifikācijas procesa loģika

```text
AI / SYSTEM CONCLUSION
↓
EVIDENCE BINDING
↓
IS HUMAN VERIFICATION REQUIRED?
├─ NO → may remain EVIDENCE BOUND — AI PROPOSED
└─ YES
   ↓
SELECT VERIFICATION METHOD
   ↓
HUMAN REVIEWS ORIGINAL SOURCE(S)
   ↓
CONFIRMED?
├─ YES → VERIFICATION EVENT → HUMAN VERIFIED
└─ NO
   ↓
   CORRECT / REJECT CONCLUSION
   ↓
   NEW FINDING / REQUIREMENT RESULT AS NEEDED
   ↓
   NEW EVIDENCE / NEW VERIFICATION EVENT IF RE-VERIFIED
```

## 14. Verificētāja darbība kļūdas gadījumā

Ja cilvēks nepiekrīt MI secinājumam:
- sākotnējais MI secinājums netiek klusējot pārrakstīts;
- tiek saglabāts tā izsekojamības ieraksts;
- nepieciešamības gadījumā izveido jaunu corrected finding / requirement result;
- jaunajam objektam saglabā jaunu evidence sasaisti;
- tikai pēc atkārtotas verifikācijas tas var kļūt `HUMAN VERIFIED`.

## 15. Release gate

Ja prasībai frozen slieksnis prasa `HUMAN VERIFIED`, materiālo rezultātu nedrīkst izdot, kamēr:
- piemērojamā verifikācija nav pabeigta;
- nav dokumentēts `VERIFICATION EVENT`;
- gala verification level nav `HUMAN VERIFIED`.

Papildus:
- `UNCLASSIFIED` paliek atsevišķs blocking gate;
- trūkstošs evidence binding nav labojams tikai ar cilvēka verifikāciju;
- unresolved competence / module / permission / data-class gates paliek neatkarīgi.

## 16. Verifikācijas atkārtota izmantošana

Iepriekšējo `HUMAN VERIFIED` rezultātu drīkst mantot tikai kā vēsturisku verification level.

Ja jaunais TASK:
- izmanto citu avota versiju;
- maina juridisko jautājumu;
- maina secinājuma tvērumu;
- maina prasību versiju;
- pievieno jaunu būtisku dokumentu,

iepriekšējā verifikācija nav automātiski pietiekama jaunajam secinājumam.

Nepieciešams jauns `VERIFICATION EVENT`, ja gala apgalvojums vairs nav identisks iepriekš verificētajam.

## 17. VERIFICATION METHOD reģistra dzīves cikls

Metodes ir kontrolēts reģistrs saskaņā ar `TERMINOLOGY_AND_ENUMS_v1`.

Vērtības netiek dzēstas pēc izmantošanas. Tās var kļūt:
- `ACTIVE`;
- `DEPRECATED`.

Pašreiz:
- `human_evidence_context_review` — ACTIVE;
- `human_applicable_scope_review` — ACTIVE;
- `human_source_set_review` — ACTIVE;
- `validated_non_ai_mechanism` — NOT ACTIVE / RESERVED.

## 18. Pilot 2 validācijas mērķi

Šis protokols tiek praktiski validēts Pilot 2.

Jāpārbauda vismaz:
1. pozitīva mandatory prasība ar korektu evidence;
2. pozitīva mandatory prasība ar maldinošu evidence;
3. `NAV IZPILDĪTS` ar tiešu pretrunīgu tekstu;
4. `NAV IZPILDĪTS` ar nosacījuma neesamību;
5. NEGATIVE REQUIREMENT;
6. salikta prasība;
7. vairāku avotu secinājums;
8. cilvēka noraidīts MI secinājums;
9. atkārtota verifikācija pēc labojuma;
10. mēģinājums izdot mandatory rezultātu bez `HUMAN VERIFIED`.

## 19. Dokumenta robeža

Šis dokuments nenosaka:
- prasību bāzes saturu;
- prasību juridisko līmeni;
- UNCLASSIFIED klasifikāciju;
- datu klašu atļaujas;
- moduļu piemērojamību;
- cilvēka juridisko apstiprinājumu;
- Legora konkrēto UI konfigurāciju.

Tas nosaka tikai semantiskās verifikācijas metodi, dziļumu un tās izsekojamību.

## 20. Atvērts pamatversijas konflikts

`TRACEABILITY_RECORD_v1` 18. punkta pašreizējais teksts var tikt lasīts tā, ka nepietiekamu evidence persistence var kompensēt ar cilvēka `VERIFICATION EVENT`.

Tas nav saderīgs ar `PROFESSIONAL_SCOPE_v1.3` 17.2. principu, ka EVIDENCE BINDING un SEMANTIC VERIFICATION nav savstarpēji aizstājamas kontroles.

Šajā protokolā tiek ievērota augstākas autoritātes `PROFESSIONAL_SCOPE_v1.3` interpretācija:

```text
HUMAN VERIFIED
DOES NOT SUBSTITUTE FOR
EVIDENCE BINDING / EVIDENCE PERSISTENCE
```

Šis konflikts jāatrisina ar atsevišķu `TRACEABILITY_RECORD_v1` versijas grozījumu pirms šī dokumenta freeze.

## 21. Nākamais pārskata solis

Pirms v0.1 var kļūt par freeze candidate, nepieciešams kritisks arhitektūras pārskats vismaz par:
- verifikācijas metožu granularitāti;
- `NAV PIERĀDĪTS` human-verification loģiku;
- absence / negative requirement pārbaudes tvērumu;
- composite parent verification;
- `RESULT` lauka statusu;
- attiecībām ar evidence persistence konfliktu.
