*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates finding the FIRST and LAST values in a group;

DATA MYDATA;
INFILE 'C:\SASDATA\EXAMPLE.DAT'; 
INPUT	ID  $ 1-3 GP $ 5 AGE 6-9 TIME1 10-14 TIME2 15-19;
IF AGE LE 10;
PROC PRINT DATA=MYDATA; 
RUN;

TITLE;FOOTNOTE;
