# REVIEW #16 â€” FORMÄ€LA ATBILDE UZ R1â€“R5 â€” v3

**Statuss:** REVIEW RESPONSE v3 â€” POZÄªCIJA FIKSÄ’TA, KONSENSS PENDING, IMPLEMENTATION NAV APSTIPRINÄ€TA
**Datums:** 2026-09-19
**Versija:** v3
**Atbildes bÄze:** `GOVERNANCE/TRACEABILITY_ISS_INSTANTIATION_REVIEW16_R1_R5_V2_RESPONSE_REVIEW.md`
**IepriekÅ¡Ä“jÄ neatkarÄ«gÄ recenzija (F1â€“F12):** `GOVERNANCE/TRACEABILITY_ISS_INSTANTIATION_REVIEW16_R1_R5_RESPONSE_REVIEW.md`
**v2 recenzÄ“tais commits:** `12b4ff32e15644737edf546644722b5b442341db`
**v3 pÄrbaudÄ«tÄ bÄze (owner shÄ“mas):** `1783c50b7ad7c45bba5b468e74ba4ac6d2364147`
**Implementation:** NAV VEIKTA
**Freeze:** NAV APSTIPRINÄ€TS

## 1. Atbildes robeÅ¾a

[PÄ€RBAUDÄªTS FAKTS] NeatkarÄ«gÄ v2 recenzija R1â€“R5 arhitektÅ«ras virzienu saglabÄja, bet v2 atzina par nepietiekami deterministisku vienam atomÄram implementation commitam un identificÄ“ja J1â€“J9.

[DOKUMENTÄ’TS LÄ’MUMS] v3 ir tikai review-response artefakts. TÄ nemaina nevienu arhitektÅ«ras draftu, frozen failu, amendment statusu, faktisku TASK/MOD/ISS instanci vai production konfigurÄciju. TÄ fiksÄ“ projekta pozÄ«ciju un vienu precÄ«zu, deterministisku piedÄvÄto delta.

[DOKUMENTÄ’TS LÄ’MUMS] Visi Å¡Ä«s v3 formulÄ“jumi ir pÄrbaudÄ«ti pret faktiskajÄm owner shÄ“mÄm commitÄ `1783c50`, nevis pret nosaukumu loÄ£iku. Katra J-atbilde 10. sadaÄ¼Ä norÄda pÄrbaudÄ«to owner sadaÄ¼u.

## 2. R1 â€” saistÄ«tÄ freeze secÄ«ba

**PozÄ«cija: PIEÅ…EMTÑ.** PrecizÄ“ts pÄ“c F2 un J8.

[PRIEKÅ LIKUMS] `GOVERNANCE/LEGAL_CLASSIFICATION_BASELINE_AMENDMENT_v0.2.md` papildina ar jaunu numurÄ“tu apakÅ¡sadaÄ¼u `Â§9.1 Freeze priekÅ¡nosacÄ«jumi`, kuras pilnais saturs ir:

```text
FREEZE PRECONDITION:
TRACEABILITY_RECORD_v1 v0.6 freeze nav pieÄ¼aujams
pirms vai atseviÅ¡Ä·i no
PROFESSIONAL_SCOPE_v1.4 UN TERMINOLOGY_AND_ENUMS_v1 v0.4 freeze.

Å Ä« ir amendment procesa precondition.
TÄ nav record-level BLOCK, SUSPENSION STATE vai jauns canonical statuss.
```

Pamatojums:
- TR v0.6 Â§6 un Â§34 `AI USED` modelis balstÄs uz PS v1.4;
- TR v0.6 Â§5.1 un Â§9 izmanto T&E v0.4 reÄ£istrÄ“tos trace-object tipus, ID prefiksus un `CONTENT HASH ALGORITHM` governance;
- frozen PS v1.3 un T&E v0.3 Å¡o modeli nesatur.

Owner sadaÄ¼as izvÄ“les pamatojums (J8): amendment Â§9 "AutoritatÄ«vais statuss" ir tieÅ¡i tÄ sadaÄ¼a, kas pÄrvalda, kas paliek autoritatÄ«vs lÄ«dz freeze lÄ“mumam; freeze precondition ir tÄs paÅ¡as sadaÄ¼as priekÅ¡mets. Amendment Â§11 "Go-live prieknosacijumi" pÄrvalda ICT-DORA moduÄ¼a **operacionÄlo** aktivizÄciju, nevis dokumentu freeze, tÄdÄ“Ä¼ nav derÄ«gs owner. FormulÄ“jums "gala amendment acceptance kontrole" tiek izÅ†emts pilnÄ«bÄ â€” repo tÄdas sadaÄ¼as nav.

## 3. R2 â€” neversÄ“ta avota identitÄte

**PozÄ«cija: PIEÅ…EMTÑ.** IzvÄ“lÄ“tais risinÄjums: recenzenta variants (b). NemainÄ«ts kopÅ¡ v2.

[PRIEKÅ LIKUMS] `TRACEABILITY_RECORD_v1 v0.6 Â§11` saglabÄ pietiekamas identitÄtes kombinÄcijas modeli:

```text
IF VERSION is absent AND EFFECTIVE DATE is absent
THEN source revision identity MUST be established
through a sufficient documented combination of available identity fields

IF source revision identity is insufficient
THEN create UNRESOLVED ISSUE
```

`CONTENT HASH` un `CONTENT HASH ALGORITHM` drÄ«kst bÅ«t Å¡Ä«s kombinÄcijas daÄ¼a, bet netiek padarÄ«ti absolÅ«ti obligÄti visiem neversÄ“tiem avotiem.

Hash cross-field noteikums netiek dublÄ“ts Â§11. Tas paliek owner vietÄs: `TRACEABILITY_RECORD_v1 v0.6 Â§9` un `TERMINOLOGY_AND_ENUMS_v1 v0.4 Â§26.3`.

[PRIEKÅ LIKUMS] `TRACEABILITY_ISS_INSTANTIATION_REVIEW16_DELTA_REVIEW_RESPONSE.md Â§6` akcepta kritÄ“rijs 8 tiek aizstÄts ar:

```text
8. Ja VERSION un EFFECTIVE DATE nav norÄdÄ«ti, konkrÄ“tÄs avota redakcijas
   identitÄtei jÄbÅ«t pietiekami dokumentÄ“tai ar Â§11 atÄ¼auto identitÄtes
   lauku kombinÄciju; ja identitÄte nav pietiekama, nepiecieÅ¡ams
   UNRESOLVED ISSUE.
```

Jauns automÄtisks release gate netiek radÄ«ts.

## 4. R3 â€” HUMAN DECISION attiecÄ«bu autoritÄte

**PozÄ«cija: PIEÅ…EMTS.** NemainÄ«ts kopÅ¡ v2.

[PRIEKÅ LIKUMS] `TRACEABILITY_RECORD_v1 v0.6 Â§36` esoÅ¡ais attiecÄ«bu skaidrojums tiek **aizstÄts** ar:

```text
RELATED TRACE OBJECT REFERENCES
= vienÄ«gais autoritatÄ«vais attiecÄ«bu avots

RELATED FINDING
RELATED REQUIREMENT
RELATED ISSUE
= compatibility views

IF any compatibility view is populated
THEN an exactly matching typed reference MUST exist in
RELATED TRACE OBJECT REFERENCES

IF a compatibility view conflicts with
RELATED TRACE OBJECT REFERENCES
THEN the HUMAN DECISION RECORD is INVALID
```

`RELATED TRACE OBJECT REFERENCES [ja piemÄ“rojams]` paliek nosacÄ«ts lauks, bet kÄ¼Å«st obligÄts, ja ir aizpildÄ«ts jebkurÅ¡ compatibility view.

## 5. R4 â€” TRACE OBJECT TYPE â†’ ID FIELD mapping

**PozÄ«cija: PIEÅ…EMTS.** PÄrstrÄdÄts pÄ“c J1, J2, J3 un J9.

### 5.1. Â§26.1 precÄ«zais aizstÄjÄ“jteksts

[PRIEKÅ LIKUMS] `TERMINOLOGY_AND_ENUMS_v1 v0.4 Â§26.1` pilnais teksts tiek **aizstÄts** ar:

```text
### 26.1. Objekta ID lauka invariants

Katram `TRACE OBJECT TYPE` patstÄvÄ«gam ierakstam ir obligÄts tÄ tipam
atbilstoÅ¡s ID lauks.

`MODULE RECORD` tÄdÄ“Ä¼ ir obligÄts `MODULE ID` ar `MOD-` prefiksu; lauks
`MODULE` saglabÄ atseviÅ¡Ä·u canonical taxonomy vÄ“rtÄ«bu. `MODULE ID` un
`MODULE` nav savstarpÄ“ji aizstÄjami.

Katram 25. punktÄ reÄ£istrÄ“tam `TRACE OBJECT TYPE`, kuram 26. punktÄ ir
pieÅ¡Ä·irts ID prefikss, ir tieÅ¡i viens mehÄniski pÄrbaudÄms ID lauka
nosaukums tÄ objekta owner shÄ“mÄ.

Sasaisti TRACE OBJECT TYPE â†’ ID PREFIX â†’ ID FIELD NAME â†’ ID FIELD SCHEMA
OWNER uztur viens kontrolÄ“ts mapping 30.1. punktÄ.
```

SalÄ«dzinÄjums pret paÅ¡reizÄ“jo Â§26.1 (J3 kontrole):
- obligÄtuma teikums â€” SAGLABÄ€TS 1. rindkopÄ;
- `MODULE ID` / `MOD-` / taxonomy `MODULE` nodalÄ«jums â€” SAGLABÄ€TS 2. rindkopÄ, papildinÄts ar skaidru neaizstÄjamÄ«bas teikumu;
- jauns saturs â€” tikai 3. un 4. rindkopa (mehÄniskÄ viennozÄ«mÄ«ba un mapping uzturÄ“Å¡ana).

`MODULE` piemÄ“rs netiek pÄrvietots citÄ sadaÄ¼Ä.

### 5.2. Jauna T&E apakÅ¡sadaÄ¼a Â§30.1 â€” mapping mÄ“rÄ·a vieta

