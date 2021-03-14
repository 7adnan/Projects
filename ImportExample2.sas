*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates how to import an EXCEL XLS file;

PROC IMPORT OUT= WORK.FROMXL 
            DATAFILE= "C:\SASDATA\EXAMPLE.XLS" 
            DBMS=XLS REPLACE;
     SHEET="Database"; 
     GETNAMES=YES;
RUN;
PROC PRINT DATA=FROMXL;RUN;

TITLE;FOOTNOTE;
