* Encoding: UTF-8.
* Methodlogical Steps to access Social Cohesion:

* Data Preparation
* Following steps need to be done in all data sets: 
1. Select relevant countries or delete countries that are not of interest
2. Recode indicators if needed: level of measurement, distribution of answers/ answer options, reversed answer scales
3. Set all missing values of indicators
4. Control the format: Decimals, Scaling, Labeling
5. Aggregation of data to country and regional level

* Data set: EQLS 2016 (missing countries: Norway, Switzerland)
    
FILTER OFF.
USE ALL.
SELECT IF (Wave = 4).
EXECUTE.

FILTER OFF.
USE ALL.
SELECT IF (EU28).
EXECUTE.

* N= 30809 Cases for 28 countries
* Indicators (need to be redefined, cleaned and recoded)

set tnumbers both. 
FREQUENCIES VARIABLES=Y16_Q52b Y16_Q40b Y16_Q34a Y16_Q34e Y16_Q34f Y16_Q35a Y16_Q35b Y16_Q35d Y16_Q35g Y16_Q38a Y16_Q38b Y16_Q39a Y16_Q39b Y16_Q88 Y16_Q55a Y16_Q55b Y16_Q30a Y16_Q30b Y16_Q30c Y16_Q30d 
  /STATISTICS=STDDEV MINIMUM MAXIMUM MEAN MEDIAN MODE
  /HISTOGRAM NORMAL
  /ORDER=ANALYSIS.

* recoded to binary from nominal scaled:

RECODE Y16_Q40b (1,2=1) (3,4=0) (else=copy) into Y16_Q40b_r.
VALUE LABELS Y16_Q40b_r 1 'Have contacts with family and friends' 0 'Institutions and nobody'.
MISSING VALUES Y16_Q40b_r (98 THRU HIGHEST).
CROSSTABS Y16_Q40b by Y16_Q40b_r /cells count /missing include.
FREQUENCIES Y16_Q40b_r.
VARIABLE LABELS Y16_Q40b_r 'Support if you needed advice about a serious personal or family matters_recoded'.

*recoded to binary because they have 3 categories only:

RECODE Y16_Q34a Y16_Q34e Y16_Q34f (1,2=0) (3=1) (else=copy) into Y16_Q34a_r Y16_Q34e_r Y16_Q34f_r.
VALUE LABELS Y16_Q34a_r Y16_Q34e_r Y16_Q34f_r 0 'A lot or some tension' 1 'No tension'.
MISSING VALUES Y16_Q34a_r Y16_Q34e_r Y16_Q34f_r (98 THRU HIGHEST).
CROSSTABS Y16_Q34a by Y16_Q34a_r /cells count /missing include.
FREQUENCIES Y16_Q34a_r Y16_Q34e_r Y16_Q34f_r.
VARIABLE LABELS Y16_Q34a_r 'Tension between poor and rich people_recoded'.
VARIABLE LABELS Y16_Q34e_r 'Tension between different racial and ethnic groups_recoded'.
VARIABLE LABELS Y16_Q34f_r 'Tension between different religious groups_recoded'.
VARIABLE LEVEL Y16_Q34a_r Y16_Q34e_r Y16_Q34f_r (NOMINAL).

*recoded to binary because they have 3 categories only, but this time cat. are slightly different:

RECODE Y16_Q34a Y16_Q34e Y16_Q34f (1=0) (2,3=1) (else=copy) into Y16_Q34a_rnew Y16_Q34e_rnew Y16_Q34f_rnew.
VALUE LABELS Y16_Q34a_rnew Y16_Q34e_rnew Y16_Q34f_rnew 0 'A lot of tension' 1 'No or some tension'.
MISSING VALUES Y16_Q34a_rnew Y16_Q34e_rnew Y16_Q34f_rnew (98 THRU HIGHEST).
CROSSTABS Y16_Q34a by Y16_Q34a_r /cells count /missing include.
FREQUENCIES Y16_Q34a_rnew Y16_Q34e_rnew Y16_Q34f_rnew.
VARIABLE LABELS Y16_Q34a_rnew 'Tension between poor and rich people_recoded'.
VARIABLE LABELS Y16_Q34e_rnew 'Tension between different racial and ethnic groups_recoded'.
VARIABLE LABELS Y16_Q34f_rnew 'Tension between different religious groups_recoded'.
VARIABLE LEVEL Y16_Q34a_rnew Y16_Q34e_rnew Y16_Q34f_rnew (NOMINAL).

* switching the scale because more (1) should be "better" than less (0). 

RECODE Y16_Q30a Y16_Q30b Y16_Q30c Y16_Q30d Y16_Q30e (1=1) (2=0) (else=copy) into Y16_Q30a_r Y16_Q30b_r Y16_Q30c_r Y16_Q30d_r Y16_Q30e_r.
VALUE LABELS Y16_Q30a_r Y16_Q30b_r Y16_Q30c_r Y16_Q30d_r Y16_Q30e_r 1 'Yes' 0 'No'.
MISSING VALUES Y16_Q30a_r Y16_Q30b_r Y16_Q30c_r Y16_Q30d_r Y16_Q30e_r (98 THRU HIGHEST).
CROSSTABS Y16_Q30d by Y16_Q30d_r /cells count /missing include.
FREQUENCIES Y16_Q30a_r Y16_Q30b_r Y16_Q30c_r Y16_Q30d_r.
VARIABLE LABELS Y16_Q30a_r 'Attended a meeting of a trade union, a political party or political action group_recoded'.
VARIABLE LABELS Y16_Q30b_r 'Attended a protest or demonstration_recoded'.
VARIABLE LABELS Y16_Q30c_r 'Signed a petition, including an e-mail or on-line petition_recoded'.
VARIABLE LABELS Y16_Q30d_r 'Contacted a politician or public official_recoded'.
VARIABLE LABELS Y16_Q30e_r 'Boycotted certain products_recoded'.
VARIABLE LEVEL Y16_Q30a_r Y16_Q30b_r Y16_Q30c_r Y16_Q30d_r Y16_Q30e_r (NOMINAL).

* switching the scale because more should be "better" than less 

RECODE Y16_Q88 (1=6) (2=5) (3=4) (4=3) (5=2) (6=1) (else=copy) into Y16_Q88_r.
VALUE LABELS Y16_Q88_r 6 'Very easily' 5 'Easily' 4 'Fairly easily' 3 'With some difficulty' 2 'With difficulty' 1 'With great difficulty'.
MISSING VALUES Y16_Q88_r  (98 THRU HIGHEST).
CROSSTABS Y16_Q88 by Y16_Q88_r /cells count /missing include.
VARIABLE LABELS Y16_Q88_r 'Making ends meet_recoded'.
VARIABLE LEVEL Y16_Q88_r (SCALE).

