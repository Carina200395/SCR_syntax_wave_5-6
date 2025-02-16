* Encoding: UTF-8.
* Methodlogical Steps to assess Social Cohesion:

* Data Preparation
* Following steps need to be done in all data sets: 
1. Select relevant countries or delete countries that are not of interest
2. Recode indicators if needed: level of measurement, distribution of answers/ answer options, reversed answer scales
3. Set all missing values of indicators
4. Control the format: Decimals, Scaling, Labeling
5. Aggregation of data to country and regional level

* Data set: ESS 7 (excluded country: Israel)
    
FILTER OFF.
USE ALL.
SELECT IF NOT (cntry = "IL").
EXECUTE.

* N= 37623 Cases for 20 countries
* Indicators (need to be redefined, cleaned and recoded)

set tnumbers both. 
FREQUENCIES VARIABLES=fltlnl sclmeet ppltrst pplfair pplhlp freehms imueclt fclcntr trstprl trstlgl trstplc mbtru trstprt gincdif hincfel wrkprty wrkorg sgnptit badge contplt polintr pbldmn bctprd mbtru ipfrule iphlppl
  /STATISTICS=STDDEV MINIMUM MAXIMUM MEAN MEDIAN MODE
  /HISTOGRAM NORMAL
  /ORDER=ANALYSIS.

*recoded to binary because they have 3 categories only:

RECODE mbtru (1,2=1) (3=0) (else=copy) into mbtru_r.
VALUE LABELS mbtru_r 0 'No' 1 'Yes, previously or currently'.
MISSING VALUES mbtru_r (7 THRU HIGHEST).
CROSSTABS mbtru by mbtru_r /cells count /missing include.
FREQUENCIES mbtru_r.
VARIABLE LABELS mbtru_r 'Member of trade union or similar organisation_recoded'.
VARIABLE LEVEL mbtru_r (NOMINAL).

* switching the scale because more (2) should be "better" than less (1). 

RECODE wrkprty wrkorg sgnptit badge contplt pbldmn bctprd (1=1) (2=0) (else=copy) into wrkprty_r wrkorg_r sgnptit_r badge_r contplt_r pbldmn_r bctprd_r.
VALUE LABELS wrkprty_r wrkorg_r sgnptit_r badge_r contplt_r pbldmn_r bctprd_r 1 'Yes' 0 'No'.
MISSING VALUES wrkprty_r wrkorg_r sgnptit_r badge_r contplt_r pbldmn_r bctprd_r (7 THRU HIGHEST).
CROSSTABS wrkorg by wrkorg_r /cells count /missing include.
FREQUENCIES wrkprty_r wrkorg_r sgnptit_r badge_r contplt_r pbldmn_r bctprd_r.
VARIABLE LABELS wrkprty_r 'Worked in political party or action group last 12 months_recoded'.
VARIABLE LABELS wrkorg_r 'Worked in another organisation or association last 12 months_recoded'.
VARIABLE LABELS sgnptit_r 'Signed petition last 12 months_recoded'.
VARIABLE LABELS badge_r 'Worn or displayed campaign badge/sticker last 12 months_recoded'.
VARIABLE LABELS contplt_r 'Contacted politician or government official last 12 months_recoded'.
VARIABLE LABELS pbldmn_r 'Taken part in lawful public demonstration last 12 months_recoded'.
VARIABLE LABELS bctprd_r 'Boycotted certain products last 12 months_recoded'.
VARIABLE LEVEL wrkprty_r wrkorg_r sgnptit_r badge_r contplt_r pbldmn_r (NOMINAL).

* switching the scale because more should be "better" than less 

RECODE ipfrule iphlppl (1=6) (2=5) (3=4) (4=3) (5=2) (6=1) (else=copy) into ipfrule_r iphlppl_r.
VALUE LABELS  ipfrule_r iphlppl_r 6 'Very much like me' 5 'Like me' 4 'Somewhat like me' 3 'A little like me' 2 'Not like me' 1 'Not like me at all'.
MISSING VALUES  ipfrule_r iphlppl_r (7 THRU HIGHEST).
CROSSTABS  ipfrule by  ipfrule_r /cells count /missing include.
FREQUENCIES  ipfrule_r iphlppl_r.
VARIABLE LABELS ipfrule_r 'Important to do what is told and follow rules_recoded'.
VARIABLE LABELS  iphlppl_r 'Important to help people and care for others well-being_recoded'.
VARIABLE LEVEL ipfrule_r iphlppl_r (SCALE).

