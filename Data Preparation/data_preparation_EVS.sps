* Encoding: UTF-8.
* Methodlogical Steps to acess Social Cohesion:

* Data Preparation
* Following steps need to be done in all data sets: 
1. Select relevant countries or delete countries that are not of interest
2. Recode indicators if needed: level of measurement, distribution of answers/ answer options, reversed answer scales
3. Set all missing values of indicators
4. Control the format: Decimals, Scaling, Labeling
5. Aggregation of data to country and regional level.

* Data set: European Value Survey 2017 (missing countries: Belgium, Ireland, Luembourg, Malta and Cyprus (Cyprus in WVS)
 
USE ALL.
SELECT IF (country=40 or country=100 or country=191 or country=203 or country=208 or country=233 
    or country=246 or country=250 or country=276 or country=300 or country=348 or country=380 or country=428 or country=440 or 
    country=528 or country=578 or country=616 or country=620 or country=642 or country=703 or country=705 or 
    country=724 or country=752 or country=756 or country=826).
EXECUTE.

* N= 40557 Cases for 25 countries
* Indicators (need to be redefined)

set tnumbers both.
FREQUENCIES VARIABLES=v3 v31 v153 v22 v24 v170 v166 v167 v168 v164 v165 v120 v121 v127 v130 v122 v103 v5 v98 v99 v100 v101 v97 v150 v152 v153
  /STATISTICS=STDDEV MINIMUM MAXIMUM MEAN MEDIAN MODE
  /HISTOGRAM NORMAL
  /ORDER=ANALYSIS.

*recoded to binary because they have 3 categories only:

RECODE v98 v99 v100 v101 (1,2=1) (3=0) (else=copy) into v98_r v99_r v100_r v101_r.
VALUE LABELS v98_r v99_r v100_r v101_r 1 'Have done or might do' 0 'Would not do'.
MISSING VALUES v98_r v99_r v100_r v101_r (LOWEST THRU -1).
CROSSTABS v98 by v98_r /cells count /missing include.
FREQUENCIES v98_r v99_r v100_r v101_r.
VARIABLE LABELS v98_r 'political action: signing a petition (Q30A)_recoded'.
VARIABLE LABELS v99_r 'political action: joining in boycotts (Q30B)_recoded'.
VARIABLE LABELS v100_r 'political action: attending lawful demonstrations (Q30C)_recoded'.
VARIABLE LABELS v101_r 'political action: joining unofficial strikes (Q30D)_recoded'.
VARIABLE LEVEL v98_r v99_r v100_r v101_r (NOMINAL).

* switching the scale because more (2) should be "better" than less (1). 

RECODE v31 (1=1) (2=0) (else=copy) into v31_r.
VALUE LABELS v31_r 1 'Most people can be trusted' 0 'Can not be trusted'.
MISSING VALUES v31_r (LOWEST THRU -1).
CROSSTABS v31 by v31_r /cells count /missing include.
FREQUENCIES v31_r.
VARIABLE LABELS v31_r 'people can be trusted/cant be too careful (Q7)_recoded'.
VARIABLE LEVEL v31_r (NOMINAL).

* simple binary coding, instead of [1;2] it should be [0;1]
    
RECODE v22 v24 (1=0) (2=1) (else=copy) into v22_r v24_r.
VALUE LABELS v22_r v24_r 0 'mentioned' 1 'not mentioned'.
MISSING VALUES v22_r v24_r (LOWEST THRU -1).
CROSSTABS v22 by v22_r /cells count /missing include.
VARIABLE LABELS v22_r 'dont like as neighbours: people of different race (Q6A)'.
VARIABLE LABELS v24_r 'dont like as neighbours: immigrants/foreign workers (Q6C)'.

* and the other way around

RECODE v10 v13 v15 v16 v18 v21 (1=1) (2=0) (else=copy) into v10_r v13_r v15_r v16_r v18_r v21_r.
VALUE LABELS v10_r v13_r v15_r v16_r v18_r v21_r 1 'mentioned' 0 'not mentioned'.
MISSING VALUES v10_r v13_r v15_r v16_r v18_r v21_r (LOWEST THRU -1).
CROSSTABS v10 by v10_r /cells count /missing include.
VARIABLE LABELS v10_r 'do you belong to: cultural activities (Q4B)_recoded'.
VARIABLE LABELS v13_r 'do you belong to: environment, ecology, animal rights (Q4E)_recoded'.
VARIABLE LABELS v15_r 'do you belong to: sports/recreation (Q4G)_recoded'.
VARIABLE LABELS v16_r 'do you belong to: charitable/humanitarian organization (Q4H)_recoded'.
VARIABLE LABELS v18_r 'do you belong to: self-help group, mutual aid group (Q4J)_recoded'.
VARIABLE LABELS v21_r 'did you do voluntary work in the last 6 months (Yes/No)_recoded'.

* switching the scale because more should be "better" than less 

RECODE v3 v5 (1=4) (2=3) (3=2) (4=1) (else=copy) into v3_r v5_r.
VALUE LABELS v3_r v5_r 4 'Very important' 3 'Quite important' 2 'Not important' 1 'Not at all important'.
MISSING VALUES v3_r v5_r (LOWEST THRU -1).
CROSSTABS v3 by v3_r /cells count /missing include.
CROSSTABS v5 by v5_r /cells count /missing include.
VARIABLE LABELS v3_r 'how important in your life: friends and acquaintances (Q1A)_recoded'.
VARIABLE LABELS v5_r 'how important in your life: politics (Q1E)_recoded'.
VARIABLE LEVEL v3_r v5_r (SCALE).

RECODE v170 (1=4) (2=3) (3=2) (4=1) (else=copy) into v170_r.
VALUE LABELS v170_r 4 'Very proud' 3 'Quite proud' 2 'Not very proud' 1 'Not at all proud'.
MISSING VALUES v170_r (LOWEST THRU -1).
VARIABLE LABELS v170_r 'how proud are you to be a ... [country] citizen (Q47)_recoded'.
VARIABLE LEVEL v170_r (SCALE).

* only recoding of city, region and country instead of continent and world (last two out: v167 and v168)

RECODE v164 v165 v166 (1=4) (2=3) (3=2) (4=1) (else=copy) into v164_r v165_r v166_r.
VALUE LABELS v164_r v165_r v166_r 4 'Very close' 3 'Close' 2 'Not very close' 1 'Not close at all'.
MISSING VALUES v164_r v165_r v166_r (LOWEST THRU -1).
VARIABLE LABELS v164_r 'how close do you feel: to own town/city (Q45A)_recoded'.
VARIABLE LABELS v165_r 'how close do you feel: to your region (Q45B)_recoded'.
VARIABLE LABELS v166_r 'how close do you feel: to country (Q45C)_recoded'.
VARIABLE LEVEL v164_r v165_r v166_r (SCALE).

RECODE v120 v121 v122 v126 v127 v130 (1=4) (2=3) (3=2) (4=1) (else=copy) into v120_r v121_r v122_r v126_r v127_r v130_r.
VALUE LABELS v120_r v121_r v122_r v126_r v127_r v130_r 4 'A great deal' 3 'Quite a lot' 2 'Not very much' 1 'None at all'.
MISSING VALUES v120_r v121_r v122_r v126_r v127_r v130_r (LOWEST THRU -1).
VARIABLE LABELS v120_r 'how much confidence in: the police (Q38F)_recoded'.
VARIABLE LABELS v121_r 'how much confidence in: parliament (Q38G)_recoded'.
VARIABLE LABELS v122_r 'how much confidence in: civil service (Q38H_recoded'.
VARIABLE LABELS v126_r 'how much confidence in: health care system (Q38L)_recoded'.
VARIABLE LABELS v127_r 'how much confidence in: justice system (Q38M)_recoded'.
VARIABLE LABELS v130_r 'how much confidence in: political parties (Q38P)_recoded'.
VARIABLE LEVEL v120_r v121_r v122_r v126_r v127_r v130_r (SCALE).

RECODE v97 (1=4) (2=3) (3=2) (4=1) (else=copy) into v97_r.
VALUE LABELS v97_r 4 'Very interested' 3 'Somewhat interested' 2 'Not very interested' 1 'Not at all interested'.
MISSING VALUES v97_r (LOWEST THRU -1).
VARIABLE LABELS v97_r 'how interested are you in politics (Q29)_recoded'.
VARIABLE LEVEL v97_r (SCALE).

RECODE v79 (1=4) (2=3) (3=2) (4=1) (else=copy) into v79_r.
VALUE LABELS v79_r 4 'Agree strongly ' 3 'Agree' 2 'Disagree' 1 'Disagree strongly'.
MISSING VALUES v79_r (LOWEST THRU -1).
VARIABLE LABELS v79_r 'one of main goals in life has been to make my parents proud (Q25H)_recoded'.
VARIABLE LEVEL v79_r (SCALE).

RECODE v150 v149 v159 (1=10) (2=9) (3=8) (4=7) (5=6) (6=5) (7=4) (8=3) (9=2) (10=1) (else=copy) into v150_r v149_r v159_r.
VALUE LABELS v150_r v149_r v159_r 1 'Always' 10 'Never'.
MISSING VALUES v150_r v149_r v159_r v153 (LOWEST THRU -1).
CROSSTABS v150 by v150_r /cells count /missing include.
VARIABLE LABELS v150_r 'do you justify: cheating on tax (Q44B)_recoded'.
VARIABLE LABELS v149_r 'do you justify: claiming state benefits (Q44A)_recoded'.
VARIABLE LABELS v159_r 'do you justify: avoiding a fare on public transport (Q44K)_recoded'.
VARIABLE LEVEL v150_r v149_r v159_r v153 (SCALE).

FORMATS v10_r v13_r v15_r v16_r v18_r v21_r v22_r v24_r v79_r v98_r v99_r v100_r v101_r v150_r v149_r v159_r v153 v97_r v120_r v121_r v122_r v126_r v127_r v130_r v164_r v165_r v166_r v170_r v3_r v5_r v31_r (f7.0).

* final control of indicators

FREQUENCIES v3_r v5_r v10_r v13_r v15_r v16_r v18_r v21_r v22_r v24_r v79_r v153 v170_r v164_r v165_r  v166_r v120_r v121_r v122_r v126_r v127_r v130_r v103 v97_r v150_r v149_r v159_r v153 v170_r v98_r v99_r v100_r v101_r v31_r
  /STATISTICS=STDDEV MINIMUM MAXIMUM MEAN MEDIAN MODE
  /ORDER=ANALYSIS.

**********************************
* Preparation for aggregation
1. Control once again the previous steps
2. Safe two data sets with all the relevant variables to COUNTRY or NUTS-1 region.

*country level: 

SAVE OUTFILE='C:\Users\chartz\OneDrive - Jacobs University\Data sets\EVS_2017\ZA7500_v5-0-0.sav\ZA7500_v5-0-0_Country.sav'
  /DROP=studyno version doi studynoc versionc id_cocas caseno year fw_start fw_end c_abrv cntry_y mode mm_select_sample mm_mixed_mode mm_mode_fu mm_matrix_group mm_original_matrix_design_IS mm_original_matrix_group_IS mm_fw_start_fu mm_fw_end_fu mm_year_fu mr_detailed_mode_DE mr_contact_mode_DE mr_incentive_DE fduplicate fmissings v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 f20 v20 v20a v20b v21 v23 f24_IT v24a_IT v24b_IT v25 v26 v27 v28 v29 v30 f30a v30a v30b v30c v31 v32 v33 v34 v35 v36 v37 v38 v39 v40 v41 v42 v43 v44 v45 f45a v45a v45b v45c v46 f46_IT v47 v48 v49 v50 v51 v52 v52_cs v53 v54 v55 v56 v57 v58 v59 v60 v61 v62 v63 v64 v65 v66 v67 v68 v69 v70 v71 v72 v72_DE v73 v73_DE v74 v74_DE v75 v75_DE v76 v76_DE v77 v77_DE v78 v78_DE v79 v79_DE v80 v81 v82 v83 v84 f85 v85 v86 v87 v88 v89 v90 v91 v92 v93 v94 v95 f96 v96 v96a v96b v97 v98 v99 v100 v101 v102 v104 v105 v106 v107 f108 v108 v109 f110 v110 v111 v111_4 v112 f112_SE v113 v114 v115 v116 v117 v118 v119 v120 v121 v122 v123 v124 v125 v126 v127 v128 v129 v130 v131 v132 v133 v133_11c v134 v134_11c v135 v135_11c v136 v136_11c v137 v137_11c v138 v138_11c v139 v139_11c v140 v140_11c v141 v141_11c v142 v143 v144 v145 v146 v147 v148 v149 v150 v151 v152 v154 v155 v156 v157 v158 v159 v160 v161 v162 v163 v164 v165 v166 v167 v168 v169 v170 v171 v172 v173 v174_LR v174_cs v175_LR v175_cs v176 v176_DK v177 v177_DK v178 v178_DK v179 v179_DK v180 v180_DK v181 v181_DK v182 v182_DK v183 v183_DK v184 v185 v186 v187 v188 v189 v190 v191 v192 v193 v194 v195 v196 v197 v198 v199 f199_IT v200 v201 v202 v203 v204 v205 v206 v207 v208 v209 v210 v211 v212 v213 v214 v215 v216 v217 v218 v219 v220 v221 v221_DK v222 v222_DK v223 v223_DK v224 v224_DK v225 v226 age age_r age_r2 age_r3 v227 v228b v228b_r v229 v230 v231b v231b_r v232 v233b v233b_r v234 v235 v236 v237 v238 v239_r v239a v239b v240 v241 v242 v242_r v243_edulvlb v243_edulvlb_2 v243_edulvlb_1 v243_ISCED_3 v243_ISCED_2 v243_ISCED_2b v243_ISCED_1 v243_EISCED v243_ISCED97 v243_8cat v243_r v243_cs v243_cs_DE1 v243_cs_DE2 v243_cs_DE3 v243_cs_GB1 v243_cs_GB2 v244 v245 v246_ISCO_2 v246_SIOPS v246_ISEI v246_ESeC v246_egp v247 v248 v248a v249 v250 v251b v251b_r v252_edulvlb f252_edulvlb_CH v252_edulvlb_2 v252_edulvlb_1 v252_ISCED_3 v252_ISCED_2 v252_ISCED_2b v252_ISCED_1 v252_EISCED v252_ISCED97 v252_8cat v252_r v252_cs v252_cs_DE1 v252_cs_DE2 v252_cs_DE3 v252_cs_GB1 v252_cs_GB2 v253 v254 v255_ISCO_2 v255_SIOPS v255_ISEI v255_ESeC v255_egp v256 v257 v258 v259 v260 v261 v261_ppp v261_r v262_edulvlb v262_edulvlb_2 v262_edulvlb_1 v262_ISCED_3 v262_ISCED_2 v262_ISCED_2b v262_ISCED_1 v262_EISCED v262_ISCED97 v262_8cat v262_r v262_cs v262_cs_DE1 v262_cs_DE2 v262_cs_DE3 v262_cs_GB1 v262_cs_GB2 v263_edulvlb v263_edulvlb_2 v263_edulvlb_1 v263_ISCED_3 v263_ISCED_2 v263_ISCED_2b v263_ISCED_1 v263_EISCED v263_ISCED97 v263_8cat v263_r v263_cs v263_cs_DE1 v263_cs_DE2 v263_cs_DE3 v263_cs_GB1 v263_cs_GB2 v264 v265 v266 v267 v268 v269 v270 v271 v272 v273 v274 v275b_N2 v275b_N1 v275c_N2 v275c_N1 v276_r v277 mm_v277_fu v278a v278b v278c_r v279a v279b v279c_r v279d_r mm_v278a_fu mm_v278b_fu mm_v279a_fu mm_v279b_fu v280 v281a v281a_r v282 gweight gweight_no_edu dweight pweight age_r3_weight v225_weight v243_r_weight
  /COMPRESSED.

* NUTS level:
    
*SAVE OUTFILE='C:\Users\chartz\OneDrive - Jacobs University\Data sets\EVS_2017\ZA7500_v5-0-0.sav\ZA7500_v5-0-0_NUTS.sav'
  /DROP=studyno version doi studynoc versionc id_cocas caseno year fw_start fw_end country c_abrv cntry_y mode mm_select_sample mm_mixed_mode mm_mode_fu mm_matrix_group mm_original_matrix_design_IS mm_original_matrix_group_IS mm_fw_start_fu mm_fw_end_fu mm_year_fu mr_detailed_mode_DE mr_contact_mode_DE mr_incentive_DE fduplicate fmissings v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 f20 v20 v20a v20b v21 v23 f24_IT v24a_IT v24b_IT v25 v26 v27 v28 v29 v30 f30a v30a v30b v30c v31 v32 v33 v34 v35 v36 v37 v38 v39 v40 v41 v42 v43 v44 v45 f45a v45a v45b v45c v46 f46_IT v47 v48 v49 v50 v51 v52 v52_cs v53 v54 v55 v56 v57 v58 v59 v60 v61 v62 v63 v64 v65 v66 v67 v68 v69 v70 v71 v72 v72_DE v73 v73_DE v74 v74_DE v75 v75_DE v76 v76_DE v77 v77_DE v78 v78_DE v79 v79_DE v80 v81 v82 v83 v84 f85 v85 v86 v87 v88 v89 v90 v91 v92 v93 v94 v95 f96 v96 v96a v96b v97 v98 v99 v100 v101 v102 v104 v105 v106 v107 f108 v108 v109 f110 v110 v111 v111_4 v112 f112_SE v113 v114 v115 v116 v117 v118 v119 v120 v121 v122 v123 v124 v125 v126 v127 v128 v129 v130 v131 v132 v133 v133_11c v134 v134_11c v135 v135_11c v136 v136_11c v137 v137_11c v138 v138_11c v139 v139_11c v140 v140_11c v141 v141_11c v142 v143 v144 v145 v146 v147 v148 v149 v150 v151 v152 v154 v155 v156 v157 v158 v159 v160 v161 v162 v163 v164 v165 v166 v167 v168 v169 v170 v171 v172 v173 v174_LR v174_cs v175_LR v175_cs v176 v176_DK v177 v177_DK v178 v178_DK v179 v179_DK v180 v180_DK v181 v181_DK v182 v182_DK v183 v183_DK v184 v185 v186 v187 v188 v189 v190 v191 v192 v193 v194 v195 v196 v197 v198 v199 f199_IT v200 v201 v202 v203 v204 v205 v206 v207 v208 v209 v210 v211 v212 v213 v214 v215 v216 v217 v218 v219 v220 v221 v221_DK v222 v222_DK v223 v223_DK v224 v224_DK v225 v226 age age_r age_r2 age_r3 v227 v228b v228b_r v229 v230 v231b v231b_r v232 v233b v233b_r v234 v235 v236 v237 v238 v239_r v239a v239b v240 v241 v242 v242_r v243_edulvlb v243_edulvlb_2 v243_edulvlb_1 v243_ISCED_3 v243_ISCED_2 v243_ISCED_2b v243_ISCED_1 v243_EISCED v243_ISCED97 v243_8cat v243_r v243_cs v243_cs_DE1 v243_cs_DE2 v243_cs_DE3 v243_cs_GB1 v243_cs_GB2 v244 v245 v246_ISCO_2 v246_SIOPS v246_ISEI v246_ESeC v246_egp v247 v248 v248a v249 v250 v251b v251b_r v252_edulvlb f252_edulvlb_CH v252_edulvlb_2 v252_edulvlb_1 v252_ISCED_3 v252_ISCED_2 v252_ISCED_2b v252_ISCED_1 v252_EISCED v252_ISCED97 v252_8cat v252_r v252_cs v252_cs_DE1 v252_cs_DE2 v252_cs_DE3 v252_cs_GB1 v252_cs_GB2 v253 v254 v255_ISCO_2 v255_SIOPS v255_ISEI v255_ESeC v255_egp v256 v257 v258 v259 v260 v261 v261_ppp v261_r v262_edulvlb v262_edulvlb_2 v262_edulvlb_1 v262_ISCED_3 v262_ISCED_2 v262_ISCED_2b v262_ISCED_1 v262_EISCED v262_ISCED97 v262_8cat v262_r v262_cs v262_cs_DE1 v262_cs_DE2 v262_cs_DE3 v262_cs_GB1 v262_cs_GB2 v263_edulvlb v263_edulvlb_2 v263_edulvlb_1 v263_ISCED_3 v263_ISCED_2 v263_ISCED_2b v263_ISCED_1 v263_EISCED v263_ISCED97 v263_8cat v263_r v263_cs v263_cs_DE1 v263_cs_DE2 v263_cs_DE3 v263_cs_GB1 v263_cs_GB2 v264 v265 v266 v267 v268 v269 v270 v271 v272 v273 v274 v275c_N2 v275c_N1 v276_r v277 mm_v277_fu v278a v278b v278c_r v279a v279b v279c_r v279d_r mm_v278a_fu mm_v278b_fu mm_v279a_fu mm_v279b_fu v280 v281a v281a_r v282 gweight gweight_no_edu dweight pweight age_r3_weight v225_weight v243_r_weight
  /COMPRESSED.

****** Aggregation of data set ******

DATASET DECLARE aggrEVS2.
AGGREGATE
  /OUTFILE='aggrEVS2'
  /BREAK=country
  /v22_mean=MEAN(v22_r) 
  /v24_mean=MEAN(v24_r) 
  /v103_mean=MEAN(v103) 
  /v153_mean=MEAN(v153) 
  /v98_r_mean=MEAN(v98_r) 
  /v99_r_mean=MEAN(v99_r) 
  /v100_r_mean=MEAN(v100_r) 
  /v101_r_mean=MEAN(v101_r) 
  /v31_r_mean=MEAN(v31_r) 
  /v3_r_mean=MEAN(v3_r) 
  /v5_r_mean=MEAN(v5_r) 
  /v170_r_mean=MEAN(v170_r) 
  /v164_r_mean=MEAN(v164_r) 
  /v165_r_mean=MEAN(v165_r) 
  /v166_r_mean=MEAN(v166_r) 
  /v120_r_mean=MEAN(v120_r) 
  /v121_r_mean=MEAN(v121_r) 
  /v122_r_mean=MEAN(v122_r) 
  /v126_r_mean=MEAN(v126_r) 
  /v127_r_mean=MEAN(v127_r) 
  /v130_r_mean=MEAN(v130_r) 
  /v97_r_mean=MEAN(v97_r) 
  /v150_r_mean=MEAN(v150_r)
  /v149_r_mean=MEAN(v149_r) 
  /v159_r_mean=MEAN(v159_r) 
  /v10_r_mean=MEAN(v10_r)
  /v13_r_mean=MEAN(v13_r)
  /v15_r_mean=MEAN(v15_r)
  /v16_r_mean=MEAN(v16_r)
  /v18_r_mean=MEAN(v18_r)
  /v21_r_mean=MEAN(v21_r)
  /v79_r_mean=MEAN(v79_r).

* in aggr data file: 

RENAME VARIABLES (v22_mean v24_mean v103_mean v153_mean v98_r_mean v99_r_mean v100_r_mean 
  v101_r_mean v31_r_mean v3_r_mean v5_r_mean v170_r_mean v164_r_mean v165_r_mean v166_r_mean 
  v120_r_mean v121_r_mean v122_r_mean v126_r_mean v127_r_mean v130_r_mean v97_r_mean 
  v150_r_mean v149_r_mean v159_r_mean v10_r_mean v13_r_mean v15_r_mean v16_r_mean v18_r_mean 
  v21_r_mean v79_r_mean = d13_v22_evs_w6 d13_v24_evs_w6 d31_v103_evs_w6 d13_v153_evs_w6 
  d33_v98_evs_w6 d33_v99_evs_w6 d33_v100_evs_w6 d33_v101_evs_w6 d12_v31_evs_w6 d11_v3_evs_w6
  d33_v5_evs_w6 d21_v170_evs_w6 d21_v164_evs_w6 d21_v165_evs_w6 d21_v166_evs_w6 d22_v120_evs_w6
  d22_v121_evs_w6 d22_v122_evs_w6 d22_v126_evs_w6 d22_v127_evs_w6 d22_v130_evs_w6
  d33_v97_evs_w6 d32_v150_evs_w6 d32_v149_evs_w6 d32_v159_evs_w6 d31_v10_evs_w6 d31_v13_evs_w6
  d31_v15_evs_w6 d31_v16_evs_w6 d31_v18_evs_w6 d31_v21_evs_w6 d32_v79_evs_w6).

VARIABLE LABELS d13_v22_evs_w6 'dont like as neighbours: people of different race (Q6A)'.
VARIABLE LABELS d13_v24_evs_w6 'dont like as neighbours: immigrants/foreign workers (Q6C)'.
VARIABLE LABELS d31_v103_evs_w6 'individual vs. state responsibility for providing (Q32A)'.
VARIABLE LABELS d13_v153_evs_w6 'do you justify: homosexuality (Q44E)'.
VARIABLE LABELS d33_v98_evs_w6 'political action: signing a petition (Q30A)'.
VARIABLE LABELS d33_v99_evs_w6 'political action: joining in boycotts (Q30B)'.
VARIABLE LABELS d33_v100_evs_w6 'political action: attending lawful demonstrations (Q30C)'.
VARIABLE LABELS d33_v101_evs_w6 'political action: joining unofficial strikes (Q30D)'.
VARIABLE LABELS  d12_v31_evs_w6 'people can be trusted/cant be too careful (Q7)'.
VARIABLE LABELS d11_v3_evs_w6 'how important in your life: friends and acquaintances (Q1C)'.
VARIABLE LABELS d33_v5_evs_w6 'how important in your life: politics (Q1E)'.
VARIABLE LABELS d21_v170_evs_w6 'how proud are you to be a ... [country] citizen (Q47)'.
VARIABLE LABELS d21_v164_evs_w6 'how close do you feel: to own town/city (Q45A)'.
VARIABLE LABELS d21_v165_evs_w6 'how close do you feel: to your [county, region, district] (Q45B)'.
VARIABLE LABELS d21_v166_evs_w6 'how close do you feel: to [country] (Q45C)'.
VARIABLE LABELS d22_v120_evs_w6 'how much confidence in: the police (Q38F)'.
VARIABLE LABELS d22_v121_evs_w6 'how much confidence in: parliament (Q38G)'.
VARIABLE LABELS d22_v122_evs_w6 'how much confidence in: civil service (Q38H)'.
VARIABLE LABELS d22_v126_evs_w6 'how much confidence in: health care system (Q38L)'.
VARIABLE LABELS d22_v127_evs_w6 'how much confidence in: justice system (Q38M)'.
VARIABLE LABELS d22_v130_evs_w6 'how much confidence in: political parties (Q38P)'.
VARIABLE LABELS d33_v97_evs_w6 'how interested are you in politics (Q29)'.
VARIABLE LABELS d32_v150_evs_w6 'do you justify: cheating on tax (Q44B)'.
VARIABLE LABELS d32_v149_evs_w6 'do you justify: claiming state benefits (Q44A)'.
VARIABLE LABELS d32_v159_evs_w6 'do you justify: avoiding a fare on public transport (Q44K)'.
VARIABLE LABELS d31_v10_evs_w6 'do you belong to: cultural activities (Q4B)'.
VARIABLE LABELS d31_v13_evs_w6 'do you belong to: environment, ecology, animal rights (Q4E)'.
VARIABLE LABELS d31_v15_evs_w6 'do you belong to: sports/recreation (Q4G)'.
VARIABLE LABELS d31_v16_evs_w6 'do you belong to: charitable/humanitarian organization (Q4H)'.
VARIABLE LABELS d31_v18_evs_w6 'do you belong to: self-help group, mutual aid group (Q4J)'.
VARIABLE LABELS d31_v21_evs_w6 'did you do voluntary work in the last 6 months (Q5)'.
VARIABLE LABELS d32_v79_evs_w6 'one of main goals in life has been to make my parents proud (Q25H)'.

* save it before
* NUTS-1
    
*DATASET DECLARE aggr.
*AGGREGATE
  /OUTFILE='aggr'
  /BREAK=v275b_N1
  /v22_mean=MEAN(v22) 
  /v24_mean=MEAN(v24) 
  /v103_mean=MEAN(v103) 
  /v153_mean=MEAN(v153) 
  /v98_r_mean=MEAN(v98_r) 
  /v99_r_mean=MEAN(v99_r) 
  /v100_r_mean=MEAN(v100_r) 
  /v101_r_mean=MEAN(v101_r) 
  /v31_r_mean=MEAN(v31_r) 
  /v3_r_mean=MEAN(v3_r) 
  /v5_r_mean=MEAN(v5_r) 
  /v170_r_mean=MEAN(v170_r) 
  /v164_r_mean=MEAN(v164_r) 
  /v165_r_mean=MEAN(v165_r) 
  /v166_r_mean=MEAN(v166_r) 
  /v120_r_mean=MEAN(v120_r) 
  /v121_r_mean=MEAN(v121_r) 
  /v122_r_mean=MEAN(v122_r) 
  /v126_r_mean=MEAN(v126_r) 
  /v127_r_mean=MEAN(v127_r) 
  /v130_r_mean=MEAN(v130_r) 
  /v97_r_mean=MEAN(v97_r) 
  /v150_r_mean=MEAN(v150_r) 
  /v152_r_mean=MEAN(v152_r).

*MISSING VALUES v275b_N1 (-1).

* in aggr data file: 

*RENAME VARIABLES (v275b_N1 v22_mean v24_mean v103_mean v153_mean v98_r_mean v99_r_mean v100_r_mean 
  v101_r_mean v31_r_mean v3_r_mean v5_r_mean v170_r_mean v164_r_mean v165_r_mean v166_r_mean 
  v120_r_mean v121_r_mean v122_r_mean v126_r_mean v127_r_mean v130_r_mean v97_r_mean 
  v150_r_mean v152_r_mean = region d13_v22_evs_w6 d13_v24_evs_w6 d31_v103_evs_w6 d13_v153_evs_w6 
  d33_v98_evs_w6 d33_v99_evs_w6 d33_v100_evs_w6 d33_v101_evs_w6 d12_v31_evs_w6 d11_v3_evs_w6
d33_v5_evs_w6 d21_v170_evs_w6 d21_v164_evs_w6 d21_v165_evs_w6 d21_v166_evs_w6 d22_v120_evs_w6
d22_v121_evs_w6 d22_v122_evs_w6 d22_v126_evs_w6 d22_v127_evs_w6 d22_v130_evs_w6
d33_v97_evs_w6 d32_v150_evs_w6 d32_v152_evs_w6).

* NUTS-2

*DATASET DECLARE aggr.
*AGGREGATE
  /OUTFILE='aggr'
  /BREAK=v275b_N2
  /v22_mean=MEAN(v22) 
  /v24_mean=MEAN(v24) 
  /v103_mean=MEAN(v103) 
  /v153_mean=MEAN(v153) 
  /v98_r_mean=MEAN(v98_r) 
  /v99_r_mean=MEAN(v99_r) 
  /v100_r_mean=MEAN(v100_r) 
  /v101_r_mean=MEAN(v101_r) 
  /v31_r_mean=MEAN(v31_r) 
  /v3_r_mean=MEAN(v3_r) 
  /v5_r_mean=MEAN(v5_r) 
  /v170_r_mean=MEAN(v170_r) 
  /v164_r_mean=MEAN(v164_r) 
  /v165_r_mean=MEAN(v165_r) 
  /v166_r_mean=MEAN(v166_r) 
  /v120_r_mean=MEAN(v120_r) 
  /v121_r_mean=MEAN(v121_r) 
  /v122_r_mean=MEAN(v122_r) 
  /v126_r_mean=MEAN(v126_r) 
  /v127_r_mean=MEAN(v127_r) 
  /v130_r_mean=MEAN(v130_r) 
  /v97_r_mean=MEAN(v97_r) 
  /v150_r_mean=MEAN(v150_r) 
  /v152_r_mean=MEAN(v152_r).

* in aggr data file: 

*RENAME VARIABLES (v275b_N2 v22_mean v24_mean v103_mean v153_mean v98_r_mean v99_r_mean v100_r_mean 
  v101_r_mean v31_r_mean v3_r_mean v5_r_mean v170_r_mean v164_r_mean v165_r_mean v166_r_mean 
  v120_r_mean v121_r_mean v122_r_mean v126_r_mean v127_r_mean v130_r_mean v97_r_mean 
  v150_r_mean v152_r_mean = region2 d13_v22_evs_w6 d13_v24_evs_w6 d31_v103_evs_w6 d13_v153_evs_w6 
  d33_v98_evs_w6 d33_v99_evs_w6 d33_v100_evs_w6 d33_v101_evs_w6 d12_v31_evs_w6 d11_v3_evs_w6
d33_v5_evs_w6 d21_v170_evs_w6 d21_v164_evs_w6 d21_v165_evs_w6 d21_v166_evs_w6 d22_v120_evs_w6
d22_v121_evs_w6 d22_v122_evs_w6 d22_v126_evs_w6 d22_v127_evs_w6 d22_v130_evs_w6
d33_v97_evs_w6 d32_v150_evs_w6 d32_v152_evs_w6).

VALUE LABELS country
40 'AT'
56 'BE'
100 'BG'
196 'CY'
203 'CZ'
276 'DE'
208 'DK'
233 'EE'
300 'GR'
724 'ES'
246 'FI'
250 'FR'
826 'GB'
191 'HR'
348 'HU'
372 'IE'
380 'IT'
440 'LT'
470 'MT'
442 'LU'
428 'LV'
528 'NL'
578 'NO'
642 'RO'
616 'PL'
620 'PT'
752 'SE'
705 'SI'
703 'SK'
756 'CH'.
