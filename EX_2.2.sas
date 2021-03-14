*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example is for end of chapter exercise 2.2;

DATA PEOPLE;
INPUT ID $ 1-5 ; * finish INPUT statement;
DATALINES;
0000123MY201
0002143FY154
0004333FN133
0005429MN173
0013249FY114
;
Title "Exercise 2.2 – your name";
PROC PRINT DATA=PEOPLE;
RUN;

TITLE;FOOTNOTE;