[PRIEKÅ LIKUMS] `TERMINOLOGY_AND_ENUMS_v1 v0.4` tiek **papildinÄts** ar jaunu numurÄ“tu apakÅ¡sadaÄ¼u `Â§30.1 TRACE OBJECT TYPE â†’ ID FIELD MAPPING` tÅ«lÄ«t pÄ“c Â§30 tabulas.

StruktÅ«ras izvÄ“le ir viena un galÄ«ga. FormulÄ“jums "vai lÄ«dzvÄ“rtÄ«gu mehÄniski viennozÄ«mÄ«gu lauku" tiek izÅ†emts pilnÄ«bÄ.

Pamatojums (J1): T&E Â§30 tabulas atslÄ“ga ir `Controlled field` ar kolonnÄm `Controlled field | Owning document | Registry`. Visi 19 trace-object tipi Â§30 ir pÄrstÄvÄ“ti ar vienu rindu `TRACE OBJECT TYPE`. Tabula ar atslÄ“gu `TRACE OBJECT TYPE` un 19 rindÄm nav savietojama ar Â§30 atslÄ“gu, tÄdÄ“Ä¼ kolonnas pievienoÅ¡ana Â§30 nav izpildÄma. Â§30.1 ir atseviÅ¡Ä·a tabula ar savu atslÄ“gu, kas paliek Â§30 reÄ£istru indeksa pÄrvaldÄ«bÄ.

`Â§30.1` normatÄ«vais ievadteksts:

```text
### 30.1. TRACE OBJECT TYPE â†’ ID FIELD MAPPING

Å Ä« tabula ir atvasinÄts kontrolÄ“ts indekss 26.1. punkta invarianta
mehÄniskai pÄrbaudei. TÄ nav lauku definÄ«ciju owner un nerada paralÄ“lu
canonical reÄ£istru.

Lauka faktiskÄ definÄ«cija paliek kolonnÄ ID FIELD SCHEMA OWNER norÄdÄ«tajÄ
dokumentÄ un sadaÄ¼Ä. Ja tabula un owner shÄ“ma atÅ¡Ä·iras, autoritatÄ«va ir
owner shÄ“ma, un neatbilstÄ«ba ir repo lÄ«meÅ†a defekts (RMT3).

Kolonna ID FIELD SCHEMA OWNER norÄda tikai ID lauka shÄ“mas Ä«paÅ¡nieku.
ReÄ£istra governance owner paliek 30. punkta indeksÄ un netiek dublÄ“ts Å¡eit.
```

Mapping (pÄrbaudÄ«ts pret faktiskajÄm owner shÄ“mÄm commitÄ `1783c50`):

| TRACE OBJECT TYPE | ID PREFIX | ID FIELD NAME | ID FIELD SCHEMA OWNER |
|---|---|---|---|
| TASK | `TASK-` | TASK ID | `TRACEABILITY_RECORD_v1 v0.6 Â§6` |
| SOURCE | `SRC-` | SOURCE ID | `TRACEABILITY_RECORD_v1 v0.6 Â§9` |
| MODULE | `MOD-` | MODULE ID | `TRACEABILITY_RECORD_v1 v0.6 Â§8` |
| FINDING | `FND-` | FINDING ID | `TRACEABILITY_RECORD_v1 v0.6 Â§15` |
| EVIDENCE | `EVD-` | EVIDENCE ID | `TRACEABILITY_RECORD_v1 v0.6 Â§17` |
| REQUIREMENTS SET | `RQS-` | REQUIREMENTS SET ID | `TRACEABILITY_RECORD_v1 v0.6 Â§21` |
| REQUIREMENT | `REQ-` | REQUIREMENT ID | `TRACEABILITY_RECORD_v1 v0.6 Â§22` |
| REQUIREMENT COMPONENT | `CMP-` | COMPONENT ID | `TRACEABILITY_RECORD_v1 v0.6 Â§27` |
| VERIFICATION EVENT | `VER-` | VERIFICATION EVENT ID | `TRACEABILITY_RECORD_v1 v0.6 Â§30` |
| VERIFICATION SCOPE RECORD | `VSR-` | VERIFICATION SCOPE RECORD ID | `TRACEABILITY_RECORD_v1 v0.6 Â§20.1` |
| LEGAL CLASSIFICATION ASSESSMENT | `LCA-` | LEGAL CLASSIFICATION ASSESSMENT ID | `TRACEABILITY_RECORD_v1 v0.6 Â§7.1` |
| MODULE SCREENING RECORD | `MSR-` | MODULE SCREENING RECORD ID | `TRACEABILITY_RECORD_v1 v0.6 Â§7.2` |
| MODULE TRIGGER SET | `MTR-` | TRIGGER SET ID | `MODULE_TRIGGER_REGISTRY_v1 Â§2` |
| HUMAN DECISION | `DEC-` | DECISION ID | `TRACEABILITY_RECORD_v1 v0.6 Â§36` |
| ESCALATION | `ESC-` | ESCALATION ID | `TRACEABILITY_RECORD_v1 v0.6 Â§37` |
| UNRESOLVED ISSUE | `ISS-` | ISSUE ID | `TRACEABILITY_RECORD_v1 v0.6 Â§38` |
| OUTPUT | `OUT-` | OUTPUT ID | `TRACEABILITY_RECORD_v1 v0.6 Â§40` |
| DATA CLASS EVENT | `DCE-` | EVENT ID | `TRACEABILITY_RECORD_v1 v0.6 Â§13` |
| TRACE RECORD | `TR-` | TRACE RECORD ID | `TRACEABILITY_RECORD_v1 v0.6 Â§44` |

