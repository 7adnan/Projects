*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PFILL Patterns;
ODS GRAPHICS OFF; * NEEDED FOR SOME RELEASES OF SAS TO MAKE PFILL WORK;
PROC UNIVARIATE DATA="C:\SASDATA\SOMEDATA" NOPRINT;
  VAR AGE;
  HISTOGRAM /NORMAL PFILL=M3X45;
RUN;


TITLE;FOOTNOTE;