RECODE freehms gincdif (1=5) (2=4) (3=3) (4=2) (5=1) (else=copy) into freehms_r gincdif_r.
VALUE LABELS freehms_r gincdif_r 5 'Agree strongly' 4 'Agree' 3 'Neither agree nor disagree' 2 'Disagree' 1 'Disagree strongly'.
MISSING VALUES freehms_r  gincdif_r (7 THRU HIGHEST).
CROSSTABS freehms by freehms_r /cells count /missing include.
FREQUENCIES freehms_r gincdif_r.
VARIABLE LABELS freehms_r 'Gays and lesbians free to live life as they wish_recoded'.
VARIABLE LABELS gincdif_r 'Government should reduce differences in income levels_recoded'.
VARIABLE LEVEL freehms_r gincdif_r (SCALE).

RECODE fltlnl (1=4) (2=3) (3=2) (4=1) (else=copy) into fltlnl_r.
VALUE LABELS fltlnl_r 4 'None or almost none of the time' 3 'Some of the time' 2 'Most of the time' 1 'All or almost all of the time'.
MISSING VALUES fltlnl_r (7 THRU HIGHEST).
CROSSTABS fltlnl by fltlnl_r /cells count /missing include.
FREQUENCIES fltlnl_r.
VARIABLE LABELS fltlnl_r 'Felt lonely, how often past week_recoded'.
VARIABLE LEVEL fltlnl_r (SCALE).

RECODE hincfel (1=4) (2=3) (3=2) (4=1) (else=copy) into hincfel_r.
VALUE LABELS hincfel_r 4 'Living comfortably on present income' 3 'Coping on present income' 2 'Difficult on present income' 1 'Very difficult on present income'.
MISSING VALUES hincfel_r (7 THRU HIGHEST).
CROSSTABS hincfel by hincfel_r /cells count /missing include.
FREQUENCIES hincfel_r.
VARIABLE LABELS hincfel_r 'Feeling about households income nowadays_recoded'.
VARIABLE LEVEL hincfel_r (SCALE).

RECODE aesfdrk (1=4) (2=3) (3=2) (4=1) (else=copy) into aesfdrk_r.
VALUE LABELS aesfdrk_r 4 'Very safe' 3 'Safe' 2 'Unsafe' 1 'Very unsafe'.
MISSING VALUES aesfdrk_r (7 THRU HIGHEST).
CROSSTABS aesfdrk by aesfdrk_r /cells count /missing include.
FREQUENCIES aesfdrk_r.
VARIABLE LABELS aesfdrk_r 'Feeling of safety of walking alone in local area after dark_recoded'.
VARIABLE LEVEL aesfdrk_r (SCALE).

RECODE fclcntr (1=4) (2=3) (3=2) (4=1) (else=copy) into fclcntr_r.
VALUE LABELS fclcntr_r 4 'Very close' 3 'Close' 2 'Not very close' 1 'Not close at all'.
MISSING VALUES fclcntr_r (7 THRU HIGHEST).
CROSSTABS fclcntr by fclcntr_r /cells count /missing include.
FREQUENCIES fclcntr_r.
VARIABLE LABELS fclcntr_r 'Feel close to country_recoded'.
VARIABLE LEVEL fclcntr_r (SCALE).

RECODE polintr (1=4) (2=3) (3=2) (4=1) (else=copy) into polintr_r.
VALUE LABELS polintr_r 4 'Very interested' 3 'Quite interested' 2 'Hardly interested' 1 'Not at all interested'.
MISSING VALUES polintr_r (7 THRU HIGHEST).
VARIABLE LABELS polintr_r 'How interested in politics_recoded'.
VARIABLE LEVEL polintr_r (SCALE).

* next step: adapt some semantically similar but different scales to the ones of ESS 8 and 9 or EQLS
    
*COMPUTE fltlnl_lt=(fltlnl_r - 1) *5/ 3+1.
*EXECUTE.

*COMPUTE fclcntr_lt=(fclcntr_r - 1) *10 / 3.
*EXECUTE.

FORMATS aesfdrk_r freehms_r gincdif_r fltlnl_r hincfel_r wrkprty_r wrkorg_r fclcntr_r sgnptit_r badge_r contplt_r pbldmn_r bctprd_r polintr_r mbtru_r ipfrule_r iphlppl_r (f7.0).

* final control of indicators

