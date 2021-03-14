*******************************************************
Code files for Chapter 9;

*AMEANS1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PROC MEANS;

DATA CHILDREN;
INPUT WEIGHT HEIGHT AGE;
DATALINES;
64 57 8
71 59 10
53 49 6
67 62 11
55 51 8
58 50 8
77 55 10
57 48 9
56 42 10
51 42 6
76 61 12
68 57 9
;
PROC MEANS;
TITLE 'PROC MEANS, simplest use';
RUN;
PROC MEANS MAXDEC=2;VAR WEIGHT HEIGHT;
TITLE 'PROC MEANS, limit decimals, specify variables';
RUN;
PROC MEANS MAXDEC=2 N MEAN STDERR MEDIAN;VAR WEIGHT HEIGHT;
TITLE 'PROC MEANS, specify statistics to report';
RUN;

TITLE;FOOTNOTE;


*AMEANS2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PROC MEANS;

DATA FERTILIZER;
INPUT FEEDTYPE WEIGHTGAIN;
DATALINES;
1 46.20
1 55.60
1 53.30
1 44.80
1 55.40
1 56.00
1 48.90
2 51.30
2 52.40
2 54.60
2 52.20
2 64.30
2 55.00
;
PROC SORT DATA=FERTILIZER;BY FEEDTYPE;
PROC MEANS; VAR WEIGHTGAIN; BY FEEDTYPE;
TITLE 'Summary statistics by group';
RUN;
PROC MEANS; VAR WEIGHTGAIN; CLASS FEEDTYPE;
TITLE 'Summary statistics USING CLASS';
RUN;

TITLE;FOOTNOTE;

*AMEANS3.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PROC MEANS;
* You could use MYSASLIB.SOMEDATA in the DATA= Statement;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

PROC MEANS DATA="C:\SASDATA\SOMEDATA";
OUTPUT OUT=TIME1MEAN MEAN=T1;
VAR TIME1;
RUN;
PROC PRINT DATA=TIME1MEAN;RUN;



TITLE;FOOTNOTE;

*AUNI1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PROC UNIVARIATE;
DATA EXAMPLE;
INPUT AGE @@;
DATALINES;
12 11 12 12 9 11 8 8 7 11 12 14 9 10 7 13
6 11 12 4 11 9 13 6 9 7 13 9 13 12 10 13
11 8 11 15 12 14 10 10 13 13 10 8 12 7 13
11 9 12
;
PROC UNIVARIATE DATA=EXAMPLE; 
    VAR AGE;
RUN;

TITLE;FOOTNOTE;

*AUNI2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PROC UNIVARIATE;
* ODS GRAPHICS ON; * May not be necessary for some SAS versions;
DATA EXAMPLE;
INPUT AGE @@;
DATALINES;
12 11 12 12 9 11 8 8 7 11 12 14 9 10 7 13
6 11 12 4 11 9 13 6 9 7 13 9 13 12 10 13
11 8 11 15 12 14 10 10 13 13 10 8 12 7 13
11 9 12
;
PROC UNIVARIATE  PLOT DATA=EXAMPLE; VAR AGE;
TITLE 'PROC UNIVARIATE EXAMPLE';
RUN;


TITLE;FOOTNOTE;

*AUNI3.SAS;

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


PROC UNIVARIATE DATA="C:\SASDATA\WOUND" NOPRINT;
  CLASS RACE_CAT;
  LABEL RACE_CAT="RACE";
  VAR SBP;
  HISTOGRAM /NORMAL (COLOR=GREEN W=5) NROWS=3;
RUN;

TITLE;FOOTNOTE;

*AUNI4.SAS;
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

*AUNI5.SAS;
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















