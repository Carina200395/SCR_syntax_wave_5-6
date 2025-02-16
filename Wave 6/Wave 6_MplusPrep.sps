* Encoding: UTF-8.
* Prepare Wave 5 summarized data set for Mplus:
* 1. Sort data set by dimensions.
* 2. Update variable names with data set short ending
* 3. Rename all names to shorter ones (max. 8 digits/letters)
* 4. Mplus changes

*1

DATASET ACTIVATE DataSet1.
SORT VARIABLES BY NAME (A).

*2
*change the other data sets by hand if needed

*3

RENAME VARIABLES (
d11_inprdsc_ess_w6
d11_sclmeet_ess_w6
d11_v3_evs_w6
d12_pplfair_ess_w6
d12_pplhlp_ess_w6
d12_ppltrst_ess_w6
d12_v31_evs_w6
d12_v56_issp_w6
d13_ethten_icrg_w6
d13_freehms_ess_w6
d13_imueclt_ess_w6
d13_reliten_icrg_w6
d13_v153_evs_w6
d13_v22_evs_w6
d13_v24_evs_w6
d21_atchctr_ess_w6
d21_v164_evs_w6
d21_v165_evs_w6
d21_v166_evs_w6
d21_v170_evs_w6
d22_trstlgl_ess_w6
d22_trstplc_ess_w6
d22_trstprl_ess_w6
d22_trstprt_ess_w6
d22_v120_evs_w6
d22_v121_evs_w6
d22_v122_evs_w6
d22_v126_evs_w6
d22_v127_evs_w6
d22_v130_evs_w6
d23_corr_icrg_w6
d23_cpi_w6
d23_gincdif_ess_w6
d23_grspfr_ess_w6
d23_hincfel_ess_w6
d23_v22_issp_w6
d23_v30_issp_w6
d23_v50_issp_w6
d23_v53_issp_w6
d23_v7_issp_w6
d31_iphlppl_ess_w6
d31_v10_evs_w6
d31_v103_evs_w6
d31_v13_evs_w6
d31_v15_evs_w6
d31_v16_evs_w6
d31_v18_evs_w6
d31_v21_evs_w6
d32_aesfdrk_ess_w6
d32_impsafe_ess_w6
d32_ipfrule_ess_w6
d32_shadow_sb_w6
d32_v149_evs_w6
d32_v150_evs_w6
d32_v159_evs_w6
d32_v79_evs_w6
d33_badge_ess_w6
d33_bctprd_ess_w6
d33_contplt_ess_w6
d33_mbtru_ess_w6
d33_part_van_w6
d33_pbldmn_ess_w6
d33_polintr_ess_w6
d33_sgnptit_ess_w6
d33_union_issp_w6
d33_v100_evs_w6
d33_v101_evs_w6
d33_v5_evs_w6
d33_v97_evs_w6
d33_v98_evs_w6
d33_v99_evs_w6
d33_wrkorg_ess_w6
d33_wrkprty_ess_w6 =
d11_a_6
d11_b_6
d11_c_6
d12_a_6
d12_b_6
d12_c_6
d12_d_6
d12_e_6
d13_a_6
d13_b_6
d13_c_6
d13_d_6
d13_e_6
d13_f_6
d13_g_6
d21_a_6
d21_b_6
d21_c_6
d21_d_6
d21_e_6
d22_a_6
d22_b_6
d22_c_6
d22_d_6
d22_e_6
d22_f_6
d22_g_6
d22_h_6
d22_i_6
d22_j_6
d23_a_6
d23_b_6
d23_c_6
d23_d_6
d23_e_6
d23_f_6
d23_g_6
d23_h_6
d23_i_6
d23_j_6
d31_a_6
d31_b_6
d31_c_6
d31_d_6
d31_e_6
d31_f_6
d31_g_6
d31_h_6
d32_a_6
d32_b_6
d32_c_6
d32_d_6
d32_e_6
d32_f_6
d32_g_6
d32_h_6
d33_a_6
d33_b_6
d33_c_6
d33_d_6
d33_e_6
d33_f_6
d33_g_6
d33_h_6
d33_i_6
d33_j_6
d33_k_6
d33_l_6
d33_m_6
d33_n_6
d33_o_6
d33_p_6
d33_q_6).

* 4 
    * change all digits to be equal (2)
    * change missings to (999)
    
RECODE d11_a_6 d11_b_6 d11_c_6 d12_a_6 d12_b_6 d12_c_6 d12_d_6 d12_e_6 d13_a_6 d13_b_6 d13_c_6 
    d13_d_6 d13_e_6 d13_f_6 d13_g_6 d21_a_6 d21_b_6 d21_c_6 d21_d_6 d21_e_6 d22_a_6 d22_b_6 d22_c_6 
    d22_d_6 d22_e_6 d22_f_6 d22_g_6 d22_h_6 d22_i_6 d22_j_6 d23_a_6 d23_b_6 d23_c_6 d23_d_6 d23_e_6 
    d23_f_6 d23_g_6 d23_h_6 d23_i_6 d23_j_6 d31_a_6 d31_b_6 d31_c_6 d31_d_6 d31_e_6 d31_f_6 d31_g_6 
    d31_h_6 d32_a_6 d32_b_6 d32_c_6 d32_d_6 d32_e_6 d32_f_6 d32_g_6 d32_h_6 d33_a_6 d33_b_6 d33_c_6 
    d33_d_6 d33_e_6 d33_f_6 d33_g_6 d33_h_6 d33_i_6 d33_j_6 d33_k_6 d33_l_6 d33_m_6 d33_n_6 d33_o_6 
    d33_p_6 d33_q_6 (MISSING=999).
EXECUTE.
