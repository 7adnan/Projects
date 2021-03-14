
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates CHARACTER FUNCTIONS;

DATA NAMES;
FORMAT FIRST LAST MAYBE $20.;
INPUT @1 NAME $30.;
FIRST=SCAN(NAME,1," ");
LAST = SCAN(NAME, -1);
MAYBE=SCAN(NAME,-2);
IF MAYBE=FIRST THEN MAYBE="";
IF LENGTH(MAYBE)=1 THEN MAYBE="";
LASTNAME=CAT(MAYBE, LAST);
FULLNAME=CAT(FIRST,LAST);
DATALINES;
Alfred J. Prufrock
Benjamin Harrison
George H. W. Bush
Vincent Van Gough
A. C. Elliott
;
PROC PRINT DATA=NAMES;
RUN;

TITLE;FOOTNOTE;
