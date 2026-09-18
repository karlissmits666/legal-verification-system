# LEGAL_CLASSIFICATION_BASELINE_AMENDMENT_v0.2 — REVIEW #13 INTEGRATION RECORD

**Statuss:** REVIEW #13 LABOJUMI INTEGRĒTI — NAV IESALDĒTS  
**Datums:** 2026-09-18  
**Avots:** Critical architecture review #13

## Bloķējošie punkti

B1 — ICT-DORA autoritātes semantika  
**RISINĀTS.** Jurista IKT pakalpojuma juridiskā kvalifikācija ir atsevišķs HUMAN DECISION. ICT-DORA MODULE STATUS saglabā HUMAN CONFIRMATION REQUIRED, un konkrētā apstiprinošā bankas funkcija jānosauc pirms production.

B2 — interpretatīvie screening triggeri  
**RISINĀTS.** OEB-T04 un OEB-T05 pārveidoti tā, lai screening balstītos FACT PROFILE. Ja triggera klātbūtni nevar noteikt no faktiem, konservatīvais rezultāts ir trigger identified → FULL LCA.

B3 — reclassification materialitātes neredzamais lēmums  
**RISINĀTS.** Jebkura FINDING, uz kuru atsaucas spēkā esošs LCA, maiņa/pievienošana automātiski rada RECLASSIFICATION REVIEW REQUIRED. Materialitāti nosaka cilvēks un HUMAN DECISION tiek saglabāts arī "not material" gadījumā.

## Augstas prioritātes punkti

H1 — OUTPUT screening summary  
**RISINĀTS.** OUTPUT RECORD paredz MODULE SCREENING SUMMARY.

H2 — MODULE TRIGGER SET / MTR- / lifecycle  
**RISINĀTS.** Terminology reģistrē module_trigger_set un MTR-. Lifecycle izmanto ACTIVE / DEPRECATED; draftam lifecycle = null. NOT ACTIVE nav canonical lifecycle.

H3 — screening confirmation  
**RISINĀTS.** Tas ir HUMAN DECISION ar RELATED OBJECT = MSR.

H4 — DORA CIF-independent daļa  
**RISINĀTS.** CIF-independent set turpinās, kamēr CIF-dependent set gaida CIF.

H5 — OEB-T03 kalibrācija  
**RISINĀTS.** Pirms ACTIVE nepieciešams retrospektīvs pilots pret 15–20 reāliem līgumiem un FULL-LCA referral rate mērījums.

H6 — OEB-T07 placeholder  
**RISINĀTS.** Pirms ACTIVE placeholder jāaizpilda ar konkrētu iekšējo avotu vai jāizņem.

H7 — robežu saraksts  
**RISINĀTS.** Pievienots:
```text
SCREENING CONFIRMATION ≠ MODULE AUTHORITY DECISION
MODULE AUTHORITY LABEL = faktiski nosauktā apstiprinošā funkcija
```

## Statuss

```text
ARCHITECTURE REVIEW #13 CHANGES: INTEGRATED
FREEZE: NOT APPROVED
OUTSOURCING-EBA TRIGGER SET: DRAFT / lifecycle = null
OPEN BANK-GOVERNANCE INPUT:
- konkrētā ICT-DORA module authority function
- bankas iekšējie outsourcing sources
```
