*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PROC FREQ;
* You could use MYSASLIB.SOMEDATA in the DATA= Statement;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

PROC FREQ DATA='C:\SASDATA\SOMEDATA'; 
     TABLES STATUS;
TITLE 'Simple Example of PROC FREQ';
RUN;
PROC FREQ DATA='C:\SASDATA\SOMEDATA'  ORDER=FREQ; 
     TABLES STATUS;
TITLE 'Example of PROC FREQ Using ORDER= Option';
RUN;

TITLE;FOOTNOTE;

