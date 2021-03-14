*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC GCHART procedure;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

GOPTIONS RESET=ALL;
Title "Horizontal Bar Chart";
PROC GCHART DATA=MYSASLIB.SOMEDATA; 
HBAR STATUS/DISCRETE;
;
RUN;
QUIT;


TITLE;FOOTNOTE;


