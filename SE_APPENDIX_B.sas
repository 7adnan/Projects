*******************************************************
Code files for APPENDIX B;

*FUNC_ARITH.SAS;


*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates ARITHMETIC FUNCTIONS;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;


* ARITHMETIC FUNCTIONS EXAMPLES;
DATA ARITH; SET MYSASLIB.HASMISSING;
MAXTIME=MAX(PRE,MONTH6,MONTH12,MONTH24);
MINTIME=MIN(OF PRE--MONTH24);
MISSTIME=NMISS(OF PRE--MONTH24); 
MEANTIME=MEAN(OF PRE--MONTH24);
;
TITLE "Use Arithmetic Functions";
PROC PRINT DATA=ARITH; RUN;

TITLE;FOOTNOTE;

*FUNC_DATETIME.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates DATE and TIME FUNCTIONS;

DATA TIME;
FORMAT DTARRIVE MMDDYY10. TIMEARRIVE TIME10. 
       ARRIVETIME DATETIMELEAVE DATETIME19.;
INPUT @1 DTARRIVE DATE10.
      @12 TIMEARRIVE TIME10.
	  @23 DATETIMELEAVE DATETIME19.;
*MERGE DTARRIVE and TIMEARRIVE;
	  ARRIVETIME=DHMS(DTARRIVE,0,0,TIMEARRIVE);
	  SECONDS1=DATETIMELEAVE-ARRIVETIME;
	  SECONDS2=INTCK('seconds',ARRIVETIME,DATETIMELEAVE);
DATALINES;
10NOV2016  1:13 pm    10NOV2016:18:49:19
12DEC2016  9:20 am    12DEC2016:13:23:22
;
PROC PRINT DATA=TIME;RUN;



TITLE;FOOTNOTE;

*FUNC_CHAR.SAS;


*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates CHARACTER FUNCTIONS;

DATA BP;
INPUT BP $10.;
I=FIND(BP,"/");
SBP=SUBSTR(BP,1,I-1); * get number before the /;
DBP=SUBSTR(BP,I+1); *get number after the /;
DROP I;
DATALINES;
120/80
140/90
110/70
;
PROC PRINT DATA=BP;RUN;




TITLE;FOOTNOTE;

*FUNC_SCAN.SAS;


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


*FUNC_MORT.SAS;


*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates FINANCIAL FUNCTIONS;



DATA LOAN;
FORMAT VALUE DOLLAR12.
       INTRATE1-INTRATE3 4.2
	   NUMBER 4.;
INPUT VALUE INTRATE1-INTRATE3 NUMBER;
ARRAY INT(3) INTRATE1-INTRATE3;
ARRAY PAY(3);
DO I=1 to 3;
   PAY(I)= MORT(VALUE,.,INT(I)/12,NUMBER); 
END;
LABEL MORT="Mortgage Payment";
LABEL INTRATE1="Int. Rate 1 ";
LABEL INTRATE2="Int. Rate 2 ";
LABEL INTRATE3="Int. Rate 3 ";
LABEL PAYMENT= "Amount of Payment";
LABEL VALUE="Loan Amount";
LABEL NUMBER="Num. Payments";
DROP I;
DATALINES;
100000 .05 .04 .03 360
100000 .05 .04 .03 180
150000 .05 .04 .03 360
150000 .05 .04 .03 180
;
RUN;
PROC PRINT LABEL DATA=LOAN ;
RUN;


TITLE;FOOTNOTE;

*FUNC_CONVERT.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates Special Use FUNCTIONS;

DATA TEMP;
LENGTH CHAR4 $ 4;
INPUT NUMERIC CHAR4;
* CONVERT CHARACTER VARIABLE TO NUMERIC;
NEW_NUM=INPUT(CHAR4,BEST4.);
* CONVERT NUMERIC VARIABLE TO CHARACTER;
NEW_CHAR=PUT(NUMERIC,4.0);
DATALINES;
789.1 1234
009.2 0009
1.5 9999
;
PROC PRINT;
FORMAT NEW_NUM 6.1 NEW_CHAR $8.;
RUN;



TITLE;FOOTNOTE;


*FUNC_SPECIAL.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates SPECIAL Functions;

DATA DATES; 
FORMAT BDATE WEEKDATE17.; 
INPUT @1 BDATE MMDDYY8.; 
BDATEDOW=PUT(BDATE,DOWNAME.);
BDATEMONTH=PUT(BDATE,MONNAME.);
DATALINES;
08212016
07041776
01011900 
; 
PROC PRINT DATA=DATES; RUN;


TITLE;FOOTNOTE;

*FUNC_LAG.SAS;


*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the LAG FUNCTIONS;



*Average Gold Price (London Fix, in Jan);
DATA PRICE; 
INPUT YEAR PRICE;
 LAG_PRICE = LAG(PRICE); 
 DIFF_PRICE = PRICE - LAG_PRICE; 
 PCT_INCREASE = (DIFF_PRICE/LAG_PRICE)*100; 
DATALINES;
2005 424.15
2006 549.86
2007 631.17
2008 889.60
2009 858.69
2010 1117.96
2011 1356.40
2012 1656.12
2013 1670.95
2014 1244.80
; 
RUN;
PROC PRINT;RUN;

*FUNC_ZIP.SAS;


*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the ZIP FUNCTIONS;



DATA ZIP;
INPUT BEGIN $ END $;
HOSPITAL=ZIPCITY(BEGIN);
SUBJECT=ZIPCITY(END);
DISTANCE=ZIPCITYDISTANCE(BEGIN, END);
datalines;
75275 75201
75275 10001 
75275 96801
75275 96951 
;
PROC PRINT;
RUN;


TITLE;FOOTNOTE;
