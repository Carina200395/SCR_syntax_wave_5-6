* Encoding: UTF-8.
* Summarize items to only "unique items"
* e.g. ESS 7 und ESS 8

COMPUTE d12_ppltrst_ess_w5=MEAN(d12_ppltrst_ess7_w5,d12_ppltrst_ess8_w5).
EXECUTE.
COMPUTE d12_pplfair_ess_w5=MEAN(d12_pplfair_ess7_w5,d12_pplfair_ess8_w5).
COMPUTE d12_pplhlp_ess_w5=MEAN(d12_pplhlp_ess7_w5,d12_pplhlp_ess8_w5).
COMPUTE d22_trstprl_ess_w5=MEAN(d22_trstprl_ess7_w5,d22_trstprl_ess8_w5).
COMPUTE d22_trstlgl_ess_w5=MEAN(d22_trstlgl_ess7_w5,d22_trstlgl_ess8_w5).
COMPUTE d22_trstplc_ess_w5=MEAN(d22_trstplc_ess7_w5,d22_trstplc_ess8_w5).
COMPUTE d22_trstprt_ess_w5=MEAN(d22_trstprt_ess7_w5,d22_trstprt_ess8_w5).
COMPUTE d13_imueclt_ess_w5=MEAN(d13_imueclt_ess7_w5,d13_imueclt_ess8_w5).
COMPUTE d11_sclmeet_ess_w5=MEAN(d11_sclmeet_ess7_w5,d11_sclmeet_ess8_w5).
COMPUTE d13_freehms_ess_w5=MEAN(d13_freehms_ess7_w5,d13_freehms_ess8_w5).
COMPUTE d23_gincdif_ess_w5=MEAN(d23_gincdif_ess7_w5,d23_gincdif_ess8_w5).
COMPUTE d23_hincfel_ess_w5=MEAN(d23_hincfel_ess7_w5,d23_hincfel_ess8_w5).
COMPUTE d33_mbtru_ess_w5=MEAN(d33_mbtru_ess7_w5,d33_mbtru_ess8_w5).
COMPUTE d33_wrkprty_ess_w5=MEAN(d33_wrkprty_ess7_w5,d33_wrkprty_ess8_w5).
COMPUTE d33_wrkorg_ess_w5=MEAN(d33_wrkorg_ess7_w5,d33_wrkorg_ess8_w5).
COMPUTE d33_sgnptit_ess_w5=MEAN(d33_sgnptit_ess7_w5,d33_sgnptit_ess8_w5).
COMPUTE d33_contplt_ess_w5=MEAN(d33_contplt_ess7_w5,d33_contplt_ess8_w5).
COMPUTE d33_badge_ess_w5=MEAN(d33_badge_ess7_w5,d33_badge_ess8_w5).
COMPUTE d33_pbldmn_ess_w5=MEAN(d33_pbldmn_ess7_w5,d33_pbldmn_ess8_w5).
COMPUTE d33_bctprd_ess_w5=MEAN(d33_bctprd_ess7_w5,d33_bctprd_ess8_w5).
COMPUTE d33_polintr_ess_w5=MEAN(d33_polintr_ess7_w5,d33_polintr_ess8_w5).
COMPUTE d32_ipfrule_ess_w5=MEAN(d32_ipfrule_ess7_w5,d32_ipfrule_ess8_w5).
COMPUTE d31_iphlppl_ess_w5=MEAN(d31_iphlppl_ess7_w5,d31_iphlppl_ess8_w5).
COMPUTE d11_inprdsc_ess_w5=MEAN(d11_inprdsc_ess7_w5,d11_inprdsc_ess8_w5).
COMPUTE d32_aesfdrk_ess_w5=MEAN(d32_aesfdrk_ess7_w5,d32_aesfdrk_ess8_w5).
EXECUTE.

