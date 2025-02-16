* Encoding: UTF-8.
* Summarize items to only "unique items" not nessesary in Wave 6 because the surveys don´t repeat themselves inbetween one wave
* e.g. ESS 7 und ESS 8

* Test of sameness
    
    *D1.1
    *fewer than 2 cases, doesn´t work, so WVS data out

DATASET ACTIVATE DataSet1.
FACTOR
  /VARIABLES d11_sclmeet_ess9_w6 d11_v3_evs_w6 d11_q2_wvs_w6 d11_q208_wvs_w6
  /MISSING LISTWISE 
  /ANALYSIS d11_sclmeet_ess9_w6 d11_v3_evs_w6 d11_q2_wvs_w6 d11_q208_wvs_w6
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /METHOD=CORRELATION.

* now only 2 items left

FACTOR
  /VARIABLES d11_sclmeet_ess9_w6 d11_v3_evs_w6
  /MISSING LISTWISE 
  /ANALYSIS d11_sclmeet_ess9_w6 d11_v3_evs_w6
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /METHOD=CORRELATION.

* Cronbachs Alpha: .33

RELIABILITY
  /VARIABLES=d11_sclmeet_ess9_w6 d11_v3_evs_w6
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE
  /SUMMARY=TOTAL.

    *D1.2
     *fewer than 2 cases, doesn´t work, again wvs out
    
FACTOR
  /VARIABLES d12_v31_evs_w6 d12_ppltrst_ess9_w6 d12_pplfair_ess9_w6 d12_pplhlp_ess9_w6 
    d12_q57_wvs_w6 d12_v56_issp_w6
  /MISSING LISTWISE 
  /ANALYSIS d12_v31_evs_w6 d12_ppltrst_ess9_w6 d12_pplfair_ess9_w6 d12_pplhlp_ess9_w6 
    d12_q57_wvs_w6 d12_v56_issp_w6
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /METHOD=CORRELATION.

* clear factor but three of the same items ("people can be trusted")

FACTOR
  /VARIABLES d12_v31_evs_w6 d12_ppltrst_ess9_w6 d12_pplfair_ess9_w6 d12_pplhlp_ess9_w6 
   d12_v56_issp_w6
  /MISSING LISTWISE 
  /ANALYSIS d12_v31_evs_w6 d12_ppltrst_ess9_w6 d12_pplfair_ess9_w6 d12_pplhlp_ess9_w6 
   d12_v56_issp_w6
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /METHOD=CORRELATION.

FACTOR
  /VARIABLES d12_ppltrst_ess9_w6 d12_pplfair_ess9_w6 d12_pplhlp_ess9_w6 
  /MISSING LISTWISE 
  /ANALYSIS d12_ppltrst_ess9_w6 d12_pplfair_ess9_w6 d12_pplhlp_ess9_w6 
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /METHOD=CORRELATION.

* Cronbachs Alpha: .97

RELIABILITY
  /VARIABLES=d12_ppltrst_ess9_w6 d12_pplfair_ess9_w6 d12_pplhlp_ess9_w6 
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE
  /SUMMARY=TOTAL.

    *D1.3
    *works well

FACTOR
  /VARIABLES d13_imueclt_ess9_w6 d13_freehms_ess9_w6 d13_v22_evs_w6 d13_v24_evs_w6 d13_v153_evs_w6 d13_ethten_icrg_w6 d13_reliten_icrg_w6
  /MISSING LISTWISE 
  /ANALYSIS d13_imueclt_ess9_w6 d13_freehms_ess9_w6 d13_v22_evs_w6 d13_v24_evs_w6 d13_v153_evs_w6 d13_ethten_icrg_w6 d13_reliten_icrg_w6
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /METHOD=CORRELATION.

* Cronbachs Alpha: .67 (N = 7 items) --> religious tension does not seem to work

RELIABILITY
  /VARIABLES=d13_imueclt_ess9_w6 d13_freehms_ess9_w6 d13_v22_evs_w6 d13_v24_evs_w6 d13_v153_evs_w6 d13_ethten_icrg_w6 d13_reliten_icrg_w6
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE
  /SUMMARY=TOTAL.

    *D2.1
    *in the screeplot looks like 2 factors but one works as well

FACTOR
  /VARIABLES d21_atchctr_ess9_w6 d21_v170_evs_w6 d21_v164_evs_w6 d21_v165_evs_w6 d21_v166_evs_w6 
  /MISSING LISTWISE 
  /ANALYSIS d21_atchctr_ess9_w6 d21_v170_evs_w6 d21_v164_evs_w6 d21_v165_evs_w6 d21_v166_evs_w6 
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /METHOD=CORRELATION.

* Cronbachs Alpha: .67 (N = 5 items)

RELIABILITY
  /VARIABLES=d21_atchctr_ess9_w6 d21_v170_evs_w6 d21_v164_evs_w6 d21_v165_evs_w6 d21_v166_evs_w6 
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE
  /SUMMARY=TOTAL.

    *D2.2
    