RECODE Y16_Q55a Y16_Q55b Y16_Q36e (1=5) (2=4) (3=3) (4=2) (5=1) (else=copy) into Y16_Q55a_r Y16_Q55b_r Y16_Q36e_r.
VALUE LABELS Y16_Q55a_r 5 Y16_Q55b_r Y16_Q36e_r 5 'Strongly agree' 4 'Agree' 3 'Neither agree nor disagree' 2 'Disagree' 1 'Strongly disagree'.
MISSING VALUES Y16_Q55a_r Y16_Q55b_r Y16_Q36e_r (98 THRU HIGHEST).
CROSSTABS Y16_Q55a by Y16_Q55a_r /cells count /missing include.
VARIABLE LABELS Y16_Q55a_r 'I feel safe when I walk alone after dark_recoded'.
VARIABLE LABELS Y16_Q55b_r 'I feel safe from crime when I am at home alone at night_recoded'.
VARIABLE LABELS Y16_Q36e_r 'I feel close to people in the area where I live_recoded'.
VARIABLE LEVEL Y16_Q55a_r Y16_Q55b_r Y16_Q36e_r (SCALE).

RECODE Y16_Q29a Y16_Q29b Y16_Q29c Y16_Q40b (1=4) (2=3) (3=2) (4=1) (else=copy) into Y16_Q29a_r Y16_Q29b_r Y16_Q29c_r Y16_Q40b_rnew.
VALUE LABELS Y16_Q29a_r Y16_Q29b_r Y16_Q29c_r 4 'Every week' 3 'Every month' 2 'Less often/occasionally' 1 'Not at all'.
VALUE LABELS Y16_Q40b_rnew 4 'A member of your family / relative' 3 'A friend, neighbour, or someone else, who does not belong to your family or relatives' 2 'A service provider, institution or organisation' 1 'Nobody'.
MISSING VALUES Y16_Q29a_r Y16_Q29b_r Y16_Q29c_r Y16_Q40b_rnew (98 THRU HIGHEST).
CROSSTABS Y16_Q29a by Y16_Q29a_r /cells count /missing include.
VARIABLE LABELS Y16_Q29a_r 'Unpaid Volunteering: community and social services_recoded'.
VARIABLE LABELS Y16_Q29b_r 'Unpaid Volunteering: ducational, cultural, sports or professional associations_recoded'.
VARIABLE LABELS Y16_Q29c_r 'Unpaid Volunteering: social movements_recoded'.
VARIABLE LABELS Y16_Q40b_rnew 'Support if you needed advice about a serious personal or family matters_recoded_new'.
VARIABLE LEVEL Y16_Q29a_r Y16_Q29b_r Y16_Q29c_r Y16_Q40b_rnew (SCALE).

RECODE Y16_Q38a Y16_Q38b Y16_Q39a Y16_Q39b (1=5) (2=4) (3=3) (4=2) (5=1) (else=copy) into Y16_Q38a_r Y16_Q38b_r Y16_Q39a_r Y16_Q39b_r.
VALUE LABELS Y16_Q38a_r Y16_Q38b_r Y16_Q39a_r Y16_Q39b_r 5 'Every day or almost every day' 4 'At least once a week' 3 'One to three times a month' 2 'Less often' 1 'Never'.
MISSING VALUES Y16_Q38a_r Y16_Q38b_r Y16_Q39a_r Y16_Q39b_r (97 THRU HIGHEST).
CROSSTABS Y16_Q38a by Y16_Q38a_r /cells count /missing include.
VARIABLE LABELS Y16_Q38a_r 'Face-to-face contact with family members or relatives_recoded'.
VARIABLE LABELS Y16_Q38b_r 'Face-to-face contact with friends or neighbours_recoded'.
VARIABLE LABELS Y16_Q39a_r 'Phone/internet contact with family members or relatives_recoded'.
VARIABLE LABELS Y16_Q39b_r 'Phone/internet contact with friends or neighbours_recoded'.
VARIABLE LEVEL Y16_Q38a_r Y16_Q38b_r Y16_Q39a_r Y16_Q39b_r (SCALE).

RECODE Y16_Q42d Y16_Q42e (1=5) (2=4) (3=3) (4=2) (5=1) (else=copy) into Y16_Q42d_r Y16_Q42e_r.
VALUE LABELS Y16_Q42d_r Y16_Q42e_r 5 'Every day' 4 'Several days a week' 3 'Once or twice a week' 2 'Less often' 1 'Never'.
MISSING VALUES Y16_Q42d_r Y16_Q42e_r (97 THRU HIGHEST).
CROSSTABS Y16_Q42e by Y16_Q42e_r /cells count /missing include.
VARIABLE LABELS Y16_Q42d_r 'Frequency caring for disabled or infirm family members, neighbours or friends un_recoded'.
VARIABLE LABELS Y16_Q42e_r 'Frequency caring for disabled or infirm family members, neighbours or friends ag_recoded'.
VARIABLE LEVEL Y16_Q42d_r Y16_Q42e_r (SCALE).

FORMATS Y16_Q40b_r Y16_Q34a_r Y16_Q34e_r Y16_Q34f_r Y16_Q30a_r Y16_Q30b_r Y16_Q30c_r Y16_Q30d_r Y16_Q30e_r Y16_Q88_r Y16_Q55a_r Y16_Q29a_r Y16_Q40b_rnew 
    Y16_Q55b_r Y16_Q38a_r Y16_Q38b_r Y16_Q39a_r Y16_Q39b_r Y16_Q36e_r Y16_Q42d_r Y16_Q42e_r Y16_Q29b_r Y16_Q29c_r Y16_Q34a_rnew Y16_Q34e_rnew Y16_Q34f_rnew (f7.0).

* missings

MISSING VALUES  Y16_Q52b Y16_Q35a Y16_Q35b Y16_Q35d Y16_Q35g Y16_Q34a Y16_Q34e Y16_Q34f (98 THRU HIGHEST).

* final control of indicators

FREQUENCIES VARIABLES=Y16_Q52b Y16_Q40b_r Y16_Q34a_r Y16_Q34e_r Y16_Q34f_r Y16_Q34a_rnew Y16_Q34e_rnew Y16_Q34f_rnew Y16_Q30a_r Y16_Q30b_r Y16_Q30c_r Y16_Q30d_r Y16_Q30e_r Y16_Q88_r 
  Y16_Q55a_r Y16_Q55b_r Y16_Q29a_r Y16_Q29b_r Y16_Q29c_r Y16_Q40b_rnew Y16_Q35a Y16_Q35b Y16_Q35d Y16_Q35g Y16_Q36e_r Y16_Q38a_r Y16_Q38b_r Y16_Q39a_r 
  Y16_Q39b_r Y16_Q42d_r Y16_Q42e_r 
  /STATISTICS=STDDEV MINIMUM MAXIMUM MEAN MEDIAN MODE
  /HISTOGRAM NORMAL
  /ORDER=ANALYSIS.

* next step: adapt some semantically similar but different scales to the ones of ESS