DELETE VARIABLES
d12_ppltrst_ess7_w5
d12_pplfair_ess7_w5
d12_pplhlp_ess7_w5
d22_trstprl_ess7_w5
d22_trstlgl_ess7_w5
d22_trstplc_ess7_w5
d22_trstprt_ess7_w5
d13_imueclt_ess7_w5
d11_sclmeet_ess7_w5
d13_freehms_ess7_w5
d23_gincdif_ess7_w5
d23_hincfel_ess7_w5
d33_mbtru_ess7_w5
d33_wrkprty_ess7_w5
d33_wrkorg_ess7_w5
d33_sgnptit_ess7_w5
d33_badge_ess7_w5
d33_contplt_ess7_w5
d33_pbldmn_ess7_w5
d33_bctprd_ess7_w5
d33_polintr_ess7_w5
d32_ipfrule_ess7_w5
d31_iphlppl_ess7_w5
d11_inprdsc_ess7_w5
d32_aesfdrk_ess7_w5
d11_fltlnl_ess7_w5.

DELETE VARIABLES
d12_ppltrst_ess8_w5
d12_pplfair_ess8_w5
d12_pplhlp_ess8_w5
d22_trstprl_ess8_w5
d22_trstlgl_ess8_w5
d22_trstplc_ess8_w5
d22_trstprt_ess8_w5
d13_imueclt_ess8_w5
d11_sclmeet_ess8_w5
d13_freehms_ess8_w5
d23_gincdif_ess8_w5
d23_hincfel_ess8_w5
d33_mbtru_ess8_w5
d33_wrkprty_ess8_w5
d33_wrkorg_ess8_w5
d33_sgnptit_ess8_w5
d33_badge_ess8_w5
d33_contplt_ess8_w5
d33_pbldmn_ess8_w5
d33_bctprd_ess8_w5
d33_polintr_ess8_w5
d32_ipfrule_ess8_w5
d31_iphlppl_ess8_w5
d11_inprdsc_ess8_w5
d32_aesfdrk_ess8_w5.

RENAME VARIABLES (d21_atchctr_ess8_w5 d32_impsafe_ess8_w5 d21_fclcntr_ess7_w5 = d21_atchctr_ess_w5 d32_impsafe_ess_w5 d21_fclcntr_ess_w5).

VARIABLE LABELS d12_ppltrst_ess_w5 'Most people can be trusted or you cant be too careful'.
VARIABLE LABELS d12_pplfair_ess_w5 'Most people try to take advantage of you, or try to be fair'.
VARIABLE LABELS d12_pplhlp_ess_w5 'Most of the time people helpful or mostly looking out for themselves'.
VARIABLE LABELS d22_trstprl_ess_w5 'Trust in countrys parliament'.
VARIABLE LABELS d22_trstlgl_ess_w5 'Trust in the legal system'.
VARIABLE LABELS d22_trstplc_ess_w5 'Trust in the police'.
VARIABLE LABELS d22_trstprt_ess_w5 'Trust in political parties'.
VARIABLE LABELS d13_imueclt_ess_w5 'Countrys cultural life undermined or enriched by immigrants'.
VARIABLE LABELS d11_sclmeet_ess_w5 'How often socially meet with friends, relatives or colleagues'.
VARIABLE LABELS d13_freehms_ess_w5 'Gays and lesbians free to live life as they wish_recoded'.
VARIABLE LABELS d21_atchctr_ess_w5 'How emotionally attached to [country]'.
VARIABLE LABELS d23_gincdif_ess_w5 'Government should reduce differences in income levels_recoded'.
VARIABLE LABELS d23_hincfel_ess_w5 'Feeling about households income nowadays_recoded'.
VARIABLE LABELS d33_mbtru_ess_w5 'Member of trade union or similar organisation_recoded'.
VARIABLE LABELS d33_wrkprty_ess_w5 'Worked in political party or action group last 12 months_recoded'.
VARIABLE LABELS d33_wrkorg_ess_w5 'Worked in another organisation or association last 12 months_recoded'.
VARIABLE LABELS d33_sgnptit_ess_w5 'Signed petition last 12 months_recoded'.
VARIABLE LABELS d33_badge_ess_w5 'Worn or displayed campaign badge/sticker last 12 months_recoded'.
VARIABLE LABELS d33_contplt_ess_w5 'Contacted politician or government official last 12 months_recoded'.
VARIABLE LABELS d33_pbldmn_ess_w5 'Taken part in lawful public demonstration last 12 months_recoded'.
VARIABLE LABELS d33_bctprd_ess_w5 'Boycotted certain products last 12 months_recoded'.
VARIABLE LABELS d33_polintr_ess_w5 'How interested in politics_recoded'.
VARIABLE LABELS d32_ipfrule_ess_w5 'Important to do what is told and follow rules_recoded'.
VARIABLE LABELS d31_iphlppl_ess_w5 'Important to help people and care for others well-being_recoded'.
VARIABLE LABELS d32_impsafe_ess_w5 'Important to live in secure and safe surroundings_recoded'.
VARIABLE LABELS d11_inprdsc_ess_w5 'How many people with whom you can discuss intimate and personal matters'.
VARIABLE LABELS d32_aesfdrk_ess_w5 'Feeling of safety of walking alone in local area after dark_recoded'.