FREQUENCIES VARIABLES=sclmeet ppltrst pplfair pplhlp freehms_r aesfdrk_r imueclt fclcntr_r trstprl trstlgl trstplc trstprt gincdif_r hincfel_r wrkprty_r wrkorg_r sgnptit_r badge_r contplt_r pbldmn_r bctprd_r polintr_r mbtru_r ipfrule_r iphlppl_r
  /STATISTICS=STDDEV MINIMUM MAXIMUM MEAN MEDIAN MODE
  /ORDER=ANALYSIS.

**********************************
* Preparation for aggregation
1. Control once again the previous steps
2. Safe two data sets with all the relevant variables to COUNTRY or NUTS-1 region.

*country level: 

*SAVE OUTFILE='C:\Users\chartz\OneDrive - Jacobs University\Paper 2\ESS7\ESS7e02_2_country.sav'
  /DROP=name essround edition proddate idno tvtot tvpol polintr psppsgv actrolg psppipl cptppol ptcpplt etapapl trstplt trstep trstun vote prtvtbat prtvtcbe prtvtech prtvtdcz prtvede1 prtvede2 prtvtcdk prtvteee prtvtces prtvtcfi prtvtcfr prtvtbgb prtvtehu prtvtaie prtvtcil prtvalt1 prtvalt2 prtvalt3 prtvtfnl prtvtbno prtvtcpl prtvtbpt prtvtbse prtvtesi contplt wrkprty wrkorg badge sgnptit pbldmn bctprd clsprty prtclcat prtclcbe prtclech prtcldcz prtclede prtclcdk prtcleee prtcldes prtclcfi prtcldfr prtclbgb prtclehu prtclcie prtcldil prtclalt prtclenl prtclbno prtclfpl prtcldpt prtclbse prtclesi prtdgcl lrscale stflife stfeco stfgov stfdem stfedu stfhlth gincdif freehms euftf imsmetn imdfetn eimpcnt impcntr imbgeco imwbcnt happy inprdsc sclact crmvct aesfdrk health hlthhmp rlgblg rlgdnm rlgdnbat rlgdnbe rlgdnach rlgdnade rlgdnafi rlgdngb rlgdnhu rlgdnie rlgdnil rlgdnlt rlgdnnl rlgdnno rlgdnapl rlgdnase rlgdnsi rlgblge rlgdnme rlgdebat rlgdebe rlgdeach rlgdeade rlgdeafi rlgdegb rlgdehu rlgdeie rlgdeil rlgdelt rlgdenl rlgdeno rlgdeapl rlgdease rlgdesi rlgdgr rlgatnd pray dscrgrp dscrrce dscrntn dscrrlg dscrlng dscretn dscrage dscrgnd dscrsex dscrdsb dscroth dscrdk dscrref dscrnap dscrna ctzcntr ctzshipc brncntr cntbrthc livecnta lnghom1 lnghom2 blgetmg facntr fbrncntb mocntr mbrncntb mmbrn qfimedu qfimlng qfimchr qfimwht qfimwsk qfimcmt imtcjob imbleco imwbcrm imdetbs imdetmr acetalv pplstrd lwdscwp gvrfgap noimbro icbrnct gvtrimg rlgueim dfegcf dfegcon dfeghbg fclcntr smegbli smegbhw smctmbe aljewlv almuslv algyplv admaimg alpfpe alpfpne allbpe allbpne etfruit eatveg dosprt cgtsmke cgtsday alcfreq alcwkdy alcwknd icgndra alcbnge height weight dshltgp dshltms dshltnt dshltref dshltdk dshltna medtrun medtrnp medtrnt medtroc medtrnl medtrwl medtrnaa medtroth medtrnap medtrref medtrdk medtrna medtrnu hlpfmly hlpfmhr trhltacu trhltacp trhltcm trhltch trhltos trhltho trhltht trhlthy trhltmt trhltpt trhltre trhltsh trhltnt trhltref trhltdk trhltna fltdpr flteeff slprl wrhpp fltlnl enjlf fltsd cldgng hltprhc hltprhb hltprbp hltpral hltprbn hltprpa hltprpf hltprsd hltprsc hltprsh hltprdi hltprnt hltprref hltprdk hltprna hltphhc hltphhb hltphbp hltphal hltphbn hltphpa hltphpf hltphsd hltphsc hltphsh hltphdi hltphnt hltphnap hltphref hltphdk hltphna hltprca cnfpplh fnsdfml hhmmb gndr gndr2 gndr3 gndr4 gndr5 gndr6 gndr7 gndr8 gndr9 gndr10 gndr11 gndr12 gndr13 gndr14 agea yrbrn yrbrn2 yrbrn3 yrbrn4 yrbrn5 yrbrn6 yrbrn7 yrbrn8 yrbrn9 yrbrn10 yrbrn11 yrbrn12 yrbrn13 yrbrn14 rshipa2 rshipa3 rshipa4 rshipa5 rshipa6 rshipa7 rshipa8 rshipa9 rshipa10 rshipa11 rshipa12 rshipa13 rshipa14 icpart1 rshpsts rshpsfi lvgptnea dvrcdeva icpart2 iccohbt marsts maritalb marstfi marstie chldhm chldhhe domicil anypacc edulvlb eisced edlveat edlvebe edlvdch edlvdcz eduade1 edude2 edude3 edlvddk edlvdee edlvges edlvdfi edlvdfr edubgb1 eduagb2 edagegb edlvdhu edlvdie eduail1 eduail2 edlvdlt edlvenl edlvdno edlvepl edlvdpt edupl2 edlvdse edlvdsi eduyrs pdwrk edctn uempla uempli dsbld rtrd cmsrv hswrk dngoth dngref dngdk dngna icomdng mainact mnactic icpdwrk crpdwk pdjobev pdjobyr emplrel emplno wrkctra estsz jbspv njbspv wkdcorga iorgact icwhct wkhct wkhtot nacer2 tporgwk isco08 wrkac6m jbexpvi jbexpti jbexpml jbexpmc jbexpnt jbexpnap jbexpref jbexpdk jbexpna jbexevl jbexevh jbexevc jbexera jbexecp jbexebs jbexent jbexenap jbexeref jbexedk jbexena uemp3m uemp12m uemp5yr mbtru hincsrca hinctnta hincfel icpart3 edulvlpb eiscedp edlvpeat edlvpebe edlvpdch edlvpdcz edupade1 edupde2 edupde3 edlvpddk edlvpdee edlvpfes edlvpdfi edlvpdfr edupbgb1 edupagb2 edagepgb edlvphu edlvpdie edupail1 edupail2 edlvpdlt edlvpenl edlvpdno edlvpepl edlvpdpt eduppl2 edlvpdse edlvpdsi pdwrkp edctnp uemplap uemplip dsbldp rtrdp cmsrvp hswrkp dngothp dngdkp dngnapp dngrefp dngnap icomdnp mnactp icppdwk crpdwkp isco08p emprelp wkhtotp edulvlfb eiscedf edlvfeat edlvfebe edlvfdch edlvfdcz edlvfddk edufade1 edufde2 edufde3 edlvfdee edlvffes edlvfdfi edlvfdfr edufbgb1 edufagb2 edagefgb edlvfhu edlvfdie edufail1 edufail2 edlvfdlt edlvfenl edlvfdno edlvfepl edlvfdpt edlvfdse edlvfdsi emprf14 occf14b edulvlmb eiscedm edlvmeat edlvmebe edlvmdch edlvmdcz edumade1 edumde2 edumde3 edlvmddk edlvmdee edlvmfes edlvmdfi edlvmdfr edumbgb1 edumagb2 edagemgb edlvmhu edlvmdie edumail1 edumail2 edlvmdlt edlvmenl edlvmdno edlvmepl edlvmdpt edlvmdse edlvmdsi emprm14 occm14b atncrse anctry1 anctry2 ipcrtiv imprich ipeqopt ipshabt impsafe impdiff ipfrule ipudrst ipmodst ipgdtim impfree iphlppl ipsuces ipstrgv ipadvnt ipbhprp iprspot iplylfr impenv imptrad impfun region regunit intewde inwdds inwmms inwyys inwshh inwsmm inwdde inwmme inwyye inwehh inwemm inwtm spltadmf supqad1 supqad2 supqdd supqmm supqyr dweight pspwght pweight
  /COMPRESSED.

