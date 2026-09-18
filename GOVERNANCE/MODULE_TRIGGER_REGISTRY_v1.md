# MODULE_TRIGGER_REGISTRY_v1

Juridiskās klasifikācijas slāņa kandidātmoduļu trigger reģistrs

**Statuss:** MELNRAKSTS — PĀRVALDĪBAS STRUKTŪRA DEFINĒTA; NAV PRODUCTION ACTIVE  
**Versija:** v0.1  
**Bāze:**  
- `PROFESSIONAL_SCOPE_v1.4` — konsolidēts melnraksts  
- `REQUIREMENTS_MATRIX_GOVERNANCE_v1` — konsolidējams v0.3  
- `OPERATION_WORKFLOWS_v1` — konsolidējams v0.2

## 1. Mērķis

Šis reģistrs nosaka, pret kādiem iepriekš apstiprinātiem triggeriem SHORT INTAKE laikā tiek veikts candidate-module screening.

Trigger reģistrs nav MODULE STATUS noteikšanas mehānisms.

```text
NO TRIGGER IDENTIFIED
≠ NOT APPLICABLE
```

Tas tikai nosaka, vai modulim nepieciešams FULL LEGAL CLASSIFICATION ASSESSMENT.

## 2. Governance

Katram moduļa trigger sarakstam obligāti:

```text
MODULE
TRIGGER SET ID
TRIGGER SET VERSION
TRIGGERS
SOURCE BASIS
APPROVAL AUTHORITY
APPROVED BY
APPROVAL REFERENCE
EFFECTIVE DATE
LAST REVIEW DATE
STATUS: ACTIVE | DEPRECATED
```

Trigger sarakstu apstiprina tā pati vai līdzvērtīga governance autoritāte, kurai pieder attiecīgā MODULE APPLICABILITY.

AI nedrīkst pats aktivizēt trigger sarakstu.

## 3. SHORT INTAKE nosacījums

SHORT INTAKE modulim ir atļauts tikai tad, ja:
- modulim ir ACTIVE trigger set;
- izmantota konkrēta versija;
- visi triggeri pārbaudīti;
- screening result ir saglabāts MODULE SCREENING RECORD.

Ja modulim ACTIVE trigger set nav:
```text
SHORT PATH UNAVAILABLE
→ FULL LCA
```

Tas nav jauns suspension status; tā ir workflow sekas.

## 4. Negatīvs screening rezultāts

Derīgs negatīvs screening rezultāts nozīmē:

```text
SCREENED MODULES: [module]
TRIGGER REGISTRY VERSION: [version]
TRIGGERS IDENTIFIED: []
SCREENED BY: [...]
SCREENED AT: [...]
```

Tukšs saraksts ir apzināts rezultāts. Missing / null lauks nav negatīvs rezultāts.

## 5. Pozitīvs screening rezultāts

Ja identificēts kaut viens trigger:
```text
TRIGGERS IDENTIFIED: [trigger IDs]
→ FULL LCA REQUIRED
```

Trigger pats par sevi nepierāda moduļa piemērojamību.

## 6. OUTSOURCING-EBA sākotnējais ieraksts

```text
MODULE: OUTSOURCING-EBA
TRIGGER SET ID: MTR-OUTSOURCING-001
VERSION: 0.1-draft
LIFECYCLE: null
SOURCE BASIS: EBA/GL/2019/02 + EBA Q&A 2020_5220 + EBA Q&A 2020_5100 + bankas iekšējie avoti vēl jāpievieno
APPROVAL AUTHORITY: LAWYER + OUTSOURCING MANAGER
APPROVED BY: null
APPROVAL REFERENCE: null
EFFECTIVE DATE: null
```

Konkrētais source-based draft atrodas `OUTSOURCING_EBA_MODULE_TRIGGER_SET_v0.1.md`. Tas vēl nav apstiprināts un tā lifecycle = null. SHORT INTAKE OUTSOURCING-EBA modulim nav production atļauts, kamēr sarakstu nav pārskatījis un apstiprinājis jurists + outsourcing manager un nav pievienoti nepieciešamie bankas iekšējie avoti.

## 7. Citi moduļi

Kamēr citam modulim nav ACTIVE trigger set:
```text
candidate-module screening cannot close the module
→ if module relevance must be assessed, use FULL LCA
```

## 8. Versēšana

Materiālas izmaiņas trigger sarakstā rada jaunu versiju.

Iepriekšējās versijas saglabā vēsturisku TASK rekonstrukcijai.

## 9. Robeža

Šis reģistrs nosaka screening sietu, nevis juridiskās klasifikācijas rezultātu.

Tas nevar:
- piešķirt APPLICABLE / NOT APPLICABLE / UNCLEAR;
- aizvietot LCA, ja trigger identificēts;
- aizvietot moduļa autoritāti;
- aktivizēt REQUIREMENTS SET.
