# TERMINOLOGY_AND_ENUMS_v1

Juridiskās pārbaudes sistēmas terminoloģija, kontrolētās vērtības un tehniskā reprezentācija

**Statuss:** MELNRAKSTS — IESALDĒŠANAS KANDIDĀTS  
**Versija:** v0.2  
**Bāze:**  
- `PROFESSIONAL_SCOPE_v1.3` — APSTIPRINĀTS, PAMATVERSIJA IESALDĒTA  
- `TRACEABILITY_RECORD_v1` — Arhitektūra v0.4 — APSTIPRINĀTS, PAMATVERSIJA IESALDĒTA

## 1. Mērķis

Šis dokuments nosaka vienotu terminoloģijas un kontrolēto vērtību modeli visai sistēmai.

Tas definē:

- kanoniskās semantiskās vērtības;
- mašīnatslēgas (`machine keys`);
- lietotājam redzamos latviešu valodas apzīmējumus;
- kontrolēto reģistru īpašniekus;
- lauku un objektu tipu nosaukumu principus;
- `null` / tukšas vērtības lietošanas noteikumus;
- enum un taxonomy pārvaldības robežas;
- aizliegtus sinonīmus kontrolētajos laukos;
- starplauku validācijas noteikumus.

Šis dokuments nemaina frozen dokumentu juridisko vai arhitektonisko nozīmi.

Konflikta gadījumā augstāka autoritāte ir:
1. `PROFESSIONAL_SCOPE_v1.3`;
2. `TRACEABILITY_RECORD_v1`;
3. šis dokuments.

## 2. Trīs līmeņu terminoloģijas modelis

Katram kontrolētam terminam var būt trīs reprezentācijas:

```text
KANONISKĀ SEMANTISKĀ VĒRTĪBA
→ autoritatīvā sistēmas nozīme

MAŠĪNATSLĒGA
→ stabila tehniskā vērtība validācijai un datu apmaiņai

LV DISPLAY LABEL
→ cilvēkam redzamais latviešu valodas apzīmējums
```

Piemērs:

```text
Canonical:    HUMAN VERIFIED
Machine key:  human_verified
LV label:     Cilvēka verificēts
```

LV apzīmējums nav jauns statuss un nemaina frozen canonical vērtību.

## 3. Mašīnatslēgu standarts

Mašīnatslēgas:

- ir lowercase ASCII;
- izmanto `snake_case`;
- nesatur atstarpes;
- nesatur diakritiskās zīmes;
- nesatur pieturzīmes, izņemot underscore;
- pēc freeze netiek pārdēvētas bez dokumentētas migrācijas;
- nav atkarīgas no lietotāja saskarnes valodas.

Diakritikas transliterācija ir deterministiska:

```text
ā → a
č → c
ē → e
ģ → g
ī → i
ķ → k
ļ → l
ņ → n
š → s
ū → u
ž → z
```

Piemērs:

```text
NAV PIERĀDĪTS
→ nav_pieradits
```

## 4. Lauku nosaukumu standarts

Specifikācijā cilvēkam lasāmā formā drīkst izmantot latviešu nosaukumu ar tehnisko lauka nosaukumu iekavās.

Mašīnshēmā lauki ir angļu valodā, lowercase snake_case.

Piemērs:

```text
Prasības statuss (REQUIREMENT STATUS)
→ requirement_status

Verifikācijas līmenis (VERIFICATION LEVEL)
→ verification_level

Pārvaldības statuss (GOVERNANCE STATUS)
→ governance_status
```

## 5. `null` / tukšas vērtības princips

`null` nav statuss.

To drīkst izmantot tikai tad, ja shēma konkrētā stāvoklī skaidri nosaka, ka:
- lauks nav piemērojams; vai
- lauku vēl nedrīkst aizpildīt; vai
- lauka nozīmi viennozīmīgi nosaka cits lauks.

`null` nedrīkst izmantot kā aizvietotāju jau definētām frozen nozīmēm, piemēram:
`UNCLEAR`, `NOT YET DETERMINED`, `PERMISSION UNKNOWN`, `UNCLASSIFIED`.

