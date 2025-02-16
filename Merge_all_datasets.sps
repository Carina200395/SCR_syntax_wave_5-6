* Encoding: UTF-8.
*Merge all data sets to one file, independently to country and wave

*merge ESS 8

SORT CASES BY country.
DATASET ACTIVATE DataSet1.
SORT CASES BY country.
DATASET ACTIVATE DataSet2.
MATCH FILES /FILE=*
  /FILE='DataSet1'
  /BY country.
EXECUTE.

* merge ESS 9 

SORT CASES BY country.
DATASET ACTIVATE DataSet3.
SORT CASES BY country.
DATASET ACTIVATE DataSet2.
MATCH FILES /FILE=*
  /FILE='DataSet3'
  /BY country.
EXECUTE.

*merge ISSP

SORT CASES BY country.
DATASET ACTIVATE DataSet4.
SORT CASES BY country.
DATASET ACTIVATE DataSet2.
MATCH FILES /FILE=*
  /FILE='DataSet4'
  /BY country.
EXECUTE.

* merge EVS 

SORT CASES BY country.
DATASET ACTIVATE DataSet5.
SORT CASES BY country.
DATASET ACTIVATE DataSet2.
MATCH FILES /FILE=*
  /FILE='DataSet5'
  /BY country.
EXECUTE.

* merge WVS --> out; ignore

SORT CASES BY country.
DATASET ACTIVATE DataSet7.
SORT CASES BY country.
DATASET ACTIVATE DataSet9.
MATCH FILES /FILE=*
  /FILE='DataSet7'
  /BY country.
EXECUTE.

* merge EQSL

SORT CASES BY country.
DATASET ACTIVATE DataSet6.
SORT CASES BY country.
DATASET ACTIVATE DataSet2.
MATCH FILES /FILE=*
  /FILE='DataSet6'
  /BY country.
EXECUTE.

* merge CPI

DATASET ACTIVATE DataSet7.
SORT CASES BY country.
DATASET ACTIVATE DataSet2.
MATCH FILES /FILE=*
  /FILE='DataSet7'
  /BY country.
EXECUTE.

* merge Shadow economy
    
DATASET ACTIVATE DataSet8.
SORT CASES BY country.
DATASET ACTIVATE DataSet2.
MATCH FILES /FILE=*
  /FILE='DataSet8'
  /BY country.
EXECUTE.

* merge ICRG
    
DATASET ACTIVATE DataSet9.
SORT CASES BY country.
DATASET ACTIVATE DataSet2.
MATCH FILES /FILE=*
  /FILE='DataSet9'
  /BY country.
EXECUTE.

* merge VAN
    
DATASET ACTIVATE DataSet10.
SORT CASES BY country.
DATASET ACTIVATE DataSet2.
MATCH FILES /FILE=*
  /FILE='DataSet10'
  /BY country.
EXECUTE.

*Aggregate to the Wave 5  
*merge ESS 8

DATASET ACTIVATE DataSet2.
GET FILE='C:\Users\chartz\OneDrive - Jacobs University\Paper 2\ESS8\ESS8e02_2_country_aggr_iso.sav'.    
DATASET NAME DataSet3.
DATASET ACTIVATE DataSet2.
SORT CASES BY country.
DATASET ACTIVATE DataSet3.
SORT CASES BY country.
DATASET ACTIVATE DataSet2.
MATCH FILES /FILE=*
  /FILE='DataSet3'
  /BY country.
EXECUTE.

*merge EQSL
    
GET FILE='C:\Users\chartz\OneDrive - Jacobs University\Paper '+
    '2\EQSL_2016\EQSL_2016_country_aggr_iso.sav'.
DATASET NAME DataSet4.
DATASET ACTIVATE DataSet2.
SORT CASES BY country.
DATASET ACTIVATE DataSet4.
SORT CASES BY country.
DATASET ACTIVATE DataSet2.
MATCH FILES /FILE=*
  /FILE='DataSet4'
  /BY country.
EXECUTE.

*merge CPI

GET FILE='C:\Users\chartz\OneDrive - Jacobs University\Paper 2\CPI 2021 Full Data Set\CPI_Wave '+
    '5_6 aggr.sav'.
DATASET NAME DataSet5.
DATASET ACTIVATE DataSet2.
SORT CASES BY country.
DATASET ACTIVATE DataSet5.
SORT CASES BY country.
DATASET ACTIVATE DataSet2.
MATCH FILES /FILE=*
  /FILE='DataSet5'
  /BY country.
EXECUTE.

DELETE VARIABLES d23_cpi_w6.

*Aggregate to the Wave 6  
*merge EVS

DATASET ACTIVATE DataSet6.
GET FILE='C:\Users\chartz\OneDrive - Jacobs University\Paper '+
    '2\EVS_2017\ZA7500_v5-0-0.sav\ZA7500_v5-0-0_country_aggr.sav'.
DATASET NAME DataSet7.
DATASET ACTIVATE DataSet6.
SORT CASES BY country.
DATASET ACTIVATE DataSet7.
SORT CASES BY country.
DATASET ACTIVATE DataSet6.
MATCH FILES /FILE=*
  /FILE='DataSet7'
  /BY country.
EXECUTE.

*merge WVS

GET FILE='C:\Users\chartz\OneDrive - Jacobs University\Paper '+
    '2\WVS_2017-2021\WVS_Cross-National_Wave_7_spss_v4_0_country_aggr.sav'.
DATASET NAME DataSet8.
DATASET ACTIVATE DataSet6.
SORT CASES BY country.
DATASET ACTIVATE DataSet8.
SORT CASES BY country.
DATASET ACTIVATE DataSet6.
MATCH FILES /FILE=*
  /FILE='DataSet8'
  /BY country.
EXECUTE.

*merge ISSP

GET FILE='C:\Users\chartz\OneDrive - Jacobs University\Paper '+
    '2\ISSP_2019\ZA7600_v2-0-0.sav\ZA7600_v2-0-0_country_aggr.sav'.
DATASET NAME DataSet9.
DATASET ACTIVATE DataSet6.
SORT CASES BY country.
DATASET ACTIVATE DataSet9.
SORT CASES BY country.
DATASET ACTIVATE DataSet6.
MATCH FILES /FILE=*
  /FILE='DataSet9'
  /BY country.
EXECUTE.

*merge CPI

GET FILE='C:\Users\chartz\OneDrive - Jacobs University\Paper 2\CPI 2021 Full Data Set\CPI_Wave '+
    '5_6 aggr.sav'.
DATASET NAME DataSet10.
DATASET ACTIVATE DataSet6.
SORT CASES BY country.
DATASET ACTIVATE DataSet10.
SORT CASES BY country.
DATASET ACTIVATE DataSet6.
MATCH FILES /FILE=*
  /FILE='DataSet10'
  /BY country.
EXECUTE.

DELETE VARIABLES d23_cpi_w5.
