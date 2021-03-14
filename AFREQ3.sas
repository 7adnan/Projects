*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC FREQ procedure;

DATA COINS;
     INPUT @1 CATEGORY $9. @11 NUMBER 3.;
DATALINES; 
CENTS     152
CENTS     100
NICKELS   49
DIMES     59
QUARTERS  21
HALF      44
DOLLARS   21
;
PROC FREQ; WEIGHT NUMBER; 
  TITLE 'Reading Summarized Count data';
  TABLES CATEGORY;
RUN;
