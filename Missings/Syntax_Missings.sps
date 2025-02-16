* Encoding: UTF-8.
** Estimate missing dimensions

* d11_6
* d12_5 (especially problematic)
* d12_6 (especially problematic)
* d21_5 (especially problematic)
* d21_6 (especially problematic)
* d22_6
* d31_6 

* Do not forget to merge the other respective wave as well (d11_5, d22_5, d31_5)

* merge these datafiles together for Mplus
    
DATASET ACTIVATE DataSet18.
SORT CASES BY country.
DATASET ACTIVATE DataSet19.
SORT CASES BY country.
DATASET ACTIVATE DataSet18.
MATCH FILES /FILE=*
  /FILE='DataSet19'
  /BY country.
EXECUTE.

SORT CASES BY country.
DATASET ACTIVATE DataSet21.
SORT CASES BY country.
DATASET ACTIVATE DataSet18.
MATCH FILES /FILE=*
  /FILE='DataSet21'
  /BY country.
EXECUTE.

SORT CASES BY country.
DATASET ACTIVATE DataSet22.
SORT CASES BY country.
DATASET ACTIVATE DataSet18.
MATCH FILES /FILE=*
  /FILE='DataSet22'
  /BY country.
EXECUTE.

SORT CASES BY country.
DATASET ACTIVATE DataSet23.
SORT CASES BY country.
DATASET ACTIVATE DataSet18.
MATCH FILES /FILE=*
  /FILE='DataSet23'
  /BY country.
EXECUTE.

SORT CASES BY country.
DATASET ACTIVATE DataSet20.
SORT CASES BY country.
DATASET ACTIVATE DataSet18.
MATCH FILES /FILE=*
  /FILE='DataSet20'
  /BY country.
EXECUTE.

SORT CASES BY country.
DATASET ACTIVATE DataSet24.
SORT CASES BY country.
DATASET ACTIVATE DataSet18.
MATCH FILES /FILE=*
  /FILE='DataSet24'
  /BY country.
EXECUTE.

SORT CASES BY country.
DATASET ACTIVATE DataSet2.
SORT CASES BY country.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /FILE='DataSet2'
  /BY country.
EXECUTE.

SORT CASES BY country.
DATASET ACTIVATE DataSet3.
SORT CASES BY country.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /FILE='DataSet3'
  /BY country.
EXECUTE.

SORT CASES BY country.
DATASET ACTIVATE DataSet4.
SORT CASES BY country.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /FILE='DataSet4'
  /BY country.
EXECUTE.

* recode all missings of factor scores (999)

RECODE D11_5 D11_6 D12_5 D12_6 D21_5 D21_6 D22_5 D22_6 D31_5 D31_6 (MISSING=999).
EXECUTE.

* save file as .dat format

SAVE TRANSLATE OUTFILE='C:\Users\chartz\OneDrive - Jacobs University\Paper 2\Wave 5\Mplus\CFA\SPSS Scores\Scores_missings.dat'
  /TYPE=TAB
  /ENCODING='UTF8'
  /MAP
  /REPLACE
  /FIELDNAMES
  /CELLS=VALUES.


