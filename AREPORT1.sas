*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* Note: These GRAPH examples use the MYSASLIB library. If you have
* not created this library, you can use this code, or modify this
* code to point to the folder containing your data files;
* LIBNAME MYSASLIB "C:\SASDATA\";

* This example illustrates the PROC REPORT procedure;

TITLE 'PROC REPORT DISPLAY Example';
PROC REPORT DATA=MYSASLIB.CARS NOFS;
  COLUMN BRAND MODEL CITYMPG HWYMPG;
  DEFINE CITYMPG/DISPLAY FORMAT=6.1 'CITY/MPG';
RUN;

TITLE;FOOTNOTE;

