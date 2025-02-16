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

VARIABLE LABELS d12_ppltrst_ess_w5 'Most people can be trusted or you cant be too careful_ess'.
VARIABLE LABELS d12_pplfair_ess_w5 'Most people try to take advantage of you, or try to be fair_ess'.
VARIABLE LABELS d12_pplhlp_ess_w5 'Most of the time people helpful or mostly looking out for themselves_ess'.
VARIABLE LABELS d22_trstprl_ess_w5 'Trust in countrys parliament_ess'.
VARIABLE LABELS d22_trstlgl_ess_w5 'Trust in the legal system_ess'.
VARIABLE LABELS d22_trstplc_ess_w5 'Trust in the police_ess'.
VARIABLE LABELS d22_trstprt_ess_w5 'Trust in political parties_ess'.
VARIABLE LABELS d13_imueclt_ess_w5 'Countrys cultural life undermined or enriched by immigrants_ess'.
VARIABLE LABELS d11_sclmeet_ess_w5 'How often socially meet with friends, relatives or colleagues_ess'.
VARIABLE LABELS d13_freehms_ess_w5 'Gays and lesbians free to live life as they wish_recoded_ess'.
VARIABLE LABELS d21_atchctr_ess_w5 'How emotionally attached to [country]_ess'.
VARIABLE LABELS d23_gincdif_ess_w5 'Government should reduce differences in income levels_recoded_ess'.
VARIABLE LABELS d23_hincfel_ess_w5 'Feeling about households income nowadays_recoded_ess'.
VARIABLE LABELS d33_mbtru_ess_w5 'Member of trade union or similar organisation_recoded_ess'.
VARIABLE LABELS d33_wrkprty_ess_w5 'Worked in political party or action group last 12 months_recoded_ess'.
VARIABLE LABELS d33_wrkorg_ess_w5 'Worked in another organisation or association last 12 months_recoded_ess'.
VARIABLE LABELS d33_sgnptit_ess_w5 'Signed petition last 12 months_recoded_ess'.
VARIABLE LABELS d33_badge_ess_w5 'Worn or displayed campaign badge/sticker last 12 months_recoded_ess'.
VARIABLE LABELS d33_contplt_ess_w5 'Contacted politician or government official last 12 months_recoded_ess'.
VARIABLE LABELS d33_pbldmn_ess_w5 'Taken part in lawful public demonstration last 12 months_recoded_ess'.
VARIABLE LABELS d33_bctprd_ess_w5 'Boycotted certain products last 12 months_recoded_ess'.
VARIABLE LABELS d33_polintr_ess_w5 'How interested in politics_recoded_ess'.
VARIABLE LABELS d32_ipfrule_ess_w5 'Important to do what is told and follow rules_recoded_ess'.
VARIABLE LABELS d31_iphlppl_ess_w5 'Important to help people and care for others well-being_recoded_ess'.
VARIABLE LABELS d32_impsafe_ess_w5 'Important to live in secure and safe surroundings_recoded_ess'.
VARIABLE LABELS d11_inprdsc_ess_w5 'How many people with whom you can discuss intimate and personal matters_ess'.
VARIABLE LABELS d32_aesfdrk_ess_w5 'Feeling of safety of walking alone in local area after dark_recoded_ess'.

*3

