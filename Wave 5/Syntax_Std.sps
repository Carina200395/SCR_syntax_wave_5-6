* Encoding: UTF-8.
    
** Standardadize all factor scores and control it with original factor scores, document it 
    *** Create domanis and Index

* read in data from .txt file

PRESERVE.
SET DECIMAL DOT.

GET DATA  /TYPE=TXT
  /FILE='C:\Users\chartz\OneDrive - Jacobs University\Paper 2\Wave 5\Mplus\CFA\scores_test_5.txt'
  /DELCASE=LINE
  /DELIMITERS='\t'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=1
  /DATATYPEMIN PERCENTAGE=95.0
  /VARIABLES=
  V1 AUTO
  V2 AUTO
  V3 AUTO
  V4 AUTO
  V5 AUTO
  V6 AUTO
  /MAP.
RESTORE.

CACHE.
EXECUTE.
DATASET NAME DataSet1 WINDOW=FRONT.

** safe the data set 

* drop unnessesary variables (do that in each dimension/wave before merging)

DELETE VARIABLES V1 V2 V3 d11_5_SE.

* merge i dimension with the other respective wave (key variable: country)
* D11_6

DATASET ACTIVATE DataSet1.
SORT CASES BY country.
DATASET ACTIVATE DataSet2.
SORT CASES BY country.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /FILE='DataSet2'
  /BY country.
EXECUTE.

*D12_5

SORT CASES BY country.
DATASET ACTIVATE DataSet6.
SORT CASES BY country.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /FILE='DataSet6'
  /BY country.
EXECUTE.

*D12_6

SORT CASES BY country.
DATASET ACTIVATE DataSet8.
SORT CASES BY country.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /FILE='DataSet8'
  /BY country.
EXECUTE.

*D13_5

SORT CASES BY country.
DATASET ACTIVATE DataSet11.
SORT CASES BY country.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /FILE='DataSet11'
  /BY country.
EXECUTE.

*D13_6

SORT CASES BY country.
DATASET ACTIVATE DataSet13.
SORT CASES BY country.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /FILE='DataSet13'
  /BY country.
EXECUTE.

*D21_5
    
SORT CASES BY country.
DATASET ACTIVATE DataSet15.
SORT CASES BY country.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /FILE='DataSet15'
  /BY country.
EXECUTE.

*D21_6

SORT CASES BY country.
DATASET ACTIVATE DataSet16.
SORT CASES BY country.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /FILE='DataSet16'
  /BY country.
EXECUTE.

*D22_5

SORT CASES BY country.
DATASET ACTIVATE DataSet18.
SORT CASES BY country.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /FILE='DataSet18'
  /BY country.
EXECUTE.

*D22_6
    
SORT CASES BY country.
DATASET ACTIVATE DataSet6.
SORT CASES BY country.
DATASET ACTIVATE DataSet2.
MATCH FILES /FILE=*
  /FILE='DataSet6'
  /BY country.
EXECUTE.

*D23_5
    
DATASET ACTIVATE DataSet1.
SORT CASES BY country.
DATASET ACTIVATE DataSet3.
SORT CASES BY country.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /FILE='DataSet3'
  /BY country.
EXECUTE.

*D23_6

SORT CASES BY country.
DATASET ACTIVATE DataSet8.
SORT CASES BY country.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /FILE='DataSet8'
  /BY country.
EXECUTE.

*D31_5

SORT CASES BY country.
DATASET ACTIVATE DataSet9.
SORT CASES BY country.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /FILE='DataSet9'
  /BY country.
EXECUTE.

*D31_6
    
DATASET ACTIVATE DataSet13.
SORT CASES BY country.
DATASET ACTIVATE DataSet12.
SORT CASES BY country.
DATASET ACTIVATE DataSet13.
MATCH FILES /FILE=*
  /FILE='DataSet12'
  /BY country.
EXECUTE.

*D32_5

SORT CASES BY country.
DATASET ACTIVATE DataSet14.
SORT CASES BY country.
DATASET ACTIVATE DataSet13.
MATCH FILES /FILE=*
  /FILE='DataSet14'
  /BY country.
EXECUTE.

*D32_6

SORT CASES BY country.
DATASET ACTIVATE DataSet15.
SORT CASES BY country.
DATASET ACTIVATE DataSet13.
MATCH FILES /FILE=*
  /FILE='DataSet15'
  /BY country.
EXECUTE.

*D33_5
    
SORT CASES BY country.
DATASET ACTIVATE DataSet16.
SORT CASES BY country.
DATASET ACTIVATE DataSet13.
MATCH FILES /FILE=*
  /FILE='DataSet16'
  /BY country.
EXECUTE.

*D33_6
    
SORT CASES BY country.
DATASET ACTIVATE DataSet17.
SORT CASES BY country.
DATASET ACTIVATE DataSet13.
MATCH FILES /FILE=*
  /FILE='DataSet17'
  /BY country.
EXECUTE.

** Control and document the Mean and N of i dimension

FREQUENCIES VARIABLES=D11_5 D11_6 D12_5 D12_6 D13_5 D13_6 D21_5 D21_6 D22_5 D22_6 D23_5 D23_6 D31_5 D31_6 D32_5 D32_6 D33_5 D33_6
  /STATISTICS=STDDEV MINIMUM MAXIMUM MEAN
  /ORDER=ANALYSIS.

