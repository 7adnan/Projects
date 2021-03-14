*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the SELECT Statment;
* You could use MYSASLIB.SOMEDATA in the DATA= Statement;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

TITLE "This example illustrates the Select Statement";
DATA MYDATA;SET "C:\SASDATA\SOMEDATA";
FORMAT ECONOMIC $7.;
SELECT(STATUS);
   WHEN (1,2) ECONOMIC="LOW";
   WHEN (3) ECONOMIC="MIDDLE";
   WHEN (4,5) ECONOMIC="HIGH";
   OTHERWISE ECONOMIC="MISSING";
END;

PROC PRINT DATA=MYDATA; 
RUN;


TITLE;FOOTNOTE;