FACTOR
  /VARIABLES d22_trstprl_ess9_w6 d22_trstlgl_ess9_w6 d22_trstplc_ess9_w6 d22_trstprt_ess9_w6 
    d22_v120_evs_w6 d22_v121_evs_w6 d22_v122_evs_w6 d22_v126_evs_w6 d22_v127_evs_w6 d22_v130_evs_w6
  /MISSING LISTWISE 
  /ANALYSIS d22_trstprl_ess9_w6 d22_trstlgl_ess9_w6 d22_trstplc_ess9_w6 d22_trstprt_ess9_w6 
    d22_v120_evs_w6 d22_v121_evs_w6 d22_v122_evs_w6 d22_v126_evs_w6 d22_v127_evs_w6 d22_v130_evs_w6
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /METHOD=CORRELATION.

* Cronbachs Alpha: .92 (N = 10 items)

RELIABILITY
  /VARIABLES=d22_trstprl_ess9_w6 d22_trstlgl_ess9_w6 d22_trstplc_ess9_w6 d22_trstprt_ess9_w6 
    d22_v120_evs_w6 d22_v121_evs_w6 d22_v122_evs_w6 d22_v126_evs_w6 d22_v127_evs_w6 d22_v130_evs_w6  
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE
  /SUMMARY=TOTAL.

    *D2.3
    
FACTOR
  /VARIABLES d23_gincdif_ess9_w6 d23_hincfel_ess9_w6 d23_grspfr_ess9_w6 d23_v22_issp_w6 
    d23_v30_issp_w6 d23_v53_issp_w6 d23_v50_issp_w6 d23_cpi_w6 d23_corr_icrg_w6
  /MISSING LISTWISE 
  /ANALYSIS d23_gincdif_ess9_w6 d23_hincfel_ess9_w6 d23_grspfr_ess9_w6 d23_v22_issp_w6 
    d23_v30_issp_w6 d23_v53_issp_w6 d23_v50_issp_w6 d23_cpi_w6 d23_corr_icrg_w6
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /METHOD=CORRELATION.

* doesn´t work that well: d23_v30_issp_w6 Q9a Just or unjust that people with higher incomes can buy better health care than people with lower incomes?
    
FACTOR
  /VARIABLES d23_gincdif_ess9_w6 d23_hincfel_ess9_w6 d23_grspfr_ess9_w6 d23_v22_issp_w6 
    d23_v53_issp_w6 d23_v50_issp_w6 d23_corr_icrg_w6
  /MISSING LISTWISE 
  /ANALYSIS d23_gincdif_ess9_w6 d23_hincfel_ess9_w6 d23_grspfr_ess9_w6 d23_v22_issp_w6 
  d23_v53_issp_w6 d23_v50_issp_w6 d23_corr_icrg_w6
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /METHOD=CORRELATION.

* Cronbachs Alpha: .281 (N = 8 items)
    
RELIABILITY
  /VARIABLES=d23_gincdif_ess9_w6 d23_hincfel_ess9_w6 d23_grspfr_ess9_w6 d23_v22_issp_w6 
    d23_v53_issp_w6 d23_v50_issp_w6 d23_cpi_w6 d23_corr_icrg_w6
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE
  /SUMMARY=TOTAL.

* CPI out (why? In factor analysis it worked well but actually also not in Cronbachs Alpha); Cronbachs Alpha if deleted: .78 (N = 7 items)
        
RELIABILITY
  /VARIABLES=d23_gincdif_ess9_w6 d23_hincfel_ess9_w6 d23_grspfr_ess9_w6 d23_v22_issp_w6 
    d23_v53_issp_w6 d23_v50_issp_w6 d23_corr_icrg_w6
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE
  /SUMMARY=TOTAL.
    
    *D3.1
    *only 2 items

FACTOR
  /VARIABLES d31_iphlppl_ess9_w6 d31_v103_evs_w6 
  /MISSING LISTWISE 
  /ANALYSIS d31_iphlppl_ess9_w6 d31_v103_evs_w6
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /METHOD=CORRELATION.

* Cronbachs Alpha: -.21 

RELIABILITY
  /VARIABLES=d31_iphlppl_ess9_w6 d31_v103_evs_w6 
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE
  /SUMMARY=TOTAL.

    *D3.2
    * why iprule works sooo bad? (right now out but in Wave 5 it works well, evs and so are too different?)
    
FACTOR
  /VARIABLES d32_v150_evs_w6 d32_v152_evs_w6 d32_shadow_sb_w6
  /MISSING LISTWISE 
  /ANALYSIS d32_v150_evs_w6 d32_v152_evs_w6 d32_shadow_sb_w6
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /METHOD=CORRELATION.

* Cronbachs Alpha: -.006 --> Size of shadow economy soo bad? 

RELIABILITY
  /VARIABLES=d32_v150_evs_w6 d32_v152_evs_w6 d32_shadow_sb_w6
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE
  /SUMMARY=TOTAL.

    *D3.3
    * too many double ones. How to deal with them?

