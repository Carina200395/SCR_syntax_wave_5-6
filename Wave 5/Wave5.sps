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
