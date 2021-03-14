*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC REPORT procedure;

TITLE "PROC REPORT ANALYSIS Example";
PROC REPORT DATA=MYSASLIB.CARS NOFS;
  COLUMN BRAND CITYMPG HWYMPG;
  DEFINE BRAND/GROUP;
  DEFINE CITYMPG/ANALYSIS MEAN FORMAT=6.1 'CITY/MPG';
RUN;


TITLE;FOOTNOTE;


