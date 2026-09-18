# LEGAL_CLASSIFICATION_BASELINE_AMENDMENT_v0.1

Juridiskās klasifikācijas slāņa baseline amendment pakete

**Statuss:** IZVEIDOTA — ARHITEKTŪRAS APSPRIEŠANAI  
**Versija:** v0.1  
**Datums:** 2026-09-18

## 1. Mērķis

Pakete novērš arhitektūras trūkumu, kurā specializēti regulatīvie moduļi un prasību kopas varēja tikt aplūkotas pirms universālas līguma veida un juridiskās / regulatīvās klasifikācijas.

Jaunā obligātā secība:

```text
LEGAL TASK RECEIVED
↓
AI TOOL / DATA PERMISSION GATE
↓
OBJECT IDENTIFICATION
↓
CONTRACT TYPE                    [ja OBJECT = CONTRACT]
↓
FACT PROFILE
↓
LEGAL / REGULATORY CLASSIFICATION ASSESSMENT
↓
HUMAN / EXTERNAL AUTHORITY DECISION
↓
MODULE STATUS
↓
REQUIREMENTS SET SELECTION
↓
ANALYSE / VERIFY / DRAFT / COMPARE / EXTRACT
```

## 2. Paketes dokumenti secībā

1. `PROFESSIONAL_SCOPE_v1.4.md`
   - ievieš CONTRACT TYPE un juridiskās / regulatīvās klasifikācijas baseline principu;
   - nostiprina jurista lomu klasifikācijā;
   - neļauj AI priekšlikumam automātiski aktivizēt prasību kopu.

2. `TRACEABILITY_RECORD_v1_v0.6.md`
   - ievieš `LEGAL CLASSIFICATION ASSESSMENT`;
   - sasaista klasifikācijas izvērtējumu ar TASK, MODULE un cilvēka lēmumu.

3. `TERMINOLOGY_AND_ENUMS_v1_v0.4.md`
   - pievieno objekta tipu `legal_classification_assessment`;
   - pievieno prefiksu `LCA-`;
   - reģistrē CONTRACT TYPE un QUALITATIVE LIKELIHOOD reģistru īpašniekus.

4. `OPERATION_WORKFLOWS_v1.md`
   - ievieš obligātu LEGAL INTAKE;
   - uztur CONTRACT TYPE REGISTRY;
   - nosaka, ka module applicability precedē Requirements Set selection.

5. `LEGAL_RESEARCH_METHOD_v1.md`
   - definē avotu lomas un prioritāti;
   - prasa supporting un counterargument analīzi;
   - definē kvalitatīvu klasifikācijas varbūtību:
     LIKELY / INDETERMINATE / UNLIKELY;
   - aizliedz pseidoprecīzus procentus bez validētas kalibrācijas.

6. `REQUIREMENTS_MATRIX_GOVERNANCE_v1.md`
   - sākas pēc LEGAL INTAKE;
   - specializētu prasību kopu aktivizē tikai pēc apstiprināta MODULE STATUS;
   - MODULE = UNCLEAR gadījumā pieļauj tikai marķētu scenārija analīzi.

## 3. Svarīgās robežas

```text
CONTRACT TYPE
≠ MODULE
≠ MODULE STATUS
≠ QUALITATIVE LIKELIHOOD
≠ LEGAL APPROVED
```

```text
LEGAL CLASSIFICATION ASSESSMENT
≠ HUMAN DECISION
```

```text
LIKELY
≠ APPLICABLE
```

## 4. Autoritatīvais statuss

Šī pakete vēl nav frozen.

Līdz atsevišķam apstiprinājumam autoritatīvas paliek iepriekšējās iesaldētās pamatversijas:
- `PROFESSIONAL_SCOPE_v1.3`;
- `TRACEABILITY_RECORD_v1 v0.5`;
- `TERMINOLOGY_AND_ENUMS_v1 v0.3`;
- `VERIFICATION_PROTOCOL_v1 v0.5`.

## 5. Nākamais solis

Veikt kritisku arhitektūras review visai paketei kā vienotam slānim, īpaši par:
- jurista gala klasifikācijas autoritāti OUTSOURCING-EBA un ICT-DORA;
- CONTRACT TYPE taxonomy;
- QUALITATIVE LIKELIHOOD skalas semantiku;
- MODULE = UNCLEAR scenārija analīzi;
- classification research slodzi;
- Requirements Set selection traceability;
- vai nepieciešams atsevišķs CONTRACT CLASSIFICATION DECISION objekts vai esošais HUMAN DECISION ir pietiekams.

Nevienu jauno baseline versiju nedrīkst iesaldēt bez lietotāja skaidra freeze apstiprinājuma.
