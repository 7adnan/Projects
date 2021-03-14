*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC FREQ procedure;

DATA LEARN;
INPUT CLASS $ LEC $ COUNT;
DATALINES;
S Y 4
S N 11
F Y 5
F N 3
;
PROC FREQ DATA=LEARN;WEIGHT COUNT;
     TABLES CLASS*LEC/CHISQ ;  
TITLE 'Chi Square Analysis of a Contingency Table';
RUN;

TITLE;FOOTNOTE;
