*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates a conditional IF statement
* to set a missing value.;

DATA MYDATA;
INPUT ID $ SBP DBP GENDER $ AGE; 
IF AGE GT 12 AND AGE LT 20 THEN TEEN=1;ELSE TEEN=0;
IF AGE=. THEN TEEN=.;
DATALINES;
001 120 80 M 15
002 130 70 F . 
003 140 100 M 12
004 180 80 F 17 
005 144 80 F 23 
006 165 80 M 18 
007 121 80 F 19 
008 195 80 M 11 
009 162 80 M 13 
010 112 80 F 17 
;
PROC PRINT;
RUN;

TITLE;FOOTNOTE;
