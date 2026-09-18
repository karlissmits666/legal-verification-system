# VERIFICATION_PROTOCOL_v1

Juridiskās pārbaudes sistēmas semantiskās verifikācijas protokols

**Statuss:** MELNRAKSTS — IESALDĒŠANAS KANDIDĀTS  
**Versija:** v0.5  
**Bāze:**  
- `PROFESSIONAL_SCOPE_v1.3` — IESALDĒTS  
- `TRACEABILITY_RECORD_v1` — Arhitektūra v0.5 — IESALDĒŠANAS KANDIDĀTS  
- `TERMINOLOGY_AND_ENUMS_v1` — v0.3 — IESALDĒŠANAS KANDIDĀTS

1. MĒRĶIS

Šis dokuments nosaka, kad un kā secinājums drīkst pāriet no
EVIDENCE BOUND — AI PROPOSED uz HUMAN VERIFIED.

Tas nenosaka prasību saturu, prasību līmeņus vai datu klašu
atļaujas.


2. TRĪS KONTROLES PALIEK NODALĪTAS

  COMPLETENESS CONTROL
  → vai pārbaudīta visa apstiprinātā prasību kopa?

  EVIDENCE BINDING
  → uz kādu pārbaudāmu avota pamatu balstās secinājums?

  SEMANTIC VERIFICATION
  → vai secinājums par avota nozīmi ir pareizs?

Tikai trešā piešķir HUMAN VERIFIED. Neviena neaizstāj otru.


3. PAMATINVARIANTI

1. MI vienprātība nav verifikācija.
2. Otrs Legora secinājums nav verifikācija.
3. Verifikācijas līmenis palielinās tikai ar dokumentētu
   VERIFICATION EVENT.
4. Verifikācija attiecas uz konkrētu apgalvojumu vai prasības
   rezultātu.
5. Verifikāciju nevar mantot tikai tādēļ, ka rezultāts ievietots
   citā uzdevumā.
6. HUMAN VERIFIED nenozīmē LEGAL APPROVED.
7. Cilvēka verifikācija neaizstāj EVIDENCE BINDING un tā
   noturīgumu.
8. Verifikācija nevar izvest prasību no UNCLASSIFIED.
9. Verifikācija nevar mainīt REQUIREMENT LEVEL.
10. Ja verificētājs nevar droši apstiprināt secinājumu, rezultāts
    nepaaugstinās līdz HUMAN VERIFIED.


4. VERIFIKĀCIJAS OBJEKTI

Verificēt var: FINDING, REQUIREMENT, REQUIREMENT COMPONENT.

OUTPUT nesaņem vienu universālu verifikācijas līmeni.


5. VERIFIKĀCIJAS METOŽU REĢISTRS

Šis dokuments ir VERIFICATION METHOD REGISTRY īpašnieks.

5.1. HUMAN_EVIDENCE_CONTEXT_REVIEW
     Cilvēka pārbaude pret pierādījumu un nepieciešamo kontekstu

Izmanto, ja secinājums ir pozitīvi pamatots ar identificētu
evidence un nozīmes pārbaudei pietiek ar precīzo fragmentu,
definīcijām, cross-reference, sasaistītajiem pielikumu
fragmentiem un prasības tekstu.

Divi obligātie soļi:
  a) vai citētais fragments norādītajā vietā faktiski pastāv un
     ir precīzs;
  b) vai secinājums par tā nozīmi ir pareizs.

Neesošas vai neprecīzas atsauces ir dokumentētā rīka kļūdu
profila daļa (PROFESSIONAL_SCOPE 15.); nozīmes pārbaude pret
nepareizi citētu tekstu neatklāj neko.

Metode nav izmantojama, ja avots nav pieejams (7.4.).

5.2. HUMAN_APPLICABLE_SCOPE_REVIEW
     Cilvēka pārbaude visā piemērojamajā avota tvērumā

Izmanto, ja secinājums ir atkarīgs no tā, vai noteikums,
ierobežojums vai izņēmums kaut kur piemērojamajā tvērumā pastāv
vai nepastāv.

Obligāta vismaz: NEGATIVE REQUIREMENT; secinājumam NAV IZPILDĪTS,
ja pamats ir nosacījuma neesamība; jebkuram citam secinājumam par
neesamību.

Šīs metodes rezultāts tiek fiksēts kā VERIFICATION SCOPE RECORD (9.2.).

