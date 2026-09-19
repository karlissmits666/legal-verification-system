# ARCHITECTURE CONFORMANCE WS1 IMPLEMENTATION TASK v0.1

## Machine-readable Schema & Registry Layer — pilnais risinājums un implementation gate

**Statuss:** PROPOSED — GATAVS LIETOTĀJA IMPLEMENTATION LĒMUMAM  
**Datums:** 2026-09-19  
**Primārais programmas dokuments:** `GOVERNANCE/ARCHITECTURE_CONFORMANCE_RESTRUCTURING_PLAN_v0.1.md`  
**Workstream:** WS1 — Machine-readable Schema & Registry Layer  
**Veids:** implementation task / dependency map; NAV jauns normative owner un NAV 14. pamatdokuments  
**Autoritatīvā bāze:** `PROFESSIONAL_SCOPE_v1.4`, `TRACEABILITY_RECORD_v1` v0.6, `TERMINOLOGY_AND_ENUMS_v1` v0.4 un `VERIFICATION_PROTOCOL_v1` v0.5

## 1. Lēmuma kopsavilkums

WS1 ir ieviešams bez frozen semantikas grozīšanas, bet sākotnējā karte ir
precizējama četros punktos:

1. vienu `core_statuses.json` nedrīkst izmantot vairākiem neatkarīgiem
   kontrolētiem laukiem; katram reģistram vajag savu artefaktu;
2. shēmu nedrīkst pasludināt par pilnu, ja tajā izmantota kontrolēta vērtība,
   kuras owner dokuments vēl nav apstiprināts/frozen;
3. JSON Schema validē struktūru, bet starpierakstu eksistenci, owner drift un
   catalog pilnīgumu validē deterministisks repo validators;
4. `schema_catalog.json` ir atvasināts discovery indekss, nevis release
   manifest, jauns authority avots vai WS5 aizvietotājs.

Tāpēc WS1 izpilda divās secīgās daļās:

```text
WS1-A — frozen owner projekcijas un pilnībā nosakāmi kontrakti
    ↓
WS1-B — atlikto kontraktu aktivizēšana tikai pēc to owner freeze
```

WS1-A ir šī uzdevuma implementējamais tvērums. WS1-B paliek tajā pašā
workstreamā, bet fail-closed statusā `BLOCKED_BY_OWNER`; tas nav klusējošs
atlikums un nav atļauja izmantot drafta vērtības produkcijas kontraktos.

## 2. Autoritātes un projekcijas modelis

```text
NORMATIVE MARKDOWN OWNER
        ↓ precīza, izsekojama projekcija
MACHINE-READABLE REGISTRY / JSON SCHEMA
        ↓ deterministiska pārbaude
DRIFT VALIDATOR + GENERATED DISCOVERY CATALOG
```

Noteikumi:

1. Markdown owner paliek vienīgais juridiskās un governance semantikas avots.
2. Machine artefakts nedrīkst pievienot, sašaurināt, pārdēvēt vai interpretēt
   owner normu.
3. Ja projekcija nesakrīt ar owner, rezultāts ir `FAIL`; projekcija nekļūst par
   jaunāku normu.
4. T&E v0.4 nosaka mašīnas reprezentāciju, bet nepārņem citas politikas
   semantisko ownership.
5. Drafta owner saturs nedrīkst nonākt `ACTIVE_PROJECTION` artefaktā.
6. Frozen owner failus WS1 implementation nemaina.

## 3. Repo mērķa struktūra

```text
schemas/
  traceability/
    trace_object_reference.schema.json
    task_record.schema.json
    module_record.schema.json
    finding_record.schema.json
    evidence_object.schema.json
    verification_scope_record.schema.json
    requirements_set_record.schema.json
    requirement_result_record.schema.json
    requirement_component.schema.json
    verification_event.schema.json
    human_decision_record.schema.json
    escalation_record.schema.json
    unresolved_issue_record.schema.json
    trace_record.schema.json

registries/
  traceability/
    trace_object_types.registry.json
    id_prefixes.registry.json
    trace_object_id_fields.registry.json
  enums/
    operation.registry.json
    object.registry.json
    module.registry.json
    requirement_status.registry.json
    verification_level.registry.json
    requirement_level.registry.json
    governance_status.registry.json
    requirement_type.registry.json
    module_status.registry.json
    applicability_authority.registry.json
    cif_status.registry.json
    permission_status.registry.json
    suspension_state.registry.json
    source_type.registry.json
    content_hash_algorithm.registry.json
    contract_type.registry.json
    human_decision_type.registry.json
    verification_method.registry.json
    verification_result.registry.json

catalog/
  schema_catalog.json

TOOLS/
  build_ws1_catalog.ps1
  validate_ws1_contract_layer.ps1
  fixtures/ws1/
    valid_projection/
    invalid_duplicate_id/
    invalid_missing_mapping/
    invalid_unresolved_ref/
```

