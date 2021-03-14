*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PROC CORR;
* You could use MYSASLIB.SOMEDATA in the DATA= Statement;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

PROC CORR DATA="C:\SASDATA\SOMEDATA";
     VAR TIME1-TIME4; WITH AGE;
TITLE "Example correlation calculations using a WITH statement";
RUN;


TITLE;FOOTNOTE;