Minimālais tvērums noteikts 8. punktā un nav verificētāja izvēle.

5.3. HUMAN_SOURCE_SET_REVIEW
     Cilvēka pārbaude pret visu noteikto avotu kopu

Nosaka dokumentu kopu, kurā pārbaude notiek. Neaizstāj 5.2.

5.4. NE-MI MEHĀNISMI

PROFESSIONAL_SCOPE_v1.3 17.3. pieļauj iepriekš validētu ne-MI
mehānismu. Šajā reģistrā šādas vērtības nav; atslēga tiek
pievienota tikai tad, kad konkrēts mehānisms ir validēts,
apstiprināts konkrētajam tipam, versēts un tam noteikts tvērums.

Tādēļ dzīves cikls paliek ACTIVE / DEPRECATED (17.).


6. MINIMĀLAIS CILVĒKA VERIFIKĀCIJAS SLIEKSNIS

HUMAN VERIFIED ir obligāts:
- MANDATORY EXTERNAL;
- MANDATORY INTERNAL;
- UNCLASSIFIED;
- jebkurai NEGATIVE prasībai neatkarīgi no līmeņa.

UNCLASSIFIED papildus ir blocking governance stāvoklis:
verifikācija nepieciešama, bet ne pietiekama.

NEGOTIABLE pozitīva prasība drīkst palikt EVIDENCE BOUND — AI
PROPOSED.

Protokols drīkst prasīt verifikāciju plašāk, bet nedrīkst
samazināt frozen minimumu.


7. PRASĪBAS STATUSA UN METODES MATRICA

7.0. METODES IR KOMPONĒJAMAS

VERIFICATION METHOD nav obligāti viena vērtība. Ja secinājumam
nepieciešami vairāki režīmi, VERIFICATION EVENT satur vairākas
metodes.

  HUMAN_SOURCE_SET_REVIEW neaizstāj HUMAN_APPLICABLE_SCOPE_REVIEW.
  Tas nosaka dokumentu kopu, kurā applicable-scope pārbaude notiek.

Tipiskā kombinācija neesamības secinājumam vairāku dokumentu
darījumā:

  HUMAN_SOURCE_SET_REVIEW + HUMAN_APPLICABLE_SCOPE_REVIEW

Uzskaitītās metodes ir minimums, ne izvēle starp tām.

7.1. IZPILDĪTS — pozitīvs teksts
  minimums: HUMAN_EVIDENCE_CONTEXT_REVIEW
  vairāku avotu nozīme: papildus HUMAN_SOURCE_SET_REVIEW

7.2. NAV IZPILDĪTS — pozitīvi pierādāma neatbilstība
  minimums: HUMAN_EVIDENCE_CONTEXT_REVIEW
  vairāku avotu kombinācija: papildus HUMAN_SOURCE_SET_REVIEW

7.3. NAV IZPILDĪTS — nosacījuma neesamība
  obligāti: HUMAN_APPLICABLE_SCOPE_REVIEW
  vairāki dokumenti: papildus HUMAN_SOURCE_SET_REVIEW
  MI vai meklēšanas rīka "not found" nav pietiekams pamats.

7.4. NAV PIERĀDĪTS

Sliekšņa prasībai NAV PIERĀDĪTS gala statuss ir obligāti
verificējams.

A. Avots ir pieejams, bet tajā nepietiek informācijas
   metode: HUMAN_EVIDENCE_CONTEXT_REVIEW vai, ja nepietiekamība
   izriet no vairākiem avotiem, HUMAN_SOURCE_SET_REVIEW
   RESULT drīkst būt CONFIRMED.

B. Nepieciešamais avots nav avotu kopā, un verificētājs var
   pozitīvi konstatēt tā neesamību
   metode: HUMAN_APPLICABLE_SCOPE_REVIEW pār pieejamo kopu
   pierādījums: VERIFICATION SCOPE RECORD (9.2.)
   RESULT drīkst būt CONFIRMED.
   Obligāti: UNRESOLVED ISSUE par trūkstošo avotu.

   CONFIRMED šeit attiecas uz apgalvojumu:

     "Nepieciešamais avots X nav identificētajā avotu kopā, un
      neviens pieejamais avots to neaizstāj."

   CONFIRMED neattiecas uz trūkstošā dokumenta saturu un nesaka
   neko par to, vai prasība pēc būtības ir izpildīta. Prasības
   statuss paliek NAV PIERĀDĪTS; verificēts ir tā pamatojums.

