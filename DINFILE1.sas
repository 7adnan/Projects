*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example reads data using INFILE;
* NOTE: If your data is in a folder other than C:\SASDATA, 
  you will need to change the INFILE statement;

DATA MYDATA;
INFILE 'C:\SASDATA\EXAMPLE.TXT';
INPUT ID $ 1-3 GP $ 5 AGE 6-9 
      TIME1 10-14 TIME2 15-19 TIME3 20-24;
PROC MEANS DATA=MYDATA;
RUN;

TITLE;FOOTNOTE


