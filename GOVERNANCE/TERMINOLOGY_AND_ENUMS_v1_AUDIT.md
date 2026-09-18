# TERMINOLOGY_AND_ENUMS_v1 — MEHĀNISKAIS AUDITS

**Pārbaudāmais dokuments:** `GOVERNANCE/TERMINOLOGY_AND_ENUMS_v1.md — v0.2`  
**Pamatversijas:**  
- `PROFESSIONAL_SCOPE_v1.3` — IESALDĒTA  
- `TRACEABILITY_RECORD_v1` — Arhitektūra v0.4 — IESALDĒTA  

**Statuss:** IZTURĒTS — BLOĶĒJOŠAS PRETRUNAS NAV ATRASTAS  
**Iesaldēšana:** APSTIPRINĀTS — PAMATVERSIJA (IESALDĒTA)

## 1. Frozen enum audits

Pārbaudīts, vai v0.2 nemaina frozen canonical vērtības.

Rezultāts:

```text
OPERATION                  PASS
OBJECT                     PASS
MODULE                     PASS
REQUIREMENT STATUS         PASS
VERIFICATION LEVEL         PASS
REQUIREMENT LEVEL          PASS
GOVERNANCE STATUS          PASS
REQUIREMENT TYPE           PASS
MODULE STATUS              PASS
APPLICABILITY AUTHORITY    PASS
CIF STATUS                 PASS
PERMISSION STATUS          PASS
SUSPENSION STATE           PASS
```

Jauni frozen statusi nav ieviesti.

## 2. Latviešu display label audits

LV apzīmējumi ir tikai attēlojuma slānis.

Tie:
- nemaina canonical vērtību;
- nemaina machine key;
- netiek izmantoti kā alternatīvs statusa reģistrs.

Pārbaudīti:
- operācijas;
- objekti;
- moduļi;
- prasību statusi;
- verifikācijas līmeņi;
- prasību līmeņi;
- pārvaldības statuss;
- prasību tipi;
- moduļu statusi;
- moduļu autoritātes;
- CIF statusi;
- permission statusi;
- visi suspension states;
- SOURCE TYPE.

Rezultāts: **IZTURĒTS**.

## 3. REQUIREMENT LEVEL / GOVERNANCE STATUS audits

Frozen Traceability modelis prasa conditional field modeli.

v0.2 saglabā tieši šīs derīgās kombinācijas:

```text
unclassified + null
null + mandatory_external
null + mandatory_internal
null + negotiable
```

`null` nav jauns statuss.

Rezultāts: **IZTURĒTS**.

## 4. Juridiskā statusa modeļa audits

Pārbaudīts pret:
- PROFESSIONAL_SCOPE 3. punktu;
- PROFESSIONAL_SCOPE 25. punktu;
- TRACEABILITY_RECORD 42.–43. punktu.

v0.2 neievieš sistēmas piešķirtu `approved` statusu.

`LEGAL APPROVED` tiek reprezentēts tikai kā ārēja atsauce.

`NOT APPROVED` un `BUSINESS PROCEEDED` ir atsevišķi lauki.

Cross-field noteikums nepieļauj:
- approval reference + not_approved vienlaikus;
- approval reference + business_proceeded;
- business_proceeded bez not_approved.

Rezultāts: **IZTURĒTS**.

## 5. DATA CLASS reģistra audits

v0.2 pats nedefinē bankas datu klases.

Autoritāte:

```text
AI_TOOL_USAGE_POLICY_v1
→ DATA CLASS REGISTRY
```

Atšķirība:
- nederīga deklarācija = vērtība nav reģistrā;
- `PERMISSION UNKNOWN` = derīga datu klase, kurai nav bankas permission lēmuma.

Tas nepaplašina frozen permission statusu kopu.

Rezultāts: **IZTURĒTS**.

## 6. Reģistru īpašnieku audits

Pārbaudīti:

```text
DATA CLASS          → AI_TOOL_USAGE_POLICY_v1
VERIFICATION METHOD → VERIFICATION_PROTOCOL_v1
OUTPUT TYPE         → OPERATION_WORKFLOWS_v1
```

Vērtības netiek dublētas šajā dokumentā, izņemot skaidri marķēto Pilot 1 provisional OUTPUT TYPE kopu.

Rezultāts: **IZTURĒTS**.

## 7. Provisional OUTPUT TYPE audits

Pilot 1 provizoriskās vērtības:

```text
LEGAL ANALYSIS
STRUCTURED EXTRACTION
```

ir skaidri marķētas:

```text
PROVISIONAL — OWNED BY OPERATION_WORKFLOWS_v1
```

Tās nav frozen enum un vēlāk drīkst kļūt tikai ACTIVE vai DEPRECATED.

Rezultāts: **IZTURĒTS**.

## 8. TRACE OBJECT TYPE un ID prefiksu audits

Pārbaudīts pret Traceability datu modeli.

Iekļauti:
- TASK;
- SOURCE;
- MODULE;
- FINDING;
- EVIDENCE;
- REQUIREMENTS SET;
- REQUIREMENT;
- REQUIREMENT COMPONENT;
- VERIFICATION EVENT;
- HUMAN DECISION;
- ESCALATION;
- UNRESOLVED ISSUE;
- OUTPUT;
- DATA CLASS EVENT;
- TRACE RECORD.

`TRACE RECORD` ir prefikss `TR-`.

`EVIDENCE ID` noturības noteikums saglabāts ar atsauci uz frozen Traceability invariantu.

Rezultāts: **IZTURĒTS**.

## 9. Registry lifecycle audits

Vērtības:
- netiek klusējot dzēstas;
- var kļūt DEPRECATED;
- vēsturiskie ieraksti saglabā interpretējamību.

Tas nav jauns juridiskais statuss; ACTIVE/DEPRECATED ir reģistra metadatu stāvoklis.

Rezultāts: **IZTURĒTS**.

## 10. Terminu rezervēšanas audits

Pārbaudīts:
- VERIFIED;
- APPROVED;
- EVIDENCE;
- STATUS.

v0.2 neļauj šos terminus izmantot tehniskā nozīmē, kas mainītu frozen semantiku.

Rezultāts: **IZTURĒTS**.

## 11. Versiju un datumu audits

Versijas virkne netiek izmantota kā universāls hronoloģijas mehānisms.

Secību nosaka:
- datums/laiks; vai
- dokumentēta versiju vēsture.

Rezultāts: **IZTURĒTS**.

## 12. Dokumenta robežas audits

v0.2 neuzņemas noteikt:
- verification depth;
- DATA CLASS saturu;
- VERIFICATION METHOD saturu;
- gala OUTPUT TYPE reģistru;
- requirements governance;
- AI permission lēmumus;
- workflow secību;
- retention.

Rezultāts: **IZTURĒTS**.

## 13. Gala audita statuss

```text
DOCUMENT:
TERMINOLOGY_AND_ENUMS_v1 — v0.2

BASELINES:
PROFESSIONAL_SCOPE_v1.3 — FROZEN
TRACEABILITY_RECORD_v1 v0.4 — FROZEN

MECHANICAL AUDIT:
PASS

BLOCKING BASELINE CONFLICTS:
0

NEW FROZEN CANONICAL STATUSES:
0

TECHNICAL REGISTRIES ADDED:
TRACE OBJECT TYPE
ID PREFIX
REGISTRY INDEX
REGISTRY VALUE LIFECYCLE

FREEZE STATUS:
APPROVED — BASELINE (FROZEN)
```

Iesaldēšanas apstiprinājums saņemts 2026-09-18. Turpmākas izmaiņas veicamas tikai jaunā versijā.
