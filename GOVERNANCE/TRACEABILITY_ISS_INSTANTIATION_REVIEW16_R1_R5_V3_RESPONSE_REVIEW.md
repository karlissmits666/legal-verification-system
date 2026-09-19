# REVIEW #16 — R1–R5 RESPONSE v3 NEATKARĪGĀ RECENZIJA

PĀRBAUDĪTAIS COMMITS: 314aefee27d79e8790f54ffc9454f44b7404f436
RECENZĒTAIS DOKUMENTS: GOVERNANCE/TRACEABILITY_ISS_INSTANTIATION_REVIEW16_R1_R5_RESPONSE.md (v3)
IEPRIEKŠĒJĀ RECENZIJA: GOVERNANCE/TRACEABILITY_ISS_INSTANTIATION_REVIEW16_R1_R5_V2_RESPONSE_REVIEW.md
REŽĪMS: read-only; recenzents neko nav mainījis, commitējis vai freezeojis
VERDIKTS: CHANGES REQUIRED

---

## 1. KOPSAVILKUMS

v3 saglabā R1–R5 arhitektūras virzienu, nemaina frozen baseline, nemaina arhitektūras
draftus, nerada TASK-/MOD-/ISS- instanci un nepasludina konsensu, implementation vai
freeze. Procesa disciplīna ir korekta. Pārbaudīts mehāniski: commitā `314aefe` pret
`1783c50` mainīts tikai viens fails — pats response artefakts.

J1, J2, J3, J7, J8 un J9 ir atrisināti pārbaudāmi. Visas 19 §30.1 mapping rindas ir
mehāniski pārbaudītas pret faktiskajām owner shēmām — 19/19 atbilst, tostarp iepriekš
kļūdainā `REQUIREMENT COMPONENT` rinda.

Tomēr v3 vēl nav gatava vienam atomāram implementation commitam. Konstatēti 7 jauni
findings: 1 BLOCKING, 2 HIGH, 2 MEDIUM, 2 LOW.

Trīs kritiskākie:

1. v3 §7.1.1 D sadaļa (bare ID lauki) un F sadaļa (noklusējuma noteikums) dod pretrunīgu
   atbildi vieniem un tiem pašiem laukiem. F noteikuma diskriminators ir references mērķa
   tips, kas aptver arī visus D sadaļas laukus un tos pārkvalificē par §5.1 atsaucēm;
2. §7.1.1 uzskaitījums nav pilnīgs pret faktisko TR v0.6, tādēļ apgalvojums
   "Neklasificētu lauku nav" ir faktiski nepatiess — vismaz 6 sadaļas paliek ārpus
   klasifikācijas;
3. TR §5.1 / T&E §26.2 aizstājējtekstā `OBJECT ID` vērtība tiek prasīta atbilstoša
   ID **lauka nosaukumam**, kas ir vērtības un lauka nosaukuma sajaukums un implementation
   laikā nav izpildāms burtiski.

J4 tādēļ nav novērsts. Tā ir tā paša kļūdas modeļa atkārtošanās, ko v2 recenzija jau
konstatēja: references tvērums vienlaikus pārāk plašs un pārāk šaurs, tikai citā formā.

## 2. J1–J9 STATUSU TABULA

| Finding | Iepriekšējais smagums | Statuss v3 | Pamatojums |
|---|---|---|---|
| J1 | BLOCKING | DAĻĒJI NOVĒRSTS | §30.1 atrisina strukturālo konfliktu ar §30, ir viens risinājums bez alternatīvām, nodala schema owner no registry owner. Atlikums: §30 indeksa rinda deklarē T&E par `ID FIELD NAME` owning document, kas ir pretrunā ar pašas §30.1 atrunu (K4). |
| J2 | HIGH | NOVĒRSTS | Mapping rinda ir `COMPONENT ID`; pārbaudīts pret TR v0.6 §27 faktisko lauku bloku. Nepārsaukšana pamatota ar amendment §14 tvērumu. |
| J3 | HIGH | NOVĒRSTS | Aizstājējteksts satur visus trīs iepriekš spēkā esošos elementus un pievieno tikai mapping semantiku. Salīdzināts rindkopa pret rindkopu ar pašreizējo §26.1. |
| J4 | HIGH | NAV NOVĒRSTS | D/F pretruna (K1) un nepilnīgs uzskaitījums (K2). |
| J5 | MEDIUM | DAĻĒJI NOVĒRSTS | Operācija skaidri nosaukta par aizstāšanu, aizstājamais teksts citēts, abas sadaļas identiskas. Atlikums: aizstājējteksta satura defekts (K3). |
| J6 | MEDIUM | DAĻĒJI NOVĒRSTS | RMT1 FILE SET ir deviņi konkrēti faili, visi eksistē commitā `314aefe`; exclusion rule novērš false fail uz review vēsturi. Atlikums: nav uzturēšanas noteikuma (K7). |
| J7 | MEDIUM | NOVĒRSTS | §9.1 / §9.2 / §9.3 nodala record-instance, repo-completeness un freeze-process. N8 vairs nesatur reģistra pilnīgumu; RMT3 to pārņem un paplašina. Atlikums ir tikai tvēruma robs (K6, LOW). |
| J8 | MEDIUM | NOVĒRSTS | Viena konkrēta owner sadaļa — jauna amendment §9.1. Pārbaudīts, ka §9 nosaukums ir "Autoritatīvais statuss" un §11 ir "Go-live priekšnosacījumi" ar moduļa operacionālo, ne dokumentu freeze tvērumu. Konflikts ar §9 vai §11 nerodas. |
| J9 | LOW | PAMATOTI NORAIDĪTS | Recenzents piekrīt noraidījumam. |

