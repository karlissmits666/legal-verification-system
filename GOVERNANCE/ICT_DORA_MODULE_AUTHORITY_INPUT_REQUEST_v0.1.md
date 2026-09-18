# ICT_DORA_MODULE_AUTHORITY_INPUT_REQUEST_v0.1

ICT-DORA MODULE STATUS apstiprinošās funkcijas governance ievaddata pieprasījums

**Repo statuss:** PREMATURE DRAFT COMMIT — NOT APPROVED — NOT FROZEN — NOT AUTHORITATIVE
**Versija:** v0.1
**Datums:** 2026-09-18
**Saistītā pakete:** LEGAL_CLASSIFICATION_BASELINE_AMENDMENT_v0.2
**Saglabāšanas pamats:** pagaidu saglabāšana līdz derīgā satura migrācijai uz apstiprinātu izsekojamības reprezentāciju
**Arhitektūras lēmums:** standalone reprezentācija noraidīta; mērķa reprezentācija ir esošais `UNRESOLVED ISSUE` modelis, bet faktiska reģistrācija vēl nav veikta
**Go-live sekas:** ICT-DORA moduļa production aktivizācija nav pieļaujama, kamēr autoritāte nav dokumentēta

> Šā faila saturs nav autoritatīvs governance avots. Failā ietvertie statusveidīgie apzīmējumi un ierakstu projekti nav izmantojami kā canonical vērtības vai production ieraksti.

## 1. Mērķis

Noteikt bankas faktisko funkciju vai funkciju kombināciju, kurai bankas governance procesā ir tiesības apstiprināt ICT-DORA MODULE STATUS = APPLICABLE / NOT APPLICABLE / UNCLEAR.

Šis dokuments neizvēlas autoritāti. Tas strukturē nepieciešamo bankas governance ievaddatu un tā pierādījumu.

## 2. Kāpēc ievaddats ir obligāts

Frozen autoritātes modelī HUMAN CONFIRMATION REQUIRED nozīmē, ka gala statusu apstiprina konkrēti identificēta funkcija.

Formulējums "papildu funkcija, ja to prasa bankas process" nav izpildāms production noteikums.

Kamēr funkcija nav nosaukta un pamatota:

    ICT-DORA MODULE STATUS
    → UNCLEAR
    → HUMAN CONFIRMATION REQUIRED

COMMON CONTRACT REVIEW un cita no ICT-DORA module statusa neatkarīga juridiskā analīze turpinās.

## 3. Jautājums bankas governance īpašniekam

Kurš bankas process / funkcija ir pilnvarota gala veidā apstiprināt, ka konkrētam trešās personas pakalpojumam ICT-DORA MODULE STATUS = APPLICABLE vai NOT APPLICABLE?

Nepieciešams norādīt:

    CONFIRMING FUNCTION
    AUTHORITY SOURCE
    SOURCE VERSION
    EFFECTIVE DATE
    DECISION POINT IN PROCESS
    REQUIRED CO-CONFIRMERS [ja tādi ir]
    SYSTEM / RECORD WHERE DECISION IS STORED

## 4. Pieļaujamie atbilžu modeļi

A. Viena funkcija — konkrēta funkcija ar authority source.
B. Kopīgs lēmums — konkrētas funkcijas A + B.
C. Ārējs procesa statusa ieraksts — ja banka jau glabā atsevišķu ICT / DORA klasifikācijas statusu citā sistēmā.

Ja faktiskais process atbilst C variantam, autoritātes modelis būtu pārskatāms kā EXTERNAL INPUT ONLY, bet tikai pēc dokumentēta bankas procesa pierādījuma.

## 5. Jurista kompetences robeža

Atsevišķi no MODULE STATUS:

    ICT SERVICE LEGAL CLASSIFICATION
    → HUMAN DECISION
    → jurists

Jurists nosaka juridisko kvalifikāciju savas kompetences ietvaros.

ICT-DORA MODULE STATUS apstiprinošā funkcija izmanto jurista kvalifikāciju kā obligātu ievaddatu un to nepārraksta. Ja nepiekrīt, rodas ESCALATION REQUIRED.

## 6. Nepieciešamais pierādījums

Derīgs authority input prasa vismaz vienu no:
- bankas apstiprinātu policy;
- procedure;
- approval matrix;
- role / responsibility matrix;
- DORA / ICT third-party risk governance dokumentu;
- dokumentētu ārējās sistēmas lauku ar skaidru owner / approver;
- citu apstiprinātu governance avotu.

Nepietiek: mutiska pieņēmuma, 'parasti to dara X', AI secinājuma vai procesa interpretācijas bez source reference.

## 7. Lēmuma ieraksts pēc saņemšanas

    DECISION TYPE: module_applicability
    MODULE: ICT-DORA
    APPLICABILITY AUTHORITY: HUMAN CONFIRMATION REQUIRED vai EXTERNAL INPUT ONLY
    CONFIRMING FUNCTION / SOURCE: [...]
    AUTHORITY REFERENCE: [...]
    EFFECTIVE DATE: [...]

## 8. Go-live gate

ICT-DORA modulis production režīmā nav aktivizējams, kamēr nav identificēta confirming function vai external authority, authority source, source version/effective date un decision storage location.

Ja kaut viens elements trūkst:

    ICT-DORA MODULE GO-LIVE
    → BLOCKED BY GOVERNANCE INPUT

Tas nav jauns canonical suspension status. Tā ir projekta ieviešanas priekšnosacījuma atzīme.

## 9. Aizpildāmais minimums

    CONFIRMING FUNCTION: [...]
    AUTHORITY MODEL: HUMAN CONFIRMATION REQUIRED / EXTERNAL INPUT ONLY
    AUTHORITY SOURCE: [...]
    SOURCE VERSION: [...]
    EFFECTIVE DATE: [...]
    DECISION POINT: [...]
    DECISION STORED IN: [...]
    CONFIRMED BY: [...]
    CONFIRMED AT: [...]
    NOTES: [...]

## 10. Statuss

    GOVERNANCE INPUT: OPEN
    ICT-DORA MODULE PRODUCTION: NOT ENABLED
    COMMON CONTRACT REVIEW: UNAFFECTED
    FREEZE IMPACT: production activation blocked until resolved
