*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PROC EXPORT;

* LIBNAME MYSASLIB "C:\SASDATA"; * Needed if you have not defined the MYSASLIB library;
PROC EXPORT DATA=MYSASLIB.SOMEDATA
            OUTFILE="C:\SASDATA\EXPORTED.CSV" 
            DBMS=CSV
           REPLACE;
RUN;

TITLE;FOOTNOTE;