## 6. Enum un taxonomy pārvaldības princips

1. Enum, kas izriet no `PROFESSIONAL_SCOPE_v1.3` slēgtā statusu reģistra, ir slēgti. Tos var mainīt tikai ar augstāka līmeņa frozen baseline grozījumu.
2. Tehniskās taxonomy, piemēram `SOURCE TYPE`, `TRACE OBJECT TYPE` un ID prefiksi, maināmas tikai ar attiecīgās shēmas governance procedūru.
3. Citam governance dokumentam piederošas vārdnīcas šeit netiek dublētas.
4. Nevienu enum vai taxonomy nedrīkst paplašināt viena `TASK` ietvaros.
5. Jauna vērtība vispirms jāapstiprina autoritatīvajā reģistrā un tikai tad to drīkst izmantot jaunā ierakstā.

## 7. Reģistra vērtību dzīves cikls

Kontrolētā reģistra vērtība var būt:

```text
ACTIVE
DEPRECATED
```

`DEPRECATED` nozīmē:
- jaunos ierakstos vērtību vairs neizmanto;
- vēsturiskajos ierakstos tā paliek derīga;
- vērtību nedzēš no reģistra tā, ka vēsturisku ierakstu vairs nevar interpretēt.

Kontrolētu vērtību dzēšana nav pieļaujama, ja tā jau izmantota materiālā vai izsekojamības ierakstā.

## 8. Uzdevuma operācija (OPERATION)

| Canonical | Machine key | LV apzīmējums |
|---|---|---|
| ANALYSE | `analyse` | Analīze |
| VERIFY | `verify` | Pārbaude |
| DRAFT | `draft` | Teksta izstrāde |
| COMPARE | `compare` | Salīdzināšana |
| EXTRACT | `extract` | Informācijas izguve |

Kopa ir slēgta.

## 9. Uzdevuma objekts (OBJECT)

| Canonical | Machine key | LV apzīmējums |
|---|---|---|
| QUESTION | `question` | Jautājums |
| CONTRACT | `contract` | Līgums |
| CLAUSE | `clause` | Klauzula |
| INTERNAL POLICY | `internal_policy` | Iekšējā politika |
| EXTERNAL SOURCE | `external_source` | Ārējais avots |
| DOCUMENT SET | `document_set` | Dokumentu kopa |

Kopa ir slēgta.

## 10. Modulis (MODULE)

| Canonical | Machine key | LV apzīmējums |
|---|---|---|
| PROCUREMENT | `procurement` | Iepirkumi |
| OUTSOURCING-EBA | `outsourcing_eba` | Ārpakalpojumi / EBA |
| ICT-DORA | `ict_dora` | IKT / DORA |
| DATA-PROTECTION | `data_protection` | Datu aizsardzība |
| INFOSEC | `infosec` | Informācijas drošība |
| OTHER | `other` | Cits |

Kopa ir slēgta.

## 11. Prasības statuss (REQUIREMENT STATUS)

| Canonical | Machine key | LV apzīmējums |
|---|---|---|
| IZPILDĪTS | `izpildits` | Izpildīts |
| NAV IZPILDĪTS | `nav_izpildits` | Nav izpildīts |
| NAV PIERĀDĪTS | `nav_pieradits` | Nav pierādīts |

Aizliegti kā statusa aizvietotāji:
`PARTIAL`, `DAĻĒJI IZPILDĪTS`, `LIKELY COMPLIANT`, `APPEARS COMPLIANT`, `ATBILST KOPUMĀ`, `NOT FOUND`.

Šādu formulējumu drīkst lietot tikai paskaidrojošā tekstā, ja tas neaizvieto canonical statusu.

## 12. Verifikācijas līmenis (VERIFICATION LEVEL)

| Canonical | Machine key | LV apzīmējums |
|---|---|---|
| EVIDENCE BOUND — AI PROPOSED | `evidence_bound_ai_proposed` | Pierādījumam piesaistīts — MI priekšlikums |
| HUMAN VERIFIED | `human_verified` | Cilvēka verificēts |

