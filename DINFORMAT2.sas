*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates FORMATS and INFORMATS;

DATA REPORT;
INPUT @1 NAME $10. @11 SCORE 5.2 @17 BDATE DATE9.;
FORMAT BDATE WORDDATE12.;  
DATALINES;
Bill      22.12 09JAN2016
Jane      33.01 02FEB2000
Clyde     15.45 23MAR1999
;
PROC PRINT DATA=REPORT;
RUN;

TITLE;FOOTNOTE;
