*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates ODS;

PROC FREQ DATA="C:\SASDATA\SOMEDATA";
     TABLES STATUS;
TITLE 'Simple Example of PROC FREQ';
RUN;


TITLE;FOOTNOTE;

