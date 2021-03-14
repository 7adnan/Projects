*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates ODS;

DATA WT;
INPUT WEIGHT @@;
DATALINES;
64 71 53 67 55 58
77 57 56 51 76 68
;
DATA WTDIFF;SET WT;
IF _N_=1 THEN SET STATS;
DIFF=WEIGHT-WEIGHT_MEAN;
Z=DIFF/WEIGHT_STDDEV; * CREATES STANDARDIZED SCORE (Z-SCORE);
RUN;
PROC PRINT DATA= WTDIFF;VAR WEIGHT DIFF Z;
RUN;




