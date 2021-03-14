*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC REPORT procedure;

TITLE "PROC REPORT ACROSS Example";
PROC FORMAT; 
VALUE FMTSUV 0="NOT SUV" 1="SUV";
PROC REPORT DATA=MYSASLIB.CARS NOFS;
  COLUMN BRAND CITYMPG,SUV HWYMPG,SUV;
  DEFINE BRAND/ORDER;
  DEFINE BRAND/GROUP;
  DEFINE CITYMPG/ANALYSIS MEAN FORMAT=6.1;
  DEFINE HWYMPG/ANALYSIS MEAN FORMAT=6.1;
  DEFINE SUV/ ACROSS 'BY SUV'; 
  FORMAT SUV FMTSUV.;
RUN;

TITLE;FOOTNOTE;




