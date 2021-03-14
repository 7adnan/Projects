*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PROC UNIVARIATE;
* You could use MYSASLIB.WOUND in the DATA= Statement;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;


ODS GRAPHICS OFF; * May not be needed for some versions of SAS;
*If color options in this example do not work, 
 then you need to use the ODS GRAPHICS OFF steement;

PROC FORMAT;
VALUE FMTWOUND 0="NONPENETRATE"
               1="PENETRATE";
RUN;
TITLE 'HISTOGRAMS of SBP by GENDER and WOUND TYPE';
PROC UNIVARIATE DATA="C:\SASDATA\WOUND" NOPRINT;
  CLASS WOUND GENDER;
  VAR SBP;
  HISTOGRAM / NROWS=2 NCOLS=2 CFILL=BLUE PFILL=M3N45;
  INSET N='N:' (4.0) MIN='MIN:' (4.1) MAX='MAX:' (4.1)
               / NOFRAME POSITION=NE HEIGHT=2;
  FORMAT WOUND FMTWOUND.;
RUN;


TITLE;FOOTNOTE;

