*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

DATA TTEST;
INPUT GROUP OBS;
DATALINES;
   1   20.00
   1   23.00
   1   32.00
   1   24.00
   1   25.00
   1   28.00
   1   27.50
   2   25.00
   2   46.00
   2   56.00
   2   45.00
   2   46.00
   2   51.00
   2   34.00
   2   47.50
;
ODS TRACE ON;
PROC TTEST;
     CLASS GROUP; VAR OBS;
     Title 'Independent Group t-Test Example';
RUN;
ODS TRACE OFF;
