
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC GCHART procedure;

GOPTIONS RESET=ALL;
ODS GRAPHICS OFF; * Needed for some SAS version to display colors;
Title "Distribution of HwyMPG by Cylinders";
* You must sort the data on the grouping variable;
PROC SORT DATA="C:\SASDATA\CARS"
     OUT=CARDATA;BY CYLINDERS;
PROC BOXPLOT DATA=CARDATA;
     PLOT HWYMPG*CYLINDERS/CBOXFILL=LIGHTGREEN;
     WHERE CYLINDERS GT 1;
RUN;


TITLE;FOOTNOTE;