*CORRELATIONS
  /VARIABLES=d22_trstprl_ess_w5 d22_q35a_new_eqls_w5
  /PRINT=TWOTAIL NOSIG FULL
  /STATISTICS DESCRIPTIVES
  /MISSING=PAIRWISE.

*CORRELATIONS
  /VARIABLES=d22_trstlgl_ess_w5 d22_q35b_new_eqls_w5
  /PRINT=TWOTAIL NOSIG FULL
  /STATISTICS DESCRIPTIVES
  /MISSING=PAIRWISE.

*CORRELATIONS
  /VARIABLES=d22_trstplc_ess_w5 d22_q35d_new_eqls_w5
  /PRINT=TWOTAIL NOSIG FULL
  /STATISTICS DESCRIPTIVES
  /MISSING=PAIRWISE.

*COMPUTE d22_trstprl_ess_eqsl_lt_w5=MEAN(d22_trstprl_ess_w5,d22_q35a_new_eqls_w5).
*Execute.
*COMPUTE d22_trstprl_ess_eqsl_w5=MEAN(d22_trstprl_ess_w5,d22_q35a_eqls_w5).
*Execute.

*COMPUTE d22_trstlgl_ess_eqsl_lt_w5=MEAN(d22_trstlgl_ess_w5,d22_q35b_new_eqls_w5).
*Execute.
*COMPUTE d22_trstlgl_ess_eqsl_w5=MEAN(d22_trstlgl_ess_w5,d22_q35b_eqls_w5).
*Execute.

*COMPUTE d22_trstplc_ess_eqsl_lt_w5=MEAN(d22_trstplc_ess_w5,d22_q35d_new_eqls_w5).
*Execute.
*COMPUTE d22_trstplc_ess_eqsl_w5=MEAN(d22_trstplc_ess_w5,d22_q35d_eqls_w5).
*Execute.

*dont delete the _ess variables to see which one fits better
    
*DELETE VARIABLES
d22_q35a_eqls_w5
d22_q35b_eqls_w5
d22_q35d_eqls_w5.

*Test of Sameness
    * feeling lonely: .74**
   
CORRELATIONS
  /VARIABLES=d11_fltlnl_ess7_w5 d11_q52b_eqls_w5
  /PRINT=TWOTAIL NOSIG FULL
  /STATISTICS DESCRIPTIVES
  /MISSING=PAIRWISE.

    * feeling attached to country: .76**

CORRELATIONS
  /VARIABLES=d21_atchctr_ess8_w5 d21_fclcntr_ess7_w5
  /PRINT=TWOTAIL NOSIG FULL
  /STATISTICS DESCRIPTIVES
  /MISSING=PAIRWISE.
 
    * contacted a politician: .64**

