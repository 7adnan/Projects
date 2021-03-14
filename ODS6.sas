*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates ODS;

DATA WT;
INPUT WEIGHT @@;
DATALINES;
64 71 53 67 55 58
77 57 56 51 76 68
;
Title "Output statistics to a data set";
ODS OUTPUT SUMMARY=STATS;
   PROC MEANS DATA=WT; 
   RUN;
PROC PRINT DATA=STATS;
RUN;


TITLE;FOOTNOTE;