C. Verificētājs nevar noteikt — nav piekļuves, nav iespējams
   noteikt piemērojamo avotu kopu, vai jautājums ārpus kompetences
   RESULT = UNABLE TO CONFIRM
   HUMAN VERIFIED netiek piešķirts
   HUMAN INPUT REQUIRED vai ESCALATION REQUIRED
   release gate paliek slēgts.

HUMAN_EVIDENCE_CONTEXT_REVIEW nav izmantojama B un C gadījumā.

Nošķīrums starp B un C ir būtisks abos virzienos: bez tā sistēma
vai nu piešķirtu HUMAN VERIFIED apgalvojumam, kuru cilvēks nav
varējis pārbaudīt, vai arī nebeidzami bloķētu katru darījumu,
kuram trūkst viena pielikuma.

Prasībām ārpus sliekšņa NAV PIERĀDĪTS drīkst palikt EVIDENCE
BOUND — AI PROPOSED.


8. NEGATĪVAS PRASĪBAS

NEGATIVE REQUIREMENT gala statuss vienmēr prasa cilvēka
verifikāciju.

Obligātā secība:
1. noteikt piemērojamo avota tvērumu;
2. pārbaudīt visu šo tvērumu;
3. ņemt vērā sinonīmus, alternatīvus formulējumus, definīcijas,
   cross-references un pielikumus;
4. fiksēt pārbaudīto tvērumu kā VERIFICATION SCOPE RECORD;
5. fiksēt verifikācijas rezultātu.

MINIMĀLAIS TVĒRUMS

Noklusējuma tvērums ir viss prasībai piemērojamais SOURCE SET.

CONTRACT objektam tas minimāli ietver: pamatlīgumu; visus
pielikumus; papildu vienošanās; inkorporētos vispārīgos
noteikumus; dokumentus, uz kuriem līgums atsaucas kā uz savu
sastāvdaļu.

Citiem objektiem — INTERNAL POLICY, EXTERNAL SOURCE, DOCUMENT SET
— tvērums ir attiecīgā piemērojamā avotu kopa tādā pašā izpratnē.

Šaurāks tvērums pieļaujams tikai tad, ja pamatots SCOPE BASIS
laukā. Nepamatots šaurāks tvērums padara verifikāciju nederīgu.

Meklēšanas terminu saraksts ir palīglīdzeklis, ne verifikācija.


9. PIERĀDĪJUMS, VERIFIKĀCIJAS TVĒRUMA IERAKSTS UN VERIFIKĀCIJA

CONTENT EVIDENCE un VERIFICATION SCOPE RECORD ir divi atšķirīgi objekti. EVIDENCE BINDING joprojām attiecas tikai uz konkrētu avota saturu ar precīzu fragmentu un atrašanās vietu. VERIFICATION SCOPE RECORD nav EVIDENCE; tas dokumentē cilvēka veikto semantiskās verifikācijas tvērumu neesamības un negatīvu prasību gadījumos.

9.1. SATURA SECINĀJUMS — CONTENT EVIDENCE

Attiecas uz 7.1., 7.2. un 7.4.A.

Pirms HUMAN VERIFIED:
- evidence atsaucei jābūt identificējamai;
- verificētājam jāspēj atvērt sākotnējo avotu;
- citētajam fragmentam jābūt pārbaudītam pēc 5.1.a;
- nepieciešamajiem papildfragmentiem jābūt sasaistītiem;
- verifikācijas notikumam jānorāda, ko tieši cilvēks pārbaudīja.

Pierādījuma objekts:
  SOURCE ID
  LOCATION
  EXACT QUOTED FRAGMENT

9.2. NEESAMĪBAS UN AVOTU KOPAS SECINĀJUMS — VERIFICATION SCOPE RECORD

Attiecas uz 7.3., 7.4.B un 8.

Šeit nav EVIDENCE OBJECT, kas pats par sevi pierādītu neesamību ar citējamu fragmentu. Cilvēka veiktais pārbaudes tvērums tiek dokumentēts atsevišķā objektā:

  VERIFICATION SCOPE RECORD
    SOURCE SET REFERENCE
    INCLUDED SOURCES
    EXCLUDED / UNAVAILABLE SOURCES
    SCOPE BASIS
    REVIEWED AT