*COMPUTE Y16_Q35a_lt=(Y16_Q35a - 1) / 9 * 10.
*EXECUTE.
*COMPUTE Y16_Q35b_lt=(Y16_Q35b - 1) / 9 * 10.
*EXECUTE.
*COMPUTE Y16_Q35d_lt=(Y16_Q35d - 1) / 9 * 10.
*EXECUTE.

*DESCRIPTIVES VARIABLES=Y16_Q35a Y16_Q35b Y16_Q35d Y16_Q35a_r Y16_Q35b_r Y16_Q35d_r
  /STATISTICS=MEAN STDDEV MIN MAX.

*VARIABLE LABELS Y16_Q35a_lt 'Trust in parliament_transformed'.
*VARIABLE LABELS Y16_Q35b_lt 'Trust in the legal system_transformed'.
*VARIABLE LABELS Y16_Q35d_lt 'Trust in the police_transformed'.

*COMPUTE Y16_Q88_lt=((Y16_Q88_r - 1) * (3 / 5)) + 1.
*EXECUTE.

*DESCRIPTIVES VARIABLES=Y16_Q88_lt Y16_Q88_r
  /STATISTICS=MEAN STDDEV MIN MAX.

*VARIABLE LABELS Y16_Q88_lt 'Making ends meet_transformed'.

**********************************
* Preparation for aggregation
1. Control once again the previous steps
2. Safe two data sets with all the relevant variables to COUNTRY or NUTS-1 region.

*country level: 
    