FACTOR
  /VARIABLES d33_mbtru_ess9_w6 d33_wrkprty_ess9_w6 d33_wrkorg_ess9_w6 d33_sgnptit_ess9_w6 
    d33_badge_ess9_w6 d33_contplt_ess9_w6 d33_pbldmn_ess9_w6 d33_bctprd_ess9_w6 d33_polintr_ess9_w6 
    d33_v98_evs_w6 d33_v99_evs_w6 d33_v100_evs_w6 d33_v101_evs_w6 d33_v97_evs_w6 
    d33_union_issp_w6
  /MISSING LISTWISE 
  /ANALYSIS d33_mbtru_ess9_w6 d33_wrkprty_ess9_w6 d33_wrkorg_ess9_w6 d33_sgnptit_ess9_w6 
    d33_badge_ess9_w6 d33_contplt_ess9_w6 d33_pbldmn_ess9_w6 d33_bctprd_ess9_w6 d33_polintr_ess9_w6 
    d33_v98_evs_w6 d33_v99_evs_w6 d33_v100_evs_w6 d33_v101_evs_w6 d33_v97_evs_w6 
    d33_union_issp_w6
  /PRINT INITIAL EXTRACTION
  /PLOT EIGEN
  /CRITERIA FACTORS(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /METHOD=CORRELATION.

FACTOR
  /VARIABLES d12_ppltrst_ess9_w6 d12_pplfair_ess9_w6 d12_pplhlp_ess9_w6 d12_v31_evs_w6 
    d12_v56_issp_w6
  /MISSING LISTWISE 
  /ANALYSIS d12_ppltrst_ess9_w6 d12_pplfair_ess9_w6 d12_pplhlp_ess9_w6 d12_v31_evs_w6 
    d12_v56_issp_w6
  /PRINT INITIAL CORRELATION KMO EXTRACTION
  /PLOT EIGEN
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION ML
  /ROTATION NOROTATE.

** Z Transformation (not neccesary -- Mplus)

DESCRIPTIVES VARIABLES=d12_ppltrst_ess9_w6 d12_pplfair_ess9_w6 d12_pplhlp_ess9_w6 
    d22_trstprl_ess9_w6 d22_trstlgl_ess9_w6 d22_trstplc_ess9_w6 d22_trstprt_ess9_w6 d13_imueclt_ess9_w6 
    d11_sclmeet_ess9_w6 d13_freehms_ess9_w6 d21_atchctr_ess9_w6 d23_gincdif_ess9_w6 d23_hincfel_ess9_w6 
    d33_mbtru_ess9_w6 d33_wrkprty_ess9_w6 d33_wrkorg_ess9_w6 d33_sgnptit_ess9_w6 d33_badge_ess9_w6 
    d33_contplt_ess9_w6 d33_pbldmn_ess9_w6 d33_bctprd_ess9_w6 d33_polintr_ess9_w6 d32_ipfrule_ess9_w6 
    d31_iphlppl_ess9_w6 d23_grspfr_ess9_w6 d13_v22_evs_w6 d13_v24_evs_w6 d31_v103_evs_w6 
    d13_v153_evs_w6 d33_v98_evs_w6 d33_v99_evs_w6 d33_v100_evs_w6 d33_v101_evs_w6 d12_v31_evs_w6 
    d11_v3_evs_w6 d33_v5_evs_w6 d21_v170_evs_w6 d21_v164_evs_w6 d21_v165_evs_w6 d21_v166_evs_w6 
    d22_v120_evs_w6 d22_v121_evs_w6 d22_v122_evs_w6 d22_v126_evs_w6 d22_v127_evs_w6 d22_v130_evs_w6 
    d33_v97_evs_w6 d32_v150_evs_w6 d32_v152_evs_w6 d13_q19_wvs_w6 d13_q21_wvs_w6 d32_q52_wvs_w6 
    d31_q108_wvs_w6 d31_q182_wvs_w6 d11_q2_wvs_w6 d33_q4_wvs_w6 d12_q57_wvs_w6 d11_q208_wvs_w6 
    d32_q180_wvs_w6 d32_q181_wvs_w6 d21_q255_wvs_w6 d21_q256_wvs_w6 d21_q257_wvs_w6 d21_q254_wvs_w6 
    d22_q69_wvs_w6 d22_q70_wvs_w6 d22_q72_wvs_w6 d22_q73_wvs_w6 d22_q74_wvs_w6 d22_q76_wvs_w6 
    d22_q78_wvs_w6 d23_q112_wvs_w6 d33_q210_wvs_w6 d33_q211_wvs_w6 d33_q212_wvs_w6 d33_q213_wvs_w6 
    d33_Q199_wvs_w6 d23_q114_wvs_w6 d12_v56_issp_w6 d23_v7_issp_w6 d23_v22_issp_w6 d23_v30_issp_w6 
    d23_v53_issp_w6 d23_v50_issp_w6 d33_union_issp_w6 d23_cpi_w6
  /SAVE
  /STATISTICS=MEAN STDDEV MIN MAX.

* lets summarize some variables that can go together