* NUTS level:

SAVE OUTFILE='C:\Users\chartz\OneDrive - Jacobs University\Data sets\ESS7\ESS7e02_2_NUTS.sav'
  /DROP=name essround edition proddate idno cntry tvtot tvpol polintr psppsgv actrolg psppipl cptppol ptcpplt etapapl trstplt trstep trstun vote prtvtbat prtvtcbe prtvtech prtvtdcz prtvede1 prtvede2 prtvtcdk prtvteee prtvtces prtvtcfi prtvtcfr prtvtbgb prtvtehu prtvtaie prtvtcil prtvalt1 prtvalt2 prtvalt3 prtvtfnl prtvtbno prtvtcpl prtvtbpt prtvtbse prtvtesi contplt wrkprty wrkorg badge sgnptit pbldmn bctprd clsprty prtclcat prtclcbe prtclech prtcldcz prtclede prtclcdk prtcleee prtcldes prtclcfi prtcldfr prtclbgb prtclehu prtclcie prtcldil prtclalt prtclenl prtclbno prtclfpl prtcldpt prtclbse prtclesi prtdgcl lrscale stflife stfeco stfgov stfdem stfedu stfhlth gincdif freehms euftf imsmetn imdfetn eimpcnt impcntr imbgeco imwbcnt happy inprdsc sclact crmvct aesfdrk health hlthhmp rlgblg rlgdnm rlgdnbat rlgdnbe rlgdnach rlgdnade rlgdnafi rlgdngb rlgdnhu rlgdnie rlgdnil rlgdnlt rlgdnnl rlgdnno rlgdnapl rlgdnase rlgdnsi rlgblge rlgdnme rlgdebat rlgdebe rlgdeach rlgdeade rlgdeafi rlgdegb rlgdehu rlgdeie rlgdeil rlgdelt rlgdenl rlgdeno rlgdeapl rlgdease rlgdesi rlgdgr rlgatnd pray dscrgrp dscrrce dscrntn dscrrlg dscrlng dscretn dscrage dscrgnd dscrsex dscrdsb dscroth dscrdk dscrref dscrnap dscrna ctzcntr ctzshipc brncntr cntbrthc livecnta lnghom1 lnghom2 blgetmg facntr fbrncntb mocntr mbrncntb mmbrn qfimedu qfimlng qfimchr qfimwht qfimwsk qfimcmt imtcjob imbleco imwbcrm imdetbs imdetmr acetalv pplstrd lwdscwp gvrfgap noimbro icbrnct gvtrimg rlgueim dfegcf dfegcon dfeghbg fclcntr smegbli smegbhw smctmbe aljewlv almuslv algyplv admaimg alpfpe alpfpne allbpe allbpne etfruit eatveg dosprt cgtsmke cgtsday alcfreq alcwkdy alcwknd icgndra alcbnge height weight dshltgp dshltms dshltnt dshltref dshltdk dshltna medtrun medtrnp medtrnt medtroc medtrnl medtrwl medtrnaa medtroth medtrnap medtrref medtrdk medtrna medtrnu hlpfmly hlpfmhr trhltacu trhltacp trhltcm trhltch trhltos trhltho trhltht trhlthy trhltmt trhltpt trhltre trhltsh trhltnt trhltref trhltdk trhltna fltdpr flteeff slprl wrhpp fltlnl enjlf fltsd cldgng hltprhc hltprhb hltprbp hltpral hltprbn hltprpa hltprpf hltprsd hltprsc hltprsh hltprdi hltprnt hltprref hltprdk hltprna hltphhc hltphhb hltphbp hltphal hltphbn hltphpa hltphpf hltphsd hltphsc hltphsh hltphdi hltphnt hltphnap hltphref hltphdk hltphna hltprca cnfpplh fnsdfml hhmmb gndr gndr2 gndr3 gndr4 gndr5 gndr6 gndr7 gndr8 gndr9 gndr10 gndr11 gndr12 gndr13 gndr14 agea yrbrn yrbrn2 yrbrn3 yrbrn4 yrbrn5 yrbrn6 yrbrn7 yrbrn8 yrbrn9 yrbrn10 yrbrn11 yrbrn12 yrbrn13 yrbrn14 rshipa2 rshipa3 rshipa4 rshipa5 rshipa6 rshipa7 rshipa8 rshipa9 rshipa10 rshipa11 rshipa12 rshipa13 rshipa14 icpart1 rshpsts rshpsfi lvgptnea dvrcdeva icpart2 iccohbt marsts maritalb marstfi marstie chldhm chldhhe domicil anypacc edulvlb eisced edlveat edlvebe edlvdch edlvdcz eduade1 edude2 edude3 edlvddk edlvdee edlvges edlvdfi edlvdfr edubgb1 eduagb2 edagegb edlvdhu edlvdie eduail1 eduail2 edlvdlt edlvenl edlvdno edlvepl edlvdpt edupl2 edlvdse edlvdsi eduyrs pdwrk edctn uempla uempli dsbld rtrd cmsrv hswrk dngoth dngref dngdk dngna icomdng mainact mnactic icpdwrk crpdwk pdjobev pdjobyr emplrel emplno wrkctra estsz jbspv njbspv wkdcorga iorgact icwhct wkhct wkhtot nacer2 tporgwk isco08 wrkac6m jbexpvi jbexpti jbexpml jbexpmc jbexpnt jbexpnap jbexpref jbexpdk jbexpna jbexevl jbexevh jbexevc jbexera jbexecp jbexebs jbexent jbexenap jbexeref jbexedk jbexena uemp3m uemp12m uemp5yr mbtru hincsrca hinctnta hincfel icpart3 edulvlpb eiscedp edlvpeat edlvpebe edlvpdch edlvpdcz edupade1 edupde2 edupde3 edlvpddk edlvpdee edlvpfes edlvpdfi edlvpdfr edupbgb1 edupagb2 edagepgb edlvphu edlvpdie edupail1 edupail2 edlvpdlt edlvpenl edlvpdno edlvpepl edlvpdpt eduppl2 edlvpdse edlvpdsi pdwrkp edctnp uemplap uemplip dsbldp rtrdp cmsrvp hswrkp dngothp dngdkp dngnapp dngrefp dngnap icomdnp mnactp icppdwk crpdwkp isco08p emprelp wkhtotp edulvlfb eiscedf edlvfeat edlvfebe edlvfdch edlvfdcz edlvfddk edufade1 edufde2 edufde3 edlvfdee edlvffes edlvfdfi edlvfdfr edufbgb1 edufagb2 edagefgb edlvfhu edlvfdie edufail1 edufail2 edlvfdlt edlvfenl edlvfdno edlvfepl edlvfdpt edlvfdse edlvfdsi emprf14 occf14b edulvlmb eiscedm edlvmeat edlvmebe edlvmdch edlvmdcz edumade1 edumde2 edumde3 edlvmddk edlvmdee edlvmfes edlvmdfi edlvmdfr edumbgb1 edumagb2 edagemgb edlvmhu edlvmdie edumail1 edumail2 edlvmdlt edlvmenl edlvmdno edlvmepl edlvmdpt edlvmdse edlvmdsi emprm14 occm14b atncrse anctry1 anctry2 ipcrtiv imprich ipeqopt ipshabt impsafe impdiff ipfrule ipudrst ipmodst ipgdtim impfree iphlppl ipsuces ipstrgv ipadvnt ipbhprp iprspot iplylfr impenv imptrad impfun intewde inwdds inwmms inwyys inwshh inwsmm inwdde inwmme inwyye inwehh inwemm inwtm spltadmf supqad1 supqad2 supqdd supqmm supqyr dweight pspwght pweight
  /COMPRESSED.