CORRELATIONS
  /VARIABLES=d33_q30d_eqls_w5 d33_contplt_ess_w5
  /PRINT=TWOTAIL NOSIG FULL
  /STATISTICS DESCRIPTIVES
  /MISSING=PAIRWISE.

    * participated in demo: .76**

CORRELATIONS
  /VARIABLES=d33_pbldmn_ess_w5 d33_q30b_eqls_w5
  /PRINT=TWOTAIL NOSIG FULL
  /STATISTICS DESCRIPTIVES
  /MISSING=PAIRWISE.

    * signed a petition: .84**

CORRELATIONS
  /VARIABLES=d33_q30c_eqls_w5 d33_sgnptit_ess_w5
  /PRINT=TWOTAIL NOSIG FULL
  /STATISTICS DESCRIPTIVES
  /MISSING=PAIRWISE.

    * attended or member of trade union: .62**

CORRELATIONS
  /VARIABLES=d33_q30a_eqls_w5 d33_mbtru_ess_w5
  /PRINT=TWOTAIL NOSIG FULL
  /STATISTICS DESCRIPTIVES
  /MISSING=PAIRWISE.

    * attended a meeting of trade union and worked in political party or action group: .25 (ns)

CORRELATIONS
  /VARIABLES=d33_q30a_eqls_w5 d33_wrkprty_ess_w5
  /PRINT=TWOTAIL NOSIG FULL
  /STATISTICS DESCRIPTIVES
  /MISSING=PAIRWISE.

*Change it to only use the items that has more valid cases --> Question: What if EQSL have some cases for some countries which ESS doesn´t?
*but if I dont take the mean, I will loose information I have actually, on certain countries

*COMPUTE d11_fltlnl_ess_eqls_w5=MEAN(d11_fltlnl_new_ess7_w5, d11_q52b_eqls_w5).
*Execute.
*COMPUTE d21_atchctr_ess_eqsl_w5=MEAN(d21_atchctr_ess8_w5, d21_fclcntr_ess7_w5).
*Execute.
*COMPUTE d23_hincfel_ess_eqls_w5=MEAN(d23_hincfel_ess_w5, d23_q88_new_eqls_w5).
*Execute.

*COMPUTE d33_contplt_ess_eqsl_w5=MEAN(d33_q30d_eqls_w5, d33_contplt_ess_w5).
*Execute.
*COMPUTE d33_pbldmn_ess_eqsl_w5=MEAN(d33_pbldmn_ess_w5, d33_q30b_eqls_w5).
*Execute.
*COMPUTE d33_sgnptit_ess_eqsl_w5=MEAN(d33_q30c_eqls_w5, d33_sgnptit_ess_w5).
*Execute.
*COMPUTE d33_mbtru_ess_eqsl_w5=MEAN(d33_q30a_eqls_w5, d33_mbtru_ess_w5).
*Execute.

** Further Reduction of Indicators (Exploratory Factor Analysis)
    * D1.1
    * like in Radar: 
    
FACTOR
  /VARIABLES d11_q52b_eqls_w5 d11_sprtsrsmtr_eqls_w5 d11_sclmeet_ess_w5  
  /MISSING LISTWISE 
  /ANALYSIS d11_q52b_eqls_w5 d11_sprtsrsmtr_eqls_w5 d11_sclmeet_ess_w5  
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /SAVE REG(ALL)
  /METHOD=CORRELATION.

* Cronbachs Alpha: .23 (N = 3)

RELIABILITY
  /VARIABLES=d11_q52b_eqls_w5 d11_sprtsrsmtr_eqls_w5 d11_sclmeet_ess_w5 
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /SUMMARY=TOTAL.

    * Merged feeling lonely

FACTOR
  /VARIABLES d11_fltlnl_ess_eqls_w5 d11_sclmeet_ess_w5 d11_sprtsrsmtr_eqls_w5
  /MISSING LISTWISE 
  /ANALYSIS d11_fltlnl_ess_eqls_w5 d11_sclmeet_ess_w5 d11_sprtsrsmtr_eqls_w5
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /METHOD=CORRELATION.

