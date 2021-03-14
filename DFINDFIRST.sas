*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates finding the FIRST and LAST values in a group;
* NOTE:
* LIBNAME MYSASLIB 'C:\SASDATA'; * NEEDED IF MYSASLAB NOT ALREADY CREATED;
DATA FIRST;
SET mysaslib.somedata; 
by GP;
IF FIRST.GP then WHICHID="ISFIRST";
IF LAST.GP then WHICHID="ISLAST";
RUN;
PROC PRINT DATA=FIRST;
VAR ID GP WHICHID;
RUN;


TITLE;FOOTNOTE;