****** Aggregation of data set ******
    
DATASET ACTIVATE DataSet1.
DATASET DECLARE aggr.
AGGREGATE
  /OUTFILE='aggr'
  /BREAK=cntry
  /ppltrst_mean=MEAN(ppltrst) 
  /pplfair_mean=MEAN(pplfair) 
  /pplhlp_mean=MEAN(pplhlp) 
  /trstprl_mean=MEAN(trstprl) 
  /trstlgl_mean=MEAN(trstlgl) 
  /trstplc_mean=MEAN(trstplc) 
  /trstprt_mean=MEAN(trstprt) 
  /imueclt_mean=MEAN(imueclt) 
  /sclmeet_mean=MEAN(sclmeet) 
  /fltlnl_r_mean=MEAN(fltlnl_r) 
  /freehms_r_mean=MEAN(freehms_r) 
  /fclcntr_r_mean=MEAN(fclcntr_r) 
  /gincdif_r_mean=MEAN(gincdif_r) 
  /hincfel_r_mean=MEAN(hincfel_r) 
  /mbtru_r_mean=MEAN(mbtru_r) 
  /wrkprty_r_mean=MEAN(wrkprty_r) 
  /wrkorg_r_mean=MEAN(wrkorg_r) 
  /sgnptit_r_mean=MEAN(sgnptit_r) 
  /badge_r_mean=MEAN(badge_r) 
  /contplt_r_mean=MEAN(contplt_r) 
  /pbldmn_r_mean=MEAN(pbldmn_r) 
  /bctprd_r_mean=MEAN(bctprd_r) 
  /polintr_r_mean=MEAN(polintr_r) 
  /ipfrule_r_mean=MEAN(ipfrule_r) 
  /iphlppl_r_mean=MEAN(iphlppl_r)
  /inprdsc_mean=MEAN(inprdsc)
  /aesfdrk_r_mean=MEAN(aesfdrk_r).

