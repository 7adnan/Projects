*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC REPORT procedure;

TITLE "PROC REPORT Multiple Statistics Example";
PROC REPORT DATA=MYSASLIB.CARS NOFS;
COLUMN BRAND CITYMPG,(N MEAN STD) HWYMPG ENGINESIZE ;
  DEFINE BRAND/GROUP;
  DEFINE CITYMPG/ FORMAT=6.1 'City MPG';
  DEFINE N / 'N' format=4.;
  DEFINE HWYMPG/ ANALYSIS MEAN FORMAT=6.1;
  DEFINE ENGINESIZE/ ANALYSIS MEAN FORMAT=6.1;
RUN;


TITLE;FOOTNOTE;