Aizliegti paralēli statusi:
`AI VERIFIED`, `SYSTEM VERIFIED`, `DOUBLE CHECKED`, `SECOND AI VERIFIED`, `LIKELY VERIFIED`, `CONFIRMED BY AI`.

## 13. Prasības līmenis (REQUIREMENT LEVEL)

| Canonical | Machine key | LV apzīmējums |
|---|---|---|
| MANDATORY EXTERNAL | `mandatory_external` | Obligāta ārēja prasība |
| MANDATORY INTERNAL | `mandatory_internal` | Obligāta iekšēja prasība |
| NEGOTIABLE | `negotiable` | Apspriežama prasība |

`UNCLASSIFIED` nav REQUIREMENT LEVEL vērtība.

## 14. Pārvaldības statuss (GOVERNANCE STATUS)

| Canonical | Machine key | LV apzīmējums |
|---|---|---|
| UNCLASSIFIED | `unclassified` | Neklasificēta |

`governance_status = null` ir derīgs tikai tad, ja `requirement_level` satur vienu no trim frozen juridiskajiem līmeņiem. Šādā gadījumā `null` nozīmē nevis “trūkst datu”, bet to, ka prasība ir klasificēta un tai nav `UNCLASSIFIED` pārvaldības statusa.

## 15. REQUIREMENT LEVEL / GOVERNANCE STATUS starplauku noteikums

```text
IF governance_status = unclassified
THEN requirement_level MUST BE null

IF governance_status IS null
THEN requirement_level MUST equal exactly one of:
  mandatory_external
  mandatory_internal
  negotiable
```

Derīgas kombinācijas:

```text
unclassified + null
null + mandatory_external
null + mandatory_internal
null + negotiable
```

Citas kombinācijas ir nederīgas.

## 16. Prasības tips (REQUIREMENT TYPE)

| Canonical | Machine key | LV apzīmējums |
|---|---|---|
| POSITIVE | `positive` | Pozitīva prasība |
| NEGATIVE | `negative` | Negatīva prasība |

## 17. Moduļa statuss (MODULE STATUS)

| Canonical | Machine key | LV apzīmējums |
|---|---|---|
| APPLICABLE | `applicable` | Piemērojams |
| NOT APPLICABLE | `not_applicable` | Nav piemērojams |
| UNCLEAR | `unclear` | Neskaidrs |

`UNCLEAR` vienmēr jāsaista ar atbilstošo frozen aptures stāvokli.

## 18. Moduļa autoritāte (APPLICABILITY AUTHORITY)

| Canonical | Machine key | LV apzīmējums |
|---|---|---|
| SYSTEM PROPOSAL ONLY | `system_proposal_only` | Tikai sistēmas priekšlikums |
| HUMAN CONFIRMATION REQUIRED | `human_confirmation_required` | Nepieciešams cilvēka apstiprinājums |
| EXTERNAL INPUT ONLY | `external_input_only` | Tikai ārējs ievaddats |
| RULE-BASED DETERMINATION | `rule_based_determination` | Noteikumos balstīta noteikšana |

## 19. CIF statuss

| Canonical | Machine key | LV apzīmējums |
|---|---|---|
| CRITICAL / IMPORTANT | `critical_important` | Kritiska / svarīga funkcija |
| NOT CRITICAL / IMPORTANT | `not_critical_important` | Nav kritiska / svarīga funkcija |
| NOT YET DETERMINED | `not_yet_determined` | Vēl nav noteikts |

## 20. Atļaujas statuss (PERMISSION STATUS)

| Canonical | Machine key | LV apzīmējums |
|---|---|---|
| ALLOWED | `allowed` | Atļauts |
| NOT ALLOWED | `not_allowed` | Nav atļauts |
| PERMISSION UNKNOWN | `permission_unknown` | Atļauja nav noteikta |
| DATA CLASS MISMATCH SUSPECTED | `data_class_mismatch_suspected` | Iespējama datu klases neatbilstība |

## 21. Aptures stāvokļi (SUSPENSION STATE)

