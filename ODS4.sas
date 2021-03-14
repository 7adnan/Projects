*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates ODS;
DATA TABLE;
INPUT A B COUNT;
DATALINES;
 0 0 12
 0 1 15
 1 0 18
 1 1 3
;
ODS SELECT CROSSTABFREQS CHISQ;
PROC FREQ;WEIGHT COUNT;
   TABLES A*B /CHISQ;
   TITLE 'CHI-SQUARE ANALYSIS FOR A 2X2 TABLE';
RUN;


TITLE;FOOTNOTE;
