*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates ARITHMETIC FUNCTIONS;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;


* ARITHMETIC FUNCTIONS EXAMPLES;
DATA ARITH; SET MYSASLIB.HASMISSING;
MAXTIME=MAX(PRE,MONTH6,MONTH12,MONTH24);
MINTIME=MIN(OF PRE--MONTH24);
MISSTIME=NMISS(OF PRE--MONTH24); 
MEANTIME=MEAN(OF PRE--MONTH24);
;
TITLE "Use Arithmetic Functions";
PROC PRINT DATA=ARITH; RUN;

TITLE;FOOTNOTE;