SAVE OUTFILE='C:\Users\chartz\OneDrive - Jacobs University\Paper 2\EQSL_2016\EQSL_2016_country_4.sav'
  /DROP=Y16_uniqueid Wave EU28 Design_Weight WCalib WCalib_crossnational_EU28 Wcalib_crossnational_total Final_grossing_weight Y16_Degurba Y16_Region Y16_Language Y16_HH1 Y16_HH2a Y16_HH2b Y16_HH2d Y16_HH3a_2 Y16_HH3b_2 Y16_HH3c_2 Y16_HH3d_2 Y16_HH3a_3 Y16_HH3b_3 Y16_HH3c_3 Y16_HH3d_3 Y16_HH3a_4 Y16_HH3b_4 Y16_HH3c_4 Y16_HH3d_4 Y16_HH3a_5 Y16_HH3b_5 Y16_HH3c_5 Y16_HH3d_5 Y16_HH3a_6 Y16_HH3b_6 Y16_HH3c_6 Y16_HH3d_6 Y16_HH3a_7 Y16_HH3b_7 Y16_HH3c_7 Y16_HH3d_7 Y16_HH3a_8 Y16_HH3b_8 Y16_HH3c_8 Y16_HH3d_8 Y16_HH3a_9 Y16_HH3b_9 Y16_HH3c_9 Y16_HH3d_9 Y16_HH3a_10 Y16_HH3b_10 Y16_HH3c_10 Y16_HH3d_10 Y16_Q1 Y16_Q2 Y16_Q3 Y16_Q4 Y16_Q5 Y16_Q6a Y16_Q6b Y16_Q6c Y16_Q6d Y16_Q6e Y16_Q6f Y16_Q7a Y16_Q7b Y16_Q7c Y16_Q7d Y16_Q7e Y16_Q7f Y16_Q7g Y16_Q8 Y16_Q9 Y16_Q10 Y16_Q11 Y16_Q12 Y16_Q13 Y16_Q14 Y16_Q15 Y16_Q16 Y16_Q17 Y16_Q18 Y16_Q19 Y16_Q20a Y16_Q20b Y16_Q20c Y16_Q21 Y16_Q22 Y16_Q23 Y16_Q24 Y16_Q25a Y16_Q25b Y16_Q25c Y16_Q25d Y16_Q25e Y16_Q25f Y16_Q26 Y16_Q27a Y16_Q27b Y16_Q27c Y16_Q27d Y16_Q28a Y16_Q28b Y16_Q29a Y16_Q29d Y16_Q29e Y16_Q30a Y16_Q30b Y16_Q30c Y16_Q30d Y16_Q30e Y16_Q30f Y16_Q31 Y16_Q32 Y16_Q33 Y16_Q34a Y16_Q34b Y16_Q34c Y16_Q34d Y16_Q34e Y16_Q34f Y16_Q34g Y16_Q35c Y16_Q35e Y16_Q35f Y16_Q35h Y16_Q36a Y16_Q36b Y16_Q36c Y16_Q36d Y16_Q37 Y16_Q40a Y16_Q40b Y16_Q40c Y16_Q40d Y16_Q40e Y16_Q40f Y16_Q41 Y16_Q42a Y16_Q42b Y16_Q42c Y16_Q42d Y16_Q42e Y16_Q43a Y16_Q43b Y16_Q43c Y16_Q43d Y16_Q43e Y16_Q44 Y16_Q45 Y16_Q46 Y16_Q47a Y16_Q47b Y16_Q47c Y16_Q47d Y16_Q47e Y16_Q47f Y16_Q48 Y16_Q49 Y16_Q50 Y16_Q51a Y16_Q51b Y16_Q51c Y16_Q51d Y16_Q51e Y16_Q52a Y16_Q52c Y16_Q53 Y16_Q54a Y16_Q54b Y16_Q54c Y16_Q54d Y16_Q55a Y16_Q55b Y16_Q56a Y16_Q56b Y16_Q56c Y16_Q56d Y16_Q56e Y16_Q56f Y16_Q57 Y16_Q58a Y16_Q58b Y16_Q58c Y16_Q58d Y16_Q58e Y16_Q58f Y16_Q58g Y16_Q59a Y16_Q59b Y16_Q60a Y16_Q60b Y16_Q60c Y16_Q60d Y16_Q60e Y16_Q60a_1 Y16_Q60a_2 Y16_Q60a_3 Y16_Q60b_1 Y16_Q60b_2 Y16_Q60b_3 Y16_Q60c_1 Y16_Q60c_2 Y16_Q60c_3 Y16_Q60d_1 Y16_Q60d_2 Y16_Q60d_3 Y16_Q60e_1 Y16_Q60e_2 Y16_Q60e_3 Y16_Q61a Y16_Q61b Y16_Q61c Y16_Q61d Y16_Q61e Y16_Q62a Y16_Q62b Y16_Q62c Y16_Q62d Y16_Q63a Y16_Q63b Y16_Q64a Y16_Q64b Y16_Q65a Y16_Q65b Y16_Q65c Y16_Q65d Y16_Q64c Y16_Q64d Y16_Q66a Y16_Q66b Y16_Q67a Y16_Q67b Y16_Q67c Y16_Q67d Y16_Q67e Y16_Q68a Y16_Q68b Y16_Q68c Y16_Q68a_1 Y16_Q68a_2 Y16_Q68a_3 Y16_Q68b_1 Y16_Q68b_2 Y16_Q68b_3 Y16_Q68c_1 Y16_Q68c_2 Y16_Q68c_3 Y16_Q69a Y16_Q69b Y16_Q69c Y16_Q70a Y16_Q70b Y16_Q70c Y16_Q71 Y16_Q72 Y16_Q73a Y16_Q73b Y16_Q73c Y16_Q73d Y16_Q74 Y16_Q75a Y16_Q75b Y16_Q76a_1 Y16_Q76a_2 Y16_Q76a_3 Y16_Q76b_1 Y16_Q76b_2 Y16_Q76b_3 Y16_Q77_1 Y16_Q77_2 Y16_Q77_3 Y16_Q77_4 Y16_Q78 Y16_Q79 Y16_Q80 Y16_Q81a Y16_Q81b Y16_Q81c Y16_Q81d Y16_Q81e Y16_Q82 Y16_Q83a Y16_Q83b Y16_Q84_1 Y16_Q84_2 Y16_Q84_3 Y16_Q84_4 Y16_Q85a Y16_Q85b Y16_Q85c Y16_Q85d Y16_Q85e Y16_Q86a Y16_Q86b Y16_Q87 Y16_ISCED Y16_Q88 Y16_Q89a Y16_Q89b Y16_Q89c Y16_Q89d Y16_Q89e Y16_Q89f Y16_Q90a Y16_Q90b Y16_Q91a Y16_Q91b Y16_Q92_1 Y16_Q92_2 Y16_Q92_3 Y16_Q92_4 Y16_Q93a Y16_Q93b Y16_Q93c Y16_Q93d Y16_Q93e Y16_Q94a Y16_Q94b Y16_Q94c Y16_Q94d Y16_Q94e Y16_Q94f Y16_Q94g Y16_Q94h Y16_Q94i Y16_Q94j Y16_Q95 Y16_Q96_euro Y16_Q97A Y16_Q97B Y16_Q97C Y16_Q98 Y16_Q99 Y16_Q100 Y16_Q101 Y16_Q102 Y16_Q103a Y16_Q103b Y16_Q103c Y16_Q103d Y16_Q104a Y16_Q104b Y16_Agegroup Y16_Adults_Total Y16_Children_Total Y16_Education_3categories Y16_Empstatus_8categories_TREND Y16_Income_Equivalised Y16_income_quartiles Y16_SocExIndex Y16_WHO5_MWIndex Y16_Deprindex Y16_PublicServicesIndex Austria Belgium Bulgaria Cyprus CzechRepublic Germany Denmark Estonia Greece Spain Finland France Croatia Hungary Ireland Italy Lithuania Luxembourg Latvia Malta Netherlands Poland Portugal Romania Sweden Slovenia Slovakia UK Albania Iceland Kosovo FYRMacedonia Montenegro Norway Serbia Turkey eastern_europe employed unemployed unable retired homemaker student other age_3groups lowest_quartile second_quartile third_quartile highest_quartile missing_income chronic_healthproblem chronic_limiting_healthproblem bad_health haspartner haschild child_sum minor_sum minorchild_sum hhstructure single couple single_parent couple_parent other_household carer_child_grandchild carer_longterm carer_child_grandchild_frequent carer_longterm_frequent large_family everyday_facetoface everyday_phone housework_daily housework_over14hours sport_weekly internet_daily commute_45min Lower_education Secondary_education Higher_education education_traditional_3cat urb_subjective born_EU firstgen_migrant firstgen_migrant_EU firstgen_migrant_NONEU secondgen_migrant secondgen_migrant_both volunteers_ever volunteers_frequently risk_depression Y11_Q2 Y11_Q7c Y11_Q10 Y11_Q13a Y11_Q13b Y11_Q13c Y11_Q14a Y11_Q14b Y11_Q14c Y11_Q14d Y11_Q18 Y11_Q19f Y11_Q20 Y11_Q26 Y11_Q27a Y11_Q27b Y11_Q27c Y11_Q29a Y11_Q31 Y11_Q32 Y11_Q33a Y11_Q33b Y11_Q33c Y11_Q34a Y11_Q34b Y11_Q34c Y11_Q36a Y11_Q36c Y11_Q37a Y11_Q37c Y11_Q38 Y11_Q40f Y11_Q40g Y11_Q40h Y11_Q48 Y11_ISCEDfull Y11_ISCEDsimple Y11_Q50c Y11_Q50d Y11_Q51a Y11_Q54a_1 Y11_Q54a_2 Y11_Q54a_3 Y11_Q54a_4 Y11_Q54a_5 Y11_Q54b_1 Y11_Q54b_2 Y11_Q54b_3 Y11_Q54b_4 Y11_Q54b_5 Y11_Q55a Y11_Q55b Y11_Q55c Y11_Q55d Y11_Q56a Y11_Q56b Y11_Q56c Y11_Q56d Y11_Q57 Y11_Q61d Y11_Q61e Y11_Q61f Y11_Q64 Y11_Q66 Y11_Q67_1 Y11_Q67_2 Y11_Q67_3 Y11_Q67_4 Y11_Q67_5 Y11_Region Y11_Stratificationcode Y11_w5_total Y07_Q2 Y07_Q3 Y07_Q5 Y07_Q10_1 Y07_Q10_2 Y07_Q10_3 Y07_Q10_4 Y07_Q10_5 Y07_Q10_6 Y07_Q10_7 Y07_Q12 Y07_Q13 Y07_Q14 Y07_Q20_2 Y07_Q21 Y07_Q22 Y07_Q24_1 Y07_Q24_2 Y07_Q24_3 Y07_Q27_6 Y07_Q28_2 Y07_Q28_3 Y07_Q32_1 Y07_Q32_2 Y07_Q32_3 Y07_Q32_4 Y07_Q33_1 Y07_Q33_2 Y07_Q33_3 Y07_Q33_4 Y07_Q34 Y07_Q35_1 Y07_Q35_2 Y07_Q35_3 Y07_Q35_4 Y07_Q35_5 Y07_Q36_1 Y07_Q36_4 Y07_CVq37a Y07_CVq37d Y07_Q39_1 Y07_Q39_2 Y07_Q39_3 Y07_Q39_4 Y07_Q39_5 Y07_Q41_1 Y07_Q41_2 Y07_Q41_3 Y07_Q41_4 Y07_Q41_5 Y07_Q41_6 Y07_Q41_7 Y07_CV6465REC Y07_CVq48 Y07_Q50 Y07_Q51 Y07_Q53 Y07_Q54_1 Y07_Q54_2 Y07_Q54_3 Y07_Q54_4 Y07_Q54_5 Y07_Q54_6 Y07_Q55_1 Y07_Q55_2 Y07_Q55_3 Y07_Q55_4 Y07_Q55_5 Y07_Q55_6 Y07_Q56_5 Y07_Q59 Y07_Q60 Y07_Q61 Y07_Q62 Y07_Q63 Y07_Q65 Y07_Q68 Y07_Q69 Y07_Q70 Y07_Q71 Y07_regionEF Y07_regionNUTS2EF Y07_regdevcodeEF Y07_devcodeEU15EF Y07_devcodeNMS12EF Y03_Q5 Y03_Q6 Y03_Q8 Y03_Q16 Y03_Q21a Y03_Q21b Y03_Q21c Y03_Q22a Y03_Q22b_1 Y03_Q22b_2 Y03_Q22b_3 Y03_Q23a Y03_Q23b Y03_Q24a Y03_Q25 Y03_Q26 Y03_Q27a Y03_Q27b Y03_Q30a Y03_Q30b Y03_Q30c Y03_Q30d Y03_Q30e Y03_Q35 Y03_Q36a Y03_Q36b Y03_Q36c Y03_Q36d Y03_Q37a Y03_Q37b Y03_Q37c Y03_Q38a Y03_Q38b Y03_Q38c Y03_Q40e Y03_Q43 Y03_Q44 Y03_Q47 Y03_Q48 Y03_Q49 Y03_Q50 Y03_Q54d Y03_Q56d Y03_Q57 Y03_Q64a Y03_Q65 Y03_s_respnr Y03_s_cntry Y03_EU28wt Y03_EU15wt Y03_AC10wt Y03_CC13wt Y03_EU25wt Y03_CC3wt filter__
  /COMPRESSED.