Owner nodalÄ«jum `MODULE TRIGGER SET` \š[™ZH
ŒK
N‚‚˜^’Q’QSÐÒSPHÕÓ‘TŽˆSÑSWÕ’QÑÑT—Ô‘QÒTÕ–WÝŒH0©Ì‚”‘q(’TÕHÓÕ‘T“SÑHÕÓ‘TŽˆ‘TURT‘SQS•×ÓPU’VÑÓÕ‘T“SÑWÝŒBˆ
[YZÈ	‘H0©ÌÌ[™ZÜñ Kš[™HSÑSH’QÑÑTˆÑU
B˜‚±h1*È\ˆšY[±*Ùñ Hš[™KÝ\˜ZHXšHÝÛ™\ˆ]1hq-Ú\˜\Ëˆ1 \±$Ú± [HNš[™1 [HQ]ZØHÚ1$ÛX\ÈÝÛ™\ˆ[ˆ\H™q(Ú\Ý˜HÝÛ™\ˆ˜]ˆ™][± K1 Y1$ñ/]Ù]šqhq-ØHÛÛÛ›˜H™]YZÈ˜Y1*ÝK‚‚ˆÈÈÈKŒËˆ0©ÌÌ[™ZÜØH\[[± Z[\Â‚–Ô’QRñhRÕST×HT“RS“ÓÑÖWÐS‘ÑS•ST×ÝŒHŒ0©ÌÌX[ZH
ŠœY]šY[›ÊŠˆšY[Hš[™N‚‚ŸÛÛ›ÛYšY[ÝÛš[™ÈØÝ[Y[™YÚ\ÝžHŸKK_KK_KK_ŸQ’QSSQHT“RS“ÓÑÖWÐS‘ÑS•ST×ÝŒXPÑHÐ’‘PÕTH8¡¤ˆQ’QSPTS‘È
0©ÌÌŒJH‚‘\Ûñhq \È0©ÌÌš[™\È™]YZÈXZ[±*Ý\Ëˆ\Ûñhq \ÈÛÛÛ›˜\È™]YZÈXZ[±*Ý\Ë‚‚ˆÈÈÈKˆ‘TURT‘SQS•ÓÓTÓ‘S•8 %^±$ÛHšZÜñ$ÝB‚–Ô’QRñhRÕST×H^±$Û1$ÝÈ™XÙ[ž™[H˜\šX[È
ŠŠJJŠŽˆX\[™Èš[™H\ˆÓÓTÓ‘S•Qˆ]ZÜÈ™]YZÈ1 \œØ]ZÝË‚‚”[X]Ú[\Î‚‹HˆŒˆ0©ÌÈ˜ZÝ\ÚØZ\È]ZÝH›ÚÜÎˆÓÓTÓ‘S•QÓÓTÓ‘S•TÐÔ’TSÓ˜ÓÓTÓ‘S•ÕUTØU’QSÑHQØ‘T’Q’PÐUSÓˆU‘SÂ‹H]ZÜÈ‘TURT‘SQS•ÓÓTÓ‘S•Q™\È™YZÜÚ\Ý1$ÎÂ‹Hˆ0©ÌÍHY]ÈÛÛZØÚZ˜\È›ÜØ]ZÝ[]H‘TURT‘SQS•ÓÓTÓ‘S•Ø™H]ZØH›ÜØ]ZÝ[]NÂ‹H\HÛÛ›ÛH˜]H\ˆYZ1 [š\ÚØH\ˆÓTX™YšZÜÝH
	‘H0©ÌŽÈˆ0©ÍHY[q$ÜœÈÓTL˜
NÂ‹H1 \œØ]ZñhX[˜H±jÝH]Ù]šqhq-ØH\š]ZÝ1jÜ˜\È[KØ\È˜]ˆ™]šY]ÈÌMˆY]Ý1 Z˜H\Ý\š[± ]Z± H[1 H
[Y[™Y[0©ÌM
K‚‚’È˜ZÝH›Ü˜ZY1*Ú[\È[YZÈÜ1$Úñ Kˆ\ˆÝÛ™\‹ÛX\[™È›Ü›][1$Ú[XH™XÚ^±$Ú[\Ë™H˜][˜HÙ[X[ZØK‚‚ˆÈÈ‹ˆH8 %]Ûq \˜HÚ1$ÛX\È[ˆ˜[Y1 XÚZ˜\È[\[Y[][Û‚‚ŠŠ”Þ±*ØÚZ˜NˆQqaQSUËŠŠ‚‚”1$ØÈÛÛœÙ[œØH[ˆ]Ù]šqhq-ØH[\[Y[][Ûˆ\›Ý˜[šY[˜H]Ûq \˜H[\[Y[][ÛˆÛÛ[Z]›Ø™qo± H± X±jÝ‚‚ŒKˆÚ1$ÛX\ÈX›Ú[ZY[NÂŒ‹ˆÜ›ÜÜËYšY[[˜\šX[Y[NÂŒËˆYZ1 [š\ÚÚH1 \˜˜]Y1 [ZY[H˜[Y1 XÚZ˜\È›ÝZZÝ[ZY[NÂˆ™YØ]1*Ý˜ZšY[H[ˆ™\È1*ÛYqa˜H\ÝY[NÂKˆØ[YK\XÚØYÙH\[™[˜ÞHÚÝ[Y[HÛÛœÙZÝ™[˜Ù\ÈX›Ú[ZY[NÂ‹ˆ™]šY]Ë[Y[™Y[›ØYX\[ˆÝ\œ™[\Ý]HÝ]\ØH]˜][š[± Z[X[H]š[ÝñhZH˜ZÝ\ÚØZ˜ZH[\[Y[][Û‹‚‚’[\[Y[][Ûˆ™Y±*ÚÜÝ]Ý1 ]™\È\Ý˜[Y1$Ú˜[q HÝ1 ]›ÚÛ1*Ë‚‚ˆÈÈËˆ[˜Z\È]Ûq \± \ÈÛÜ™ZØÚZHZÙ]\È±$Ü[\Â‚ˆÈÈÈËŒKˆ“È8 %™Y™\™[˜ÙH[ÙH™XÚ^±$Ú[\Â‚“ÝÛ™\ˆØYq/\Î‚‹HÓÕ‘T“SÑKÕPÑPP’SUWÔ‘PÓÔ‘ÝŒWÝŒ‹›Y0©ÍKŒXÂ‹HÓÕ‘T“SÑKÕT“RS“ÓÑÖWÐS‘ÑS•ST×ÝŒWÝŒ›Y0©Ì‹Œ˜‚‚X± \ÈÜ\± XÚZ˜H\ˆ
ŠRV”Õ1 1hSJŠ‹™H\[[± Z[\È
JK‚‚ŠŠ•ˆ0©ÍKŒH8 %Z^œÝ1 Z˜[XZ\ÈZÜÝÎŠŠ‚‚˜^˜^•PÑH‘PÓÔ‘Q”‘PÓÔ‘‘T”ÒSÓ‚“Ð’‘PÕTB“Ð’‘PÕQ˜‚•š\ÚH1#Y]šH]ZÚH\ˆØ›Yñ ]KˆÐ’‘PÕTX^›X[ÈT“RS“ÓÑÖWÐS‘ÑS•ST×ÝŒXœ™q(Ú\Ý±$ÝHPÑHÐ’‘PÕTXÈÐ’‘PÕQ™YšZÜØ[H± X]š[Ý\[K[‚›Øš™ZÝ[H± YZÜÚ\Ý1$È›Ü± Y1*ÝZ± HPÑH‘PÓÔ‘Q[ˆ‘PÓÔ‘‘T”ÒSÓ˜‚˜‚ŠŠ•ˆ0©ÍKŒH8 %Z^œÝ1 Z±$ÚZÜÝÎŠŠ‚‚˜^]Ø]XÙHYZÈÛX± ]HšY[± H›È]šY[H™qo±*ÛZY[K‚‚’S•KT‘PÓÔ‘‘Q‘T‘SÑH
q$Ü±-Ú\È\ˆZ± Hqhq H[[]]X›H™XÛÜ™™\œÚZ± JN‚“Ð’‘PÕTB“Ð’‘PÕQ˜PÑH‘PÓÔ‘Q[ˆ‘PÓÔ‘‘T”ÒSÓ˜YZÈX[ÝH›ÈÛÛZ[š[™È™XÛÜ™™\œÚZ˜\È[ˆ™]YZÈÛX± ]H]ñ \ÝK‚‚Ô“ÔÔËT‘PÓÔ‘‘Q‘T‘SÑH
q$Ü±-Ú\È\ˆÚ]1 H™XÛÜ™˜ZHÚ]1 H™\œÚZ± JN‚•PÑH‘PÓÔ‘Q”‘PÓÔ‘‘T”ÒSÓ‚“Ð’‘PÕTB“Ð’‘PÕQ•š\ÚH1#Y]šH]ZÚH\ˆØ›Yñ ]K‚‚X›ÜÈ™qo±*Û[ÜÈÐ’‘PÕTX^›X[ÈT“RS“ÓÑÖWÐS‘ÑS•ST×ÝŒXKˆ[šÝ1 Bœ™q(Ú\Ý±$ÝHPÑHÐ’‘PÕTXÈÐ’‘PÕQ™YšZÜØ[H± X]š[Ý\[BŠ‹ˆ[šÝÊH[ˆ± X]š[ÝÌŒKˆ[šÝ1 H™q(Ú\Ý±$ÝZ˜[HQ]ZØH›ÜØ]ZÝ[X[B›ÝÛ™\ˆÚ1$Ûq NÈ\™Ù]Øš™ZÝ[H± YZÜÚ\Ý1$È]YXñ*ÙØZ± H™XÛÜ™™\œÚZ± K‚‚“™\[±*ÙØHÜ›ÜÜË\™XÛÜ™™Y™\™[˜ÙH\ˆS•SQ‚]Ø]XÙH^ˆÝ\œ™[]\Ý˜ZHÚ]HÝ\Ý1*ÙÝHq$Ü±-ÚH˜]ˆ\±*ÙØHØYÛX± ]B˜]Ø]XÙH™]šY[± H™qo±*Ûq K‚˜‚”[YZÈ™[XZ[±*ÝÈˆ0©ÍKŒH›ÜÛ1$ÙÝ[XHš[™ÛÜ\ÈZÜÝÈ\ˆÛÝ™\›˜[˜ÙHÚÝ[Y[Hñ HÓÕTÑX‚‚ŠŠ•	‘H0©Ì‹Œˆ8 %Z^œÝ1 Z˜[XZ\ÈZÜÝÎŠŠˆš[™ÛÜH”\œÚ\Ý1$ÝH˜XÙK[Øš™XÝ™Y™\™[˜ÙH\ˆšY[˜HÝZÝ\±$ÝH±$Ü1*Ø˜NˆˆÛÜ1 H\ˆZHÙZÛÚ›ñh[È1#Y]H]ZÝH›ÚÝH[ˆš[™ÛÜH”™Y™\™[˜ÙH\ˆY\Ü˜]\ÝHÛÛšÜ±$ÝZH˜XÙXXš[]H™XÛÜ™™\œÚZ˜ZKˆ‹‹ˆ\™Ù]Øš™ZÝ[H± YZÜÚ\Ý1$È›Ü± Y1*ÝZ± H™XÛÜ™™\œÚZ± Kˆ‚‚ŠŠ•	‘H0©Ì‹Œˆ8 %Z^œÝ1 Z±$ÚZÜÝÎŠŠˆ\È]ÈZÜÝËØ\Èˆ0©ÍKŒHZ^œÝ1 Z±$ÚZÜÝ1 K± \™È± \™1 KˆX˜\ÈØYq/\È1$ØÈ[\[Y[][Ûˆ\ˆZÜÝHšqa± HY[\ÚØ\ÎÈ]1hq-Ú\±*Ø˜H\ˆ“UˆRS‚‚”[YZÈ™[XZ[±*ÝH	‘H0©Ì‹Œˆ›ÜÛ1$ÙÝ[XHš[™ÛÜH\ˆÛÝ™\›˜[˜ÙHÚÝ[Y[Hñ HÓÕTÑX‚‚ˆÈÈÈËŒKŒKˆ“ÈX[ñhX[˜\È±$Ü[\È8 %]\›Z[š\Ý\ÚØHÛ\ÚYšZñ XÚZ˜B‚’Û\ÚYšZñ XÚZ˜H™]˜ZÝ\ÚÛÈPÑPP’SUWÔ‘PÓÔ‘ÝŒWÝŒ‹›YÛÛ[Z]1 HMÎØÍL

K‚‚ŠŠKˆ0©ÍKŒH˜XÙK[Øš™XÝ™Y™\™[˜Ù\È8 %X[È“È™qo±*Û]NŠŠ‚‚˜^°©ÍH›ÜÛ1$ÙÝ[XHš[™ÛÜH8 %Y\Ü˜]\ÝHÓÕTÑH]Ø]XÙHÛÝ™\›˜[˜ÙHÚÝ[Y[[B°©ÍËŒˆ›ÜÛ1$ÙÝ[XHš[™ÛÜH8 %SPSˆPÒTÒSÓˆ‘SUQPÑHÐ’‘PÕ‘Q‘T‘SÑTÂˆ\ˆ]Ø]XÚH^ˆÛÛšÜ±$ÝÈSÑSHÐÔ‘QS’S‘È‘PÓÔ‘Q°©ÌÍˆ‘SUQPÑHÐ’‘PÕ‘Q‘T‘SÑTÂ°©ÌÎ‘SUQPÑHÐ’‘PÕ‘Q‘T‘SÑTÂ˜‚ŠŠ‹ˆÚØZYšHV”Ó1$‘ÕÈ›È0©ÍKŒH™qo±*ÛXH8 %]šY[˜ÙK\ÝÜ™H™Y™\™[˜Ù\ÎŠŠ‚‚˜^°©ÌMÈU’QSÑHÕÔ‘H‘Q‘T‘SÑKU’QSÑHÑUÈ‘U’QUÈQÑS‘TUQU°©ÌŒU’QSÑHÕÔ‘H‘Q‘T‘SÑKU’QSÑHÑUÈ‘U’QUÈQÑS‘TUQU˜‚±hYH]ZÚHY[YšXñ$È1 \±$ÚH]šY[˜ÙHÛX± ]]šK™H˜XÙK[Øš™XÝˆÈÚ1$ÛXH™]YZÈXZ[±*ÝK‚‚ŠŠËˆÚØZYšHV”Ó1$‘ÕÈ›È0©ÍKŒH™qo±*ÛXH8 %1 \±$Ú˜\ÈÚ\Ý1$ÛX\È™Y™\™[˜Ù\ÎŠŠ‚‚˜^°©ÍˆÓÕTÑHÖTÕSHÈÒS“‘S‘Q‘T‘SÑKUK–B°©ÍÈPÒTÒSÓˆÓÕTÑK‘Q‘T‘SÑKUB°©ÍÕUU‘Q‘T‘SÑH
™^[1 ]H\Y˜ZÝH]˜qhX[± \ÈšY]JB°©ÍËŒHÓÓ•PÕTH‘Q‘T‘SÑTÈ
ÛÛ›Û1$ÝH™q(Ú\Ý˜H±$Ü1*Ø˜K™H˜XÙK[Øš™XÝ
B˜‚ŠŠ‘ˆ˜\™HQ]ZÚH8 %[YZÈ˜\™HQ]ZÚNŠŠ‚‚˜^°©ÍˆPÕ“Ñ’SH’S‘S‘ÈQËSÑSHÐÔ‘QS’S‘È‘PÓÔ‘QÂ°©ÍËŒHTÒÈQ‘SUQSÑSHQÕTT”ÑQTÈÐHQˆ‘PÓTÔÒQ’PÐUSÓˆ‘U’QUÈPÒTÒSÓˆQ°©ÍËŒˆTÒÈQ’QÑÑTˆ‘QÒTÕ–HQ’QÑÑTˆ‘QÒTÕ–H‘T”ÒSÓ‹ˆ‘SUQPÕ’S‘S‘ÈQËÐÔ‘QS’S‘ÈPÒTÒSÓˆQ°©ÌLÈÓÕTÑHQ°©ÌMHÓÕTÑHQËU’QSÑHQÂ°©ÌMÈÓÕTÑHQ°©ÌŒU’QSÑHQÂ°©ÌŒˆ‘TURT‘SQS•QU’QSÑHQÂ°©ÌÈU’QSÑHQÂ°©ÌÌT‘ÑUÐ’‘PÕQ
ÈT‘ÑUÐ’‘PÕTB°©ÍSÑSHÐÔ‘QS’S‘ÈÕSSPT–HÈSÑSHÐÔ‘QS’S‘È‘PÓÔ‘Q˜‚±hYH]ZÚHY[YšXñ$ÈØš™ZÝH1 HqhXHY\˜ZÜÝHY]˜\›ÜÈ\ˆ™XØ]\œÜ1*Ù1*ÙÝHQ[ˆ™]YZÈ1 \™ZYÝH\ˆ0©ÍKŒHÝZÝ\±$Ý1 [H]Ø]Xñ$ÛH1hXZ± HZÙ]1$ËˆÈÙ[X[ZØH\ˆZÝš]˜[[H[˜K\™XÛÜ™™qo±*ÛX[NˆX[ÝÈPÑH‘PÓÔ‘Q[ˆ‘PÓÔ‘‘T”ÒSÓ˜\È^œšY]›ÈQ™YšZÜØH
	‘H0©ÌŠH[ˆ]ZØH›ÜØ]ZÝ[XH
0©ÌÌŒJK‚‚ŠŠ‘KˆšY[±*Ùñ H˜\™H8¡¤ˆ™Y™\™[˜ÙHÛÛ™\œÚZ˜H1hXZ± HZÙ]1$ÎŠŠ‚‚˜^°©ÌMÔ’QÒSˆTÒÈQÔ’QÒSˆÕUUQÔ’QÒSˆÐ’‘PÕQˆ8¡¤ˆÔ’QÒSˆTÒÈ‘Q‘T‘SÑKÔ’QÒSˆÕUU‘Q‘T‘SÑKÔ’QÒSˆÐ’‘PÕ‘Q‘T‘SÑBˆš\Ø\Èñ H[˜\ÈÔ“ÔÔËT‘PÓÔ‘™Y™\™[˜Ù\È
1hq*ÜÈŒÈ0©ÍËK
B˜‚ŠŠ‘‹ˆ›ÚÛ\ñ$Ú[XH›ÝZZÝ[\È1 \±$ÚšY[H‹‹‹ˆ‘Q‘T‘SÑTÈˆ]ZÚY[NŠŠ‚‚˜^’˜H\œÚ\Ý1$ÝH™Y™\™[˜Ù\È]ZØHq$Ü±-Ú\È\ˆT“RS“ÓÑÖWÐS‘ÑS•ST×ÝŒHKˆ[šÝ1 Bœ™q(Ú\Ý±$ÝÈPÑHÐ’‘PÕTK]ZÜÈ\ˆKŒKˆ[šÝH˜XÙK[Øš™XÝ™Y™\™[˜ÙK‚•1 H›ÚÛ\ñ$Ú[XH™qo±*Û\È\ˆS•KT‘PÓÔ‘˜HšY[ˆÝÛ™\ˆØYq/HÚØZYšH™\˜\ØBÔ“ÔÔËT‘PÓÔ‘™qo±*Û]K‚‚’˜Hq$Ü±-Ú\È˜]ˆKˆ[šÝ1 H™q(Ú\Ý±$ÝÈ˜XÙK[Øš™XÝ
ÛÛ›Û1$ÝH™q(Ú\Ý˜H±$Ü1*Ø˜K™]šY[˜ÙK\ÝÜ™K1 \±$Ú˜HÚ\Ý1$ÛXK\Y˜ZÝH]˜qhX[± \ÈšY]JK]ZÜÈ˜]ˆKŒK‚œ[šÝH™Y™\™[˜ÙH[ˆØYÛX± HØ]H\Ûñh[ÈÚ1$Û]K‚˜‚“›ÝZZÝ[\È]YXØ\È^Žˆ0©ÍËŒH
‘SUS•PÕ’S‘S‘È‘Q‘T‘SÑTØPUT’PSTÔÕSTSÓˆ’S‘S‘È‘Q‘T‘SÑTØÕTÔ•S‘ÈÓÕTÑH‘Q‘T‘SÑTØÓÕS•T•RSS‘ÈÓÕTÑH‘Q‘T‘SÑTØSPSˆPÒTÒSÓˆ‘Q‘T‘SÑX
K0©Î
ÓÕTÑHÈ‘Q‘T‘SÑXÓTÔÒQ’PÐUSÓˆTÔÑTÔÓQS•‘Q‘T‘SÑTØ
K0©ÌLÈ
‘TÓÓUSÓˆ‘Q‘T‘SÑX
K0©ÌŒˆ
UHÓTÔÈU‘S•‘Q‘T‘SÑTØÓTÔÒQ’PÐUSÓˆTÒTÈ‘Q‘T‘SÑTØ
K0©ÌÌ
ÓÕTÑHÈU’QSÑH‘Q‘T‘SÑTØ‘T’Q’PÐUSÓˆÐÓÔH‘PÓÔ‘‘Q‘T‘SÑTØ
K0©ÌÍÈ
TÐÐSUSÓˆ‘Q‘T‘SÑX‘TÔÓ”ÑH‘Q‘T‘SÑX
K0©Í
ÓÕTÑHÑU‘Q‘T‘SÑX‘SUQ’S‘S‘ÔØ‘SUQ‘TURT‘SQS•ØQÐSÓTÔÒQ’PÐUSÓˆTÔÑTÔÓQS•‘Q‘T‘SÑTØSÑSHÐÔ‘QS’S‘È‘PÓÔ‘‘Q‘T‘SÑTØÓÓTUS‘TÔÈÓÓ•“Ó‘Q‘T‘SÑXUHÓTÔÈU‘S•‘Q‘T‘SÑTØ‘T’Q’PÐUSÓˆÐÓÔH‘PÓÔ‘‘Q‘T‘SÑTØ
K‚‚“™ZÛ\ÚYšXñ$ÝH]ZÝH˜]‹ˆ[\[Y[][ÛˆZZñ H^›[Z˜[]H™qo±*ÛXH^±$ñ/H˜]‹‚‚–ÑÒÕSQS•1$•ÈQUÕ1 H1$“UST×H1h1*È[HXZ[˜H™]šY]ÈÌMˆñ ZÛÝ±$ÚšH\Ý\š[± ]Z± H[YÜ± XÚZ˜\È1$Û][q HšZÜñ$ÝÈ1#Y]H]ZÝHÛX± qhX[˜\È™\™^™[1 XÚZH[˜K\™XÛÜ™™Y™\™[˜Ù\ÈØY1*Ú[q KˆY]Ý1 Z˜HØ[HÛÛœÙ[œØ[H± X]YXØ\È\±*È^ˆ1h[È[Kˆ1$ØÈÛÛœÙ[œØH›Ü›Ú± [H™\YXÚYqhX[\È]Ù]šqhq-ÜÈ[\[Y[][Ûˆ\›Ý˜[‚‚ˆÈÈÈËŒ‹ˆH8 %\ÜÚYÛ›Y[]]Üš]H˜\Ú\Â‚“ÝÛ™\ˆØYq/\Î‚‹HPÑPP’SUWÔ‘PÓÔ‘ÝŒHŒˆ0©ÌÍ˜8 %SPSˆPÒTÒSÓˆÚ1$ÛXNÂ‹HPÑPP’SUWÔ‘PÓÔ‘ÝŒHŒˆ0©ÌÎ8 %PÕSÓˆÕÓ‘TˆÈ‘TÓÓUSÓˆUUÔ’UH˜\Ú\È™Y™\™[˜Ù\Ë‚‚˜SPSˆPÒTÒSÓˆ‘PÓÔ‘Y]šY[›ÈÝZÝ\±$ÝHTÔÒQÓ“QS•UUÔ’UHTÒTÈÓÕTÑH‘Q‘T‘SÑXˆ˜HSPSˆPÒTÒSÓˆØ[È\ˆXÝ[ÛˆÝÛ™\ˆ˜ZH™\ÛÛ][Ûˆ]]Üš]H\ÜÚYÛ›Y[[X]K1hq*ÈY\Ü˜]\Ý1 HÓÕTÑX]Ø]XÙH\ˆØ›Yñ ]K‚‚ˆÈÈÈËŒËˆˆ8 %™XØ]\œÜ1*Ù1*ÙÜÈUˆQ‚“ÝÛ™\ˆ˜Z[N‚‹HÓÕ‘T“SÑKÓSÑSWÕ’QÑÑT—Ô‘QÒTÕ–WÝŒK›Y0©Í˜Â‹HÓÕ‘T“SÑKÓÕUÓÕTÒS‘×ÑPWÓSÑSWÕ’QÑÑT—ÔÑUÝŒŒK›Y‚‚•š\Ø\ÈÙ[X[\Úñ \ÈU‹SÕUÓÕTÒS‘ËLX±$Ü1*Ø˜\È1hXZ›ÜÈ]›ÜÈ˜Z[ÜÈZ^œÝ1 Zˆ\ˆU‹LXˆ˜][œÈšYÙÙ\‹\Ù]Øš™ZÝÈ™]YZÈ˜Y1*ÝË‚‚‘˜ZÝ\ÚØZ\ÈÝ1 ]›ÚÛ\ÈÛÛ[Z]1 HMÎØÍLˆU‹SÕUÓÕTÒS‘ËLXØ\ÝÜ[\ÈÈ™Z^™\ÈZÝ1*Ý˜Z›ÜÈ˜YÜÈ
SÑSWÕ’QÑÑT—Ô‘QÒTÕ–WÝŒK›Y8 %NÈÕUÓÕTÒS‘×ÑPWÓSÑSWÕ’QÑÑT—ÔÑUÝŒŒK›Y8 %ŠH[ˆ™Z^™\È™]šY]ÈÈ™\ÜÛœÙH\Y˜ZÝÜËÝ\ˆ\È\ˆq(Ú]1*ÛXH±$ÜÝ\š\ÚØH]Ø]XÙH[ˆ™]YZÈXZ[±*ÝË‚‚ˆÈÈÈËˆ8 %ÝÛ™\‹YØÝ[Y[Q[˜\šX[Â‚’Y]šY\Ý1hq*ÜÈŒÈ0©ÍKŒH0©Ì‹ŒHZ^œÝ1 Z±$ÚZÜÝK0©ÍKŒˆ˜][›È	‘H0©ÌÌŒH\Zñh\ØYq/H\ˆNHš[™HX\[™È[ˆ0©ÍKŒÈšY[H˜][H0©ÌÌ[™ZÜØHš[™Kˆ‘TURT‘SQS•ÓÓTÓ‘S•š[™H\ˆÓÓTÓ‘S•QÈˆ0©ÌÈ]ZÜÈ™]YZÈ1 \œØ]ZÝËˆUHÓTÔÈU‘S•š[™H\ˆU‘S•QÈˆ0©ÌLÈ]ZÜÈ™]YZÈ1 \œØ]ZÝËˆÈ˜ZÝH›Ü˜ZY1*Ú[\È[YZÈ™[XZ[±*ÝË‚‚ˆÈÈÈËKˆ8 %’SÔˆTÒÈÕUU™Y™\™[˜Ù\Â‚“ÝÛ™\ˆØYq/N‚‹HPÑPP’SUWÔ‘PÓÔ‘ÝŒHŒˆ0©ÌM‚‚ŠŠZ^œÝ1 ZŠŠˆ˜\™HÜšYÚ[ˆQ]ZÝ\ÈÔ’QÒSˆTÒÈQÔ’QÒSˆÕUUQÔ’QÒSˆÐ’‘PÕQÚ˜HY[q$Ü›Ú˜[\×X\Ž‚‹HÔ’QÒSˆTÒÈ‘Q‘T‘SÑXÂ‹HÔ’QÒSˆÕUU‘Q‘T‘SÑXÂ‹HÔ’QÒSˆÐ’‘PÕ‘Q‘T‘SÑHÚ˜HY[q$Ü›Ú˜[\×XÂ‚š\Ø\Èñ H[˜\ÈÔ“ÔÔËT‘PÓÔ‘™Y™\™[˜Ù\È^ˆÛÛšÜ±$ÝH^˜Ù[ÛY\È™XÛÜ™™\œÚZKˆÓÕTÑHTNˆ’SÔˆTÒÈÕUU[ˆS’T’UQ‘T’Q’PÐUSÓˆU‘S[YZÈ™[XZ[±*ÝK‚‚ˆÈÈÈË‹ˆLKÔŒÈ8 %SPSˆPÒTÒSÓˆ]YXñ*ØH]]Üš]1 ]B‚“ÝÛ™\ˆØYq/NˆPÑPP’SUWÔ‘PÓÔ‘ÝŒHŒˆ0©ÌÍ˜ˆY]šY\Ý1hq*ÜÈŒÈ0©ÍZ^œÝ1 Z±$ÚZÜÝK‚‚ˆÈÈÈËËˆL‹ÔŒˆ8 %™]™\œñ$ÝH]›ÝHY[]1 ]B‚“ÝÛ™\ˆØYq/\ÎˆPÑPP’SUWÔ‘PÓÔ‘ÝŒHŒˆ0©ÌLXÈ\Ú[˜\šX[H[YZÈˆ0©ÎX[ˆ	‘H0©Ì‹ŒØˆ\[\ÈZ^œÝ1 ZˆY\šYZñhq$Ú± \È™]šY]Ë\™\ÜÛœÙHZØÙ\HÜš]1$ÜšZHñ H›ÝZZÝÈ1hq*ÜÈŒÈ0©ÌË‚‚ˆÈÈÈËŽˆŒH8 %œ™Y^™H\[™[˜ÞB‚“ÝÛ™\ŽˆQÐSÐÓTÔÒQ’PÐUSÓ—ÐTÑSS‘WÐSQS‘QS•ÝŒŒ‹›Y8 %˜][˜H\Zñh\ØYq/H0©ÎKŒHœ™Y^™HšYZñh[›ÜØXñ*Ú[ZX
1hq*ÜÈŒÈ0©ÌˆZÜÝÊK‚‚•šY[±*ÙØZ\ÈÝÛ™\‹ˆ]Ø]XÙH^ˆ™Ø[H[Y[™Y[XØÙ\[˜ÙHÛÛ›ÛHˆ^±a™[]Kˆ[Y[™Y[0©ÌLH‘ÛË[]™HšYZñh[›ÜØXñ*Ú[ZHˆ™]YZÈXZ[±*ÝË‚‚ˆÈÈÈËŽKˆH8 %˜[Y][ÛˆÜXÚYšXØ][Û‚‚•š\Ø\ÈY\šYZñhHZ[±$Ý1 \ÈÚ1$ÛX\ÈÛÜ™ZØÚZ˜\Ë˜[Y1 XÚZ˜\È›ÝZZÝ[ZH[ˆ\ÝHYZÈY]šY\ÝHšY[± H]Ûq \± H[\[Y[][ÛˆÛÛ[Z]1 K‚‚ˆÈÈÈËŒLˆ™]šY]È[ˆÝ]\ØHÛÛœÙZÝ™[˜ÙB‚•Z± Hqhq H[\[Y[][ÛˆšY[±*Ø± H]˜][š[˜H™]šY]ÈÌMˆ[YÜ± XÚZ˜\ÈY\˜ZÜÝK[Y[™Y[Ý]\ÝK›ØYX\[ˆ“Ò‘PÕÐÕT”‘S•ÔÕUK›YZØZH]š[ÝñhZH˜ZÝ\ÚØZ˜ZH[\[Y[][Û‹ˆœ›Þ™[ˆ˜\Ù[[™HÝ]\ÝH™[XZ[˜H™^ˆ]Ù]šqhq-ØHœ™Y^™H1$Û][XK‚‚ˆÈÈˆ\[™[˜ÞHØ\B‚˜^”’SPT–HÐÕSQS••PÑPP’SUWÔ‘PÓÔ‘ÝŒHŒ‚‚‘”“Ö‘SˆS”UÂ‹H“Ñ‘TÔÒSÓSÔÐÓÔWÝŒKŒÂ‹HPÑPP’SUWÔ‘PÓÔ‘ÝŒHŒB‹HT“RS“ÓÑÖWÐS‘ÑS•ST×ÝŒHŒŒÂ‹H‘T’Q’PÐUSÓ—Ô“ÕÐÓÓÝŒHŒB‚‘Q•S”UÂ‹H“Ñ‘TÔÒSÓSÔÐÓÔWÝŒK‹HT“RS“ÓÑÖWÐS‘ÑS•ST×ÝŒHŒ‹H‘TURT‘SQS•×ÓPU’VÑÓÕ‘T“SÑWÝŒHŒŒÂ‹HÔTUSÓ—ÕÓÔ’Ñ“ÕÔ×ÝŒHŒŒ‚‹HQÐSÔ‘TÑPTÒÓQUÑÝŒHŒŒ‚‹HSÑSWÕ’QÑÑT—Ô‘QÒTÕ–WÝŒHŒŒB‹HÕUÓÕTÒS‘×ÑPWÓSÑSWÕ’QÑÑT—ÔÑUÝŒŒB‚”ÐSQKTPÒÐQÑHTS‘SÒQTÂ‹H“Ñ‘TÔÒSÓSÔÐÓÔWÝŒK‹HT“RS“ÓÑÖWÐS‘ÑS•ST×ÝŒHŒ‹H‘TURT‘SQS•×ÓPU’VÑÓÕ‘T“SÑWÝŒHŒŒÂ‹HSÑSWÕ’QÑÑT—Ô‘QÒTÕ–WÝŒHŒŒB‹HÕUÓÕTÒS‘×ÑPWÓSÑSWÕ’QÑÑT—ÔÑUÝŒŒB‹HQÐSÐÓTÔÒQ’PÐUSÓ—ÐTÑSS‘WÐSQS‘QS•ÝŒŒ‚‚‘ÐÕSQS•È“ÐÒÑQ–HTÈÓÔ’Â‹H\šY\Úñ \ÈÛ\ÚYšZñ XÚZ˜\È[Y[™Y[ZÙ]\ÈØ[H]Y]Â‹HÈŒKÈˆŒˆÈ	‘HŒœ™Y^™H1$Û][\Â‚”SÕÈSTSQS•USÓˆÓÓ”ÑTUQSÑTÂ‹H™Y™\™[˜Ù\È˜[Y]Ü˜[H± X]1hq-Ú\ˆ[˜K\™XÛÜ™[ˆÜ›ÜÜË\™XÛÜ™™qo±*Û\Â‹H\H8¡¤ˆQšY[X\[™È± X±jÝYZ1 [š\ÚÚH˜[Y1$Ú˜[X[H™]ÝÛ™\ˆÚ1$Ûq [B‹H™\È1*ÛYqa˜H\ÝÈ™Y±*ÚÜÝYq/]]Ù[X[\ÚÝHUˆQZÝ1*Ý˜Z›ÜÈ˜YÜÂ‹Hœ™Y^™H\[™[˜ÞH\ˆ[Y[™Y[›ØÙ\ØH™XÛÛ™][Û‹™H[[YHÝ\Ü[œÚ[ÛˆÝ]B˜‚ˆÈÈKˆ™YØ]1*ÝšYH[ˆYZ1 [š\ÚÚYH\ÝB‚ˆÈÈÈKŒKˆ™XÛÜ™ÈØÚ[XH1*ÛYqa˜H\ÝB‚•˜[Y1$ÈšY[HÛÛšÜ±$ÝH™XÛÜ™[œÝ[˜ÚK‚‚˜^“ŒNˆ[˜K\™XÛÜ™™Y™\™[˜ÙHZ\ÜÚ[™ÈÐ’‘PÕTHOˆS•SQ“ŒŽˆ[˜K\™XÛÜ™Ð’‘PÕQ™Yš^Ý\HZ\ÛX]ÚOˆS•SQ“ŒÎˆÜ›ÜÜË\™XÛÜ™™Y™\™[˜ÙHZ\ÜÚ[™ÈPÑH‘PÓÔ‘QOˆS•SQ“ˆÜ›ÜÜË\™XÛÜ™™Y™\™[˜ÙHZ\ÜÚ[™È‘PÓÔ‘‘T”ÒSÓˆOˆS•SQ“NˆÜ›ÜÜË\™XÛÜ™\™Ù]XœÙ[[ˆ[›™Y™XÛÜ™™\œÚ[ÛˆOˆS•SQ“ŽˆSPSˆPÒTÒSÓˆÛÛ\]Xš[]HšY]ÈÛÛ™›XÝÈÚ]]]Üš]]]™Bˆ‘SUQPÑHÐ’‘PÕ‘Q‘T‘SÑTÈOˆS•SQ“ÎˆSPSˆPÒTÒSÓˆ\ÙY\È\ÜÚYÛ›Y[˜\Ú\ÈÚ]Ý]ˆTÔÒQÓ“QS•UUÔ’UHTÒTÈÓÕTÑH‘Q‘T‘SÑHOˆS•SQ“Žˆ[œÝ[˜ÙHÙˆH™YÚ\Ý\™YPÑHÐ’‘PÕTHXÚÜÈHQšY[˜[YY[‚ˆ]ÈÝÛ™\ˆØÚ[XKÜˆ]ÈQ˜[YH™Yš^Ù\È›ÝX]Ú0©ÌˆOˆS•SQ“ŽNˆ’SÔˆTÒÈÕUUÜšYÚ[ˆ™Y™\™[˜ÙHXÚÜÈ[›™YÜšYÚ[ˆ™XÛÜ™™\œÚ[Û‚ˆOˆS•SQ“ŒLˆÓÓ•S•TÒ™\Ù[Ú]Ý]ÓÓ•S•TÒSÓÔ’UHOˆS•SQ“ŒLNˆ[™\œÚ[Û™YÛÝ\˜ÙHY[]H[œÝY™šXÚY[OˆS”‘TÓÓ‘QTÔÕQH™\]Z\™Y˜‚“Ž^›XZqa˜H
ÊNˆ™q(Ú\Ý˜H[±*ÙÝ[XHq/H
››È^XÝ0©ÌÌQ’QSSQHX\[™ÈŠH\ˆ^±a™[]H›È™XÛÜ™[]™[\ÝY[Kˆ™]šY[˜H™XÛÜ™[œÝ[˜ÙH™]˜\ˆ±jÝS•SQ1 Y1$ñ/ØH	‘H0©ÌÌŒH±jÚÜÝš[™\Ëˆ[±*ÙÝ[XHÛÛ›ÛH1 \šY]ÝH^ˆ“UË‚‚ˆÈÈÈKŒ‹ˆ™\ÈÈ™YÚ\ÝžH1*ÛYqa˜HYZ1 [š\Úñ H1 \˜˜]YB‚•˜[Y1$È™\ÈÝ1 ]›ÚÛK™H™XÛÜ™[œÝ[˜ÚK‚‚˜^”“UNˆ[žHÙ[X[XÈU‹OSQO‹O•SP‘TˆY[YšY\ˆ™[XZ[œÈ[ˆH“UH’SHÑUˆOˆRS”“UŽˆˆ0©ÍKŒH[™	‘H0©Ì‹Œˆ™Y™\™[˜ÙK[[ÙHYš[š][ÛœÈY™™\ˆOˆRS”“UÎˆ[žH0©ÌHPÑHÐ’‘PÕTHXÚÜÈ^XÝHÛ™H0©ÌÌŒHX\[™È›ÝËˆÔˆH0©ÌÌŒHQ’QSSQHÙ\È›Ý^\Ý[ˆH˜[YYˆQ’QSÐÒSPHÕÓ‘TˆÙXÝ[Û‚ˆOˆRS˜‚”“UH±$Ü[\È
ŠH8 %™Xñ*Þ˜H˜Z[HÛÜKØ\È˜]ˆ\qhZ[± [XH™^ˆ]Ù]šqhq-ØH1$Û][XN‚‚˜^”“UH’SHÑU‚‘ÓÕ‘T“SÑKÔ“Ñ‘TÔÒSÓSÔÐÓÔWÝŒK›Y‘ÓÕ‘T“SÑKÕPÑPP’SUWÔ‘PÓÔ‘ÝŒWÝŒ‹›Y‘ÓÕ‘T“SÑKÕT“RS“ÓÑÖWÐS‘ÑS•ST×ÝŒWÝŒ›Y‘ÓÕ‘T“SÑKÔ‘TURT‘SQS•×ÓPU’VÑÓÕ‘T“SÑWÝŒK›Y‘ÓÕ‘T“SÑKÓÔTUSÓ—ÕÓÔ’Ñ“ÕÔ×ÝŒK›Y‘ÓÕ‘T“SÑKÓQÐSÔ‘TÑPTÒÓQUÑÝŒK›Y‘ÓÕ‘T“SÑKÓSÑSWÕ’QÑÑT—Ô‘QÒTÕ–WÝŒK›Y‘ÓÕ‘T“SÑKÓÕUÓÕTÒS‘×ÑPWÓSÑSWÕ’QÑÑT—ÔÑUÝŒŒK›Y‘ÓÕ‘T“SÑKÓQÐSÐÓTÔÒQ’PÐUSÓ—ÐTÑSS‘WÐSQS‘QS•ÝŒŒ‹›Y‚”“UHVÓTÒSÓˆ•SN‚•š\ÚH1 \±$ÚšYH™\È˜Z[KÜÝ\œ™XšÝ\±hH˜Z[ËÝ\˜H›ÜØ]ZÝ[\ÈØ]\‚—Ô‘U’QUËÔ‘TÔÓ”ÑKÐUQU˜ZHÕTÒËˆ±$ÜÝ\š\Úñ \È]Ø]XÙ\È™]šY]È[‚œ™\ÜÛœÙH\Y˜ZÝÜÈ\ˆq(Ú]1*ÛX\È[ˆ™\˜YHRS‚˜‚ˆÈÈÈKŒËˆœ™Y^™H›ØÙ\ØH™XÛÛ™][Û‚‚•˜[Y1$È[Y[™Y[›ØÙ\ØH\˜±*ØK™H™XÛÜ™[œÝ[˜ÚH[ˆ™H™\ÈØ]\K‚‚˜^‘”Nˆ][\YˆŒˆœ™Y^™HÚ]Ý]Ø[YK\XÚØYÙHÈŒK[™	‘HŒœ™Y^™BˆOˆ”‘QV‘H‘PÓÓ‘USÓˆ“ÕQU˜‚˜”X˜]ˆ™XÛÜ™[]™[˜[Y]ÜœË™Z^›X[ÈØ[›ÛšXØ[“ÐÒØ[ˆ˜]ˆ™\È1*ÛYqa˜H\ÝËˆ1 HÝÛ™\ˆ\ˆ[Y[™Y[0©ÎKŒK‚‚•±*ÜÈ1*ÛYqašH\ˆ›Ù[1*ÝNˆKŒKˆH™XÛÜ™[œÝ[˜ÙNÈKŒ‹ˆH™\ÈÈ™q(Ú\Ý˜H[±*ÙÝ[\ÎÈKŒËˆHœ™Y^™H›ØÙ\ÜË‚‚ˆÈÈLˆŒx $ÒŽHÝ]\ÚB‚ˆÈÈÈŒH8 %X\[™Èq$Ü±-ØHšY]H[ˆÝZÝ1jÜ˜BŠŠ”QqaQSU4KŠŠˆš\Ú[± Z[\Îˆ1hq*ÜÈŒÈ0©ÍKŒˆ˜][± H	‘H0©ÌÌŒH\Zñh\ØYq/H\ˆ1#Y]± [HÛÛÛ›± [HPÑHÐ’‘PÕTHQ‘Q’VQ’QSSQHQ’QSÐÒSPHÕÓ‘T˜[ˆ0©ÍKŒÈšY[˜H˜][˜H0©ÌÌ[™ZÜØHš[™Kˆ[\›˜]1*Ý˜H˜ZH1*Ù±$Ü1*ÙÝHˆ^±a™[]Kˆ\˜[1$ÛÈØ[›ÛšXØ[™q(Ú\ÝœÈ™]YZÈ˜Y1*ÝÎˆ0©ÌÌŒH\ˆ]˜\Ú[± ]È[™ZÜÜËÛÛ™›ZÝHØY1*Ú[q H]]Üš]]1*Ý˜H\ˆÝÛ™\ˆÚ1$ÛXKˆSÑSH’QÑÑTˆÑUš[™ZHÚ1$ÛX\ÈÝÛ™\ˆ
SÑSWÕ’QÑÑT—Ô‘QÒTÕ–WÝŒH0©Ì˜
H[ˆ™q(Ú\Ý˜HÛÝ™\›˜[˜ÙHÝÛ™\ˆ
‘TURT‘SQS•×ÓPU’VÑÓÕ‘T“SÑWÝŒX	‘H0©ÌÌ
H\ˆÚØZYšH›Ù[1*ÝKˆ1 \˜˜]Y1*ÝÈ™]	‘HŒ0©ÌÌ˜ZÝ\ÚÛÈÛÛÛ›HÝZÝ1jÜK‚‚ˆÈÈÈŒˆ8 %‘TURT‘SQS•ÓÓTÓ‘S•Q]ZÜÂŠŠ”QqaQSUËŠŠˆX\[™Èš[™H\ˆÓÓTÓ‘S•QÝÛ™\ˆPÑPP’SUWÔ‘PÓÔ‘ÝŒHŒˆ0©ÌØˆ1 \œØ]ZñhX[˜H™]YZÈ™ZZÝNÈX]\šq [ÈY[Y\ÛÈ˜]ˆÛÛœÝ]1$ÝË[ˆ1 \œØ]ZÝ[\È±jÝH]Ù]šqhq-ØH\š]ZÝ1jÜ˜\È[H1 \œ\È[Y[™Y[0©ÌM\Ý\š[± ]1 H±$Ü[XKˆ1 \˜˜]Y1*ÝÈ™]ˆŒˆ0©ÌÈ˜ZÝ\ÚÛÈ]ZÝH›ÚÝK‚‚ˆÈÈÈŒÈ8 %0©Ì‹ŒH[˜\šX[BŠŠ”QqaQSU4KŠŠˆ1h1*ÜÈŒÈ0©ÍKŒHZ^œÝ1 Z±$ÚZÜÝÈØ]\ˆš\Ý\È1#Y]\È˜\ñ*ÝÜÈ[[Y[\ÎˆØ›Yñ ]H\[H]š[Ýñh]HQ]ZÝHØ]˜[H]Ý1 ]±*ÙØ[HY\˜ZÜÝ[NÈSÑSHQ\ˆSÑX™YšZÜÝNÈSÑSHQÈ^Û›Û^HSÑSX›Ù[1*Ú[]H\ˆ™XZ^œÝ1 Z˜[q*Ø˜\ÈZZÝ[]NÈX\[™ÈØ\ØZ\Ý\È›ÝZZÝ[]H^ˆ0©ÌÌŒKˆSÑSXY[q$ÜœÈ™]YZÈ1 \šY]ÝËˆÙ[X[\Úñ H™YÜ™\ÚZ˜H™]qh\™Z^±$Ú›È0©Ì‹ŒH\ˆ›Ý±$ÜœÝK‚‚ˆÈÈÈ8 %“È™Y™\™[˜Ù\È±$Ü[\ÂŠŠ”QqaQSU4KŠŠˆ1h1*ÜÈŒÈ0©ÍËŒKŒHZ^œÝ1 ZˆŒˆØ\˜ZÜÝH\ˆ[HÛ\ÚYšZñ XÚZH™]˜ZÝ\ÚÛÈˆŒŽˆH8 %0©ÍKŒHX[Ý1 ZšH
0©ÍK0©ÍËŒ‹0©ÌÍ‹0©ÌÎ
NÈˆ8 %]šY[˜ÙK\ÝÜ™H™Y™\™[˜Ù\È^œÛ1$ÙÝ\È
0©ÌMË0©ÌŒ
NÈÈ8 %1 \±$Ú˜\ÈÚ\Ý1$ÛX\È™Y™\™[˜Ù\È^œÛ1$ÙÝ\È
0©Í‹0©ÍË0©ÍÕUU‘Q‘T‘SÑX0©ÍËŒHÓÓ•PÕTH‘Q‘T‘SÑTØ
NÈ8 %˜\™HQ]ZÚH^œÚØZ]1*ÝH[ˆ]Ý1 ]H˜\™NÈH8 %šY[±*Ùñ HÛÛ™\œÚZ˜H\ˆ0©ÌM

NÈˆ8 %›ÚÛ\ñ$Ú[XH›ÝZZÝ[\È1$ØÈ™Y™\™[˜Ù\Èq$Ü±-ØH\Kˆ™ZÛ\ÚYšXñ$ÝH]ZÝH˜]‹‚‚ˆÈÈÈH8 %Z^œÝ1 qhX[˜H˜ZH\[[± qhX[˜BŠŠ”QqaQSUËŠŠˆX± [HØYq/1 [HÜ\± XÚZ˜H\ˆ
ŠRV”Õ1 1hSJŠ‹ˆ1h1*ÜÈŒÈ0©ÍËŒHÚ]1$È™Xñ*ÞHZ^œÝ1 Z˜[[ÈZÜÝHˆ0©ÍKŒH[ˆ	‘H0©Ì‹Œˆ[ˆÛšYYˆ™Xñ*ÞHZ^œÝ1 Z±$ÚZÜÝKˆZZÝ[\È•š\ÚH1#Y]šH]ZÚH\ˆØ›Yñ ]Hˆqh\™Z^±$Ú± H›Ü›q HYZÈ±$ÜÝÈ[ˆ1 \˜Ùq/\È^ˆÜ›ÜÜË\™XÛÜ™™qo±*ÛXH›ÚÝKˆYqhXH™][˜H\ˆ[˜K\™XÛÜ™™qo±*Û]H™\[YZË‚‚ˆÈÈÈˆ8 %“UH±$Ü[\ÂŠŠ”QqaQSU4KŠŠˆ1h1*ÜÈŒÈ0©ÎKŒˆYš[±$È“UH’SHÑU\ˆ]šqašY[HÛÛšÜ±$ÝY[H˜Z[Y[H[ˆÚØZYHVÓTÒSÓˆ•SKˆ±$ÜÝ\š\ÚÚYH™]šY]ÈÈ™\ÜÛœÙHÈ]Y]\Y˜ZÝH™\˜Y1*ÜÈ˜[ÙH˜Z[\™Kˆ1 \˜˜]Y1*ÝÈ™]˜ZÝ\ÚÛÈU‹SÕUÓÕTÒS‘ËLXØ\ÝÜ[q*ØHÛÛ[Z]1 HMÎØÍL‚‚ˆÈÈÈÈ8 %Ž1*ÛY[š\ÂŠŠ”QqaQSU4KŠŠˆ1h1*ÜÈŒÈ0©ÎH›Ù[H±*ÜÈ1*ÛYqa\ËˆŽ[YZÈZØZH™XÛÜ™Z[œÝ[˜ÙH\ÝÈ
±jÚÜÝÝÛ™\ˆÚ1$ÛX\ÈQ]ZØH[œÝ[˜ñ$È˜ZH™YšZÜØH™X]š[Ý1*Ø˜JKˆ™q(Ú\Ý˜H[±*ÙÝ[XHq/H\šY[›ÝH\ˆ“UËØ\È\[\È1 \˜˜]YK˜ZH0©ÌÌŒH›Ü± Y1*ÝZ\ÈQ’QSSQH˜ZÝ\ÚÚHZÜÚ\Ý1$È›Ü± Y1*ÝZ± HÝÛ™\ˆØYq/1 Kˆ“UÈX›1$ñhX[± \È\ˆŽ›Ý±$ÜœÝK‚‚ˆÈÈÈŽ8 %œ™Y^™H™XÛÛ™][ÛˆÝÛ™\‚ŠŠ”QqaQSUËŠŠˆšY[˜HÛÛšÜ±$ÝHÝÛ™\ˆØYq/Nˆ˜][˜HQÐSÐÓTÔÒQ’PÐUSÓ—ÐTÑSS‘WÐSQS‘QS•ÝŒŒˆ0©ÎKŒH‘œ™Y^™HšYZñh[›ÜØXñ*Ú[ZH˜ˆ›Ü›][1$Ú[\È™Ø[H[Y[™Y[XØÙ\[˜ÙHÛÛ›ÛHˆ^±a™[]Ëˆ[Y[™Y[0©ÌLH˜]ˆ^±$Û1$ÝË›È\È1 \˜[HPÕQÔH[Ùq/HÜ\˜XÚ[Û± [ÈÛË[]™K™HÚÝ[Y[Hœ™Y^™Kˆ1 \˜˜]Y1*ÝÈ™][Y[™Y[0©ÎH[ˆ0©ÌLH˜ZÝ\ÚØZšY[H›ÜØ]ZÝ[ZY[H[ˆØ]\K‚‚ˆÈÈÈŽH8 %UHÓTÔÈU‘S•QŠŠ““ÔRQ1*•ÈTˆ1 UQ1 UHSPUÒ•SUKŠŠ‚‚”[X]Ú[\Î‚ŒKˆX\[™È\ˆ˜ZÝ\ÚÚHÛÜ™ZÝËˆˆŒˆ0©ÌLÈ]ZØH›ÜØ]ZÝ[\È\ˆU‘S•QÈUHÓTÔÈU‘S•8¡¤ˆU‘S•Q]š[ÝÝÛ™\ˆÚ1$ÛXZK‚Œ‹ˆYZ1 [š\ÚØHqhZY[YšXñ$Ú˜[q*Ø˜H˜]H\ˆ›Ù›ñhZ[± ]H\ˆQ™YšZÜØHÛÛ›ÛNˆ	‘H0©Ìˆ›ÜØZØHÑKX[ˆ0©ÌÌŒHš[™HØ\ØZ\ÝH\K™YšZÜÝK]ZØH›ÜØ]ZÝ[]H[ˆÝÛ™\ˆØYq/KˆŒˆ[ˆŽ\ÝH\H™X]š[Ý1*ØH›ñ-Ù\ˆ™^ˆ]ZØH1 \œØ]ZñhX[˜\Ë‚ŒËˆÙ[X[\ÚØH˜ZHYZ1 [š\ÚØH›Ø›1$ÛXH˜]ˆY\± Y1*ÝKˆ™XÙ[ž™[È›Ü± YHY\Ü1$Ú˜[]H± ZÛÝ™\ÈØY\œÛZH\ˆÚ]Y[H]™[Øš™ZÝY[NÈ1h[ÙY[ˆ™\ÈÚ]H]™[\H˜]‹[ˆ	‘H0©ÌHÈ™\™q(Ú\Ý±$Ë‚ˆ1 \œØ]ZñhX[˜H±jÝH\š]ZÝ1jÜ˜\È[H1 \œ\È™]šY]ÈÌMˆY]Ý1 Z˜H\Ý\š[± ]1 H±$Ü[XH
[Y[™Y[0©ÌM
K[ˆ1hq*È]š[H\š]ZÝ1jÜ˜\ÈÚ1$Û]H™[XZ[˜H
T0©ÍËŒÊK‚‚‘šZÜñ$ÝÈñ H\š[± ]H^±$ÛNˆUHÓTÔÈU‘S•š[™H0©ÌÌŒH[YZÈU‘S•Qˆ˜H± ZÛÝ±$ÈYZÈ™q(Ú\Ý±$ÝÈÝœÈ]™[\H˜XÙHØš™XÝ]ZØH1 \œØ]ZñhX[˜H^ˆUHÓTÔÈU‘S•QYZÈ^œÚØ]1*ÝHñ H]Ù]šqhq-ØH\š]ZÝ1jÜ˜\È[H\ˆØ]H™]šY]ÈÚZÛK‚‚ˆÈÈLKˆŒx $ÑŒLˆÝ]\ÚH
1 \›™\ÝH›ÈŒ‹ZÝX[^±$ÝJB‚˜^‘ŒNˆQqaQSUÈ8 %ŒÈ0©ÍËŒHÈ0©ÍËŒKŒH
H›Ý±$ÜœÝJB‘ŒŽˆQqaQSUÈ8 %ŒÈ0©ÌˆÈ0©ÍËŽÈ0©ÎKŒÈ”B‘ŒÎˆQqaQSUÈ8 %ŒÈ0©ÍKŒHÈ0©ÍKŒˆ
ŒKŒÈ›Ý±$ÜœÝJB‘ˆQqaQSUÈ8 %ŒÈ0©ÍKŒˆ
Œˆ›Ý±$ÜœÝÎÈ1#Y]H[[Y[HØ\ØZ\ÝH™q(Ú\Ý±$ÝJB‘NˆQqaQSUÈ8 %ŒÈ0©ÌÈÈ0©ÍËÂ‘ŽˆQqaQSUÈ8 %È[ˆ›Ù[1*ÝB‘Îˆq.ñ$’’HQqaQSUÈ8 %ŒÈ0©ÍËŒKŒHZñ/]Zˆ“È[HY]Ý1 Z˜HÛÛœÙ[œØ[NÂˆ\[H\˜[1$ÛÈ\›Ý˜[ÜÛ\È™]YZÈ˜Y1*ÝÂ‘ŽˆQqaQSUÈ8 %ŒÈ0©ÎH±*ÜÈ1*ÛYqašH›Ù[1*ÝH
È›Ý±$ÜœÝÊB‘ŽNˆQqaQSUÈ8 %ŒÈ0©Î\[™[˜ÞHØ\B‘ŒLˆQqaQSUÈ8 %ŒÈ0©ÎKŒˆ“UH’SHÑU
ˆ›Ý±$ÜœÝÊB‘ŒLNˆQqaQSUÈ8 %ÝÛ™\ˆ˜Z[KÜØYq/\È™XÚ^±$ÝH
Ž›Ý±$ÜœÝÊB‘ŒLŽˆQqaQSUÈ8 %›ØÙ\ØHÝ]\ÚH]š[ÝT0©ÍËŒÂ˜‚ˆÈÈL‹ˆ›ØÙ\ØH™^[1 ]Â‚˜^’ŒNˆQqaQSUÂ’ŒŽˆQqaQSUÂ’ŒÎˆQqaQSUÂ’ˆQqaQSUÂ’NˆQqaQSUÂ’ŽˆQqaQSUÂ’ÎˆQqaQSUÂ’ŽˆQqaQSUÂ’ŽNˆ“ÔRQ1*•ÈTˆ1 UQ1 UHSPUÒ•SUB‚”ŒNˆQqaQSUÂ”ŒŽˆQqaQSUÈ
˜\šX[ÈŠB”ŒÎˆQqaQSUÂ”ˆQqaQSUÂ”NˆQqaQSUÂ“ÈÈHÈˆÈÈLHÈLŽ‚ˆÐQÓP± HTˆŒÈ‘PÒV±$’•SRQSB“HÈÈ“ÔRQ1*’•SRNˆSQRÈÔ1$’ñ “Žˆ“Õ±$””ÕÂ‚’STSQS•USÓŽˆUˆ‘RRÕBT’URÕ1j”TÈQ•NˆUˆPRS±*•B‘”“Ö‘SˆTÑSS‘NˆUˆPRS±*•Â•TÒËHÈSÑHÈTÔËHS”ÕSÑNˆUˆV•‘RQÕB”ÕS‘SÓ‘HÓÓ•RS“QS•RSÎˆSQRÈ‘TÂ“QUÕ1 HÓÓ”ÑS”ÔÎˆUˆTÓQS± Â‘”‘QV‘NˆUˆTÕT’S± Â“± ÐSPRTÈ“ÐQPTÒÕSQS•ÎˆUˆV”ñ ÕÂ˜‚ˆÈÈLËˆXØÙ\[˜ÙHÜš]1$ÜšZHqh\1 \˜˜]YB‚˜^ŒKˆØ]˜[HŒx $ÒŽHšZÜñ$ÝÈ›ØÙ\ØHÝ]\ÜÈ8 %V”S1*•È
0©ÌL0©ÌLŠBŒ‹ˆŒx $ÒH™X]Ý1 Zˆ[\[Y[][ÛˆZZñ H^›[Z˜[]BˆÚ1$ÛX\È^±$ÛH8 %V”S1*•È
0©ÍKŒK0©ÍKŒ‹ˆ0©ÍKŒË0©ÍK0©ÍËŒK0©ÍËŒKŒJBŒËˆ\H8¡¤ˆQšY[X\[™È1 \˜˜]Y1*ÝÈ™]ˆ˜ZÝ\ÚØZ± [HÝÛ™\ˆÚ1$Ûq [H8 %V”S1*•È
0©ÍKŒ‹± ^™HMÎØÍL
Bˆ“È™Y™\™[˜Ù\È±$Ü[\È]\›Z[š\Ý\ÚÜÈ™]ˆ˜ZÝ\ÚÛÈˆŒˆ8 %V”S1*•È
0©ÍËŒKŒHx $ÑŠBKˆ™XÛÜ™[]™[™\Ë[]™[[ˆœ™Y^™K\›ØÙ\ÜÂˆ˜[Y1 XÚZ˜\È˜]ˆØZ˜]ZÝ\È8 %V”S1*•È
0©ÎKŒK0©ÎKŒ‹0©ÎKŒÊB‹ˆœ›Þ™[ˆ˜\Ù[[™H˜]ˆXZ[±*ÝÈ8 %V”S1*•ÂËˆ\š]ZÝ1jÜ˜\È˜YH˜]ˆXZ[±*ÝH8 %V”S1*•ÂŽˆ[\[Y[][Ûˆ[ˆœ™Y^™H˜]ˆ\ÛY[± ]Bˆ\ˆ]]Üš^±$ÝY[H8 %V”S1*•È
0©ÌLŠB˜‚ˆÈÈMˆ± ZØ[XZ\È›ØÙ\ØHÛÛ\Â‚”1$ØÈ1hq*ÜÈŒÈ™]šY]Ë\™\ÜÛœÙHÛÛ[Z]H± \ØYØ]]›È]Ù]šqhq-ÜÈ™X]Ø\±*Ùñ \È™XÙ[žšZ˜\È^™][\È\ˆÛÛšÜ±$ÝH1 \˜˜]Y1 [[ÈÛÛ[Z]ÒKˆ™XÙ[ž™[È1 \˜˜]YHŒÈ™]Œx $ÒŽH[ˆ˜ZÝ\ÚØZ± [HÝÛ™\ˆÚ1$Ûq [K‚‚”™XÙ[ž™[[H1*ÜqhZH± X\Ý\š[˜N‚ŒKˆ˜ZHŒx $ÒŽš\Ú[± Z[ZH\ˆ]\›Z[š\Ý\ÚÚHšY[˜[H]Ûq \˜[H[\[Y[][ÛˆÛÛ[Z][NÂŒ‹ˆ˜ZHŽH›Ü˜ZY1*Ú[XH[X]Ú[\È\ˆ1 \˜˜]Y1 [\È™]ˆŒˆ0©ÌLÈ[ˆ	‘H0©ÌŽÂŒËˆ˜ZH0©ÌÌŒH™\˜YH\˜[1$ÛHØ[›ÛšXØ[™q(Ú\ÝNÂˆ˜ZH0©ÍËŒKŒHÛ\ÚYšZñ XÚZ˜H\ˆ[±*ÙØH™]˜ZÝ\ÚÛÈˆŒˆØ]\NÂKˆ˜ZH0©ÎKŒHÈ0©ÎKŒˆÈ0©ÎKŒÈ›Ù[1*Ú[\È\ˆÛÛœÙZÝ™[È\ˆT0©ÍËŽ[ˆŽš[˜Ú\K‚‚˜^ÓÓSRUUUÔ’V‘QˆQTÈ8 %ZØZH1hZ\È™]šY]Ë\™\ÜÛœÙH\Y˜ZÝÂ’STSQS•USÓˆUUÔ’V‘Qˆ“Â‘”‘QV‘HUUÔ’V‘Qˆ“Â’ÓÓ”ÑS”ÔÎˆS‘S‘È8 %ŒÈ‘PUÐT±*‘ÐH1 UQB˜