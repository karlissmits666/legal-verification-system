# Juridiskās pārbaudes sistēma

Privāts repozitorijs MI atbalstītai juridiskā darba pārbaudes un pārvaldības sistēmai.

## Iesaldētās pamatversijas

- `GOVERNANCE/PROFESSIONAL_SCOPE_v1.3.md` — **APSTIPRINĀTS — PAMATVERSIJA (IESALDĒTA)**.
- `GOVERNANCE/TRACEABILITY_RECORD_v1.md` — **Arhitektūra v0.5 — APSTIPRINĀTS — PAMATVERSIJA (IESALDĒTA)**.
- `GOVERNANCE/TERMINOLOGY_AND_ENUMS_v1.md` — **v0.3 — APSTIPRINĀTS — PAMATVERSIJA (IESALDĒTA)**.
- `GOVERNANCE/VERIFICATION_PROTOCOL_v1.md` — **v0.5 — APSTIPRINĀTS — PAMATVERSIJA (IESALDĒTA)**.

Iesaldēšanas datums: 2026-09-18.

`main` zars ir paredzēts apstiprinātiem sistēmas dokumentiem un tehniskai repozitorija dokumentācijai. Zemāka līmeņa dokumenti nedrīkst vājināt iesaldētās pamatversijas invariantus bez `PROFESSIONAL_SCOPE_v1.3` grozījuma.


## Projekta ceļvedis

- `PROJECT_CONSTITUTION_v1.md` — stabilā projekta identitāte, mērķis, autoritātes robežas un neaizskaramie drošības principi. Tas nav current-state manifests vai 14. arhitektūras pamatdokuments.
- `PROJECT_ROADMAP_v1.md` — kopējais 13 obligāto projekta dokumentu plāns, izstrādes secība un pilotu struktūra.
- `PROJECT_EXECUTION_PROTOCOL.md` — obligātā projekta izpildes kārtība: roadmap kontrole, review, lietotāja konsenss, implementation, audits un atsevišķs freeze lēmums. Tas nav 14. arhitektūras pamatdokuments.
- `NEW_CHAT_START_TASK.md` — atkārtojamais jaunā čata konteksta atjaunošanas uzdevums.
- `PROJECT_CURRENT_STATE.md` — vienīgais dinamiskais starpčatu handoff ar pēdējo darba punktu, atvērtajiem blokatoriem un vienu precīzu nākamo uzdevumu; tas nav arhitektūras authority.


## Legora mērķa arhitektūra

- `IMPLEMENTATION/LEGORA_IMPLEMENTATION_SPEC_v1.md` — gala ieviešanas mērķa arhitektūra: `BANK LEGAL CORE`, pārvaldības vārti, operāciju darba plūsmas, moduļi, strukturēti atradumi un prasības, verifikācija, izsekojamības ieraksts (`Traceability Record`) un izdošanas vārti.


## Dokumentācijas valoda

Projekta dokumenti pēc noklusējuma tiek rakstīti precīzā latviešu valodā. Angļu valoda tiek saglabāta tikai tad, ja tā nepieciešama tehniskai savietojamībai, Legora funkciju nosaukumiem, failu/objektu identifikatoriem vai frozen kanoniskajām sistēmas vērtībām. Ja angļu termins ir jāsaglabā, cilvēkam redzamajā tekstā tam pēc iespējas pievieno latvisku skaidrojumu.