* NUTS level:
    
*SAVE OUTFILE='C:\Users\chartz\OneDrive - Jacobs University\Paper 2\EQSL_2016\\EQSL_2016_NUTS.sav'
  /DROP=Y16_uniqueid Wave Y16_Country EU28 Design_Weight WCalib WCalib_crossnational_EU28 Wcalib_crossnational_total Final_grossing_weight Y16_Degurba Y16_Language Y16_HH1 Y16_HH2a Y16_HH2b Y16_HH2d Y16_HH3a_2 Y16_HH3b_2 Y16_HH3c_2 Y16_HH3d_2 Y16_HH3a_3 Y16_HH3b_3 Y16_HH3c_3 Y16_HH3d_3 Y16_HH3a_4 Y16_HH3b_4 Y16_HH3c_4 Y16_HH3d_4 Y16_HH3a_5 Y16_HH3b_5 Y16_HH3c_5 Y16_HH3d_5 Y16_HH3a_6 Y16_HH3b_6 Y16_HH3c_6 Y16_HH3d_6 Y16_HH3a_7 Y16_HH3b_7 Y16_HH3c_7 Y16_HH3d_7 Y16_HH3a_8 Y16_HH3b_8 Y16_HH3c_8 Y16_HH3d_8 Y16_HH3a_9 Y16_HH3b_9 Y16_HH3c_9 Y16_HH3d_9 Y16_HH3a_10 Y16_HH3b_10 Y16_HH3c_10 Y16_HH3d_10 Y16_Q1 Y16_Q2 Y16_Q3 Y16_Q4 Y16_Q5 Y16_Q6a Y16_Q6b Y16_Q6c Y16_Q6d Y16_Q6e Y16_Q6f Y16_Q7a Y16_Q7b Y16_Q7c Y16_Q7d Y16_Q7e Y16_Q7f Y16_Q7g Y16_Q8 Y16_Q9 Y16_Q10 Y16_Q11 Y16_Q12 Y16_Q13 Y16_Q14 Y16_Q15 Y16_Q16 Y16_Q17 Y16_Q18 Y16_Q19 Y16_Q20a Y16_Q20b Y16_Q20c Y16_Q21 Y16_Q22 Y16_Q23 Y16_Q24 Y16_Q25a Y16_Q25b Y16_Q25c Y16_Q25d Y16_Q25e Y16_Q25f Y16_Q26 Y16_Q27a Y16_Q27b Y16_Q27c Y16_Q27d Y16_Q28a Y16_Q28b Y16_Q29b Y16_Q29c Y16_Q29d Y16_Q29e Y16_Q30a Y16_Q30b Y16_Q30c Y16_Q30d Y16_Q31 Y16_Q32 Y16_Q33 Y16_Q34a Y16_Q34b Y16_Q34c Y16_Q34d Y16_Q34e Y16_Q34f Y16_Q34g Y16_Q35c Y16_Q35e Y16_Q35f Y16_Q35h Y16_Q36a Y16_Q36b Y16_Q36c Y16_Q36d Y16_Q36e Y16_Q37 Y16_Q38a Y16_Q38b Y16_Q39a Y16_Q39b Y16_Q40a Y16_Q40b Y16_Q40c Y16_Q40d Y16_Q40e Y16_Q40f Y16_Q41 Y16_Q42a Y16_Q42b Y16_Q42c Y16_Q42d Y16_Q42e Y16_Q43a Y16_Q43b Y16_Q43c Y16_Q43d Y16_Q43e Y16_Q44 Y16_Q45 Y16_Q46 Y16_Q47a Y16_Q47b Y16_Q47c Y16_Q47d Y16_Q47e Y16_Q47f Y16_Q48 Y16_Q49 Y16_Q50 Y16_Q51a Y16_Q51b Y16_Q51c Y16_Q51d Y16_Q51e Y16_Q52a Y16_Q52c Y16_Q53 Y16_Q54a Y16_Q54b Y16_Q54c Y16_Q54d Y16_Q55a Y16_Q55b Y16_Q56a Y16_Q56b Y16_Q56c Y16_Q56d Y16_Q56e Y16_Q56f Y16_Q57 Y16_Q58a Y16_Q58b Y16_Q58c Y16_Q58d Y16_Q58e Y16_Q58f Y16_Q58g Y16_Q59a Y16_Q59b Y16_Q60a Y16_Q60b Y16_Q60c Y16_Q60d Y16_Q60e Y16_Q60a_1 Y16_Q60a_2 Y16_Q60a_3 Y16_Q60b_1 Y16_Q60b_2 Y16_Q60b_3 Y16_Q60c_1 Y16_Q60c_2 Y16_Q60c_3 Y16_Q60d_1 Y16_Q60d_2 Y16_Q60d_3 Y16_Q60e_1 Y16_Q60e_2 Y16_Q60e_3 Y16_Q61a Y16_Q61b Y16_Q61c Y16_Q61d Y16_Q61e Y16_Q62a Y16_Q62b Y16_Q62c Y16_Q62d Y16_Q63a Y16_Q63b Y16_Q64a Y16_Q64b Y16_Q65a Y16_Q65b Y16_Q65c Y16_Q65d Y16_Q64c Y16_Q64d Y16_Q66a Y16_Q66b Y16_Q67a Y16_Q67b Y16_Q67c Y16_Q67d Y16_Q67e Y16_Q68a Y16_Q68b Y16_Q68c Y16_Q68a_1 Y16_Q68a_2 Y16_Q68a_3 Y16_Q68b_1 Y16_Q68b_2 Y16_Q68b_3 Y16_Q68c_1 Y16_Q68c_2 Y16_Q68c_3 Y16_Q69a Y16_Q69b Y16_Q69c Y16_Q70a Y16_Q70b Y16_Q70c Y16_Q71 Y16_Q72 Y16_Q73a Y16_Q73b Y16_Q73c Y16_Q73d Y16_Q74 Y16_Q75a Y16_Q75b Y16_Q76a_1 Y16_Q76a_2 Y16_Q76a_3 Y16_Q76b_1 Y16_Q76b_2 Y16_Q76b_3 Y16_Q77_1 Y16_Q77_2 Y16_Q77_3 Y16_Q77_4 Y16_Q78 Y16_Q79 Y16_Q80 Y16_Q81a Y16_Q81b Y16_Q81c Y16_Q81d Y16_Q81e Y16_Q82 Y16_Q83a Y16_Q83b Y16_Q84_1 Y16_Q84_2 Y16_Q84_3 Y16_Q84_4 Y16_Q85a Y16_Q85b Y16_Q85c Y16_Q85d Y16_Q85e Y16_Q86a Y16_Q86b Y16_Q87 Y16_ISCED Y16_Q88 Y16_Q89a Y16_Q89b Y16_Q89c Y16_Q89d Y16_Q89e Y16_Q89f Y16_Q90a Y16_Q90b Y16_Q91a Y16_Q91b Y16_Q92_1 Y16_Q92_2 Y16_Q92_3 Y16_Q92_4 Y16_Q93a Y16_Q93b Y16_Q93c Y16_Q93d Y16_Q93e Y16_Q94a Y16_Q94b Y16_Q94c Y16_Q94d Y16_Q94e Y16_Q94f Y16_Q94g Y16_Q94h Y16_Q94i Y16_Q94j Y16_Q95 Y16_Q96_euro Y16_Q97A Y16_Q97B Y16_Q97C Y16_Q98 Y16_Q99 Y16_Q100 Y16_Q101 Y16_Q102 Y16_Q103a Y16_Q103b Y16_Q103c Y16_Q103d Y16_Q104a Y16_Q104b Y16_Agegroup Y16_Adults_Total Y16_Children_Total Y16_Education_3categories Y16_Empstatus_8categories_TREND Y16_Income_Equivalised Y16_income_quartiles Y16_SocExIndex Y16_WHO5_MWIndex Y16_Deprindex Y16_PublicServicesIndex Austria Belgium Bulgaria Cyprus CzechRepublic Germany Denmark Estonia Greece Spain Finland France Croatia Hungary Ireland Italy Lithuania Luxembourg Latvia Malta Netherlands Poland Portugal Romania Sweden Slovenia Slovakia UK Albania Iceland Kosovo FYRMacedonia Montenegro Norway Serbia Turkey eastern_europe employed unemployed unable retired homemaker student other age_3groups lowest_quartile second_quartile third_quartile highest_quartile missing_income chronic_healthproblem chronic_limiting_healthproblem bad_health haspartner haschild child_sum minor_sum minorchild_sum hhstructure single couple single_parent couple_parent other_household carer_child_grandchild carer_longterm carer_child_grandchild_frequent carer_longterm_frequent large_family everyday_facetoface everyday_phone housework_daily housework_over14hours sport_weekly internet_daily commute_45min Lower_education Secondary_education Higher_education education_traditional_3cat urb_subjective born_EU firstgen_migrant firstgen_migrant_EU firstgen_migrant_NONEU secondgen_migrant secondgen_migrant_both volunteers_ever volunteers_frequently risk_depression Y11_Q2 Y11_Q7c Y11_Q10 Y11_Q13a Y11_Q13b Y11_Q13c Y11_Q14a Y11_Q14b Y11_Q14c Y11_Q14d Y11_Q18 Y11_Q19f Y11_Q20 Y11_Q26 Y11_Q27a Y11_Q27b Y11_Q27c Y11_Q29a Y11_Q31 Y11_Q32 Y11_Q33a Y11_Q33b Y11_Q33c Y11_Q34a Y11_Q34b Y11_Q34c Y11_Q36a Y11_Q36c Y11_Q37a Y11_Q37c Y11_Q38 Y11_Q40f Y11_Q40g Y11_Q40h Y11_Q48 Y11_ISCEDfull Y11_ISCEDsimple Y11_Q50c Y11_Q50d Y11_Q51a Y11_Q54a_1 Y11_Q54a_2 Y11_Q54a_3 Y11_Q54a_4 Y11_Q54a_5 Y11_Q54b_1 Y11_Q54b_2 Y11_Q54b_3 Y11_Q54b_4 Y11_Q54b_5 Y11_Q55a Y11_Q55b Y11_Q55c Y11_Q55d Y11_Q56a Y11_Q56b Y11_Q56c Y11_Q56d Y11_Q57 Y11_Q61d Y11_Q61e Y11_Q61f Y11_Q64 Y11_Q66 Y11_Q67_1 Y11_Q67_2 Y11_Q67_3 Y11_Q67_4 Y11_Q67_5 Y11_Region Y11_Stratificationcode Y11_w5_total Y07_Q2 Y07_Q3 Y07_Q5 Y07_Q10_1 Y07_Q10_2 Y07_Q10_3 Y07_Q10_4 Y07_Q10_5 Y07_Q10_6 Y07_Q10_7 Y07_Q12 Y07_Q13 Y07_Q14 Y07_Q20_2 Y07_Q21 Y07_Q22 Y07_Q24_1 Y07_Q24_2 Y07_Q24_3 Y07_Q27_6 Y07_Q28_2 Y07_Q28_3 Y07_Q32_1 Y07_Q32_2 Y07_Q32_3 Y07_Q32_4 Y07_Q33_1 Y07_Q33_2 Y07_Q33_3 Y07_Q33_4 Y07_Q34 Y07_Q35_1 Y07_Q35_2 Y07_Q35_3 Y07_Q35_4 Y07_Q35_5 Y07_Q36_1 Y07_Q36_4 Y07_CVq37a Y07_CVq37d Y07_Q39_1 Y07_Q39_2 Y07_Q39_3 Y07_Q39_4 Y07_Q39_5 Y07_Q41_1 Y07_Q41_2 Y07_Q41_3 Y07_Q41_4 Y07_Q41_5 Y07_Q41_6 Y07_Q41_7 Y07_CV6465REC Y07_CVq48 Y07_Q50 Y07_Q51 Y07_Q53 Y07_Q54_1 Y07_Q54_2 Y07_Q54_3 Y07_Q54_4 Y07_Q54_5 Y07_Q54_6 Y07_Q55_1 Y07_Q55_2 Y07_Q55_3 Y07_Q55_4 Y07_Q55_5 Y07_Q55_6 Y07_Q56_5 Y07_Q59 Y07_Q60 Y07_Q61 Y07_Q62 Y07_Q63 Y07_Q65 Y07_Q68 Y07_Q69 Y07_Q70 Y07_Q71 Y07_regionEF Y07_regionNUTS2EF Y07_regdevcodeEF Y07_devcodeEU15EF Y07_devcodeNMS12EF Y03_Q5 Y03_Q6 Y03_Q8 Y03_Q16 Y03_Q21a Y03_Q21b Y03_Q21c Y03_Q22a Y03_Q22b_1 Y03_Q22b_2 Y03_Q22b_3 Y03_Q23a Y03_Q23b Y03_Q24a Y03_Q25 Y03_Q26 Y03_Q27a Y03_Q27b Y03_Q30a Y03_Q30b Y03_Q30c Y03_Q30d Y03_Q30e Y03_Q35 Y03_Q36a Y03_Q36b Y03_Q36c Y03_Q36d Y03_Q37a Y03_Q37b Y03_Q37c Y03_Q38a Y03_Q38b Y03_Q38c Y03_Q40e Y03_Q43 Y03_Q44 Y03_Q47 Y03_Q48 Y03_Q49 Y03_Q50 Y03_Q54d Y03_Q56d Y03_Q57 Y03_Q64a Y03_Q65 Y03_s_respnr Y03_s_cntry Y03_EU28wt Y03_EU15wt Y03_AC10wt Y03_CC13wt Y03_EU25wt Y03_CC3wt filter__
  /COMPRESSED.