| Canonical | Machine key | LV apzīmējums |
|---|---|---|
| TASK CLARIFICATION REQUIRED | `task_clarification_required` | Nepieciešama uzdevuma precizēšana |
| HUMAN INPUT REQUIRED | `human_input_required` | Nepieciešams cilvēka ievaddats |
| HUMAN CONFIRMATION REQUIRED | `human_confirmation_required` | Nepieciešams cilvēka apstiprinājums |
| HUMAN VERIFICATION REQUIRED | `human_verification_required` | Nepieciešama cilvēka verifikācija |
| ESCALATION REQUIRED | `escalation_required` | Nepieciešama eskalācija |
| BLOCK | `block` | Bloķēts |

Tas, ka `human_confirmation_required` ir arī moduļa autoritātes machine key, nav jauna semantiska vērtība; lauka nosaukums nosaka kontekstu.

## 22. Juridiskā apstiprinājuma un neapstiprināšanas modelis

Sistēma neievieš `approved` kā iekšēju juridiskā statusa enum.

Juridiskais apstiprinājums eksistē tikai kā ārēja atsauce:

```text
legal_approval_reference
  source_system_or_channel
  reference
  date
  by
```

Neapstiprināta juridiskā pozīcija tiek glabāta atsevišķi:

```text
legal_position
  NOT APPROVED | null

business_proceeded
  true | false | null

decision_source
reference
date
```

Machine representation:

```text
legal_position = not_approved | null
```

## 23. Juridiskā statusa starplauku validācija

Derīgas ir tikai šādas kombinācijas:

```text
1. Vēl nav juridiska lēmuma
   legal_approval_reference = null
   legal_position = null
   business_proceeded = null

2. Juridiski nav apstiprināts, bizness nav turpinājis
   legal_approval_reference = null
   legal_position = not_approved
   business_proceeded = false

3. Juridiski nav apstiprināts, bizness turpinājis
   legal_approval_reference = null
   legal_position = not_approved
   business_proceeded = true

4. Juridiski apstiprināts ārējā bankas procesā
   legal_approval_reference != null
   legal_position = null
   business_proceeded = null
```

Validācijas invarianti:

```text
IF legal_approval_reference IS NOT null
THEN legal_position MUST BE null
AND business_proceeded MUST BE null

IF legal_position = not_approved
THEN legal_approval_reference MUST BE null

business_proceeded MUST BE null
UNLESS legal_position = not_approved
```

## 24. Avota tips (SOURCE TYPE)

`SOURCE TYPE` ir tehniska taxonomy, ne juridisks statuss.

| Canonical | Machine key | LV apzīmējums |
|---|---|---|
| INTERNAL POLICY | `internal_policy` | Iekšējā politika |
| INTERNAL PROCEDURE | `internal_procedure` | Iekšējā procedūra |
| CONTRACT | `contract` | Līgums |
| CONTRACT ANNEX | `contract_annex` | Līguma pielikums |
| CHECKLIST | `checklist` | Pārbaudes saraksts |
| TEMPLATE | `template` | Veidne |
| EXTERNAL LEGAL SOURCE | `external_legal_source` | Ārējais tiesību avots |
| REGULATORY GUIDANCE | `regulatory_guidance` | Regulatīvās vadlīnijas |
| CASE LAW | `case_law` | Tiesu prakse |
| CORRESPONDENCE | `correspondence` | Sarakste |
| PRIOR TASK OUTPUT | `prior_task_output` | Iepriekšēja uzdevuma rezultāts |
| OTHER | `other` | Cits |

Kopu nedrīkst ad hoc paplašināt TASK ietvaros.

## 25. Izsekojamības objekta tips (TRACE OBJECT TYPE)

| Canonical | Machine key |
|---|---|
| TASK | `task` |
| SOURCE | `source` |
| MODULE | `module` |
| FINDING | `finding` |
| EVIDENCE | `evidence` |
| REQUIREMENTS SET | `requirements_set` |
| REQUIREMENT | `requirement` |
| REQUIREMENT COMPONENT | `requirement_component` |
| VERIFICATION EVENT | `verification_event` |
| HUMAN DECISION | `human_decision` |
| ESCALATION | `escalation` |
| UNRESOLVED ISSUE | `unresolved_issue` |
| OUTPUT | `output` |
| DATA CLASS EVENT | `data_class_event` |
| TRACE RECORD | `trace_record` |

