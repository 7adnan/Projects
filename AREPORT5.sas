*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC REPORT procedure;

TITLE "PROC REPORT COMPUTE Example";
PROC REPORT DATA=MYSASLIB.CARS NOFS SPLIT="~";
  COLUMN BRAND CITYMPG,MEAN HWYMPG, MEAN RATIO_MPG;
  DEFINE BRAND/ORDER;
  DEFINE BRAND/GROUP;
  DEFINE CITYMPG/DISPLAY FORMAT=6.1 'City MPG';
  DEFINE HWYMPG/DISPLAY FORMAT=6.1 'Highway MPG';
  DEFINE RATIO_MPG/COMPUTED FORMAT=6.2 'Ratio~CITY/HWY';
  COMPUTE RATIO_MPG;
     RATIO_MPG=_C2_/_C3_;
  ENDCOMP;
RUN;

TITLE;FOOTNOTE;



