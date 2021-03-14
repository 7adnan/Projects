*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PROC UNIVARIATE;
*
* Replace the ??? missing information in the code below.
*;
PROC FORMAT;
VALUE FMTSUV 0="NOT SUV"
               1="???";
VALUE FMTAUTO 0="???"
               1="Automatic";
RUN;
TITLE 'HISTOGRAMS of CITY MPG by SUV and AUTOMATIC';

 PROC UNIVARIATE DATA="C:\SASDATA\CARS" NOPRINT;
  CLASS AUTOMATIC SUV;
  VAR CITYMPG;
  HISTOGRAM / NROWS=??? NCOLS=??? CFILL=BLUE PFILL=M3N45;
  INSET N='N:' (4.0) MIN='MIN:' (4.1) MAX='MAX:' (4.1) MEAN='MEAN' (???)
               / NOFRAME POSITION=??? HEIGHT=2;
			   FORMAT AUTOMATIC ??? SUV FMTSUV.;
RUN;


