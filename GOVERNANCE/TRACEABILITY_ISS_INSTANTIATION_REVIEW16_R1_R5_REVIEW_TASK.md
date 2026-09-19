# REVIEW #16 — R1–R5 ATBILDES NEATKARĪGĀS RECENZIJAS UZDEVUMS

**Statuss:** GATAVS NODOŠANAI NEATKARĪGAM RECENZENTAM

**Primārais roadmap dokuments:** `TRACEABILITY_RECORD_v1` v0.6 juridiskās klasifikācijas amendment paketē

**Pārbaudāmais commits:** `c0d72c9a44e25c374f591d2372123585d4b09285`

**Recenzējamais dokuments:** `GOVERNANCE/TRACEABILITY_ISS_INSTANTIATION_REVIEW16_R1_R5_RESPONSE.md`

**Recenzijas veids:** neatkarīga, kritiska, read-only pārbaude

## 1. Uzdevums

Veikt neatkarīgu recenziju dokumentam `GOVERNANCE/TRACEABILITY_ISS_INSTANTIATION_REVIEW16_R1_R5_RESPONSE.md` pret:

1. Review #16 otrās kārtas recenzenta R1–R5 prasībām;
2. sākotnēji pieņemto BL3, H1, H2, H4, M1 un M2 korekciju tvērumu;
3. integrēto bāzi un current amendment draftiem;
4. frozen baseline un projekta governance invariantiem.

Recenzijas mērķis ir noteikt, vai formālā R1–R5 atbilde ir precīza, pilnīga, savstarpēji konsekventa un pietiekami konkrēta, lai pēc lietotāja konsensa un atsevišķa implementation approval to varētu pārvērst vienā atomārā korekciju paketē.

## 2. Obligāti izlasāmie faili

Izlasīt pilnā uzdevumam relevantā apjomā:

1. `PROJECT_CONSTITUTION_v1.md`;
2. `PROJECT_EXECUTION_PROTOCOL.md`;
3. `PROJECT_CURRENT_STATE.md`;
4. `GOVERNANCE/TRACEABILITY_ISS_INSTANTIATION_REVIEW16_TASK.md`;
5. `GOVERNANCE/TRACEABILITY_ISS_INSTANTIATION_REVIEW16.md`;
6. `GOVERNANCE/TRACEABILITY_ISS_INSTANTIATION_REVIEW16_DELTA_REVIEW_RESPONSE.md`;
7. `GOVERNANCE/TRACEABILITY_ISS_INSTANTIATION_REVIEW16_DELTA_RESPONSE_REVIEW.md`;
8. `GOVERNANCE/TRACEABILITY_ISS_INSTANTIATION_REVIEW16_R1_R5_RESPONSE.md`;
9. `GOVERNANCE/TRACEABILITY_RECORD_v1_v0.6.md`, īpaši §5.1, §6, §11, §14, §34, §36, §38 un §44–45;
10. `GOVERNANCE/TERMINOLOGY_AND_ENUMS_v1_v0.4.md`, īpaši §25–26.3, kontrolētos reģistrus un statusa sadaļas;
11. `GOVERNANCE/PROFESSIONAL_SCOPE_v1.4.md`, īpaši AI un traceability sadaļas;
12. `GOVERNANCE/LEGAL_CLASSIFICATION_BASELINE_AMENDMENT_v0.2.md`;
13. `GOVERNANCE/MODULE_TRIGGER_REGISTRY_v1.md`;
14. `GOVERNANCE/OUTSOURCING_EBA_MODULE_TRIGGER_SET_v0.1.md`;
15. frozen baseline failus, uz kuriem atsaucas `PROJECT_CURRENT_STATE.md`.

## 3. Obligātie pārbaudes jautājumi

Par katru R1–R5 noteikt:

1. vai atbilde precīzi atbild uz recenzenta finding, to nepaplašinot vai nesašaurinot bez pamatojuma;
2. vai piedāvātais invariants ir viennozīmīgi implementējams;
3. vai ir identificēts pareizais owner dokuments;
4. vai ir aptverti nepieciešamie validācijas noteikumi un negatīvie testi;
5. vai nav radīts jauns paralēls patiesības avots vai neatļauts izdošanas vārts;
6. vai atbilde ir savietojama ar frozen baseline;
7. vai pilnā atomārā pakete aptver arī iepriekš pieņemtos BL3, H1, H2, H4, M1 un M2 labojumus;
8. vai nekas nav atlikts bez owner, konkrēta milestone un pārbaudāma pamatojuma.

Papildus pārbaudīt:

- freeze secību starp `PROFESSIONAL_SCOPE_v1.4` un `TRACEABILITY_RECORD_v1_v0.6`;
- “pietiekamas identitātes kombinācijas” modeļa robežas un `UNRESOLVED ISSUE` semantiku;
- `RELATED TRACE OBJECT REFERENCES` autoritāti pret compatibility views;
- mehānisko mapping starp `TRACE OBJECT TYPE` un atbilstošo ID lauku;
- prasību visas shēmas un validācijas izmaiņas ieviest vienā atomārā commitā.

## 4. Recenzijas rezultāta forma

Atgriezt vienu pilnu recenzijas dokumenta draftu ar šādu struktūru:

```text
# REVIEW #16 — R1–R5 ATBILDES NEATKARĪGĀ RECENZIJA

PĀRBAUDĪTAIS COMMITS:
RECENZĒTAIS DOKUMENTS:
VERDIKTS: ACCEPT / CHANGES REQUIRED / REJECT

1. KOPSAVILKUMS
2. R1 VĒRTĒJUMS
3. R2 VĒRTĒJUMS
4. R3 VĒRTĒJUMS
5. R4 VĒRTĒJUMS
6. R5 VĒRTĒJUMS
7. IEPRIEKŠ PIEŅEMTO FINDINGS TVĒRUMA PĀRBAUDE
8. CROSS-DOCUMENT UN VALIDĀCIJAS PĀRBAUDE
9. FINDINGS
10. KONSENSA GATAVĪBA
11. ATĻAUTAIS NĀKAMAIS SOLIS
```

Katram jaunam finding obligāti norādīt:

- smagumu: `BLOCKING`, `HIGH`, `MEDIUM` vai `LOW`;
- precīzu failu un sadaļu;
- pārkāpto invariantu;
- pierādījumu;
- minimālo nepieciešamo labojumu;
- ietekmi uz konsensu, implementation un freeze.

Ja finding nav, to skaidri norādīt. Recenzents nedrīkst aizstāt lietotāja konsensu, implementation approval vai freeze lēmumu.

## 5. Aizliegtās darbības

Recenzijas laikā nedrīkst:

- mainīt vai commitēt repo failus;
- ieviest R1–R5 arhitektūras draftos;
- pasludināt lietotāja konsensu;
- autorizēt implementation vai freeze;
- radīt faktisku `TASK-`, `MOD-` vai `ISS-` instanci;
- dzēst standalone containment failu;
- pāriet uz nākamo roadmap dokumentu.

## 6. Acceptance kritērijs

Uzdevums ir izpildīts, ja recenzents ir iesniedzis vienu pilnu, pierādījumos balstītu recenzijas draftu ar nepārprotamu verdiktu, atsevišķu R1–R5 vērtējumu, visu finding statusu un vienu konkrētu atļauto nākamo soli.