* Cronbachs Alpha: .15 (N = 3), worse than before

RELIABILITY
  /VARIABLES=d11_fltlnl_ess_eqls_w5 d11_sprtsrsmtr_eqls_w5 d11_sclmeet_ess_w5 
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /SUMMARY=TOTAL.

    *D1.2
    * like in Radar, works well 
    
FACTOR
  /VARIABLES d12_ppltrst_ess_w5 d12_pplfair_ess_w5 d12_pplhlp_ess_w5
  /MISSING LISTWISE 
  /ANALYSIS d12_ppltrst_ess_w5 d12_pplfair_ess_w5 d12_pplhlp_ess_w5
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /SAVE REG(ALL)
  /METHOD=CORRELATION.

* Cronbachs Alpha: .96 (N = 3)

RELIABILITY
  /VARIABLES=d12_ppltrst_ess_w5 d12_pplfair_ess_w5 d12_pplhlp_ess_w5
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /SUMMARY=TOTAL.

    *D1.3
 
FACTOR
  /VARIABLES d13_imueclt_ess_w5 d13_q34e_eqls_w5 d13_q34f_eqls_w5 d13_freehms_ess_w5 d13_ethten_icrg_w5 d13_reliten_icrg_w5
  /MISSING LISTWISE 
  /ANALYSIS d13_imueclt_ess_w5 d13_q34e_eqls_w5 d13_q34f_eqls_w5 d13_freehms_ess_w5 d13_ethten_icrg_w5 d13_reliten_icrg_w5
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /SAVE REG(ALL)
  /METHOD=CORRELATION.

* item: "Gay men and lesbians should be free to live their own life as they wish" (1=Agree strongly; 5=Disagree strongly, than recoded) apparently negativly recoded??
* Cronbachs Alpha: .36 (N = 4)

RELIABILITY
  /VARIABLES=d13_imueclt_ess_w5 d13_q34e_eqls_w5 d13_q34f_eqls_w5 d13_freehms_ess_w5 d13_ethten_icrg_w5 d13_reliten_icrg_w5
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /SUMMARY=TOTAL.

    *D2.1
    * like in Radar (only 2 items which are the same)
    * action needed: if I merge both variables, only single item-dimension
    
FACTOR
  /VARIABLES d21_fclcntr_ess7_w5 d21_atchctr_ess8_w5
  /MISSING LISTWISE 
  /ANALYSIS d21_fclcntr_ess7_w5 d21_atchctr_ess8_w5
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /SAVE REG(ALL)
  /METHOD=CORRELATION.

* Cronbachs Alpha: .63

RELIABILITY
  /VARIABLES=d21_fclcntr_ess7_w5 d21_atchctr_ess8_w5
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /SUMMARY=TOTAL.

    *D2.2
      * first approach: taking items with most cases, regardless of continuity

FACTOR
  /VARIABLES d22_q35a_eqls_w5 d22_q35b_eqls_w5 d22_q35d_eqls_w5 d22_q35g_eqls_w5 d22_trstprt_ess_w5
  /MISSING LISTWISE 
  /ANALYSIS d22_q35a_eqls_w5 d22_q35b_eqls_w5 d22_q35d_eqls_w5 d22_q35g_eqls_w5 d22_trstprt_ess_w5
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /SAVE REG(ALL)
  /METHOD=CORRELATION.

* Cronbachs Alpha: .93 (N = 5)

RELIABILITY
  /VARIABLES=d22_q35a_eqls_w5 d22_q35b_eqls_w5 d22_q35d_eqls_w5 d22_q35g_eqls_w5 d22_trstprt_ess_w5
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /SUMMARY=TOTAL.

    * second approach, only taking ESS data because I have a continuity with ESS 9, regardless of most cases 
    
