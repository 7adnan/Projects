*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the use of LABELS;

DATA MYDATA;
INPUT @1 FNAME $11. @12 LNAME $12. @24 BDATE DATE9.;
FORMAT BDATE WORDDATE12.;  
LABEL   FNAME="First Name"; * Complete the labels;
DATALINES;
Bill       Smith       08JAN1952
Jane       Jones       02FEB1953
Clyde      York        23MAR1949
;
PROC PRINT;
RUN;


