* Encoding: UTF-8.
* Methodlogical Steps to access Social Cohesion:

* Data Preparation
* Following steps need to be done in all data sets: 
1. Select relevant countries or delete countries that are not of interest
2. Recode indicators if needed: level of measurement, distribution of answers/ answer options, reversed answer scales
3. Set all missing values of indicators
4. Control the format: Decimals, Scaling, Labeling
5. Aggregation of data to country and regional level.

* Data set: ISSP 2019; Modul: Social Inequality 
    
FILTER OFF.
USE ALL.
SELECT IF NOT (country = 152 or country = 158 or country = 352 or country = 376 or country = 392 or country = 554 or country = 608 or country = 643 or country = 710 or country = 740 or country = 764).
EXECUTE.

* N= 15599 Cases for 11 countries
* Indicators (need to be redefined, cleaned and recoded)

set tnumbers both. 
FREQUENCIES VARIABLES=v7 v22 v30 v50 v53 v56 UNION
  /STATISTICS=STDDEV MINIMUM MAXIMUM MEAN MEDIAN MODE
  /HISTOGRAM NORMAL
  /ORDER=ANALYSIS.

* switching the scale because more should be "better" than less 

RECODE v50 (4=1) (3=2) (2=3) (1=4) (else=copy) into v50_r.
VALUE LABELS  v50_r 4 'Very fair' 3 'Fair' 2 'Unfair' 1 'Very unfair'.
MISSING VALUES v50_r (LOWEST THRU -8).
CROSSTABS  v50 by v50_r /cells count /missing include.
FREQUENCIES v50_r.
VARIABLE LABELS v50_r 'How fair or unfair do you think the income distribution is in country_recoded'.
VARIABLE LEVEL v50_r (SCALE).

RECODE v56 (1=4) (2=3) (3=2) (4=1) (else=copy) into v56_r.
VALUE LABELS v56_r 4 'People can almost always be trusted' 3 'People can usually be trusted' 2 'You usually can’t be too careful in dealing with people' 1 'You almost always can’t be too careful in dealing with people'.
MISSING VALUES v56_r (LOWEST THRU -8).
CROSSTABS v56 by v56_r /cells count /missing include.
FREQUENCIES v56_r.
VARIABLE LABELS v56_r 'People can be trusted or cant be too careful in dealing with people_recoded'.
VARIABLE LEVEL v56_r (SCALE).

*recoded to binary because they have 3 categories only:

RECODE UNION (1,2=2) (3=1) (else=copy) into UNION_r.
VALUE LABELS UNION_r 1 'No' 2 'Yes, previously or currently'.
MISSING VALUES UNION_r (LOWEST THRU -7).
CROSSTABS UNION by UNION_r /cells count /missing include.
FREQUENCIES UNION_r.
VARIABLE LABELS UNION_r 'trade union membership_recoded'.
VARIABLE LEVEL UNION_r (NOMINAL).

FORMATS v50_r v56_r UNION_r (f7.0).

* final control of indicators

FREQUENCIES VARIABLES=v7 v22 v50_r v53 v56_r UNION_r
  /STATISTICS=STDDEV MINIMUM MAXIMUM MEAN MEDIAN MODE
  /HISTOGRAM NORMAL
  /ORDER=ANALYSIS.

**********************************
* Preparation for aggregation
1. Control once again the previous steps
2. Safe one data sets with all the relevant variables to COUNTRY.
*** NO NUTS-1 REGIONS FOR ISSP ****

*country level: 