`VERIFICATION SCOPE RECORD` nav `EVIDENCE` un uz to neattiecas `EXACT QUOTED FRAGMENT` prasība. Tas nav atvieglojums: negatīvas prasības pārbaudes prasības (8. punkts) paliek nemainīgas. "Nav atrasts" netiek ierakstīts `EXACT QUOTED FRAGMENT` laukā.

Ja pārbaudē tiek atrasts ierobežojums, ko MI nebija konstatējis,
tas kļūst par parastu content evidence jaunam secinājumam (14.).

9.3. EVIDENCE PERSISTENCE KĻŪME

Cilvēka verifikācija nav aizvietotājs evidence binding vai tā
noturīgumam. Bet glabāšanas kļūme ir governance defekts, ne
juridisks secinājums.

  Ja EVIDENCE OBJECT vai VERIFICATION SCOPE RECORD noturīguma prasība nav izpildīta:
  → evidence binding ir nepilnīgs;
  → materiāls rezultāts tiek bloķēts;
  → HUMAN VERIFIED netiek piešķirts un uz to nevar balstīt
    izdošanu;
  → darba vērtējums drīkst palikt redzams kā neizdots melnraksts;
  → prasības statuss NETIEK automātiski pārrakstīts uz
    NAV PIERĀDĪTS.

Šis noteikums vienādi attiecas uz content evidence un scope
evidence.

Pretrunas ar frozen 16.1. nav: statuss bez saglabāta pierādījuma
nekad nenonāk materiālā rezultātā.


10. SALIKTAS PRASĪBAS

Katram komponentam ir savs statuss, evidence un verification
level. Parent statuss tiek agregēts deterministiski.

Parent prasība drīkst kļūt HUMAN VERIFIED tikai ar atsevišķu
VERIFICATION EVENT, kas aptver gala parent secinājumu, visus
statusu noteicošos komponentus un to evidence vai avotu tvērumu.


11. FINDING VERIFIKĀCIJA

FINDING drīkst palikt EVIDENCE BOUND — AI PROPOSED, ja neviens
noteikums neprasa cilvēka verifikāciju.

NESOŠIE FINDINGS

Ja sliekšņa prasības statuss balstās uz FINDING — piemēram, uz
konstatējumu par definīcijas nozīmi vai pielikuma piemērojamību —
šis FINDING ietilpst prasības verifikācijas tvērumā un tiek
norādīts VERIFICATION SCOPE laukā.

Citādi tiktu verificēts secinājums, bet ne pamats, uz kura tas
stāv.


12. VERIFICATION EVENT

Minimālais ieraksts:

  VERIFICATION EVENT ID
  TARGET OBJECT ID
  TARGET OBJECT TYPE
  VERIFICATION METHODS         [1..n — 7.0.]
  VERIFICATION SCOPE
  VERIFIED BY
  VERIFIED AT
  RESULT
  RESULTING VERIFICATION LEVEL
  SOURCE / EVIDENCE REFERENCES
  VERIFICATION SCOPE RECORD REFERENCES [ja piemērojams — 9.2.]
  NOTES                        [ja nepieciešams]

VERIFICATION SCOPE nav brīvs memo. Tam jāspēj identificēt, kuri avoti faktiski tika pārbaudīti; neesamības secinājumam tas sasaistās ar vienu vai vairākiem VERIFICATION SCOPE RECORD.

VERIFICATION RESULT reģistrs — īpašnieks ir šis dokuments:

  CANONICAL            MACHINE KEY          LV LABEL
  ------------------------------------------------------------
  CONFIRMED            confirmed            Secinājums apstiprināts
  NOT CONFIRMED        not_confirmed        Secinājums nav
                                            apstiprināts
  UNABLE TO CONFIRM    unable_to_confirm    Nav iespējams
                                            apstiprināt

LV labels ir apzināti nošķirti no juridiskā apstiprinājuma.
"Apstiprināts" bez papildinājuma sistēmā, kur LEGAL APPROVED ir
stingri rezervēts termins, radītu tieši to sajaukšanu, kuru
PROFESSIONAL_SCOPE 3. punkts novērš.

Nozīme:
  NOT CONFIRMED — verificētājs pārbaudīja, secinājums ir
                  nepareizs → 14. punkts.
  UNABLE TO CONFIRM — verificētājs nevarēja noteikt →
                  UNRESOLVED ISSUE vai ESCALATION REQUIRED;
                  secinājums paliek nemainīgs.

