*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the RETAIN statement;

DATA MYDATA;
INPUT VISIT_DATE ANYDTDTE10.;
DATALINES;
01/04/2015 
01/29/2015
03/07/2015
04/25/2015
07/06/2015
08/30/2015
;
DATA DAYS;SET MYDATA;
IF _N_=1 THEN FIRST=VISIT_DATE;
RETAIN FIRST;
DAYS=VISIT_DATE-FIRST;
RUN;
PROC PRINT DATA=DAYS;
Title 'These are the contents of the dataset DAYS';
FORMAT VISIT_DATE FIRST DATE10.;
RUN;


TITLE;FOOTNOTE;
