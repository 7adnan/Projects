*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates SGPLOT;

PROC SGPLOT DATA=MYSASLIB.WOUND; 
   HISTOGRAM SBP;
TITLE "SGPLOT Histogram"; 
RUN; 


TITLE;FOOTNOTE;