VIENS NOTIKUMS — VIENS RESULT

Ja notikumā izmantotas vairākas metodes, RESULT attiecas uz
notikumu kopumā. Ja viena daļa apstiprina un otra nevar, rezultāts
ir UNABLE TO CONFIRM. Dažādiem apgalvojumiem — atsevišķi notikumi.

Ja RESULT nav CONFIRMED, RESULTING VERIFICATION LEVEL nedrīkst
būt HUMAN VERIFIED.


13. VERIFIKĀCIJAS PROCESA LOĢIKA

  AI / SYSTEM CONCLUSION
  ↓
  CLAIM TYPE?
  ├─ CONTENT CLAIM
  │  → EVIDENCE BINDING: SOURCE + LOCATION + EXACT QUOTED FRAGMENT
  │
  └─ ABSENCE / NEGATIVE CLAIM
     → MI meklēšana ir tikai priekšpārbaude
     → neviens EVIDENCE OBJECT pats par sevi nepierāda neesamību
  ↓
  IS HUMAN VERIFICATION REQUIRED?
  ├─ NO
  │  → may remain EVIDENCE BOUND — AI PROPOSED
  │
  └─ YES
     ↓
  SELECT VERIFICATION METHOD(S)
     ↓
  HUMAN REVIEWS ORIGINAL SOURCE(S) / SOURCE SET
     ↓
  RESULT?
  ├─ CONFIRMED
  │  → VERIFICATION EVENT
  │  → VERIFICATION SCOPE RECORD, ja piemērojams
  │  → HUMAN VERIFIED
  │
  ├─ NOT CONFIRMED
  │  → CORRECT / REJECT CONCLUSION
  │  → NEW FINDING / REQUIREMENT RESULT + NEW EVIDENCE, ja piemērojams
  │
  └─ UNABLE TO CONFIRM
     → VERIFICATION EVENT with result recorded
     → UNRESOLVED ISSUE / ESCALATION REQUIRED
     → level unchanged; release gate remains closed


14. VERIFICĒTĀJA DARBĪBA KĻŪDAS GADĪJUMĀ

- sākotnējais secinājums netiek klusējot pārrakstīts;
- tiek saglabāts tā izsekojamības ieraksts;
- izveido jaunu corrected finding vai requirement result;
- jaunajam objektam saglabā jaunu evidence sasaisti;
- tikai pēc atkārtotas verifikācijas tas var kļūt HUMAN VERIFIED.


15. RELEASE GATE

Ja prasībai frozen slieksnis prasa HUMAN VERIFIED, materiālo
rezultātu nedrīkst izdot, kamēr verifikācija nav pabeigta, nav
dokumentēts VERIFICATION EVENT ar RESULT = CONFIRMED, un gala
verification level nav HUMAN VERIFIED.

Papildus paliek neatkarīgi: UNCLASSIFIED gate; evidence
noturīguma bloķējums (9.3.); competence, module, permission un
data-class gates.


16. VERIFIKĀCIJAS ATKĀRTOTA IZMANTOŠANA

Verifikācijas līmenis pieder apgalvojumam, ne uzdevumam.

Iepriekš piešķirts HUMAN VERIFIED apmierina release gate jaunā
uzdevumā tikai tad, ja izpildīti visi nosacījumi:

  a) gala apgalvojums ir identisks iepriekš verificētajam;
  b) avots ir tā pati versija vai identificētā redakcija;
  c) prasību kopas versija nav mainījusies — attiecas tikai tad,
     ja apgalvojums ir balstīts uz prasību kopu;
  d) secinājuma tvērums nav mainījies;
  e) ierakstā ir atsauce uz sākotnējo VERIFICATION EVENT;
  f) apgalvojumam būtiskais SOURCE SET nav mainījies — nav
     pievienots, noņemts vai aizstāts neviens avots, kas var
     ietekmēt gala apgalvojumu.

(f) ir atsevišķs no (b) tīši. Avotu versijas var būt nemainīgas,
un tomēr kopai pievienots jauns pielikums, kas maina atbildi. Tas
īpaši attiecas uz neesamības secinājumiem, kuru pierādījums pēc
definīcijas ir apgalvojums par kopas sastāvu.