Šis ir iekšējs tehniskais reģistrs. LV display label nav obligāts, kamēr tips netiek rādīts gala lietotāja saskarnē.

## 26. ID prefiksu standarts

| Objekts | Prefikss |
|---|---|
| TASK | `TASK-` |
| SOURCE | `SRC-` |
| MODULE | `MOD-` |
| FINDING | `FND-` |
| EVIDENCE | `EVD-` |
| REQUIREMENTS SET | `RQS-` |
| REQUIREMENT | `REQ-` |
| REQUIREMENT COMPONENT | `CMP-` |
| VERIFICATION EVENT | `VER-` |
| HUMAN DECISION | `DEC-` |
| ESCALATION | `ESC-` |
| UNRESOLVED ISSUE | `ISS-` |
| OUTPUT | `OUT-` |
| DATA CLASS EVENT | `DCE-` |
| TRACE RECORD | `TR-` |

ID ir necaurspīdīgs. No ID nedrīkst secināt parent/child attiecības.

`EVIDENCE ID` papildus jāatbilst `TRACEABILITY_RECORD_v1` noturības invariantam: tas nedrīkst mainīties tikai tādēļ, ka Review vai cits darba artefakts tiek pārģenerēts.

## 27. Datu klases (DATA CLASS) reģistra īpašnieks

Datu klašu saturiskais reģistrs nepieder šim dokumentam.

```text
CONTROLLED FIELD:
DATA CLASS

OWNER:
AI_TOOL_USAGE_POLICY_v1

REGISTRY:
DATA CLASS REGISTRY
```

Šis dokuments nosaka tikai kontraktu:
- deklarācijā drīkst izmantot tikai īpašnieka reģistrā esošu machine key;
- vērtība ārpus reģistra ir nederīga deklarācija;
- nederīga deklarācija nav `PERMISSION UNKNOWN`;
- `PERMISSION UNKNOWN` attiecas tikai uz derīgu datu klasi, kurai bankas permission lēmums nav noteikts.

Nederīgas deklarācijas gadījumā cilvēkam deklarācija jāizlabo pirms permission check.

## 28. VERIFICATION METHOD reģistra īpašnieks

```text
CONTROLLED FIELD:
VERIFICATION METHOD

OWNER:
VERIFICATION_PROTOCOL_v1

REGISTRY:
VERIFICATION METHOD REGISTRY
```

Šis dokuments nedefinē verifikācijas metodes vai dziļumu.

Līdz `VERIFICATION_PROTOCOL_v1` apstiprināšanai šī vārdnīca nav production-final.

## 29. OUTPUT TYPE reģistra īpašnieks

```text
CONTROLLED FIELD:
OUTPUT TYPE

OWNER:
OPERATION_WORKFLOWS_v1

REGISTRY:
OUTPUT TYPE REGISTRY
```

Šis dokuments neuztur gala output tipu sarakstu.

Pilotam 1 nepieciešamā provizoriskā kopa:

| Operācija | Provisional canonical | Machine key | LV apzīmējums |
|---|---|---|---|
| ANALYSE | LEGAL ANALYSIS | `legal_analysis` | Juridiskā analīze |
| EXTRACT | STRUCTURED EXTRACTION | `structured_extraction` | Strukturēta informācijas izguve |

Statuss:

```text
PROVISIONAL — OWNED BY OPERATION_WORKFLOWS_v1
```

Pēc `OPERATION_WORKFLOWS_v1` izstrādes katra provizoriskā vērtība:
- kļūst `ACTIVE`; vai
- kļūst `DEPRECATED`.

## 30. Kontrolēto reģistru indekss

