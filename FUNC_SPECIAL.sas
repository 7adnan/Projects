*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates SPECIAL Functions;

DATA DATES; 
FORMAT BDATE WEEKDATE17.; 
INPUT @1 BDATE MMDDYY8.; 
BDATEDOW=PUT(BDATE,DOWNAME.);
BDATEMONTH=PUT(BDATE,MONNAME.);
DATALINES;
08212016
07041776
01011900 
; 
PROC PRINT DATA=DATES; RUN;


TITLE;FOOTNOTE;