* in aggr data file: 

RENAME VARIABLES (cntry ppltrst_mean pplfair_mean pplhlp_mean trstprl_mean trstlgl_mean trstplc_mean trstprt_mean 
  imueclt_mean sclmeet_mean fltlnl_r_mean freehms_r_mean fclcntr_r_mean gincdif_r_mean hincfel_r_mean 
  mbtru_r_mean wrkprty_r_mean wrkorg_r_mean sgnptit_r_mean badge_r_mean contplt_r_mean 
  pbldmn_r_mean bctprd_r_mean polintr_r_mean ipfrule_r_mean iphlppl_r_mean inprdsc_mean aesfdrk_r_mean = country d12_ppltrst_ess7_w5
  d12_pplfair_ess7_w5 d12_pplhlp_ess7_w5 d22_trstprl_ess7_w5 d22_trstlgl_ess7_w5 d22_trstplc_ess7_w5 
  d22_trstprt_ess7_w5 d13_imueclt_ess7_w5 d11_sclmeet_ess7_w5 d11_fltlnl_ess7_w5 d13_freehms_ess7_w5 
  d21_fclcntr_ess7_w5 d23_gincdif_ess7_w5 d23_hincfel_ess7_w5 d33_mbtru_ess7_w5 d33_wrkprty_ess7_w5 
  d33_wrkorg_ess7_w5 d33_sgnptit_ess7_w5 d33_badge_ess7_w5 d33_contplt_ess7_w5 d33_pbldmn_ess7_w5 
  d33_bctprd_ess7_w5 d33_polintr_ess7_w5 d32_ipfrule_ess7_w5 d31_iphlppl_ess7_w5 d11_inprdsc_ess7_w5 d32_aesfdrk_ess7_w5).