SAVE OUTFILE='C:\Users\chartz\OneDrive - Jacobs University\Data sets\ISSP_2019\ZA7600_v2-0-0.sav\ZA7600_v2-0-0_country.sav'
  /DROP=studyno version doi c_sample c_alphan v1 v2 v3 v4 v5 v6 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 v23 v24 v25 v26 v27 v28 v29 v31 v32 v33 v34 v35 v36 v37 v38 v39 v40 v41 v42 v43 v44 DK_v44 v45 DK_v45 v46 DK_v46 v47 DK_v47 v48 v49 v50 v51 v52 v54 v55 v56 v57 v58 v59 v60 v61 v62 v63 v64 v65 v66 v67 v68 v69 v70 SEX BIRTH AGE EDUCYRS BG_DEGR CH_DEGR CL_DEGR CZ_DEGR DE_DEGR DK_DEGR FI_DEGR GB_DEGR HR_DEGR IL_DEGR IS_DEGR IT_DEGR JP_DEGR LT_DEGR NZ_DEGR PH_DEGR RU_DEGR SI_DEGR SR_DEGR TH_DEGR TW_DEGR ZA_DEGR DEGREE WORK WRKHRS EMPREL WRKSUP NSUP TYPORG1 TYPORG2 ISCO08 MAINSTAT PARTLIV SPWORK SPWRKHRS SPEMPREL SPWRKSUP SPISCO08 SPMAINST UNION BG_RELIG CH_RELIG CL_RELIG CZ_RELIG DE_RELIG DK_RELIG FI_RELIG GB_RELIG HR_RELIG IL_RELIG IS_RELIG IT_RELIG JP_RELIG LT_RELIG NZ_RELIG PH_RELIG RU_RELIG SI_RELIG SR_RELIG TW_RELIG TH_RELIG ZA_RELIG RELIGGRP ATTEND TOPBOT VOTE_LE BG_PRTY CH_PRTY CL_PRTY CZ_PRTY DE_PRTY DK_PRTY FI_PRTY GB_PRTY HR_PRTY IL_PRTY IS_PRTY IT_PRTY JP_PRTY LT_PRTY NZ_PRTY PH_PRTY RU_PRTY SI_PRTY SR_PRTY TH_PRTY TW_PRTY ZA_PRTY PARTY_LR BG_ETHN1 BG_ETHN2 CH_ETHN1 CH_ETHN2 CL_ETHN1 CL_ETHN2 CZ_ETHN1 CZ_ETHN2 DE_ETHN1 DE_ETHN2 DK_ETHN1 DK_ETHN2 FI_ETHN1 FI_ETHN2 GB_ETHN1 GB_ETHN2 HR_ETHN1 HR_ETHN2 IL_ETHN1 IL_ETHN2 IS_ETHN1 IS_ETHN2 IT_ETHN1 IT_ETHN2 JP_ETHN1 JP_ETHN2 LT_ETHN1 LT_ETHN2 NZ_ETHN1 NZ_ETHN2 PH_ETHN1 PH_ETHN2 RU_ETHN1 RU_ETHN2 SI_ETHN1 SI_ETHN2 SR_ETHN1 SR_ETHN2 TH_ETHN1 TH_ETHN2 TW_ETHN1 TW_ETHN2 ZA_ETHN1 ZA_ETHN2 HOMPOP HHADULT HHCHILDR HHTODD BG_RINC CH_RINC CL_RINC CZ_RINC DE_RINC DK_RINC FI_RINC GB_RINC HR_RINC IL_RINC IS_RINC IT_RINC JP_RINC LT_RINC NZ_RINC PH_RINC RU_RINC SI_RINC SR_RINC TH_RINC TW_RINC ZA_RINC BG_INC CH_INC CL_INC CZ_INC DE_INC DK_INC FI_INC GB_INC HR_INC IL_INC IS_INC IT_INC JP_INC LT_INC NZ_INC PH_INC RU_INC SI_INC SR_INC TH_INC TW_INC ZA_INC MARITAL F_BORN M_BORN URBRURAL BG_REG CH_REG CL_REG CZ_REG DE_REG DK_REG FI_REG GB_REG HR_REG IL_REG IS_REG IT_REG JP_REG LT_REG NZ_REG PH_REG RU_REG SI_REG SR_REG TH_REG TW_REG ZA_REG CASEID SUBSCASE DATEYR DATEMO DATEDY INTLANG WEIGHT MODE PARTIALS
  /COMPRESSED.

****** Aggregation of data set ******

DATASET DECLARE aggr.
AGGREGATE
  /OUTFILE='aggr'
  /BREAK=country
  /v56_r_mean=MEAN(v56_r) 
  /v7_mean=MEAN(v7) 
  /v22_mean=MEAN(v22) 
  /v30_mean=MEAN(v30) 
  /v53_mean=MEAN(v53) 
  /v50_r_mean=MEAN(v50_r) 
  /UNION_r_mean=MEAN(UNION_r).

* in aggr data file: 

RENAME VARIABLES (v56_r_mean v7_mean v22_mean v30_mean v53_mean v50_r_mean UNION_r_mean = 
d12_v56_issp_w6 d23_v7_issp_w6 d23_v22_issp_w6 d23_v30_issp_w6 d23_v53_issp_w6 d23_v50_issp_w6
d33_union_issp_w6).

VALUE LABELS country
100 'BG'
191 'HR'
203 'CZ'
208 'DK'
246 'FI'
276 'DE'
380 'IT'
440 'LT'
705 'SI'
756 'CH'
826 'GB'.

