*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC REPORT procedure;

TITLE "PROC REPORT Subtotals";
PROC REPORT DATA=MYSASLIB.CARS NOFS;
COLUMN BRAND CYLINDERS AUTOMATIC SUV  ;
  DEFINE BRAND/GROUP;
  DEFINE CYLINDERS/GROUP;
  BREAK AFTER BRAND/SUMMARIZE SUPPRESS;
  RBREAK AFTER/ SUMMARIZE ;
  WHERE CYLINDERS NE -1 ;
RUN;


TITLE;FOOTNOTE;
