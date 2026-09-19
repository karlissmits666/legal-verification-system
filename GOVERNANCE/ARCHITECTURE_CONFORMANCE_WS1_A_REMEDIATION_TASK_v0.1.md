# WS1-A MACHINE-READABLE CONTRACT LAYER — REMEDIĀCIJAS UZDEVUMS v0.1

**Statuss:** GATAVS LIETOTĀJA IMPLEMENTĀCIJAS LĒMUMAM  
**Primārais programmas dokuments:** `GOVERNANCE/ARCHITECTURE_CONFORMANCE_RESTRUCTURING_PLAN_v0.1.md`  
**Workstream:** WS1 — Machine-readable Schema & Registry Layer  
**Remediācijas bāze:** `bd4288b14b1c655acd1d3d98cff2f37897b74410`  
**Neatkarīgās recenzijas verdikts:** CHANGES REQUIRED  
**Recenzijas findings:** F-01–F-21  
**Frozen owner baseline:** PS v1.4 / TR v0.6 / T&E v0.4 / VP v0.5  
**Scope:** tikai WS1-A remediācija; WS1-B un WS2–WS5 paliek bloķēti

## 1. Mērķis

Novērst WS1-A neatkarīgajā implementation recenzijā konstatētās nepilnības tā, lai machine-readable contract layer būtu mehāniski sasaistīts ar frozen owner dokumentiem, fail-closed un deterministiski pārbaudāms.

Remediācija nedrīkst mainīt frozen PS/TR/T&E/VP semantiku, izgudrot owner vērtības, aktivizēt WS1-B, sākt WS2–WS5, radīt faktiskas trace object instances vai pasludināt WS1-A par ACCEPT/FROZEN bez jaunas neatkarīgas recenzijas un lietotāja lēmuma.

## 2. Autoritātes robeža

Normatīvā semantika paliek frozen Markdown owner dokumentos. Registry, schemas, catalog, generated definitions un validators ir tikai šo normu tehniskas projekcijas.

Ja finding novēršanai nepieciešama izvēle starp vairākām ticamām frozen-owner interpretācijām, implementation apstājas pie fail-closed boundary un jautājums tiek nodots owner amendment / user decision procesam.

## 3. Obligātais gala rezultāts

Pirms remediācijas review jābūt patiesiem vismaz šiem nosacījumiem:

1. `trace_object_reference` faktiski regulē visus TR §5.1 reference laukus;
2. controlled enum vērtības nav nekontrolēta paralēla inline autoritāte;
3. WS1-B blocked objekts nevar kļūt executable, saglabājot PASS;
4. registry ↔ owner salīdzinājums ir precīzs, section-scoped un divvirzienu;
5. schema ↔ registry ↔ TYPE/PREFIX/ID FIELD mapping ir deterministisks;
6. `normative_owners` failu/sadaļu atsauces ir verificētas;
7. catalog ir pilnībā reproducējams;
8. fixtures izsauc pašu produkcijas validatoru;
9. frozen baseline neskartība nav atkarīga no `HEAD^`;
10. WS1-B un WS2–WS5 paliek ārpus scope.

## 4. Darba pakete A — pinned references

### A1 — F-01 / F-08

Šiem laukiem brīvs `string` jāaizstāj ar faktisku `$ref` uz `trace_object_reference.schema.json`, ja frozen owner tos definē kā §5.1 reference:

- `module_record.classification_assessment_references`;
- `requirement_result_record.classification_basis_references`;
- `human_decision_record.related_trace_object_references`;
- `human_decision_record.assignment_authority_basis_source_reference`;
- `unresolved_issue_record.related_trace_object_references`;
- `unresolved_issue_record.action_owner_basis_reference`;
- `unresolved_issue_record.resolution_authority_basis_reference`.

Kur owner ierobežo target TYPE, shēmā jābūt tieši šai TYPE kopai.

Bloķēta target objekta reference struktūras validācija pati par sevi nedrīkst aktivizēt tā pilno WS1-B schema.

### A2 — F-09

`trace_object_reference.schema.json` jāvalidē TYPE ↔ ID PREFIX savietojamība, deterministiski atvasinot to no `id_prefixes.registry.json`. Nederīga kombinācija, piemēram `task` + `MOD-`, ir FAIL.

### A3 — F-14

Moving-target aizliegumu nedrīkst realizēt tikai ar `["current","latest"]` denylist. Ja frozen owner nosaka pietiekamu immutable version formātu, izmantot allowlist/pattern pieeju gan reference schema, gan `trace_record.record_version`. Ja owner formāts nav pietiekami noteikts, izveidot explicit owner-decision boundary, nevis izgudrot formātu.

## 5. Darba pakete B — controlled values un owner drift

### B1 — F-02

Kontrolēto enum vērtību shēmu validācijai jābūt mehāniski saistītai ar registry projekciju.

