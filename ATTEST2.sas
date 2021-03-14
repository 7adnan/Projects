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