Kopsavilkums: NOVĒRSTI 5; DAĻĒJI NOVĒRSTI 3; NAV NOVĒRSTS 1.

## 3. R1–R5 GALA VĒRTĒJUMS

R1 — freeze secība: PIEŅEMTS un pēc būtības pareizs. Owner sadaļa tagad ir precīza.
Bez atlikuma.

R2 — avota identitāte: PIEŅEMTS, variants (b). Nemainīts kopš v2, kur tas jau bija
pārbaudīts bez atlikuma.

R3 — HUMAN DECISION attiecību autoritāte: PIEŅEMTS. Aizstāšana, ne papildinājums.
Bez atlikuma.

R4 — TYPE → ID FIELD mapping: ATRISINĀTS. Struktūra deterministiska, 19/19 rindas
pareizas, owner nodalījums korekts. Vienīgais atlikums K4 ir redakcionāls, ne strukturāls.

R5 — atomāra implementation: NAV SASNIEGTA. K1, K2 un K3 atstāj references režīma izvēles
implementation brīdim. Atomaritāte nav iespējama, kamēr K1 un K2 nav novērsti.

## 4. §30.1 TYPE → ID FIELD MAPPING PĀRBAUDE

Katra rinda pārbaudīta mehāniski: vai kolonnā `ID FIELD NAME` norādītais lauks
burtiski eksistē kolonnā `ID FIELD SCHEMA OWNER` norādītajā dokumentā un sadaļā
commitā `314aefe`.

Rezultāts: **19 no 19 rindām atbilst faktiskajai owner shēmai.** Visi 19 prefiksi atbilst
T&E v0.4 §26 tabulai. Visi 19 tipi ir reģistrēti T&E v0.4 §25.

Struktūras pārbaude (J1):
- §30 tabulas atslēga `Controlled field` netiek mainīta;
- §30.1 ir atsevišķa tabula ar savu atslēgu;
- četru elementu sasaiste ir reģistrēta pilnībā;
- alternatīvu formulējumu "vai līdzvērtīgu" dokumentā vairs nav;
- `MODULE TRIGGER SET` owner nodalījums ir precīzs.

J9 noraidījums ir pamatots un tiek pieņemts.

## 5. BL3 REFERENCES KLASIFIKĀCIJAS PĀRBAUDE

Pareizi klasificēts:
- A sadaļa (§5, §7.2, §36, §38 `RELATED TRACE OBJECT REFERENCES`);
- B sadaļa (§17, §20 evidence-store lauki);
- C sadaļa (§42, §43, §40 `OUTPUT REFERENCE`, §7.1 `CONTRACT TYPE REFERENCES`);
- E sadaļa (§14 konversija).

Nepareizi vai nepilnīgi — skat. K1 un K2.

## 6. VALIDĀCIJAS LĪMEŅU PĀRBAUDE

Record instance / repo-registry / freeze-process līmeņu nodalījums ir korekts.
Atlikums: K6.

## 7. DEPENDENCY / FREEZE PĀRBAUDE

Dependency karte ir pilnīga. Frozen baseline un arhitektūras drafti nav mainīti.
Freeze owner amendment §9.1 ir korekts.

## 8. JAUNI FINDINGS

### K1 — BLOCKING — §7.1.1 D un F sadaļas ir savstarpēji pretrunīgas

Minimālais labojums: F noteikumu tvērumā skaidri ierobežot uz laukiem, kuru nosaukums
beidzas ar `REFERENCE` vai `REFERENCES`, un pievienot normatīvu teikumu, ka lauki ar
galotni `ID` vai `IDS` ir bare ID lauki un netiek pārveidoti šajā paketē, ar vienīgo
izņēmumu §14.

### K2 — HIGH — §7.1.1 uzskaitījums nav pilnīgs; apgalvojums "Neklasificētu lauku nav" ir nepatiess

