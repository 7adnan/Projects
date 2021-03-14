*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the use of KEEP, DROP, and RENAME;

*********************************************************
* Note correction in the book p 93
* There is no GENDER variable in this data set
* GENDER has been removed from this code.
*********************************************************;

PROC SORT DATA="C:\SASDATA\SOMEDATA"
       OUT=ANALYSIS
       (KEEP=ID GP AGE GENDER RENAME=( ID=SUBJECT AGE=DXAGE)); 
BY ID; 
RUN;
TITLE "Example of KEEP and RENAME in SORT";
PROC PRINT DATA=ANALYSIS;RUN;


TITLE;FOOTNOTE;
