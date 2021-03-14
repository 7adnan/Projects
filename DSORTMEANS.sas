*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the use of the BY Statement;
* Note: If you have data in a folder other than C:\SASDATA you need to modify
        the INFILE statement;

DATA MYDATA;
INFILE 'C:\SASDATA\EXAMPLE.DAT';
INPUT ID 1-3 GP $ 5 AGE 6-9 TIME1 10-14 TIME2 15-19 TIME3 20-24 STATUS 31;
RUN;
* FIRST TIME ALL DATA AT ONCE;
PROC MEANS; 
   VAR TIME1 TIME2; 
RUN;*NOTE USES MYDATA BY DEFAULT;

* SECOND TIME MEANS BY GROUP;
PROC SORT DATA=MYDATA OUT=SORTED;BY GP; RUN;
PROC MEANS DATA=SORTED; 
   VAR TIME1 TIME2;
   BY GP; 
RUN;


TITLE;FOOTNOTE;