VARIABLE LABELS d12_ppltrst_ess7_w5 'Most people can be trusted or you can´t be too careful'.
VARIABLE LABELS d12_pplfair_ess7_w5 'Most people try to take advantage of you, or try to be fair'.
VARIABLE LABELS d12_pplhlp_ess7_w5 'Most of the time people helpful or mostly looking out for themselves'.
VARIABLE LABELS d22_trstprl_ess7_w5 'Trust in country´s parliament'.
VARIABLE LABELS d22_trstlgl_ess7_w5 'Trust in the legal system'.
VARIABLE LABELS d22_trstplc_ess7_w5 'Trust in the police'.
VARIABLE LABELS d22_trstprt_ess7_w5 'Trust in political parties'.
VARIABLE LABELS d13_imueclt_ess7_w5 'Country´s cultural life undermined or enriched by immigrants'.
VARIABLE LABELS d11_sclmeet_ess7_w5 'Unpaid Volunteering: community and social services_recoded'.
VARIABLE LABELS d11_fltlnl_ess7_w5 'Felt lonely, how often past week_recoded'.
VARIABLE LABELS d13_freehms_ess7_w5 'Gays and lesbians free to live life as they wish_recoded'.
VARIABLE LABELS d21_fclcntr_ess7_w5 'Feel close to country_recoded'.
VARIABLE LABELS d23_gincdif_ess7_w5 'Government should reduce differences in income levels_recoded'.
VARIABLE LABELS d23_hincfel_ess7_w5 'Feeling about households income nowadays_recoded'.
VARIABLE LABELS d33_mbtru_ess7_w5 'Member of trade union or similar organisation_recoded'.
VARIABLE LABELS d33_wrkprty_ess7_w5 'Worked in political party or action group last 12 months_recoded'.
VARIABLE LABELS d33_wrkorg_ess7_w5 'Worked in another organisation or association last 12 months_recoded'.
VARIABLE LABELS d33_sgnptit_ess7_w5 'Signed petition last 12 months_recoded'.
VARIABLE LABELS d33_badge_ess7_w5 'Worn or displayed campaign badge/sticker last 12 months_recoded'.
VARIABLE LABELS d33_contplt_ess7_w5 'Contacted politician or government official last 12 months_recoded'.
VARIABLE LABELS d33_pbldmn_ess7_w5 'Taken part in lawful public demonstration last 12 months_recoded'.
VARIABLE LABELS d33_bctprd_ess7_w5 'Boycotted certain products last 12 months_recoded'.
VARIABLE LABELS d33_polintr_ess7_w5 'How interested in politics_recoded'.
VARIABLE LABELS d32_ipfrule_ess7_w5 'Important to do what is told and follow rules_recoded'.
VARIABLE LABELS d31_iphlppl_ess7_w5 'Important to help people and care for others well-being_recoded'.
VARIABLE LABELS d11_inprdsc_ess7_w5 'How many people with whom you can discuss intimate and personal matters'.
VARIABLE LABELS d32_aesfdrk_ess7_w5 'Feeling of safety of walking alone in local area after dark_recoded'.

