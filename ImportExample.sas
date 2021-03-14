
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates how to import a CSV file;

PROC IMPORT OUT= WORK.MPG_FOR_CARS 
            DATAFILE= "C:\SASDATA\CARSMPG.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;


TITLE;FOOTNOTE;