****** Aggregation of data set ******
  
DATASET DECLARE aggr.
AGGREGATE
  /OUTFILE='aggr'
  /BREAK=Y16_Country
  /Y16_Q35a_mean=MEAN(Y16_Q35a) 
  /Y16_Q35b_mean=MEAN(Y16_Q35b) 
  /Y16_Q35d_mean=MEAN(Y16_Q35d) 
  /Y16_Q35g_mean=MEAN(Y16_Q35g) 
  /Y16_Q52b_mean=MEAN(Y16_Q52b) 
  /Y16_Q29a_r_mean=MEAN(Y16_Q29a_r) 
  /Y16_Q40b_r_mean=MEAN(Y16_Q40b_r) 
  /Y16_Q40b_rnew_mean=MEAN(Y16_Q40b_rnew) 
  /Y16_Q34a_mean=MEAN(Y16_Q34a) 
  /Y16_Q34e_mean=MEAN(Y16_Q34e) 
  /Y16_Q34f_mean=MEAN(Y16_Q34f)
  /Y16_Q34a_r_mean=MEAN(Y16_Q34a_r) 
  /Y16_Q34e_r_mean=MEAN(Y16_Q34e_r) 
  /Y16_Q34f_r_mean=MEAN(Y16_Q34f_r)
  /Y16_Q34a_rnew_mean=MEAN(Y16_Q34a_rnew) 
  /Y16_Q34e_rnew_mean=MEAN(Y16_Q34e_rnew) 
  /Y16_Q34f_rnew_mean=MEAN(Y16_Q34f_rnew)  
  /Y16_Q30a_r_mean=MEAN(Y16_Q30a_r) 
  /Y16_Q30b_r_mean=MEAN(Y16_Q30b_r) 
  /Y16_Q30c_r_mean=MEAN(Y16_Q30c_r) 
  /Y16_Q30d_r_mean=MEAN(Y16_Q30d_r) 
  /Y16_Q30e_r_mean=MEAN(Y16_Q30e_r) 
  /Y16_Q88_r_mean=MEAN(Y16_Q88_r) 
  /Y16_Q55a_r_mean=MEAN(Y16_Q55a_r) 
  /Y16_Q55b_r_mean=MEAN(Y16_Q55b_r) 
  /Y16_Q38a_r_mean=MEAN(Y16_Q38a_r) 
  /Y16_Q38b_r_mean=MEAN(Y16_Q38b_r) 
  /Y16_Q39a_r_mean=MEAN(Y16_Q39a_r) 
  /Y16_Q39b_r_mean=MEAN(Y16_Q39b_r) 
  /Y16_Q36e_r_mean=MEAN(Y16_Q36e_r) 
  /Y16_Q42d_r_mean=MEAN(Y16_Q42d_r) 
  /Y16_Q42e_r_mean=MEAN(Y16_Q42e_r) 
  /Y16_Q29b_r_mean=MEAN(Y16_Q29b_r) 
  /Y16_Q29c_r_mean=MEAN(Y16_Q29c_r).