*** Go to missing syntax now to fill up missings in Mplus, than continue in this syntax to finalize the standardization
  
* merge new data sets without missings
    * D11_6_complete
    
DATASET ACTIVATE DataSet1.
SORT CASES BY country.
DATASET ACTIVATE DataSet3.
SORT CASES BY country.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /FILE='DataSet3'
  /BY country.
EXECUTE.

    *D22_6_complete
    
SORT CASES BY country.
DATASET ACTIVATE DataSet9.
SORT CASES BY country.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /FILE='DataSet6'
  /BY country.
EXECUTE.

    *D31_6_complete
    
SORT CASES BY country.
DATASET ACTIVATE DataSet6.
SORT CASES BY country.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /FILE='DataSet6'
  /BY country.
EXECUTE.

* quickly control the new factor scores without missings and document the new sd in the excel sheet

FREQUENCIES VARIABLES=D11_6 D31_6
  /STATISTICS=STDDEV MEAN
  /ORDER=ANALYSIS.

** Standardize all variables together

DESCRIPTIVES VARIABLES=D11_5 D11_6 D12_5 D12_6 D13_5 D13_6 D21_5 D21_6 D22_5 D22_6 D23_5 D23_6 D31_5 D31_6 D32_5 D32_6 D33_5 D33_6
  /SAVE
  /STATISTICS=MEAN STDDEV MIN MAX.

* control all stand. factor scores if they have a mean of 0 and a Sd of 1 --> document country values in excel sheet 'Factorscores__5__5'
   
*** Create domanis and Index
    
COMPUTE d1w5=MEAN(ZD11_5,ZD12_5,ZD13_5).
EXECUTE.
COMPUTE d1w6=MEAN(ZD11_6,ZD12_6,ZD13_6).
EXECUTE.

COMPUTE d2w5=MEAN(ZD21_5,ZD22_5,ZD23_5).
EXECUTE.
COMPUTE d2w6=MEAN(ZD21_6,ZD22_6,ZD23_6).
EXECUTE.

COMPUTE d3w5=MEAN(ZD31_5,ZD32_5,ZD33_5).
EXECUTE.
COMPUTE d3w6=MEAN(ZD31_6,ZD32_6,ZD33_6).
EXECUTE.

COMPUTE cohw5=MEAN(d1w5,d2w5,d3w5).
EXECUTE.
COMPUTE cohw6=MEAN(d1w6,d2w6,d3w6).
EXECUTE.

*** Write data set

VARIABLE LABELS ZD11_5 'D1.1 Social networks (13-16)'.
VARIABLE LABELS ZD12_5 'D1.2 Trust in people (13-16)'.
VARIABLE LABELS ZD13_5 'D1.3 Acceptance of diversity (13-16)'.

VARIABLE LABELS d1w5 'Domain 1: Social relations (13-16)'.

VARIABLE LABELS ZD21_5 'D2.1 Identification (13-16)'.
VARIABLE LABELS ZD22_5 'D2.2 Trust in institutions (13-16)'.
VARIABLE LABELS ZD23_5 'D2.3 Perception of fairness (13-16)'.

VARIABLE LABELS d2w5 'Domain 2: Connectedness (13-16)'.

VARIABLE LABELS ZD31_5 'D3.1 Solidarity and helpfulness (13-16)'.
VARIABLE LABELS ZD32_5 'D3.2 Respect for social rules (13-16)'.
VARIABLE LABELS ZD33_5 'D3.3 Civic participation (13-16)'.

VARIABLE LABELS d3w5 'Domain 3: Common good orientation (13-16)'.

VARIABLE LABELS cohw5 'Overall index of cohesion (13-16)'.

VARIABLE LABELS ZD11_6 'D1.1 Social networks (17-20)'.
VARIABLE LABELS ZD12_6 'D1.2 Trust in people (17-20)'.
VARIABLE LABELS ZD13_6 'D1.3 Acceptance of diversity (17-20)'.

VARIABLE LABELS d1w6 'Domain 1: Social relations (17-20)'.

VARIABLE LABELS ZD21_6 'D2.1 Identification (17-20)'.
VARIABLE LABELS ZD22_6 'D2.2 Trust in institutions (17-20'.
VARIABLE LABELS ZD23_6 'D2.3 Perception of fairness (17-20)'.

VARIABLE LABELS d2w6 'Domain 2: Connectedness (17-20)'.

VARIABLE LABELS ZD31_6 'D3.1 Solidarity and helpfulness (17-20)'.
VARIABLE LABELS ZD32_6 'D3.2 Respect for social rules (17-20)'.
VARIABLE LABELS ZD33_6 'D3.3 Civic participation (17-20)'.

VARIABLE LABELS d3w6 'Domain 3: Common good orientation (17-20)'.

VARIABLE LABELS cohw5 'Overall index of cohesion (13-16)'.
VARIABLE LABELS cohw6 'Overall index of cohesion (17-20)'.

SAVE OUTFILE='C:\Users\chartz\OneDrive - Jacobs University\Paper 2\Data_Results.sav'
  /COMPRESSED.

FREQUENCIES VARIABLES=d1w5 d1w6 d2w5 d2w6 d3w5 d3w6 cohw5 cohw6
  /FORMAT=NOTABLE
  /STATISTICS=STDDEV MEAN
  /ORDER=ANALYSIS.