`TOOLS/fixtures/ws1` satur tikai validatora pašpārbaudes minimumu. Tas nav WS4
domēna positive/negative conformance suite.

## 4. Artefakta metadata kontrakts

Katram schema un registry artefaktam obligāti ir:

```json
{
  "artifact_id": "stabila unikāla mašīnas identitāte",
  "artifact_version": "0.1.0",
  "artifact_kind": "json_schema | controlled_registry | mapping_registry",
  "projection_status": "ACTIVE_PROJECTION",
  "normative_owners": [
    {
      "document": "GOVERNANCE/...md",
      "version": "v...",
      "sections": ["§..."],
      "role": "semantic_owner | representation_owner | dependency"
    }
  ]
}
```

Precizējumi:

- `normative_owners` ir masīvs, jo vienam artefaktam var būt vairāki owner vai
  reprezentācijas avoti;
- `artifact_version` ir projekcijas versija, nevis owner dokumenta versija;
- `projection_status` WS1-A artefaktos drīkst būt tikai `ACTIVE_PROJECTION`;
- bloķētie objekti tiek uzskaitīti catalog dependency ierakstos, bet tiem
  neveido šķietami pilnu executable schema;
- vērtību mašīnatslēgas drīkst izmantot tikai tad, ja tās nosaka T&E vai
  attiecīgais owner; validators tās nedrīkst brīvi ģenerēt;
- JSON Schema dialekts ir Draft 2020-12;
- tehniskie lauku nosaukumi ir angļu valodā, lowercase `snake_case` atbilstoši
  T&E v0.4 §4;
- shēmās pēc noklusējuma izmanto `additionalProperties: false`; apzināts
  paplašinājuma punkts ir atļauts tikai tad, ja to nosaka owner.

## 5. WS1-A registry inventārs

### 5.1. Traceability tehniskie reģistri

| Artefakts | Normative owner | Rezultāts |
|---|---|---|
| `trace_object_types.registry.json` | T&E v0.4 §25 | precīza TRACE OBJECT TYPE kopa |
| `id_prefixes.registry.json` | T&E v0.4 §26 | precīza ID prefiksu kopa |
| `trace_object_id_fields.registry.json` | T&E v0.4 §30.1 + norādītie field owneri | TYPE → PREFIX → ID FIELD → OWNER 1:1 mapping |

### 5.2. Frozen kontrolēto vērtību reģistri

Katram laukam ir atsevišķs fails, lai nepieļautu statusu, taxonomy un authority
vērtību sajaukšanu vienā paralēlā avotā.

| Reģistrs | Semantiskais owner | Reprezentācijas/dependency owner |
|---|---|---|
| `operation` | PS v1.4 §30 un saistītā semantika | T&E v0.4 §8 |
| `object` | PS v1.4 §30 un saistītā semantika | T&E v0.4 §9 |
| `module` | PS v1.4 §30 un saistītā semantika | T&E v0.4 §10 |
| `requirement_status` | PS v1.4 §30 | T&E v0.4 §11 |
| `verification_level` | PS v1.4 §30 | T&E v0.4 §12 |
| `requirement_level` | PS v1.4 §30 | T&E v0.4 §13 |
| `governance_status` | PS v1.4 §30 | T&E v0.4 §14 |
| `requirement_type` | PS v1.4 §30 | T&E v0.4 §15 |
| `module_status` | PS v1.4 §30 | T&E v0.4 §16 |
| `applicability_authority` | PS v1.4 §30 | T&E v0.4 §17 |
| `cif_status` | PS v1.4 §30 | T&E v0.4 §18 |
| `permission_status` | PS v1.4 §30 | T&E v0.4 §19 |
| `suspension_state` | PS v1.4 §30 | T&E v0.4 §§20–23 |
| `source_type` | TR v0.6 §§9–10 | T&E v0.4 §24 |
| `content_hash_algorithm` | T&E v0.4 §26.3 | — |
| `contract_type` | T&E v0.4 §28.1 | — |
| `human_decision_type` | T&E v0.4 §29.2 | TR v0.6 §36 |
| `verification_method` | VP v0.5 §5 | VP v0.5 §17, kur piemērojams |
| `verification_result` | VP v0.5 §12 | — |

