*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates subsetting;
* IF your data is stored in a different location, chance the C:\SASDATA reference;

DATA MYDATA;
INFILE 'C:\SASDATA\EXAMPLE.DAT'; 
INPUT GP $ 5 AGE 6-9 @;
IF GP EQ "A" and AGE GE 10;
INPUT	ID  $ 1-3 GP $ 5 AGE 6-9 TIME1 10-14 TIME2 15-19;
PROC PRINT DATA=MYDATA; 
RUN;

TITLE;FOOTNOTE;
