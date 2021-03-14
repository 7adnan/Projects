*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the use of FORMATS;

* NOTE: FIRST RUN DFORMAT3.SAS;

OPTIONS  FMTSEARCH=(__________________);
PROC PRINT DATA="C:\SASDATA\SURVEY";
     VAR SUBJECT MARRIED GENDER;
     FORMAT MARRIED FMTMARRIED. GENDER $FMTGENDER.;
RUN;



TITLE;FOOTNOTE;