FACTOR
  /VARIABLES d22_trstprl_ess_w5 d22_trstlgl_ess_w5 d22_trstplc_ess_w5 d22_trstprt_ess_w5 d22_q35g_eqls_w5
  /MISSING LISTWISE 
  /ANALYSIS d22_trstprl_ess_w5 d22_trstlgl_ess_w5 d22_trstplc_ess_w5 d22_trstprt_ess_w5 d22_q35g_eqls_w5
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /SAVE REG(ALL)
  /METHOD=CORRELATION.

* Cronbachs Alpha: .93 (N = 5)

RELIABILITY
  /VARIABLES=d22_trstprl_ess_w5 d22_trstlgl_ess_w5 d22_trstplc_ess_w5 d22_trstprt_ess_w5 d22_q35g_eqls_w5
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /SUMMARY=TOTAL.

    * adapted second approach: trust in banks out: because only on WVS and these are not enough cases for wave 9
      
FACTOR
  /VARIABLES d22_trstprl_ess_w5 d22_trstlgl_ess_w5 d22_trstplc_ess_w5 d22_trstprt_ess_w5
  /MISSING LISTWISE 
  /ANALYSIS d22_trstprl_ess_w5 d22_trstlgl_ess_w5 d22_trstplc_ess_w5 d22_trstprt_ess_w5
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /SAVE REG(ALL)
  /METHOD=CORRELATION.

* Cronbachs Alpha: .96 (N = 4)

RELIABILITY
  /VARIABLES=d22_trstprl_ess_w5 d22_trstlgl_ess_w5 d22_trstplc_ess_w5 d22_trstprt_ess_w5
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /SUMMARY=TOTAL.

   * third approach: merged items that where lin. transformed (ESS) and (EQLS)
    * but is it correct to do it instead of FIML?
    
FACTOR
  /VARIABLES d22_trstprl_ess_eqls_lt_w5 d22_trstlgl_ess_eqls_lt_w5 d22_trstplc_ess_eqls_lt_w5 d22_trstprt_ess_w5 d22_q35g_eqls_w5
  /MISSING LISTWISE 
  /ANALYSIS d22_trstprl_ess_eqls_lt_w5 d22_trstlgl_ess_eqls_lt_w5 d22_trstplc_ess_eqls_lt_w5 d22_trstprt_ess_w5 d22_q35g_eqls_w5
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /SAVE REG(ALL)
  /METHOD=CORRELATION.

* Cronbachs Alpha: .94 (N = 4)

RELIABILITY
  /VARIABLES=d22_trstprl_ess_eqls_lt_w5 d22_trstlgl_ess_eqls_lt_w5 d22_trstplc_ess_eqls_lt_w5 d22_trstprt_ess_w5 d22_q35g_eqls_w5
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /SUMMARY=TOTAL.

 * fourth approach: merged items of ESS, filling the missings with EQLS (N = 9)
    * but is it correct to do it instead of FIML?

FACTOR
  /VARIABLES TrustParliament TrustLegalSystem TrustPolice
  /MISSING LISTWISE 
  /ANALYSIS TrustParliament TrustLegalSystem TrustPolice
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /SAVE REG(ALL)
  /METHOD=CORRELATION.

* Cronbachs Alpha: .95 (N = 3)

RELIABILITY
  /VARIABLES=TrustParliament TrustLegalSystem TrustPolice
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /SUMMARY=TOTAL.

    *D2.3
    
FACTOR
  /VARIABLES d23_q34a_eqls_w5 d23_hincfel_ess_w5 d23_corr_icrg_w5 d23_q88_new_eqls_w5
  /MISSING LISTWISE 
  /ANALYSIS d23_q34a_eqls_w5 d23_hincfel_ess_w5 d23_corr_icrg_w5 d23_q88_new_eqls_w5
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /SAVE REG(ALL)
  /METHOD=CORRELATION.

* Cronbachs Alpha: .661 (4 Items)  --> EQLS und ESS separat drin für PAN Analyse, aber inhaltlich identisch

RELIABILITY
  /VARIABLES=d23_q34a_eqls_w5 d23_hincfel_ess_w5 d23_corr_icrg_w5 d23_q88_new_eqls_w5
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /SUMMARY=TOTAL.