AUTORECODE VARIABLES=country 
  /INTO country_iso
  /PRINT.
FORMATS country_iso (f3.0).
VARIABLE LEVEL country_iso (NOMINAL).
VARIABLE LABELS country_iso 'Country'.

RECODE country_iso 
    (1=40) 
    (2=56) 
    (3=756) 
    (4=203) 
    (5=276)
    (6=208)
    (7=233)
    (8=724)
    (9=246)
    (10=250)
    (11=826)
    (12=348)
    (13=372)
    (14=440)
    (15=528)
    (16=578)
    (17=616)
    (18=620)
    (19=752)
    (20=705).
EXECUTE.

VALUE LABELS country_iso
40 'AT'
56 'BE'
756 'CH'
203 'CZ'
276 'DE'
208 'DK'
233 'EE'
724 'ES'
246 'FI'
250 'FR'
826 'GB'
348 'HU'
372 'IE'
440 'LT'
528 'NL'
578 'NO'
616 'PL'
620 'PT'
752 'SE'
705 'SI'.

* recommended: safe data set ("_iso") in case you have to go back to string country code

DELETE VARIABLES country.
RENAME VARIABLES country_iso = country.

* save before
* NUTS region

*DATASET DECLARE aggr.
*AGGREGATE
  /OUTFILE='aggr'
  /BREAK=region
  /ppltrst_mean=MEAN(ppltrst) 
  /pplfair_mean=MEAN(pplfair) 
  /pplhlp_mean=MEAN(pplhlp) 
  /trstprl_mean=MEAN(trstprl) 
  /trstlgl_mean=MEAN(trstlgl) 
  /trstplc_mean=MEAN(trstplc) 
  /trstprt_mean=MEAN(trstprt) 
  /imueclt_mean=MEAN(imueclt) 
  /sclmeet_mean=MEAN(sclmeet) 
  /fltlnl_r_mean=MEAN(fltlnl_r) 
  /freehms_r_mean=MEAN(freehms_r) 
  /fclcntr_r_mean=MEAN(fclcntr_r) 
  /gincdif_r_mean=MEAN(gincdif_r) 
  /hincfel_r_mean=MEAN(hincfel_r) 
  /mbtru_r_mean=MEAN(mbtru_r) 
  /wrkprty_r_mean=MEAN(wrkprty_r) 
  /wrkorg_r_mean=MEAN(wrkorg_r) 
  /sgnptit_r_mean=MEAN(sgnptit_r) 
  /badge_r_mean=MEAN(badge_r) 
  /contplt_r_mean=MEAN(contplt_r) 
  /pbldmn_r_mean=MEAN(pbldmn_r) 
  /bctprd_r_mean=MEAN(bctprd_r) 
  /polintr_r_mean=MEAN(polintr_r) 
  /ipfrule_r_mean=MEAN(ipfrule_r) 
  /iphlppl_r_mean=MEAN(iphlppl_r).

* in aggr data file: 

*RENAME VARIABLES (ppltrst_mean pplfair_mean pplhlp_mean trstprl_mean trstlgl_mean trstplc_mean 
  trstprt_mean imueclt_mean sclmeet_mean fltlnl_trans_mean freehms_r_mean fclcntr_r_mean gincdif_r_mean 
  hincfel_r_mean mbtru_r_mean wrkprty_r_mean wrkorg_r_mean sgnptit_r_mean badge_r_mean contplt_r_mean
  pbldmn_r_mean bctprd_r_mean polintr_r_mean ipfrule_r_mean iphlppl_r_mean = d12_ppltrst_ess7_w5
  d12_pplfair_ess7_w5 d12_pplhlp_ess7_w5 d22_trstprl_ess7_w5 d22_trstlgl_ess7_w5 d22_trstplc_ess7_w5 
  d22_trstprt_ess7_w5 d13_imueclt_ess7_w5 d11_sclmeet_ess7_w5 d11_fltlnl_ess7_w5 d13_freehms_ess7_w5 
  d21_fclcntr_ess7_w5 d23_gincdif_ess7_w5 d23_hincfel_ess7_w5 d33_mbtru_ess7_w5 d33_wrkprty_ess7_w5 
  d33_wrkorg_ess7_w5 d33_sgnptit_ess7_w5 d33_badge_ess7_w5 d33_contplt_ess7_w5 d33_pbldmn_ess7_w5 
  d33_bctprd_ess7_w5 d33_polintr_ess7_w5 d32_ipfrule_ess7_w5 d31_iphlppl_ess7_w5).