Atļauts:
- `$ref` uz ģenerētu enum definition, kas būvēta no registry; vai
- inline enum tikai tad, ja validators katram laukam pierāda precīzu schema enum ↔ registry ↔ owner kopu identitāti abos virzienos.

Priekšroka dodama vienai ģenerētai machine kopai, ja tas neievieš jaunu authority slāni.

### B2 — F-04 / F-05

Substring meklēšana pa visu owner failu jāaizstāj ar section-scoped Markdown tabulas/kopas parsēšanu.

Validatoram jāatklāj:
- lieka machine value;
- trūkstoša owner value;
- vērtība no nepareiza controlled field;
- neatbilstība canonical/machine representation;
- 1:1 kopu neatbilstība abos virzienos.

### B3 — F-19 / F-20 / F-21

Owner routing jāatvasina no `normative_owners`, ne artifact nosaukuma wildcardiem. Hardcoded `19` jāatvasina no owner tabulas. `verification_method.lifecycle` jāvalidē pret VP, ja tas ownerā ir kontrolēts atribūts.

## 6. Darba pakete C — WS1-B fail-closed

### C1 — F-03

Validatoram obligāti jāpārbauda:
- catalog `artifact_id` unikalitāte;
- neviena executable schema nedeklarē blocked `x_trace_object_type`;
- BLOCKED_BY_OWNER ierakstam `path = null`;
- viens artifact nevar vienlaikus būt ACTIVE un BLOCKED.

### C2 — F-13

Sešu WS1-B blocked objektu hardcoded saraksts builder skriptā jāpārvieto uz deklaratīvu projection/control artefaktu, piemēram `registries/blocked_dependencies.registry.json`.

Tas nav jauns normatīvais owner. Builder to tikai nolasa.

## 7. Darba pakete D — catalog un normative owners

### D1 — F-10

Validatoram jāpārbauda katrs `normative_owners` ieraksts:
- dokumenta eksistence, ja tas deklarēts kā repo dokuments;
- sadaļas eksistence;
- version metadata;
- neatļautas atsauces uz neesošu failu.

Ja owner vēl nav izveidots, blocked dependency metadata skaidri jānorāda, ka tas ir missing/unapproved dependency, nevis jāizliekas par verificētu repo failu.

### D2 — F-11

Catalog reproducibility jāsalīdzina pēc normalizēta pilna JSON satura, ne tikai `artifact_id|projection_status|path`.

Jāsedz vismaz `artifact_id`, `artifact_kind`, `artifact_version`, `projection_status`, `path`, `trace_object_type`, `id_field`, `normative_owners`, `dependencies`, kā arī catalog-level metadata.

### D3 — F-12

`id_field` jālieto vienā machine reprezentācijā visiem catalog ierakstiem. Ja vajadzīga canonical label, tai jābūt atsevišķā laukā.

### D4 — F-15

Catalog `dependencies` jāatspoguļo reālās machine dependencies, kas izriet no `$ref`/generated definitions. Tas nav runtime secības vai juridiskas atkarības modelis.

## 8. Darba pakete E — validatora fail-closed pierādījums

### E1 — F-06

Frozen baseline integritātes pārbaude nedrīkst balstīties tikai uz `HEAD^..HEAD`. Jāievieš stabils frozen baseline fingerprint mehānisms, piemēram, repo glabāts SHA-256 manifests pret jau apstiprināto frozen failu saturu.

Manifestam nav tiesību mainīt freeze statusu.

### E2 — F-07

Fixtures jāizpilda pret to pašu `TOOLS/validate_ws1_contract_layer.ps1`, izmantojot explicit fixture/repo root.

Minimāli:
- valid baseline → PASS;
- duplicate artifact ID → FAIL;
- missing owner value → FAIL;
- cross-registry contamination → FAIL;
- schema enum drift → FAIL;
- TYPE/prefix mismatch → FAIL;
- executable blocked schema → FAIL;
- broken `$ref` → FAIL;
- catalog metadata drift → FAIL;
- frozen baseline hash drift → FAIL.

Fixtures nav WS4 pilnā conformance suite.

## 9. Darba pakete F — schema owner invariants

### F1 — F-17

Ja `human_decision_record` compatibility view laukā ir `related_finding`, `related_requirement` vai `related_issue`, tad `related_trace_object_references` ir required ar `minItems >= 1`.

Konkrētās typed-reference satura sakritības pārbaude pieder semantiskajam validatoram.

### F2 — F-16 OWNER-DECISION BOUNDARY

`finding_record.related_output` required/optional statusu nedrīkst izmainīt pēc minējuma.

Vispirms atkārtoti verificēt TR §15. Ja owner viennozīmīgi nosaka required, shēmu saskaņo. Ja pastāv redakcionāla neskaidrība, izveido explicit amendment candidate un semantiku nemaina līdz user-approved owner lēmumam.

### F3 — F-18 OWNER-DECISION CHECK