RENAME VARIABLES (
d11_inprdsc_ess_w5
d11_q38a_eqls_w5
d11_q38b_eqls_w5
d11_q39a_eqls_w5
d11_q39b_eqls_w5
d11_q52b_eqls_w5
d11_sclmeet_ess_w5
d11_sprtsrsmtr_eqls_w5
d11_sprtsrsmtr_new_eqls_w5
d12_pplfair_ess_w5
d12_pplhlp_ess_w5
d12_ppltrst_ess_w5
d13_ethten_icrg_w5
d13_freehms_ess_w5
d13_imueclt_ess_w5
d13_q34e_eqls_w5
d13_q34e_new_eqls_w5
d13_q34e_original_eqls_w5
d13_q34f_eqls_w5
d13_q34f_new_eqls_w5
d13_q34f_original_eqls_w5
d13_reliten_icrg_w5
d21_atchctr_ess_w5
d21_fclcntr_ess_w5
d21_q36e_eqls_w5
d22_q35a_eqls_w5
d22_q35b_eqls_w5
d22_q35d_eqls_w5
d22_q35g_eqls_w5
d22_trstlgl_ess_w5
d22_trstplc_ess_w5
d22_trstprl_ess_w5
d22_trstprt_ess_w5
d23_corr_icrg_w5
d23_cpi_w5
d23_gincdif_ess_w5
d23_hincfel_ess_w5
d23_q34a_eqls_w5
d23_q34a_new_eqls_w5
d23_q34a_original_eqls_w5
d23_q88_eqls_w5
d31_iphlppl_ess_w5
d31_q29a_eqsl_w5
d31_q29b_eqls_w5
d31_q29c_eqls_w5
d31_q42d_eqls_w5
d31_q42e_eqls_w5
d32_aesfdrk_ess_w5
d32_impsafe_ess_w5
d32_ipfrule_ess_w5
d32_q55a_eqls_w5
d32_q55b_eqls_w5
d32_shadow_sb_w5
d33_badge_ess_w5
d33_bctprd_ess_w5
d33_contplt_ess_w5
d33_mbtru_ess_w5
d33_part_van_w5
d33_pbldmn_ess_w5
d33_polintr_ess_w5
d33_q30a_eqls_w5
d33_q30b_eqls_w5
d33_q30c_eqls_w5
d33_q30d_eqls_w5
d33_q30e_eqls_w5
d33_sgnptit_ess_w5
d33_wrkorg_ess_w5
d33_wrkprty_ess_w5 =
d11_a_5
d11_b_5
d11_c_5
d11_d_5
d11_e_5
d11_f_5
d11_g_5
d11_h_5
d11_i_5
d12_a_5
d12_b_5
d12_c_5
d13_a_5
d13_b_5
d13_c_5
d13_d_5
d13_e_5
d13_f_5
d13_g_5
d13_h_5
d13_i_5
d13_j_5
d21_a_5
d21_b_5
d21_c_5
d22_a_5
d22_b_5
d22_c_5
d22_d_5
d22_e_5
d22_f_5
d22_g_5
d22_h_5
d23_a_5
d23_b_5
d23_c_5
d23_d_5
d23_e_5
d23_f_5
d23_g_5
d23_h_5
d31_a_5
d31_b_5
d31_c_5
d31_d_5
d31_e_5
d31_f_5
d32_a_5
d32_b_5
d32_c_5
d32_d_5
d32_e_5
d32_f_5
d33_a_5
d33_b_5
d33_c_5
d33_d_5
d33_e_5
d33_f_5
d33_g_5
d33_h_5
d33_i_5
d33_j_5
d33_k_5
d33_l_5
d33_m_5
d33_n_5
d33_o_5).

* 4 
    * change all digits to be equal (2)
    * change missings to (999)
    
RECODE d11_a_5 d11_b_5 d11_c_5 d11_d_5 d11_e_5 d11_f_5 d11_g_5 d11_h_5 d11_i_5 d12_a_5 d12_b_5 
    d12_c_5 d13_a_5 d13_b_5 d13_c_5 d13_d_5 d13_e_5 d13_f_5 d13_g_5 d13_h_5 d13_i_5 d13_j_5 d21_a_5 
    d21_b_5 d21_c_5 d22_a_5 d22_b_5 d22_c_5 d22_d_5 d22_e_5 d22_f_5 d22_g_5 d22_h_5 d23_a_5 d23_b_5 
    d23_c_5 d23_d_5 d23_e_5 d23_f_5 d23_g_5 d23_h_5 d31_a_5 d31_b_5 d31_c_5 d31_d_5 d31_e_5 d31_f_5 
    d32_a_5 d32_b_5 d32_c_5 d32_d_5 d32_e_5 d32_f_5 d33_a_5 d33_b_5 d33_c_5 d33_d_5 d33_e_5 d33_f_5 
    d33_g_5 d33_h_5 d33_i_5 d33_j_5 d33_k_5 d33_l_5 d33_m_5 d33_n_5 d33_o_5 (MISSING=999).
EXECUTE.


