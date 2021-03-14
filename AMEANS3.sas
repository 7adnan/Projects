*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PROC MEANS;
* You could use MYSASLIB.SOMEDATA in the DATA= Statement;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

PROC MEANS DATA="C:\SASDATA\SOMEDATA";
OUTPUT OUT=TIME1MEAN MEAN=T1;
VAR TIME1;
RUN;
PROC PRINT DATA=TIME1MEAN;RUN;



TITLE;FOOTNOTE;