Katrs registry ieraksts glabā tikai owner definētos elementus:
`canonical`, `machine_key`, `lv_label` un lifecycle metadata tādā apjomā, kādā
tie faktiski ir noteikti. Neesošs owner lauks netiek aizpildīts ar pieņēmumu.

## 6. WS1-A shēmu inventārs

| Shēma | TRACE OBJECT TYPE | Galvenie owneri | Statuss |
|---|---|---|---|
| `trace_object_reference.schema.json` | — | TR §5.1; T&E §26.2 | ACTIVE_PROJECTION |
| `task_record.schema.json` | TASK | TR §§6–7; PS/T&E kontrolētie lauki | ACTIVE_PROJECTION |
| `module_record.schema.json` | MODULE | TR §8; PS/T&E MODULE lauki | ACTIVE_PROJECTION |
| `finding_record.schema.json` | FINDING | TR §§15–16 | ACTIVE_PROJECTION |
| `evidence_object.schema.json` | EVIDENCE | TR §§17–20 | ACTIVE_PROJECTION |
| `verification_scope_record.schema.json` | VERIFICATION SCOPE RECORD | TR §20.1 | ACTIVE_PROJECTION |
| `requirements_set_record.schema.json` | REQUIREMENTS SET | TR §21 | ACTIVE_PROJECTION |
| `requirement_result_record.schema.json` | REQUIREMENT | TR §§22–26, 28–29; PS/T&E; VP | ACTIVE_PROJECTION |
| `requirement_component.schema.json` | REQUIREMENT COMPONENT | TR §§27–29 | ACTIVE_PROJECTION |
| `verification_event.schema.json` | VERIFICATION EVENT | TR §§30–33; VP §§5–14 | ACTIVE_PROJECTION |
| `human_decision_record.schema.json` | HUMAN DECISION | TR §36; T&E §29.2 | ACTIVE_PROJECTION |
| `escalation_record.schema.json` | ESCALATION | TR §37 | ACTIVE_PROJECTION |
| `unresolved_issue_record.schema.json` | UNRESOLVED ISSUE | TR §§38–39 | ACTIVE_PROJECTION |
| `trace_record.schema.json` | TRACE RECORD | TR §§34–35, 44–46 | ACTIVE_PROJECTION |

`requirement_result_record.schema.json` nosaukums neievieš jaunu TRACE OBJECT
TYPE. Catalog tajā nepārprotami saglabā `trace_object_type: REQUIREMENT` un
`id_field: requirement_id`.

## 7. Fail-closed atliktie objekti — WS1-B

| Objekts / lauks | Trūkstošais owner | WS1 stāvoklis | Aktivizācijas nosacījums |
|---|---|---|---|
| `legal_classification_assessment` / QUALITATIVE LIKELIHOOD | `LEGAL_RESEARCH_METHOD_v1` | BLOCKED_BY_OWNER | owner registry apstiprināts/frozen |
| `module_screening_record` | module trigger modelis / `REQUIREMENTS_MATRIX_GOVERNANCE_v1` | BLOCKED_BY_OWNER | trigger registry un shēma apstiprināta |
| `module_trigger_set` | `MODULE_TRIGGER_REGISTRY_v1` + RMG | BLOCKED_BY_OWNER | abi owner slāņi apstiprināti |
| `source_record` / DATA CLASS | `AI_TOOL_USAGE_POLICY_v1` | BLOCKED_BY_OWNER | DATA CLASS registry apstiprināts/frozen |
| `data_class_event` / DATA CLASS | `AI_TOOL_USAGE_POLICY_v1` | BLOCKED_BY_OWNER | DATA CLASS registry apstiprināts/frozen |
| `output_record` / OUTPUT TYPE | `OPERATION_WORKFLOWS_v1` | BLOCKED_BY_OWNER | OUTPUT TYPE registry apstiprināts/frozen |

Frozen T&E §25/§26/§30.1 tehniskie TYPE, prefix un ID-field ieraksti par šiem
objektiem joprojām tiek projicēti. Taču tie nepierāda pilnas objekta shēmas
gatavību. Catalog tos rāda kā zināmus, bloķētus dependencies bez executable
schema path.

WS1 nedrīkst:

- aizstāt trūkstošu enum ar nekontrolētu `string` un nosaukt shēmu par pilnu;
- kopēt drafta vērtības uz jaunu šķietami frozen registry;
- izgudrot pagaidu DATA CLASS, QUALITATIVE LIKELIHOOD, OUTPUT TYPE vai trigger
  vērtības;