| Controlled field | Owning document | Registry |
|---|---|---|
| OPERATION | `PROFESSIONAL_SCOPE_v1.3` | OPERATION |
| OBJECT | `PROFESSIONAL_SCOPE_v1.3` | OBJECT |
| MODULE | `PROFESSIONAL_SCOPE_v1.3` | MODULE |
| REQUIREMENT STATUS | `PROFESSIONAL_SCOPE_v1.3` | REQUIREMENT STATUS |
| VERIFICATION LEVEL | `PROFESSIONAL_SCOPE_v1.3` | VERIFICATION LEVEL |
| REQUIREMENT LEVEL | `PROFESSIONAL_SCOPE_v1.3` | REQUIREMENT LEVEL |
| GOVERNANCE STATUS | `PROFESSIONAL_SCOPE_v1.3` | GOVERNANCE STATUS |
| REQUIREMENT TYPE | `PROFESSIONAL_SCOPE_v1.3` | REQUIREMENT TYPE |
| MODULE STATUS | `PROFESSIONAL_SCOPE_v1.3` | MODULE STATUS |
| APPLICABILITY AUTHORITY | `PROFESSIONAL_SCOPE_v1.3` | MODULE AUTHORITY |
| CIF STATUS | `PROFESSIONAL_SCOPE_v1.3` | CIF STATUS |
| PERMISSION STATUS | `PROFESSIONAL_SCOPE_v1.3` | PERMISSION STATUS |
| SUSPENSION STATE | `PROFESSIONAL_SCOPE_v1.3` | SUSPENSION STATES |
| SOURCE TYPE | `TRACEABILITY_RECORD_v1` + šī dokumenta shēmas governance | SOURCE TYPE |
| TRACE OBJECT TYPE | `TERMINOLOGY_AND_ENUMS_v1` | TRACE OBJECT TYPE |
| ID PREFIX | `TERMINOLOGY_AND_ENUMS_v1` | ID PREFIX |
| DATA CLASS | `AI_TOOL_USAGE_POLICY_v1` | DATA CLASS REGISTRY |
| VERIFICATION METHOD | `VERIFICATION_PROTOCOL_v1` | VERIFICATION METHOD REGISTRY |
| OUTPUT TYPE | `OPERATION_WORKFLOWS_v1` | OUTPUT TYPE REGISTRY |

## 31. Boolean princips

Mašīnreprezentācijā patiesi boolean laukam izmanto:

```text
true
false
```

Nelieto `YES/NO`, `Y/N`, `1/0` kā canonical machine value.

UI drīkst rādīt `Jā / Nē`.

## 32. Datuma un laika princips

Mašīnreprezentācija izmanto ISO 8601.

```text
Datums:
YYYY-MM-DD

Timestamp:
YYYY-MM-DDThh:mm:ss±hh:mm
```

Lietotāja saskarnē formātu drīkst lokalizēt.

## 33. Versiju princips

Versijas identifikators ir teksts, ne statuss.

Piemēri:

```text
1.3
v0.4
2026-09-18
EBA-REQ-2026-01
```

Versijas virkni nedrīkst mehāniski parsēt, lai noteiktu hronoloģiju starp atšķirīgiem versēšanas formātiem.

Ja nepieciešams noteikt secību, to nosaka:
- atsevišķs datuma/laika lauks; vai
- dokumentēta versiju vēsture.

## 34. Termina STATUS lietošana

`STATUS` nedrīkst automātiski lietot jebkuram laukam.

Atšķir:

```text
STATUS      → kontrolēts stāvoklis
TYPE        → objekta tips
LEVEL       → juridiska / kontroles kategorija
AUTHORITY   → kas drīkst noteikt rezultātu
REFERENCE   → ārēja atsauce
EVENT       → vēsturisks notikums
DECISION    → cilvēka lēmums
```

## 35. Termina VERIFIED rezervēšana

`VERIFIED` ir rezervēts semantiskās verifikācijas nozīmei.

`HUMAN VERIFIED` nozīmē, ka noticis `PROFESSIONAL_SCOPE_v1.3` 17.3. paredzēts verifikācijas akts.

Nedrīkst izmantot tādus laukus vai statusus kā:
`source_verified`, `ai_verified`, `workflow_verified`,
ja faktiski domāts tikai avots atrasts, lauks aizpildīts, plūsma pabeigta vai otrs MI piekrita.

## 36. Termina APPROVED rezervēšana

`LEGAL APPROVED` ir ārējs bankas juridiskais apstiprinājums.

MI sistēma pati nepiešķir `LEGAL APPROVED`.

