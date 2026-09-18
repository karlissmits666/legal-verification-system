# REVIEW #16 — APSTIPRINĀTAIS INTEGRĀCIJAS LĒMUMS

## Governance TASK un UNRESOLVED ISSUE instances priekšnoteikumi

**Statuss:** LIETOTĀJA APSTIPRINĀTS INTEGRĀCIJAS LĒMUMS — NAV FREEZE  
**Datums:** 2026-09-18  
**Review uzdevums:** `GOVERNANCE/TRACEABILITY_ISS_INSTANTIATION_REVIEW16_TASK.md`  
**Tvērums:** draftu shēmas delta; frozen baseline netiek mainīts

## 1. Lēmums

Review #16 secinājumi ir pieņemti un ieviešami juridiskās klasifikācijas amendment paketes draftos.

Apstiprinātais virziens:

1. `MODULE RECORD` ir patstāvīgs trace object, un tam pievieno obligātu `MODULE ID` ar `MOD-` prefiksu.
2. Saglabāta trace-object reference vienmēr ir piesprausta konkrētam record un versijai.
3. `RELATED OBJECT` brīvteksta lauku aizstāj ar tipētu `RELATED TRACE OBJECT REFERENCES` sarakstu.
4. TASK līmenī skaidri deklarē, vai AI ir izmantots; AI governance lauki ir nosacīti obligāti tikai tad, ja AI ir izmantots.
5. `RESPONSIBLE FUNCTION` sadala action owner un resolution authority jēdzienos, nepieļaujot sistēmai izdomāt nevienu no tiem.
6. `HUMAN DECISION RECORD` iegūst generic `RELATED TRACE OBJECT REFERENCES` lauku.
7. `LEGAL CLASSIFICATION ASSESSMENT.RELATED MODULE` precizē par `RELATED MODULE ID`.
8. `CONTENT HASH` gadījumā obligāti norāda kontrolētu `CONTENT HASH ALGORITHM`.

## 2. Apstiprinātā references shēma

```text
TRACE RECORD ID
RECORD VERSION
OBJECT TYPE
OBJECT ID
```

Visas saglabātās references ir pinned. `current`, `latest` un citas kustīgas references nav atļautas.

Governance dokuments, kuru TASK faktiski izmanto, tiek reģistrēts kā `SOURCE` un referencēts kā SOURCE trace object. Atsevišķa governance-artifact references klase netiek ieviesta.

## 3. AI izmantošanas invariants

TASK RECORD pievieno:

```text
AI USED
AI USE DECLARED BY
AI USE DECLARED AT
```

Ja `AI USED = false`, `AI TOOL`, `AI/MODEL VERSION` un `AI TOOL USAGE POLICY VERSION` nav norādāmi. Ja `AI USED = true`, visi trīs ir obligāti un permission gate paliek fail-closed. `NOT ESTABLISHED`, `N/A`, `TBD` un līdzīgi placeholder nav atļauti.

## 4. UNRESOLVED ISSUE atbildības modelis

```text
ACTION OWNER
ACTION OWNER BASIS REFERENCE
RESOLUTION AUTHORITY KNOWN
RESOLUTION AUTHORITY
RESOLUTION AUTHORITY BASIS REFERENCE
```

Action owner drīkst norādīt tikai ar dokumentētu pašuzņemšanos vai autoritatīvu piešķīrumu. TASK atbildīgais jurists nekļūst par owner automātiski.

Ja `RESOLUTION AUTHORITY KNOWN = true`, authority un basis reference ir obligāti. Ja `false`, abi lauki nav norādāmi un resolution authority noskaidrošana jāiekļauj `REQUIRED ACTION`.

## 5. Apzināti neieviestais

Šis lēmums neievieš:

- `REFERENCE MODE`;
- automātisku cross-record §45 staleness/version trigger;
- atsevišķu governance-artifact references klasi;
- globālu module activation gate;
- `RUNTIME MANIFEST VERSION` katrā TASK;
- jaunu D3 AI permission event;
- determination unit vai cardinality noteikumu;
- function registry;
- faktisku `TASK-`, `MOD-` vai `ISS-` instanci;
- standalone containment faila dzēšanu;
- freeze.

Globālais module activation gate ir atsevišķs arhitektūras / ieviešanas jautājums. Gadījums, kad AI jau izmantots un permission neatbilstība konstatēta vēlāk, arī paliek atsevišķi risināms; šis lēmums nepasludina `DATA CLASS EVENT` par pilnīgu D3 risinājumu.

## 6. Ietekmētie drafti

Apstiprinātais delta integrēts:

- `GOVERNANCE/TRACEABILITY_RECORD_v1_v0.6.md`;
- `GOVERNANCE/TERMINOLOGY_AND_ENUMS_v1_v0.4.md`;
- `GOVERNANCE/PROFESSIONAL_SCOPE_v1.4.md`;
- `GOVERNANCE/LEGAL_CLASSIFICATION_BASELINE_AMENDMENT_v0.2.md`;
- `PROJECT_ROADMAP_v1.md`.

Frozen faili paliek nemainīti un autoritatīvi līdz atsevišķam freeze lēmumam.

## 7. Nākamais solis

1. veikt integrētā delta mehānisko auditu;
2. atsevišķi izlemt globālā module activation gate arhitektūru;
3. iegūt dokumentētu bankas input par ICT-DORA resolution authority un action owner;
4. tikai pēc derīgas TASK / MODULE konteksta un dokumentēta assignment izveidot faktisku `UNRESOLVED ISSUE` instanci;
5. standalone containment failu saglabāt līdz drošai satura migrācijai;
6. freeze lemt tikai atsevišķi pēc paketes gala review.