- slēpt bloķējumu ar optional lauku.

## 8. Piespraustās atsauces kontrakts

`trace_object_reference.schema.json` izmanto `oneOf` ar tieši diviem režīmiem:

1. intra-record atsauce — obligāti `trace_object_type` un
   `trace_object_id`;
2. cross-record atsauce — obligāti `trace_record_id`,
   `record_version`, `trace_object_type` un `trace_object_id`.

Abos režīmos:

- daļēja cross-record atsauce nav derīga;
- `current`, `latest`, peldoša versija vai noklusēta record versija nav
  pieļaujama;
- TYPE, prefix un ID-field savietojamība tiek pārbaudīta pret WS1 reģistriem;
- atsauces target faktiskā eksistence un tips ir semantiskā validatora, nevis
  JSON Schema pienākums.

## 9. Validācijas atbildību sadalījums

### 9.1. JSON Schema pārbauda

- datu tipu;
- obligātos laukus;
- `additionalProperties` robežu;
- ID un datuma/laika formātu;
- enum vērtības ar `$ref` uz registry projekciju vai ģenerētu enum definīciju;
- owner noteiktas conditional required/forbidden attiecības;
- reference objekta lokālo pilnīgumu.

### 9.2. `validate_ws1_contract_layer.ps1` pārbauda

1. visu `artifact_id` un registry ID unikalitāti;
2. T&E §25 ↔ TRACE OBJECT TYPE precīzu 1:1 kopu;
3. T&E §26 ↔ ID PREFIX precīzu 1:1 kopu;
4. T&E §30.1 ↔ TYPE/PREFIX/ID FIELD/OWNER precīzu 1:1 mapping;
5. katra mapping ID field esamību norādītajā owner sadaļā;
6. TR §5.1 ↔ T&E §26.2 ↔ reference schema identitāti;
7. PS §30 canonical kopu ↔ T&E §§8–23 reprezentāciju ↔ atsevišķo registry
   precīzu 1:1 atbilstību;
8. TR/T&E/VP owneru ↔ pārējo WS1-A registry precīzu atbilstību;
9. visu `$ref` atrisināmību un aizliegumu atsaukties uz
   `BLOCKED_BY_OWNER` artefaktu;
10. katras shēmas TRACE OBJECT TYPE, prefix un ID-field atbilstību mapping;
11. `normative_owners` atsauču failu un sadaļu esamību;
12. aizliegumu machine artefaktā izmantot owner neesošu controlled value;
13. blocked dependency ierakstam nav aktīva executable schema;
14. versionētā frozen faila un canonical alias identitāti, kur abi eksistē;
15. catalog deterministisku atjaunošanu, stabilu kārtojumu, pilnīgumu un
    neesošu failu aizliegumu;
16. validatora valid/invalid pašpārbaudes fixture gaidīto rezultātu;
17. WS1 diffā nav frozen owner failu izmaiņu.

### 9.3. Ko WS1 validators nepārbauda

- pilnu requirement → source → test → evidence ķēdi — WS2;
- AI candidate → canonical admission — WS3;
- pilnu domēna conformance test suite — WS4;
- release provenance, commit/test report un vides manifestu — WS5.

## 10. Catalog kontrakts

`catalog/schema_catalog.json` ģenerē `build_ws1_catalog.ps1` no faktiskajiem
WS1 artefaktiem un explicit blocked-dependency definīcijas.

Katram ierakstam catalog glabā:

- `artifact_id`;
- `artifact_kind`;
- `artifact_version`;
- `projection_status`;
- repo-relative path vai `null`, ja `BLOCKED_BY_OWNER`;
- TRACE OBJECT TYPE un ID field, ja piemērojams;
- normative owner atsauces;
- artefakta dependencies.

Catalog nedrīkst saturēt release approval, vides stāvokli, test reportu vai
pasludināt freeze. Tā vienīgais uzdevums ir deterministiska WS1 artefaktu
atrodamība un dependency closure.

## 11. Izpildes secība

### 11.1. WS1-A atomārā implementation pakete

1. izveidot direktoriju struktūru un vienotu metadata formu;
2. izveidot visus §5 registry artefaktus;
3. izveidot reference schema;
4. izveidot visas §6 `ACTIVE_PROJECTION` shēmas;
5. izveidot explicit §7 blocked dependency ierakstus;
6. izveidot deterministic catalog builder;
7. izveidot drift validatoru un minimālos validatora fixtures;
8. palaist esošos continuity/freeze validatorus un jauno WS1 validatoru;
9. sagatavot neatkarīgas implementation recenzijas uzdevumu;
10. tikai pēc auditējama PASS un lietotāja lēmuma pāriet pie nākamā WS1/WS2
    gate.