* in aggr data file: 

RENAME VARIABLES (Y16_Country Y16_Q35a_mean Y16_Q35b_mean Y16_Q35d_mean Y16_Q35g_mean Y16_Q52b_mean 
  Y16_Q29a_r_mean Y16_Q40b_r_mean Y16_Q40b_rnew_mean Y16_Q34a_mean Y16_Q34e_mean Y16_Q34f_mean Y16_Q34a_r_mean Y16_Q34e_r_mean Y16_Q34f_r_mean Y16_Q34a_rnew_mean 
  Y16_Q34e_rnew_mean Y16_Q34f_rnew_mean Y16_Q30a_r_mean  Y16_Q30b_r_mean Y16_Q30c_r_mean Y16_Q30d_r_mean Y16_Q30e_r_mean Y16_Q88_r_mean Y16_Q55a_r_mean Y16_Q55b_r_mean
  Y16_Q38a_r_mean Y16_Q38b_r_mean Y16_Q39a_r_mean Y16_Q39b_r_mean Y16_Q36e_r_mean Y16_Q42d_r_mean Y16_Q42e_r_mean Y16_Q29b_r_mean Y16_Q29c_r_mean = 
  country d22_q35a_eqls_w5 d22_q35b_eqls_w5 d22_q35d_eqls_w5 d22_q35g_eqls_w5 d11_q52b_eqls_w5 d31_q29a_eqsl_w5 d11_sprtsrsmtr_eqls_w5 
  d11_sprtsrsmtr_new_eqls_w5 d23_q34a_original_eqls_w5 d13_q34e_original_eqls_w5 d13_q34f_original_eqls_w5 d23_q34a_eqls_w5 d13_q34e_eqls_w5 d13_q34f_eqls_w5 d23_q34a_new_eqls_w5 
  d13_q34e_new_eqls_w5 d13_q34f_new_eqls_w5 d33_q30a_eqls_w5 d33_q30b_eqls_w5 d33_q30c_eqls_w5 d33_q30d_eqls_w5 d33_q30e_eqls_w5 d23_q88_eqls_w5 d32_q55a_eqls_w5 d32_q55b_eqls_w5 
  d11_q38a_eqls_w5 d11_q38b_eqls_w5 d11_q39a_eqls_w5 d11_q39b_eqls_w5 d31_q42d_eqls_w5 d31_q42e_eqls_w5 d21_q36e_eqls_w5 d31_q29b_eqls_w5 d31_q29c_eqls_w5).

