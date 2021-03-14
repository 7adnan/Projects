*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC REPORT procedure;

TITLE "PROC REPORT Exercise 19.2";
PROC REPORT DATA=MYSASLIB.SOMEDATA NOFS ;
  COLUMN AGE STATUS TIME1-TIME4 MEANTIME;
  DEFINE AGE/GROUP;
  DEFINE TIME1/ANALYSIS MEAN ;
  DEFINE MEANTIME/COMPUTED  'AVE TIME 1 TO 2' ;
  COMPUTE MEANTIME;
     MEANTIME=(_C3_+_C4_)/2; *MEAN OF TIME1 AND TIME2;
  ENDCOMP;
RUN;



TITLE;FOOTNOTE;