* lets try with transformed variable
    
FACTOR
  /VARIABLES d23_gincdif_ess_w5 d23_q34a_eqls_w5 d23_hincfel_ess_eqls_w5 d23_cpi_w5
  /MISSING LISTWISE 
  /ANALYSIS d23_gincdif_ess_w5 d23_q34a_eqls_w5 d23_hincfel_ess_eqls_w5 d23_cpi_w5
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /SAVE REG(ALL)
  /METHOD=CORRELATION.

* Cronbachs Alpha: .01 --> doesn´t work out 

RELIABILITY
  /VARIABLES=d23_gincdif_ess_w5 d23_q34a_eqls_w5 d23_hincfel_ess_eqls_w5 d23_cpi_w5
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /SUMMARY=TOTAL.

    *D3.1
*only two items: d31_iphlppl_ess_w5: Important to help people and care for others well-being_recoded
                           d31_q29a_eqsl_w5: Unpaid Volunteering: community and social services
                           
FACTOR
  /VARIABLES d31_q29a_eqsl_w5 d31_iphlppl_ess_w5
  /MISSING LISTWISE 
  /ANALYSIS  d31_q29a_eqsl_w5 d31_iphlppl_ess_w5
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /SAVE REG(ALL)
  /METHOD=CORRELATION.

* Cronbachs Alpha: .43 (N = 2)

RELIABILITY
  /VARIABLES=d31_q29a_eqsl_w5 d31_iphlppl_ess_w5
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /SUMMARY=TOTAL.
 
    *D3.2
                          
FACTOR
  /VARIABLES d32_ipfrule_ess_w5 d32_shadow_sb_w5
  /MISSING LISTWISE 
  /ANALYSIS d32_ipfrule_ess_w5 d32_shadow_sb_w5
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /SAVE REG(ALL)
  /METHOD=CORRELATION.