`escalation_record.response_reference` nullable/non-nullable statuss vispirms jāpārbauda pret TR §37 un T&E null principu. Ja frozen owneri nedod viennozīmīgu atbildi, izveido owner-decision/amendment candidate.

## 10. Findings closure map

| Finding | Severity | Pakete | Prasītais stāvoklis pirms review |
|---|---|---|---|
| F-01 | BLOCKING | A1 | CLOSED |
| F-02 | BLOCKING | B1 | CLOSED |
| F-03 | BLOCKING | C1 | CLOSED |
| F-04 | HIGH | B2 | CLOSED |
| F-05 | HIGH | B2 | CLOSED |
| F-06 | HIGH | E1 | CLOSED |
| F-07 | HIGH | E2 | CLOSED |
| F-08 | HIGH | A1 | CLOSED |
| F-09 | HIGH | A2 | CLOSED |
| F-10 | HIGH | D1 | CLOSED |
| F-11 | HIGH | D2 | CLOSED |
| F-12 | MEDIUM | D3 | CLOSED |
| F-13 | MEDIUM | C2 | CLOSED |
| F-14 | MEDIUM | A3 | CLOSED vai explicit owner boundary |
| F-15 | MEDIUM | D4 | CLOSED |
| F-16 | MEDIUM | F2 | CLOSED vai explicit amendment candidate |
| F-17 | MEDIUM | F1 | CLOSED |
| F-18 | LOW | F3 | CLOSED vai explicit amendment candidate |
| F-19 | LOW | B3 | CLOSED |
| F-20 | LOW | B3 | CLOSED |
| F-21 | LOW | B3 | CLOSED |

Neviens BLOCKING vai HIGH findings nedrīkst palikt kā follow-up.

MEDIUM/LOW drīkst palikt atvērts tikai tad, ja tas ir pierādāmi owner-amendment jautājums, nevis implementation defekts.

## 11. Implementation secība

1. blocked dependency registry + frozen baseline fingerprint;
2. owner section parser + 1:1 registry comparison;
3. controlled-value generated definitions / saites;
4. reference schema pieslēgšana;
5. TYPE↔prefix conditionality;
6. schema owner invariants;
7. catalog dependency closure + full reproducibility;
8. blocked executable-schema un normative owner pārbaudes;
9. integration fixtures;
10. pilns validatoru cikls;
11. viens skaidrs remediācijas review target state;
12. fresh-context neatkarīgas remediācijas recenzijas uzdevums.

## 12. Commit un audit discipline

Mērķis ir viena atomāra remediācijas pakete. Ja tehnisku kļūdu labošanai tomēr rodas vairāki commiti, neatkarīgā recenzija vērtē pilnu remediācijas diff no pirms-remediācijas state līdz skaidri norādītam gala targetam. Frozen baseline tiek pierādīts ar stabilu fingerprint, ne `HEAD^`.

Neviens starpcommits netiek pasludināts par WS1-A ACCEPT.

## 13. Acceptance tests pirms review

Obligāti PASS:
1. exact owner↔registry 1:1;
2. schema controlled-value ↔ registry integrity;
3. visi `$ref` atrisinās;
4. blocked objects nevar kļūt executable;
5. TYPE↔prefix checks;
6. catalog artifact_id unique;
7. normative owner path/section checks;
8. full normalized catalog regeneration identical;
9. frozen baseline fingerprints identical;
10. integration fixtures: valid PASS, invalid scenāriji FAIL;
11. repository continuity PASS;
12. Review #16 frozen invariants PASS;
13. frozen owner faili nav mainīti;
14. WS2–WS5 nav sākti;
15. nav faktisku trace object instanču.

## 14. Neatkarīgās remediācijas recenzijas prasība

Pēc implementation nepieciešama fresh-context neatkarīga recenzija, kas pārbauda F-01–F-21 closure un pati atkārto svarīgākos negatīvos testus. CI PASS pats par sevi nav ACCEPT.

ACCEPT tikai tad, ja nav atvērtu BLOCKING/HIGH finding un nav MEDIUM finding, kas joprojām ir implementation defekts.

## 15. Aizliegtās darbības

Aizliegts:
- grozīt frozen owner failus bez amendment procesa;
- aktivizēt WS1-B;
- ieviest draft owner vērtības kā canonical;
- sākt WS2–WS5;
- pievienot release manifest;
- pievienot ontology, DB/API, policy engine vai runtime platformu;
- radīt faktiskus TASK-/MOD-/ISS- objektus;
- pasludināt production readiness;
- freezeot WS1.

## 16. Precīzs nākamais lēmums

Šī task sagatavošana pati neautorizē implementāciju.

```text
APPROVE WS1-A REMEDIATION IMPLEMENTATION
```

Šis gate autorizē tikai šajā dokumentā definēto WS1-A remediācijas paketi. Tas neautorizē frozen owner amendment, WS1-B aktivizāciju, WS2–WS5, WS1 freeze vai production acceptance.
