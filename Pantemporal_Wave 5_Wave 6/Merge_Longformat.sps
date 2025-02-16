* Encoding: UTF-8.
* merge both Waves and change from wideformat to longformat

DATASET ACTIVATE DataSet1.
ADD FILES /FILE=*
  /FILE='DataSet2'
  /IN=Wave.
VARIABLE LABELS Wave
 'Case source is DataSet2'.
EXECUTE.