Mantošana nekad nenotiek klusējot: bez (e) atsauces mantotais
līmenis nav derīgs.


17. VERIFICATION METHOD REĢISTRA DZĪVES CIKLS

  ACTIVE       active       Aktīva
  DEPRECATED   deprecated   Novecojusi

Pašreiz:
  human_evidence_context_review   → ACTIVE
  human_applicable_scope_review   → ACTIVE
  human_source_set_review         → ACTIVE


18. PILOT 2 VALIDĀCIJAS MĒRĶI

1. pozitīva mandatory prasība ar korektu evidence;
2. pozitīva mandatory prasība ar maldinošu evidence;
3. NAV IZPILDĪTS ar tiešu pretrunīgu tekstu;
4. NAV IZPILDĪTS ar nosacījuma neesamību;
5. NEGATIVE REQUIREMENT;
6. salikta prasība;
7. vairāku avotu secinājums;
8. cilvēka noraidīts MI secinājums;
9. atkārtota verifikācija pēc labojuma;
10. mēģinājums izdot mandatory rezultātu bez HUMAN VERIFIED;
11. fabricēta vai neprecīza atsauce (5.1.a);
12. mantota verifikācija — viens gadījums, kur 16. punkta
    nosacījumi izpildīti, un viens, kur nav, tostarp (f) gadījums
    ar pievienotu pielikumu;
13. trūkstošs pielikums: 7.4.B un 7.4.C gadījums;
14. VERIFICATION SCOPE RECORD ieraksts: vai verificētājs praktiski spēj
    fiksēt INCLUDED un EXCLUDED avotus tā, lai ieraksts vēlāk
    būtu saprotams citam juristam.

14. gadījums ir atsevišķs, jo verification scope record ir vienīgais
pierādījuma veids, kuru rada pats verificētājs; ja tā ierakstīšana
praksē ir pārāk smaga, negatīvo prasību plūsma neizturēs slodzi.


19. DOKUMENTA ROBEŽA

Šis dokuments nenosaka: prasību bāzes saturu; prasību juridisko
līmeni; UNCLASSIFIED klasifikāciju; datu klašu atļaujas; moduļu
piemērojamību; cilvēka juridisko apstiprinājumu; Legora UI
konfigurāciju.


20. VĀRTU KOPSAVILKUMS

  verifikācijas vārti          15. punkts
  UNCLASSIFIED vārti           6. punkts
  evidence noturīguma vārti    9.3.
  atļauju un datu klases vārti PROFESSIONAL_SCOPE 19.
  kompetences un moduļu vārti  PROFESSIONAL_SCOPE 13., 23.

Neviens nav savstarpēji kompensējams.


21. SAISTĪTO SHĒMU PRASĪBAS

Šī protokola ieviešanai nepieciešamas šādas saderīgas shēmas:

21.1. TRACEABILITY_RECORD_v1 — Arhitektūra v0.5

- nenoturīgs EVIDENCE OBJECT vairs nav kompensējams ar HUMAN VERIFIED;
- ieviests VERIFICATION SCOPE RECORD;
- VERIFICATION EVENT satur VERIFICATION METHODS [1..n], VERIFICATION SCOPE, RESULT, SOURCE / EVIDENCE REFERENCES, VERIFICATION SCOPE RECORD REFERENCES un NOTES;
- UNCLASSIFIED saglabā gan cilvēka verifikācijas minimumu, gan atsevišķu blocking gate.

21.2. TERMINOLOGY_AND_ENUMS_v1 — v0.3

- VERIFICATION RESULT reģistrs pieder VERIFICATION_PROTOCOL_v1;
- TRACE OBJECT TYPE ietver VERIFICATION SCOPE RECORD → verification_scope_record;
- ID prefikss: VERIFICATION SCOPE RECORD → VSR-;
- VERIFICATION SCOPE RECORD ir skaidri nošķirts no EVIDENCE.

22. IESALDĒŠANAS NOSACĪJUMS

Šis dokuments ir iesaldēšanas kandidāts. To drīkst iesaldēt tikai pēc:
1. mehāniskā audita pret PROFESSIONAL_SCOPE_v1.3, TRACEABILITY_RECORD_v1 v0.5 un TERMINOLOGY_AND_ENUMS_v1 v0.3;
2. bloķējošu pretrunu skaita = 0;
3. lietotāja skaidra freeze apstiprinājuma.
