*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC COOR procedure;
* You could use MYSASLIB.SOMEDATA in the DATA= Statement;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

PROC CORR DATA="C:\SASDATA\SOMEDATA";
     VAR AGE TIME1 TIME2;
TITLE "Example correlations using PROC CORR";
RUN;



TITLE;FOOTNOTE;
