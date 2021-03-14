*******************************************************
Code files for Chapter 11;

*ATTEST1.SAS;


*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC TTEST procedure;
* NOTE: Depending on your version of SAS, you may need to use 

*ODS GRAPHICS ON;

* in order for this example to produce graphs.;

DATA ONESAMPLE;
INPUT LENGTH @@;
DATALINES;
4		3.95	4.01	3.95	4.00
3.98 	3.97	3.97	4.01	3.98
3.99	4.01	4.02	4.02	3.98
4.01    3.99    4.03    4.00	3.99
;
Title 'Single sample t-test, using PROC UNIVARIATE';
PROC UNIVARIATE DATA=ONESAMPLE MU0=4;VAR LENGTH ;RUN;
Title 'Single sample t-test using PROC TTEST';
PROC TTEST DATA=ONESAMPLE  H0=4;var LENGTH;
RUN;


TITLE;FOOTNOTE;


*ATTEST2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;
* NOTE: Depending on your version of SAS, you may need to use 

*ODS GRAPHICS ON;

* in order for this example to produce graphs.;

* This example illustrates the PROC TTEST procedure;

DATA TTEST PLOTS;
INPUT BRAND $ HEIGHT;
DATALINES;
   A   20.00
   A   23.00
   A   32.00
   A   24.00
   A   25.00
   A   28.00
   A   27.50
   B   25.00
   B   46.00
   B   56.00
   B   45.00
   B   46.00
   B   51.00
   B   34.00
   B   47.50
;
PROC TTEST;
     CLASS BRAND; VAR HEIGHT;
     Title 'Independent Group t-Test Example';
RUN;
QUIT;


TITLE;FOOTNOTE;



* ATTEST3.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC TTEST procedure;
* NOTE: Depending on your version of SAS, you may need to use 

*ODS GRAPHICS ON;

* in order for this example to produce graphs.;

DATA WEIGHT;
INPUT WBEFORE WAFTER;
DATALINES;
200 185
175 154
188 176
198 193
197 198
310 275
245 224
202 188
;
PROC TTEST;
PAIRED WBEFORE*WAFTER;
TITLE 'Paired t-test Example';
RUN;


TITLE;FOOTNOTE;


