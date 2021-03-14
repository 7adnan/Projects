*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example is for end of chapter exercise 2.4;

DATA BIRTHDATES;
INPUT ID $ 1-5 ;          * finish INPUT statement;
FORMAT BDATE someformat.; * finish OUTPUT FORMAT statement;
DATALINES;
00001M112JAN1999
00021F003MAR1989
00043F018JUL1991
00054M022DEC1998
00132F110JUL1992
;
Title "Exercise 2.3 - your name";
PROC PRINT DATA=BIRTHDATES;
RUN;

TITLE;FOOTNOTE;
