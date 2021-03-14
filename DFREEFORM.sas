*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example reads data using the freeform entry technique;

DATA MYDATA;
INPUT ID $ SBP DBP GENDER $ AGE WT;
DATALINES;
001 120 80 M    15    115
002 130 70 F 25 180
003 140 100 M 89 170
004 120 80 F 30 150
005 125 80 F 20 110
;
PROC PRINT DATA=MYDATA;
RUN;


TITLE;FOOTNOTE;