Vārdu `APPROVED` iekšējā sistēmas laukā drīkst izmantot tikai tad, ja dokumentēti norādīts:
- kas apstiprināja;
- kādā governance procesā;
- ar kādu atsauci.

## 37. Termina EVIDENCE rezervēšana

`EVIDENCE` nozīmē sasaisti ar konkrētu avota saturu.

Derīgam Evidence Object nepieciešams vismaz:

```text
SOURCE ID
LOCATION
EXACT QUOTED FRAGMENT
```

Brīvs MI kopsavilkums nav pierādījums.

## 38. FINDING definīcija

`FINDING` ir strukturēts, izsekojams secinājums vai konstatējums.

Tas nav:
- cilvēka lēmums;
- prasības statuss;
- pierādījums;
- juridiskais apstiprinājums.

FINDING var būt:
- faktu izguves rezultāts;
- juridisks konstatējums;
- salīdzinājuma atradums;
- teksta izstrādes pamatojums;
- cits izsekojams analīzes rezultāts.

## 39. MATERIAL OUTPUT definīcija

`MATERIAL OUTPUT` ir rezultāts, kas iziet ārpus konkrētā TASK:
- tiek izmantots jurista lēmumā;
- tiek nodots citai funkcijai;
- tiek izmantots saziņā ar darījuma partneri;
- kļūst par ievaddatu citam TASK.

Iekšējs MI darba melnraksts pats par sevi nav MATERIAL OUTPUT.

## 40. BLOCK definīcija

`BLOCK` nozīmē, ka attiecīgie ievaddati netiek tālāk apstrādāti MI rīkā un uz tiem balstīts materiāls rezultāts netiek izdots.

`BLOCK` nenozīmē, ka juridiskais darbs vispār ir aizliegts. Darbs drīkst turpināties ārpus MI rīka.

## 41. Terminoloģijas validācija

Pirms production ieviešanas:

1. visi controlled fields tiek salīdzināti ar šī dokumenta un attiecīgā owner document reģistriem;
2. visi Workflow dropdowns izmanto tikai derīgas machine keys;
3. visi Tabular Review controlled fields izmanto tās pašas kopas;
4. visi Lists controlled fields izmanto tās pašas kopas;
5. prompts nedrīkst izgudrot alternatīvas statusu vērtības;
6. output renderer drīkst pārvērst machine key tikai reģistrētā LV display label;
7. REQUIREMENT LEVEL / GOVERNANCE STATUS cross-field noteikums tiek testēts automātiski;
8. legal approval / legal position / business proceeded cross-field noteikums tiek testēts automātiski;
9. external registry value tiek validēta pret tās owner document versiju.

## 42. Aizliegtais anti-pattern

Nav pieļaujams:

```text
Workflow:
COMPLIANT

Tabular Review:
SATISFIED

Traceability:
IZPILDĪTS

Prompt:
MEETS REQUIREMENT
```

ja visi četri mēģina apzīmēt vienu un to pašu prasības statusu.

Pareizi:

```text
machine key:
izpildits

canonical value:
IZPILDĪTS

LV display label:
Izpildīts
```

Interpretācijas teksts drīkst paskaidrot, kāpēc prasība ir `IZPILDĪTS`.

## 43. Dokumenta robeža

Šis dokuments nenosaka:
- verifikācijas dziļumu;
- prasību saturu;
- prasību līmeņu piešķiršanas governance;
- AI/MI rīka permission saturu;
- workflow secību;
- Legora tehnisko konfigurāciju;
- retention;
- juridisko interpretāciju.

Tas nosaka vienotu valodu, tehnisko reprezentāciju un reģistru kontraktu.

## 44. Freeze nosacījums

Šis dokuments ir `MELNRAKSTS — IESALDĒŠANAS KANDIDĀTS`.

Freeze drīkst notikt tikai pēc:
1. mehāniskā audita pret abiem frozen dokumentiem;
2. blocking pretrunu skaits = 0;
3. jaunie tehniskie enum/taxonomy ir atzīti par saderīgiem ar frozen semantiku;
4. lietotāja explicit freeze approval.