Implementation jāveic vienā atomārā commitā. Ja vienlaikus nav iespējams
izpildīt visu WS1-A acceptance, izmaiņas nedrīkst pasludināt par pabeigtu
machine contract layer.

### 11.2. WS1-B aktivizācija

Katru bloķēto shēmu drīkst aktivizēt tikai pēc attiecīgā owner dokumenta
approval/freeze un atsevišķa lietotāja implementation lēmuma. Aktivizācija
ietver registry projekciju, shēmu, catalog statusa maiņu un validatora
pārbaudes vienā atomārā paketē.

## 12. Acceptance kritēriji

WS1-A ir izpildīts tikai tad, ja:

1. visi §5 artefakti ir precīzas owner projekcijas;
2. visas §6 shēmas validē owner noteikto struktūru un conditionality;
3. neviens §7 objekts nav nepatiesi pasludināts par pilnu;
4. TYPE ↔ PREFIX ↔ ID FIELD ↔ schema mapping ir deterministisks un pilnīgs;
5. pinned reference kontrakts aizliedz daļējas un peldošas atsauces;
6. catalog ir reproducējams no repo satura;
7. validatora valid fixture dod PASS un katra invalid fixture dod paredzēto
   FAIL;
8. esošie continuity un frozen-baseline validatori paliek PASS;
9. frozen owner failu saturs nav mainīts;
10. neatkarīga recenzija neatrod atvērtu BLOCKING vai HIGH finding;
11. lietotājs atsevišķi pieņem implementation rezultātu.

WS1 kopumā nav pabeigts, kamēr WS1-B bloķējumi nav vai nu atrisināti ar owner
freeze, vai programmas līmenī skaidri pārvietoti uz attiecīgo 13 dokumentu
milestone ar owner, acceptance un secību. Tos nedrīkst klusējot aizmirst.

## 13. Anti-overengineering gate

| Kandidāts | Lēmums | Pamatojums |
|---|---|---|
| atsevišķi reģistri katram controlled field | IEKĻAUT | novērš sajauktu ownership un drift |
| reference schema | IEKĻAUT | mehāniski novērš floating/partial references |
| core complete schemas | IEKĻAUT | novērš required/conditionality kļūdas |
| blocked dependency catalog entries | IEKĻAUT | novērš drafta semantikas klusētu iesaldēšanu |
| deterministic catalog | IEKĻAUT | nodrošina atrodamību bez otra authority avota |
| validatora minimālie fixtures | IEKĻAUT | pierāda paša validatora fail-closed uzvedību |
| jauna ontology/knowledge graph | NEIEKĻAUT | WS1 nav konkrētas nepieciešamības |
| datubāze vai API | NEIEKĻAUT | kontraktu slānim nav vajadzīga runtime sistēma |
| policy engine/compiler | NEIEKĻAUT | pieder WS3/WS4 |
| pilna testu matrica | NEIEKĻAUT | pieder WS2/WS4 |
| release manifest | NEIEKĻAUT | pieder WS5 |

## 14. Roadmap ietekme

- Primārais darbs paliek `ARCHITECTURE_CONFORMANCE_RESTRUCTURING_PLAN_v0.1`
  WS1 ietvaros.
- WS2–WS5 nav sākti un nav autorizēti.
- Nākamais lielais 13 dokumentu roadmap milestone paliek bloķēts.
- Šis uzdevums neatver frozen PS/TR/T&E/VP amendment.
- WS1-A implementation prasa atsevišķu lietotāja apstiprinājumu.

## 15. Precīzs nākamais lēmums

```text
APPROVE WS1-A IMPLEMENTATION
```

Šāds apstiprinājums autorizē tikai šī dokumenta §§3–12 noteiktās WS1-A
machine-readable projekcijas, catalog builder, drift validatoru un minimālos
validatora fixtures vienā atomārā implementation paketē.

Tas neautorizē:

- WS1-B bloķēto owneru semantikas izgudrošanu;
- WS2–WS5 ieviešanu;
- frozen dokumentu grozīšanu;
- faktisku `TASK-`, `MOD-`, `ISS-` vai cita trace objekta instanci;
- WS1 freeze vai pāreju uz nākamo lielo roadmap dokumentu.
