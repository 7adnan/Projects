*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the INTCK Function.;
DATA DATES;
INPUT @1 BDATE MMDDYY8.;
TARGET=MDY(08,25,2016);         * Uses MDY() function;
AGE=INTCK('YEAR',BDATE,TARGET); *  INTCK function;
DATALINES;
07101952
07041776
01011900
;
PROC PRINT DATA=DATES;
FORMAT BDATE WEEKDATE. TARGET MMDDYY8.;
RUN;

TITLE;FOOTNOTE;