Vismaz šādi lauki/sadaļas nebija pilnīgi klasificēti:
```text
§9    DOCUMENT MANAGEMENT REFERENCE; LOCATION / REFERENCE
§11   DOCUMENT MANAGEMENT REFERENCE
§15   DATA CLASS EVENT REFERENCES; VERIFICATION SCOPE RECORD IDS
§17   RELATED FINDING / REQUIREMENT / COMPONENT
§20.1 SOURCE SET REFERENCE; RELATED FINDING / REQUIREMENT / COMPONENT
§22   SUPERSEDED BY RESULT ID
§34   EVIDENCE REFERENCES; VERIFICATION SCOPE RECORD REFERENCES; LEGAL STATUS REFERENCE
§38   ACTION OWNER BASIS REFERENCE; RESOLUTION AUTHORITY BASIS REFERENCE
§45   LEGAL STATUS REFERENCE
§46   EVIDENCE REFERENCES; REQUIREMENTS SET SELECTION REFERENCES
```

Minimālais labojums: F sadaļas noteikumu padarīt universālu visiem pārējiem TR v0.6
`... REFERENCE` / `... REFERENCES` laukiem, pievienot trūkstošās sadaļas un precīzi
fiksēt §38 abu BASIS REFERENCE lauku režīmu.

### K3 — HIGH — §5.1 / §26.2 aizstājējtekstā sajaukta ID vērtība un ID lauka nosaukums

Minimālais labojums:
```text
OBJECT ID prefiksam jāatbilst OBJECT TYPE prefiksam 26. punktā.
OBJECT ID vērtība ir tā vērtība, kas target objekta owner shēmā glabāta
30.1. punktā reģistrētajā ID laukā.
```

### K4 — MEDIUM — §30 indeksa rinda deklarē T&E par ID FIELD NAME owning document

Minimālais labojums: mainīt Controlled field uz `TRACE OBJECT TYPE → ID FIELD MAPPING`
vai skaidri pateikt, ka owning document attiecas uz mapping indeksu, ne lauku definīcijām.

### K5 — MEDIUM — §7.2 (H1) delta un §7.1.1 klasifikācija nav savstarpēji saskaņotas

Minimālais labojums: §7.2 norādīt precīzu §38 delta un §7.1.1 fiksēt abu §38 BASIS
REFERENCE lauku režīmu.

### K6 — LOW — nav negatīvā testa cross-record OBJECT ID prefiksa neatbilstībai

Minimālais labojums: N2 paplašināt uz abiem režīmiem vai pievienot atsevišķu testu.

### K7 — LOW — RMT1 FILE SET ir statisks saraksts bez uzturēšanas noteikuma

Minimālais labojums: noteikt, ka RMT1 FILE SET tiek aktualizēts vienlaikus ar
`PROJECT_CURRENT_STATE` DRAFT INPUTS / same-package dependency izmaiņām, vai definēt
mehānisku glob + exclusion noteikumu.

## 9. KONSENSA GATAVĪBA

```text
NEATKARĪGĀS RECENZIJAS VERDIKTS:  CHANGES REQUIRED
JAUNI FINDINGS:                   K1 BLOCKING; K2, K3 HIGH; K4, K5 MEDIUM; K6, K7 LOW
J1-J9 STATUSS:                    5 NOVĒRSTI; 3 DAĻĒJI; 1 NAV NOVĒRSTS (J4)
R1-R5 ARHITEKTŪRAS VIRZIENS:      SAGLABĀTS
§30.1 MAPPING:                    19/19 PAREIZS PRET OWNER SHĒMĀM
FROZEN BASELINE:                  NEMAINĪTS
ARHITEKTŪRAS DRAFTI:              NEMAINĪTI
KONSENSS:                         NAV GATAVS
IMPLEMENTATION AUTHORIZED:        NO
FREEZE AUTHORIZED:                NO
```

## 10. ATĻAUTAIS NĀKAMAIS SOLIS

Sagatavot `GOVERNANCE/TRACEABILITY_ISS_INSTANTIATION_REVIEW16_R1_R5_RESPONSE.md` v4, kas:
1. K1 atrisina ar vienu skaidri nosauktu diskriminatoru starp bare ID laukiem un strukturētām references;
2. K2 atrisina ar pilnīgu, mehāniski pārbaudāmu TR v0.6 references lauku klasifikāciju;
3. K3 atrisina ar precīzu, izpildāmu formulējumu identiski abās owner sadaļās;
4. K4 un K5 novērš ar precizētu §30 rindu un pilnu §38 delta;
5. K6 un K7 fiksē vai pamatoti noraida.

v4 saglabā J1, J2, J3, J7, J8 risinājumus un J9 noraidījumu nemainītus.