* Cronbachs Alpha: .014 (N = 3) --> "I feel safe when I walk alone after dark" does not fit
    * or .046 without it (doesn´t really work with the S & B item although it fits well, the feel safe- item now changed significantly 

RELIABILITY
  /VARIABLES=d32_ipfrule_ess_w5 d32_shadow_sb_w5
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /SUMMARY=TOTAL.

    *D3.3
    * first approach: all items in, regardless of double items 

FACTOR
  /VARIABLES d33_q30d_eqls_w5 d33_q30a_eqls_w5 d33_q30b_eqls_w5 d33_q30c_eqls_w5 d33_mbtru_ess_w5 
    d33_wrkprty_ess_w5 d33_wrkorg_ess_w5 d33_sgnptit_ess_w5 d33_badge_ess_w5 d33_contplt_ess_w5 
    d33_pbldmn_ess_w5 d33_bctprd_ess_w5 d33_polintr_ess_w5 d33_part_van_w5
  /MISSING LISTWISE 
  /ANALYSIS d33_q30d_eqls_w5 d33_q30a_eqls_w5 d33_q30b_eqls_w5 d33_q30c_eqls_w5 d33_mbtru_ess_w5 
    d33_wrkprty_ess_w5 d33_wrkorg_ess_w5 d33_sgnptit_ess_w5 d33_badge_ess_w5 d33_contplt_ess_w5 
    d33_pbldmn_ess_w5 d33_bctprd_ess_w5 d33_polintr_ess_w5 d33_part_van_w5
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /SAVE REG(ALL)
  /METHOD=CORRELATION.

* Cronbachs Alpha: .13 (N = 14) --> VAN out (.87)

RELIABILITY
  /VARIABLES=d33_q30d_eqls_w5 d33_q30a_eqls_w5 d33_q30b_eqls_w5 d33_q30c_eqls_w5 d33_mbtru_ess_w5 
    d33_wrkprty_ess_w5 d33_wrkorg_ess_w5 d33_sgnptit_ess_w5 d33_badge_ess_w5 d33_contplt_ess_w5 
    d33_pbldmn_ess_w5 d33_bctprd_ess_w5 d33_polintr_ess_w5 d33_part_van_w5
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /SUMMARY=TOTAL.

    * second approach:with the new transformed variables from original data sets
    
FACTOR
  /VARIABLES d33_contplt_ess_eqsl_w5 d33_pbldmn_ess_eqsl_w5 d33_sgnptit_ess_eqsl_w5 d33_mbtru_ess_eqsl_w5
    d33_wrkprty_ess_w5 d33_wrkorg_ess_w5 d33_badge_ess_w5 d33_bctprd_ess_w5 d33_polintr_ess_w5 d33_part_van_w5
  /MISSING LISTWISE 
  /ANALYSIS d33_contplt_ess_eqsl_w5 d33_pbldmn_ess_eqsl_w5 d33_sgnptit_ess_eqsl_w5 d33_mbtru_ess_eqsl_w5
    d33_wrkprty_ess_w5 d33_wrkorg_ess_w5 d33_badge_ess_w5 d33_bctprd_ess_w5 d33_polintr_ess_w5 d33_part_van_w5
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /SAVE REG(ALL)
  /METHOD=CORRELATION.

* Cronbachs Alpha: .11 (N = 10); transformed items do not bring better result

RELIABILITY
  /VARIABLES=d33_contplt_ess_eqsl_w5 d33_pbldmn_ess_eqsl_w5 d33_sgnptit_ess_eqsl_w5 d33_mbtru_ess_eqsl_w5
    d33_wrkprty_ess_w5 d33_wrkorg_ess_w5 d33_badge_ess_w5 d33_bctprd_ess_w5 d33_polintr_ess_w5 d33_part_van_w5
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /SUMMARY=TOTAL.

** end **

** repeat merging process with the new transformed variables from original data sets
** testing new variables which was been transformed linealy

FREQUENCIES VARIABLES=d11_fltlnl_ess7_w5 d11_fltlnl_new_ess7_w5 d11_q52b_eqls_w5 
    d21_fclcntr_ess7_w5 d21_fclcntr_new_ess7_w5 d21_atchctr_ess8_w5 d23_q88_eqls_w5 d23_q88_new_eqls_w5 
    d23_hincfel_ess_w5
  /STATISTICS=MEAN
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=d11_fltlnl_ess7_w5 d11_fltlnl_new_ess7_w5 d11_q52b_eqls_w5 
    d21_fclcntr_ess7_w5 d21_fclcntr_new_ess7_w5 d21_atchctr_ess8_w5 d23_q88_eqls_w5 d23_q88_new_eqls_w5 
    d23_hincfel_ess_w5 d22_q35a_eqls_w5 d22_q35a_new_eqls_w5 d22_q35b_eqls_w5 d22_q35b_new_eqls_w5 
    d22_q35d_eqls_w5 d22_q35d_new_eqls_w5 d22_trstprl_ess_w5 d22_trstlgl_ess_w5 d22_trstplc_ess_w5 
    d11_sprtsrsmtr_eqls_w5 d11_q40b_new_eqls_w5
  /STATISTICS=MINIMUM MAXIMUM MEAN
  /ORDER=ANALYSIS.

COMPUTE D22=MEAN(d22_trstprl_ess_eqls_w5,d22_trstlgl_ess_eqls_w5,d22_trstplc_ess_eqls_w5,
    d22_trstprt_ess_w5,d22_q35g_eqls_w5).
EXECUTE.

COMPUTE D22_miss=MEAN(d22_trstprl_ess_w5,d22_trstlgl_ess_w5,d22_trstplc_ess_w5,d22_trstprt_ess_w5,d22_q35g_eqls_w5).
EXECUTE.

COMPUTE D22_lt=MEAN(d22_trstprl_ess_eqls_lt_w5,d22_trstlgl_ess_eqls_lt_w5,d22_trstplc_ess_eqls_lt_w5,d22_trstprt_ess_w5,d22_q35g_eqls_w5).
EXECUTE.

