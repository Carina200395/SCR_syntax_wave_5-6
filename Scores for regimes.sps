* Encoding: UTF-8.
* Decriptives for clustered countries

DATASET ACTIVATE DataSet1.
IF  (country = 578 | country = 208 | country = 246 | country = 752 | country =  528 | country =  
    276  | country = 756) regimes=1 .
IF  (country = 40 | country = 442 | country = 372 | country = 56 | country =  826 | country =  
    250) regimes=2 .
IF  (country = 300 | country = 724 | country = 470 | country = 233 | country = 380 | country = 616 | country = 620 | country =  
    428 | country = 440 | country = 703 | country = 642) regimes=3.
IF  (country = 100 | country = 348 | country = 191 | country =  705 
    | country = 196 |  country = 203) regimes=4.
EXECUTE.

* Generate table

DESCRIPTIVES VARIABLES=cohw6 ZD11_6 ZD12_6 ZD13_6 ZD21_6 ZD22_6 ZD23_6 ZD31_6 ZD32_6 ZD33_6
  /STATISTICS=MEAN.
