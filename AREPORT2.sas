*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC REPORT procedure;
TITLE "PROC REPORT ORDER Example";
PROC REPORT DATA=MYSASLIB.CARS NOFS;
  COLUMN BRAND CITYMPG HWYMPG;
  DEFINE BRAND/ORDER 'Brand';
  DEFINE CITYMPG/DISPLAY FORMAT=6.1 'City MPG';
  DEFINE HWYMPG/DISPLAY FORMAT=6.1 'Highway MPG';
RUN;

