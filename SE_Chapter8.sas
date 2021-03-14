*******************************************************
Code files for Chapter 8;

*ODS1.SAS;
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates ODS;
* Note: If you have data in a folder other than C:\SASDATA you need to modify
        the INFILE statement;


DATA TEST; SET "C:\SASDATA\SOMEDATA";
* DEFINE WHERE HTML LISTING WILL GO;
TITLE 'ODS HTML Example';
ODS HTML BODY='C:\SASDATA\ODS.HTML';
PROC MEANS MAXDEC=2; VAR AGE TIME1-TIME4;
RUN;
* CLOSE THE HTML OUTPUT;
ODS HTML CLOSE;
RUN;
ODS PREFERENCES; * NEEDED TO TURN BACK ON HTML DEFAULT;

TITLE;FOOTNOTE;

*ODS2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates ODS;
* Note: If you have data in a folder other than C:\SASDATA you need to modify
        the INFILE statement;

DATA TEST; SET "C:\SASDATA\SOMEDATA";
* DEFINE WHERE HTML LISTING WILL GO;
TITLE 'ODS PDF Example';
ODS PDF FILE='C:\SASDATA\ODS.PDF' STYLE=STATISTICAL;
PROC MEANS MAXDEC=2; VAR AGE TIME1-TIME4;
RUN;
* CLOSE THE PDF OUTPUT;
ODS PDF CLOSE;
RUN;

TITLE;FOOTNOTE;


*ODS3.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates ODS;
DATA TABLE;
INPUT A B COUNT;
DATALINES;
0 0 12
0 1 15
1 0 18
1 1 3
;
ODS TRACE ON;
PROC FREQ;WEIGHT COUNT;
   TABLES A*B /CHISQ;
   TITLE 'CHI-SQUARE ANALYSIS FOR A 2X2 TABLE';
RUN;
ODS TRACE OFF;


TITLE;FOOTNOTE;

*ODS4.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates ODS;
DATA TABLE;
INPUT A B COUNT;
DATALINES;
 0 0 12
 0 1 15
 1 0 18
 1 1 3
;
ODS SELECT CROSSTABFREQS CHISQ;
PROC FREQ;WEIGHT COUNT;
   TABLES A*B /CHISQ;
   TITLE 'CHI-SQUARE ANALYSIS FOR A 2X2 TABLE';
RUN;


TITLE;FOOTNOTE;

*ODS5.SAS;
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates ODS;
DATA WT;
INPUT WEIGHT @@;
DATALINES;
64 71 53 67 55 58
77 57 56 51 76 68
;
ODS TRACE ON;
PROC MEANS DATA=WT;
RUN;
ODS TRACE OFF;RUN;
QUIT;


TITLE;FOOTNOTE;

*ODS6.SAS;
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates ODS;

DATA WT;
INPUT WEIGHT @@;
DATALINES;
64 71 53 67 55 58
77 57 56 51 76 68
;
Title "Output statistics to a data set";
ODS OUTPUT SUMMARY=STATS;
   PROC MEANS DATA=WT; 
   RUN;
PROC PRINT DATA=STATS;
RUN;


TITLE;FOOTNOTE;

*ODS7.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates ODS;

DATA WT;
INPUT WEIGHT @@;
DATALINES;
64 71 53 67 55 58
77 57 56 51 76 68
;
DATA WTDIFF;SET WT;
IF _N_=1 THEN SET STATS;
DIFF=WEIGHT-WEIGHT_MEAN;
Z=DIFF/WEIGHT_STDDEV; * CREATES STANDARDIZED SCORE (Z-SCORE);
RUN;
PROC PRINT DATA= WTDIFF;VAR WEIGHT DIFF Z;
RUN;




*ODS8.SAS;
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates ODS;

PROC FREQ DATA="C:\SASDATA\SOMEDATA";
     TABLES STATUS;
TITLE 'Simple Example of PROC FREQ';
RUN;


TITLE;FOOTNOTE;

*ODS9.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;
PROC FORMAT;
VALUE FMTSEVERE
	  LOW-<0="BLACK"
      0-<10="GREEN"
	  10-<20="BLUE"
	  20-HIGH="RED";


* This example illustrates the use of Traffic Signal highlights;
	  * Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

TITLE "Trauma Data Report";
PROC PRINT LABEL DATA=MYSASLIB.TRAUMA  (firstobs=1 obs=10);
ID INC_KEY;
VAR  AGE GENDER ;
VAR ISS/STYLE={FOREGROUND=FMTSEVERE.};
VAR  INJTYPE DISSTATUS;
label   INC_KEY='Subject ID '
		AGE='Age in 2014 '
		GENDER='Gender '
        ISS='Injury Severity Score '
        INJTYPE='Injury Type '
        DISSTATUS='Discharge Status';
RUN;

TITLE;FOOTNOTE;

*EX_8.2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

DATA TTEST;
INPUT GROUP OBS;
DATALINES;
   1   20.00
   1   23.00
   1   32.00
   1   24.00
   1   25.00
   1   28.00
   1   27.50
   2   25.00
   2   46.00
   2   56.00
   2   45.00
   2   46.00
   2   51.00
   2   34.00
   2   47.50
;
ODS TRACE ON;
PROC TTEST;
     CLASS GROUP; VAR OBS;
     Title 'Independent Group t-Test Example';
RUN;
ODS TRACE OFF;

*EX_8.3.sas;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This is code for an example in chapter 8 - ODS;

DATA TABLE;
INPUT EXPOSURE DISEASE COUNT;
DATALINES;
0 0 24
0 1 8
1 0 9
1 1 19
;


PROC FREQ DATA=TABLE; WEIGHT COUNT;
TABLES EXPOSURE*DISEASE/CHISQ;
RUN;




TITLE;FOOTNOTE;