VARIABLE LABELS d22_q35a_eqls_w5 'Trust in parliament'.
VARIABLE LABELS d22_q35b_eqls_w5 'Trust in the legal system'.
VARIABLE LABELS d22_q35d_eqls_w5 'Trust in the police'.
VARIABLE LABELS d22_q35g_eqls_w5 'Trust in banks'.
VARIABLE LABELS d11_q52b_eqls_w5 'I have felt lonely'.
VARIABLE LABELS d31_q29a_eqsl_w5 'Unpaid Volunteering: community and social services_recoded'.
VARIABLE LABELS d11_sprtsrsmtr_eqls_w5 'Support if you needed advice about a serious personal or family matters_recoded'.
VARIABLE LABELS d11_sprtsrsmtr_new_eqls_w5 'Support if you needed advice about a serious personal or family matters_recoded_new'.
VARIABLE LABELS d23_q34a_original_eqls_w5 'Tension between poor and rich people_original'.
VARIABLE LABELS d13_q34e_original_eqls_w5 'Tension between different racial and ethnic groups_original'.
VARIABLE LABELS d13_q34f_original_eqls_w5 'Tension between different religious groups_original'.
VARIABLE LABELS d23_q34a_eqls_w5 'Tension between poor and rich people_recoded'.
VARIABLE LABELS d13_q34e_eqls_w5 'Tension between different racial and ethnic groups_recoded'.
VARIABLE LABELS d13_q34f_eqls_w5 'Tension between different religious groups_recoded'.
VARIABLE LABELS d23_q34a_new_eqls_w5 'Tension between poor and rich people_recoded_new'.
VARIABLE LABELS d13_q34e_new_eqls_w5 'Tension between different racial and ethnic groups_recoded_new'.
VARIABLE LABELS d13_q34f_new_eqls_w5 'Tension between different religious groups_recoded_new'.
VARIABLE LABELS d33_q30a_eqls_w5 'Attended a meeting of a trade union, a political party or political action group_recoded'.
VARIABLE LABELS d33_q30b_eqls_w5 'Attended a protest or demonstration_recoded'.
VARIABLE LABELS d33_q30c_eqls_w5 'Signed a petition, including an e-mail or online petition_recoded'.
VARIABLE LABELS d33_q30d_eqls_w5 'Contacted a politician or public official_recoded'.
VARIABLE LABELS d33_q30e_eqls_w5 'Boycotted certain products_recoded'.
VARIABLE LABELS d23_q88_eqls_w5 'Making ends meet_recoded'.
VARIABLE LABELS d32_q55a_eqls_w5 'I feel safe when I walk alone after dark_recoded'.
VARIABLE LABELS d32_q55b_eqls_w5 'I feel safe from crime when I am at home alone at night_recoded'.
VARIABLE LABELS d11_q38a_eqls_w5 'Face-to-face contact with family members or relatives_recoded'.
VARIABLE LABELS d11_q38b_eqls_w5 'Face-to-face contact with friends or neighbours_recoded'.
VARIABLE LABELS d11_q39a_eqls_w5 'Phone/internet contact with family members or relatives_recoded'.
VARIABLE LABELS d11_q39b_eqls_w5 'Phone/internet contact with friends or neighbours_recoded'.
VARIABLE LABELS d31_q42d_eqls_w5 'Frequency caring for disabled or infirm family members, neighbours or friends un_recoded'.
VARIABLE LABELS d31_q42e_eqls_w5 'Frequency caring for disabled or infirm family members, neighbours or friends ag_recoded'.
VARIABLE LABELS d21_q36e_eqls_w5 'I feel close to people in the area where I live_recoded'.
VARIABLE LABELS d31_q29b_eqls_w5 'Unpaid Volunteering: ducational, cultural, sports or professional associations_recoded'.
VARIABLE LABELS d31_q29c_eqls_w5 'Unpaid Volunteering: social movements_recoded'.

RECODE country 
    (1=40) 
    (2=56) 
    (3=100)
    (4=196)
    (5=203) 
    (6=276)
    (7=208)
    (8=233)
    (9=300)
    (10=724)
    (11=246)
    (12=250)
    (13=191)
    (14=348)
    (15=372)
    (16=380)
    (17=440)
    (18=442)
    (19=428)
    (20=470)
    (21=528)
    (22=616)
    (23=620)
    (24=642)
    (25=752)
    (26=705)
    (27=703)
    (28=826).
EXECUTE.

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
703 'SK'.

* recommended: safe data set ("_iso") in case you have to go back to string country code

* NUTS-1
* save it before

*DATASET DECLARE aggr.
*AGGREGATE
  /OUTFILE='aggr'
  /BREAK=Y16_Region
  /Y16_Q35a_mean=MEAN(Y16_Q35a) 
  /Y16_Q35b_mean=MEAN(Y16_Q35b) 
  /Y16_Q35d_mean=MEAN(Y16_Q35d) 
  /Y16_Q35g_mean=MEAN(Y16_Q35g) 
  /Y16_Q52b_mean=MEAN(Y16_Q52b) 
  /Y16_Q40b_r_mean=MEAN(Y16_Q40b_r) 
  /Y16_Q34a_r_mean=MEAN(Y16_Q34a_r) 
  /Y16_Q34e_r_mean=MEAN(Y16_Q34e_r) 
  /Y16_Q34f_r_mean=MEAN(Y16_Q34f_r) 
  /Y16_Q30d_r_mean=MEAN(Y16_Q30d_r) 
  /Y16_Q30a_r_mean=MEAN(Y16_Q30a_r) 
  /Y16_Q30b_r_mean=MEAN(Y16_Q30b_r) 
  /Y16_Q30c_r_mean=MEAN(Y16_Q30c_r) 
  /Y16_Q30e_r_mean=MEAN(Y16_Q30e_r)
  /Y16_Q88_r_mean=MEAN(Y16_Q88_r) 
  /Y16_Q55a_r_mean=MEAN(Y16_Q55a_r)
  /Y16_Q29a_r_mean=MEAN(Y16_Q29a_r).

* in aggr data file: 

*RENAME VARIABLES (Y16_Region Y16_Q35a_mean Y16_Q35b_mean Y16_Q35d_mean Y16_Q35g_mean Y16_Q52b_mean 
 Y16_Q40b_r_mean Y16_Q34a_r_mean Y16_Q34e_r_mean Y16_Q34f_r_mean Y16_Q30d_r_mean Y16_Q30a_r_mean
 Y16_Q30b_r_mean Y16_Q30e_r_mean Y16_Q30c_r_mean Y16_Q88_r_mean Y16_Q55a_r_mean Y16_Q29a_r_mean= country d22_q35a_eqls_w5
d22_q35b_eqls_w5 d22_q35d_eqls_w5 d22_q35g_eqls_w5 d11_q52b_eqls_w5 d11_sprtsrsmtr_eqls_w5 d23_q34a_eqls_w5
d13_q34e_eqls_w5 d13_q34f_eqls_w5 d33_q30d_eqls_w5 d33_q30e_eqls_w5 d33_q30a_eqls_w5 d33_q30b_eqls_w5 d33_q30c_eqls_w5
d23_q88_eqls_w5 d32_q55a_eqls_w5 d31_q29a_eqsl_w5).





