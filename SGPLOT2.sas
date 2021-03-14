*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC SGPLOT procedure;

PROC SGPLOT DATA=MYSASLIB.WOUND; 
 HBAR RACE_CAT;
 TITLE "SGPLOT Bar Chart"; 
RUN; 


TITLE;FOOTNOTE;
