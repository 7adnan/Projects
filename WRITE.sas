*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates how to create a permanent data set.;

DATA "C:\SASDATA\PEOPLE";
INPUT ID $ 1-3 SBP 4-6 DBP 7-9 GENDER $ 10 AGE 11-12 WT 13-15;
DATALINES;
001120 80M15115
002130 70F25180
003140100M89170
004120 80F30150
005125 80F20110
;
RUN;
PROC MEANS;
RUN;

TITLE;FOOTNOTE;
