
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates Special Use FUNCTIONS;

DATA TEMP;
LENGTH CHAR4 $ 4;
INPUT NUMERIC CHAR4;
* CONVERT CHARACTER VARIABLE TO NUMERIC;
NEW_NUM=INPUT(CHAR4,BEST4.);
* CONVERT NUMERIC VARIABLE TO CHARACTER;
NEW_CHAR=PUT(NUMERIC,4.0);
DATALINES;
789.1 1234
009.2 0009
1.5 9999
;
PROC PRINT;
FORMAT NEW_NUM 6.1 NEW_CHAR $8.;
RUN;



TITLE;FOOTNOTE;
