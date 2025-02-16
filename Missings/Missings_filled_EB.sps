* Encoding: UTF-8.
* Usage of Eurobarometer for missing data for Greece, Luxembourg and Malta in 1.2 Trust in People and 2.1. Identification
    
* Use of ZA7576: 91.5 (2019) for 2.1 Identification 
    
* Check on the descriptives of both variables
    
FREQUENCIES VARIABLES=qd1a_1 qd1a_2
  /STATISTICS=STDDEV MINIMUM MAXIMUM MEAN
  /ORDER=ANALYSIS.

* Recode the variables (high: more attachment; low: less attachment)
    
RECODE qd1a_1 qd1a_2 (1=4) (2=3) (3=2) (4=1) (else=copy) into qd1a_1_r qd1a_2_r.
VALUE LABELS qd1a_1_r qd1a_2_r 4 'Very attached' 3 'Fairly attached' 2 'Not very attached' 1 'Not at all attached'.
VARIABLE LABELS qd1a_1_r 'ATTACHMENT TO: CITY/TOWN/VILLAGE_recoded'.
VARIABLE LABELS qd1a_2_r 'ATTACHMENT TO: COUNTRY_recoded'.
VARIABLE LEVEL qd1a_1_r qd1a_2_r (SCALE).

* Agregate both variables on country level

AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES
  /BREAK=isocntry
  /qd1a_1_r_mean=MEAN(qd1a_1_r) 
  /qd1a_2_r_mean=MEAN(qd1a_2_r).

* Control

FREQUENCIES VARIABLES=qd1a_1_r_mean qd1a_2_r_mean
  /STATISTICS=STDDEV MINIMUM MAXIMUM MEAN
  /ORDER=ANALYSIS.

* Give out cross tabulats to see country differences

CROSSTABS
  /TABLES=isocntry BY qd1a_1_r_mean
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=isocntry BY qd1a_2_r_mean
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT
  /COUNT ROUND CELL.





