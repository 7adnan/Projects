*******************************************************
Code files for Chapter 6;

*DDATES.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the INTCK Function.;
DATA DATES;
INPUT @1 BDATE MMDDYY8.;
TARGET=MDY(08,25,2016);         * Uses MDY() function;
AGE=INTCK('YEAR',BDATE,TARGET); *  INTCK function;
DATALINES;
07101952
07041776
01011900
;
PROC PRINT DATA=DATES;
FORMAT BDATE WEEKDATE. TARGET MMDDYY8.;
RUN;

TITLE;FOOTNOTE;

*DTRANSPOSE1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the use of PROC TRANSPOSE;

DATA SUBJECTS;                                                         
INPUT SUB1 $ SUB2 $ SUB3 $ SUB4 $;                                     
DATALINES;                                                             
12 21 13 14
13 21 12 14
15 31 23 23
15 33 21 32
 M  F  F  M
;                                                                   
PROC TRANSPOSE DATA=SUBJECTS OUT=TRANSPOSED;                       
  VAR SUB1 SUB2 SUB3 SUB4;           
RUN;                                                                   
PROC PRINT DATA=TRANSPOSED;
RUN;

TITLE;FOOTNOTE;

*DTRANSPOSE1A.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the use of PROC TRANSPOSE;

DATA SUBJECTS;                                                         
INPUT LAB $ SUB1 $ SUB2 $ SUB3 $ SUB4 $;                                     
DATALINES;                                                             
BASELINE 12 21 13 14                                                 
TIME1 13 21 12 14                                                 
TIME2 15 31 23 23                                                 
TIME3 15 33 21 32                                                  
GENDER  M  F  F  M                                                  
;                                                                   
PROC TRANSPOSE DATA=SUBJECTS OUT=TRANSPOSED;  
  ID LAB; 
  VAR SUB1 SUB2 SUB3 SUB4;           
RUN;                                                                   
PROC PRINT DATA=TRANSPOSED;
RUN;


TITLE;FOOTNOTE;

*DTRANSPOSE2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PROC TRANSPOSE;
* You could use MYSASLIB.COMPLICATIONS in the DATA= Statement;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

TITLE "Illustrates PROC TRANSPOSE, compressing";
TITLE2 "multiple subject records to a single record.";
TITLE3 "Reports subjects having 3 or more complications.";
PROC TRANSPOSE DATA="C:\SASDATA\COMPLICATIONS"
	OUT=COMP_OUT PREFIX=COMP;
	BY SUBJECT;
	VAR COMPLICATION;
RUN;
DATA MULTIPLE;SET COMP_OUT;
DROP _NAME_ ;
IF COMP3 NE '';
PROC PRINT DATA=MULTIPLE; VAR SUBJECT COMP1-COMP4;
FORMAT SUBJECT 10. COMP1-COMP4 $10.;
RUN;


TITLE;FOOTNOTE;

*DSELECT.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the SELECT Statment;
* You could use MYSASLIB.SOMEDATA in the DATA= Statement;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

TITLE "This example illustrates the Select Statement";
DATA MYDATA;SET "C:\SASDATA\SOMEDATA";
FORMAT ECONOMIC $7.;
SELECT(STATUS);
   WHEN (1,2) ECONOMIC="LOW";
   WHEN (3) ECONOMIC="MIDDLE";
   WHEN (4,5) ECONOMIC="HIGH";
   OTHERWISE ECONOMIC="MISSING";
END;

PROC PRINT DATA=MYDATA; 
RUN;


TITLE;FOOTNOTE;

*MESSY1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates Cleaning a MESSY data file;
******************************************************************;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries
****************************************************************** 
STEP 1;
* THIS CODE MAKES A COPY OF THE ORIGINAL FILE;
* SO ALL CHANGES ARE MADE IN A COPY OF THE DATA SET;

DATA MYSASLIB.CLEANED;SET MYSASLIB.MESSYDATA;
LABEL 
      EDUCATION='Years of Schooling'
      HOW_ARRIVED='How Arrived at Clinic'
      TOP_REASON='Top Reason for Coming'
      SATISFACTION='Satisfaction Score'
	  ARRIVAL='Arrival Temperature';
	  * You don't really need the ARRIVAL Label;
TEMP=ARRIVAL; 
DROP ARRIVAL;
LABEL TEMP='Arrival Temperature';
RUN;
PROC PRINT LABEL 
     DATA=MYSASLIB.CLEANED 
     (firstobs=1 obs=10);
     VAR  SUBJECT EDUCATION TEMP 
          TOP_REASON SATISFACTION;
RUN;



TITLE;FOOTNOTE;

* EACH VERSION OF MESSYn.SAS BUILDS ON THIS PROGRAM;


* EACH VERSION OF MESSYn.SAS BUILDS ON THIS PROGRAM;


*MESSY2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates Cleaning a MESSY data file;
******************************************************************;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries
******************************************************************

************************************************************STEP 1;

DATA MYSASLIB.CLEANED;SET MYSASLIB.MESSYDATA;

LABEL 
      EDUCATION='Years of Schooling'
      HOW_ARRIVED='How Arrived at Clinic'
      TOP_REASON='Top Reason for Coming'
      SATISFACTION='Satisfaction Score'
      Subject="Subject ID"
      DateArrived="Date Arrived"
      TimeArrive="Time Arrived"
      DateLeft="Date Left"
      TimeLeft="Time Left"
      Married="Married?"
      Single="Single?"
      Age="Age Jan 1, 2014"
      Gender="Gender"
      Race="Race"
      Satisfaction="Satisfaction Score";
TEMP=ARRIVAL;
DROP ARRIVAL;
LABEL TEMP='Arrival Temperature';

****************************************************************** STEP 2;
* FIX 1 - Convert text values to all uppercase;
GENDER=UPCASE(GENDER);
RACE=UPCASE(RACE);
HOW_ARRIVED=UPCASE(HOW_ARRIVED);
* FIX 2 SET BAD UNKNOWN VALUES TO MISSING;
IF HOW_ARRIVED NOT IN ('CAR','BUS','WALK') THEN HOW_ARRIVED="";
* FIX 2 - GET RID OF EMPTY ROWS;
IF SUBJECT="" THEN DELETE;
RUN;


* DISPLAY SOME OF THE CORRECTED VARIABLES;
PROC PRINT LABEL 
     DATA=MYSASLIB.CLEANED 
     (firstobs=1 obs=30);
	  VAR SUBJEcT GENDER RACE HOW_ARRIVED;
RUN;


TITLE;FOOTNOTE;


*DISCOVER1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates fixing the Messy Data File;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

PROC FREQ data=MYSASLIB.cleaned; 
TABLES  MARRIED SINGLE TOP_REASON RACE GENDER HOW_ARRIVED;
run;


TITLE;FOOTNOTE;

*MESSY3.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates Cleaning a MESSY data file;
******************************************************************;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;
****************************************************************** STEP 1;
DATA MYSASLIB.CLEANED;SET MYSASLIB.MESSYDATA;

LABEL 
      EDUCATION='Years of Schooling'
      HOW_ARRIVED='How Arrived at Clinic'
      TOP_REASON='Top Reason for Coming'
      SATISFACTION='Satisfaction Score'
      Subject="Subject ID"
      DateArrived="Date Arrived"
      TimeArrive="Time Arrived"
      DateLeft="Date Left"
      TimeLeft="Time Left"
      Married="Married?"
      Single="Single?"
      Age="Age Jan 1, 2014"
      Gender="Gender"
      Race="Race"
      Satisfaction="Satisfaction Score";
TEMP=ARRIVAL;
DROP ARRIVAL;
LABEL TEMP='Arrival Temperature';

****************************************************************** STEP 2;
GENDER=UPCASE(GENDER);
RACE=UPCASE(RACE);
HOW_ARRIVED=UPCASE(HOW_ARRIVED);
* FIX 2 SET BAD UNKNOWN VALUES TO MISSING;
IF HOW_ARRIVED NOT IN ('CAR','BUS','WALK') THEN HOW_ARRIVED="";
* FIX 2 - GET RID OF EMPTY ROWS;
IF SUBJECT="" THEN DELETE;

*ADDED CODE FROM EXAMPLE;
IF GENDER NOT IN('M','F') THEN GENDER='';
IF RACE="MEX" OR RACE="M" then RACE="H";
IF RACE="A" then RACE="AA";
IF RACE="W" then RACE="C";
IF RACE="X" OR RACE="NA" then RACE="";
;

* NOTE: RUN DISCOVER1.SAS BEFORE GOING TO STEP 3;

****************************************************************** STEP 3;

DROP MARRIED;
IF RACE NOT IN ('AA','H','C') THEN RACE="";

IF TOP_REASON NE "1" AND 
   TOP_REASON NE "2" AND 
   TOP_REASON NE "3" THEN TOP_REASON=.;
RUN;



PROC PRINT LABEL 
     DATA=MYSASLIB.CLEANED 
     (firstobs=1 obs=30);
RUN;


*DISCOVER2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates fixing the Messy Data File;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

PROC MEANS MAXDEC=2 data=MYSASLIB.cleaned;
RUN;



TITLE;FOOTNOTE;

*MESSY4.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates Cleaning a MESSY data file;
******************************************************************;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;
****************************************************************** STEP 1;
DATA MYSASLIB.CLEANED;SET MYSASLIB.MESSYDATA;

LABEL 
      EDUCATION='Years of Schooling'
      HOW_ARRIVED='How Arrived at Clinic'
      TOP_REASON='Top Reason for Coming'
      SATISFACTION='Satisfaction Score'
      Subject="Subject ID"
      DateArrived="Date Arrived"
      TimeArrive="Time Arrived"
      DateLeft="Date Left"
      TimeLeft="Time Left"
      Married="Married?"
      Single="Single?"
      Age="Age Jan 1, 2014"
      Gender="Gender"
      Race="Race"
      Satisfaction="Satisfaction Score";
TEMP=ARRIVAL;
DROP ARRIVAL;
LABEL TEMP='Arrival Temperature';

****************************************************************** STEP 2;
GENDER=UPCASE(GENDER);
RACE=UPCASE(RACE);
HOW_ARRIVED=UPCASE(HOW_ARRIVED);
* FIX 2 SET BAD UNKNOWN VALUES TO MISSING;
IF HOW_ARRIVED NOT IN ('CAR','BUS','WALK') THEN HOW_ARRIVED="";
* FIX 2 - GET RID OF EMPTY ROWS;
IF SUBJECT="" THEN DELETE;
IF GENDER NOT IN("M","F") then GENDER="";
IF RACE="MEX" OR RACE="M" then RACE="H";
IF RACE="A" then RACE="AA";
IF RACE="W" then RACE="C";
IF RACE="X" OR RACE="NA" then RACE="";
****************************************************************** STEP 3;

DROP MARRIED;
IF RACE NOT IN ('AA','H','C') THEN RACE="";
* ADD NEW CODE HERE;

IF TOP_REASON NE "1" AND 
   TOP_REASON NE "2" AND 
   TOP_REASON NE "3" THEN TOP_REASON=.;



****************************************************************** STEP 4;
IF EDUCATION=99 then EDUCATION=.;
IF TEMP LT 45 THEN TEMP=(9/5)*TEMP+32;
IF TEMP=1018 then TEMP=101.8;
IF SATISFACTION=-99 THEN SATISFACTION=.;
* Convert AGE from character to numeric;
AGEN=INPUT(AGE,5.);
DROP AGE;
LABEL AGEN="Age Jan 1, 2014";



RUN;



PROC PRINT LABEL 
     DATA=MYSASLIB.CLEANED 
     (firstobs=1 obs=30);
RUN;



*MESSY5.SAS;
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates Cleaning a MESSY data file;
******************************************************************;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;
****************************************************************** STEP 1;
DATA MYSASLIB.CLEANED;SET MYSASLIB.MESSYDATA;

LABEL 
      EDUCATION='Years of Schooling'
      HOW_ARRIVED='How Arrived at Clinic'
      TOP_REASON='Top Reason for Coming'
      SATISFACTION='Satisfaction Score'
      Subject="Subject ID"
      DateArrived="Date Arrived"
      TimeArrive="Time Arrived"
      DateLeft="Date Left"
      TimeLeft="Time Left"
      Married="Married?"
      Single="Single?"
      Age="Age Jan 1, 2014"
      Gender="Gender"
      Race="Race"
      Satisfaction="Satisfaction Score";
TEMP=ARRIVAL;
DROP ARRIVAL;
LABEL TEMP='Arrival Temperature';

****************************************************************** STEP 2;
GENDER=UPCASE(GENDER);
RACE=UPCASE(RACE);
HOW_ARRIVED=UPCASE(HOW_ARRIVED);
* FIX 2 SET BAD UNKNOWN VALUES TO MISSING;
IF HOW_ARRIVED NOT IN ('CAR','BUS','WALK') THEN HOW_ARRIVED="";
* FIX 2 - GET RID OF EMPTY ROWS;
IF SUBJECT="" THEN DELETE;
IF GENDER NOT IN ('M','F') THEN GENDER="";
IF RACE="MEX" OR RACE="M" then RACE="H";
IF RACE="A" then RACE="AA";
IF RACE="W" then RACE="C";
IF RACE="X" OR RACE="NA" then RACE="";

****************************************************************** STEP 3;

IF HOW_ARRIVED NOT IN ('CAR','BUS','WALK') THEN HOW_ARRIVED="";

IF RACE NOT IN ('AA','H','C') THEN RACE="";

IF TOP_REASON NE "1" AND 
   TOP_REASON NE "2" AND 
   TOP_REASON NE "3" THEN TOP_REASON=.;

DROP MARRIED;

****************************************************************** STEP 4;

IF TEMP=1018 then TEMP=101.8;
IF EDUCATION=99 then EDUCATION=.;
IF TEMP LT 45 THEN TEMP=(9/5)*TEMP+32;
IF SATISFACTION=-99 THEN SATISFACTION=.;
* Convert AGE from character to numeric;
AGEN=INPUT(AGE,5.);
IF AGEN LT 10 OR AGEN GT 99 THEN AGE=.;
DROP AGE;
LABEL AGEN="Age Jan 1, 2014";

*****************************************************************STEP 5;

FORMAT ARRIVEDT DATETIME18.;
FORMAT DATEARRIVED2 DATE10. TIMEARRIVET TIME8.;
DATEARRIVED2=INPUT(TRIM(DATEARRIVED),MMDDYY10.);
I= FIND(TIMEARRIVE," ");
P=FIND(TIMEARRIVE,"P");
TIMEARRIVE2=SUBSTR(TIMEARRIVE,1,I-1);
TIMEARRIVET=INPUT(TRIM(TIMEARRIVE2),TIME8.);
IF P>0 THEN TIMEARRIVET=TIMEARRIVET+43200; * ADD SECONDS FOR 12 HRS;
ARRIVEDT=DHMS(DATEARRIVED2,0,0,TIMEARRIVET) ;

Label ARRIVEDT="Date & Time Arrived";


RUN;



PROC PRINT LABEL 
     DATA=MYSASLIB.CLEANED 
     (firstobs=1 obs=30);
	 var SUBJEcT DATEARRIVED TIMEARRIVE DATEARRIVED2 TIMEARRIVET ARRIVEDT ;
RUN;





*DISCOVER3.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates fixing the Messy Data File;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

PROC FREQ data=MYSASLIB.cleaned NOPRINT;
     TABLES SUBJECT / OUT=FREQCNT;
RUN;
PROC PRINT DATA=FREQCNT;
WHERE COUNT>1;
RUN;

DATA TMP;SET MYSASLIB.cleaned;
tmp=subject*1;
t=CAT("|",TRIM(SUBJEcT),"|");
RUN;


TITLE;FOOTNOTE;

*MESSY_ALL.SAS (combines all MESSY SAS code files);

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates Cleaning a MESSY data file;
******************************************************************;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

* THESE ARE ALL THE STEPS IN CLEANING THE MESSY DATA SET;

****************************************************************** STEP 1;
DATA MYSASLIB.CLEANED;SET MYSASLIB.MESSYDATA;

LABEL 
      EDUCATION='Years of Schooling'
      HOW_ARRIVED='How Arrived at Clinic'
      TOP_REASON='Top Reason for Coming'
      SATISFACTION='Satisfaction Score'
      Subject="Subject ID"
      DateArrived="Date Arrived"
      TimeArrive="Time Arrived"
      DateLeft="Date Left"
      TimeLeft="Time Left"
      Married="Married?"
      Single="Single?"
      Age="Age Jan 1, 2014"
      Gender="Gender"
      Race="Race"
      Satisfaction="Satisfaction Score";
TEMP=ARRIVAL;
DROP ARRIVAL;
LABEL TEMP='Arrival Temperature';

****************************************************************** STEP 2;
GENDER=UPCASE(GENDER);
RACE=UPCASE(RACE);
HOW_ARRIVED=UPCASE(HOW_ARRIVED);
* FIX 2 SET BAD UNKNOWN VALUES TO MISSING;
IF HOW_ARRIVED NOT IN ('CAR','BUS','WALK') THEN HOW_ARRIVED="";


* FIX 2 - GET RID OF EMPTY ROWS;
IF GENDER NOT IN ('M','F') THEN GENDER="";
IF SUBJECT="" THEN DELETE;
IF RACE="MEX" OR RACE="M" then RACE="H";
IF RACE="A" then RACE="AA";
IF RACE="W" then RACE="C";
IF RACE="X" OR RACE="NA" then RACE="";

****************************************************************** STEP 3;


FORMAT ARRIVEDT DATETIME18.;
FORMAT DATEARRIVED2 DATE10. TIMEARRIVET TIME8.;
DATEARRIVED2=INPUT(TRIM(DATEARRIVED),MMDDYY10.);
I= FIND(TIMEARRIVE," ");
P=FIND(TIMEARRIVE,"P");
TIMEARRIVE2=SUBSTR(TIMEARRIVE,1,I-1);
TIMEARRIVET=INPUT(TRIM(TIMEARRIVE2),TIME8.);
IF P>0 THEN TIMEARRIVET=TIMEARRIVET+43200; * ADD SECONDS FOR 12 HRS;
ARRIVEDT=DHMS(DATEARRIVED2,0,0,TIMEARRIVET) ;

Label ARRIVEDT="Date & Time Arrived";


****************************************************************** STEP 4;

IF TEMP=1018 then TEMP=101.8;
IF EDUCATION=99 then EDUCATION=.;
IF TEMP LT 45 THEN TEMP=(9/5)*TEMP+32;
IF SATISFACTION=-99 THEN SATISFACTION=.;
* Convert AGE from character to numeric;
AGEN=INPUT(AGE,5.);
IF AGEN LT 10 OR AGEN GT 99 THEN AGE=.;
DROP AGE;
LABEL AGEN="Age Jan 1, 2014";

*****************************************************************STEP 5;

FORMAT  ARRIVEDT LEFTDT DATETIME18.;

DATEARRIVED2=INPUT(TRIM(DATEARRIVED),MMDDYY10.);
I= FIND(TIMEARRIVE," ");
P=FIND(TIMEARRIVE,"P");
TIMEARRIVE=SUBSTR(TIMEARRIVE,1,I-1);
TIMEARRIVET=INPUT(TRIM(TIMEARRIVE),TIME8.);
IF P>0 THEN TIMEARRIVET=TIMEARRIVET+43200; * ADD SECONDS FOR 12 HRS;
ARRIVEDT=DHMS(DATEARRIVED2,0,0,TIMEARRIVET) ;

DATELEFT2=INPUT(TRIM(DATELEFT),MMDDYY10.);
I= FIND(TIMELEFT," ");
P=FIND(TIMELEFT,"P");
TIMELEFT=SUBSTR(TIMELEFT,1,I-1);
TIMELEFTT=INPUT(TRIM(TIMELEFT),TIME8.);
if P>0 then TIMELEFTT=TIMELEFTT+43200;
LEFTDT=DHMS(DATELEFT2,0,0,TIMELEFTT) ;
Label ARRIVEDT="Date & Time Arrived"
      LEFTDT ="Date & Time Left";
*DROP I P DATEARRIVED DATEARRIVED2 TIMEARRIVE TIMEARRIVET
       DATELEFT TIMELEFT DATELEFT2 TIMELEFT TIMELEFTT;

STAYMINUTES=INTCK( 'MINUTE', ARRIVEDT, LEFTDT );
STAYHOURS=ROUND(STAYMINUTES/60,.1);

IF STAYHOURS<0 or STAYHOURS>48 then STAYHOURS=.;

IF _N_=27 THEN SUBJECT=27;

RUN;



PROC PRINT LABEL 
     DATA=MYSASLIB.CLEANED 
     (firstobs=1 obs=30) ;
RUN;



* EX_6.1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example is for end of chapter exercise 6.1;

DATA OWED;
INPUT ID $3. AMOUNTOWED DOLLAR9.;
DATALINES;
001 $3,209
002 $29
002 $34.95
003 2,012
003 312.45
003 34.23
004 2,312
004 $3.92
005 .98
;
RUN;
PROC TRANSPOSE DATA=OWED OUT=________ PREFIX=____;
    BY ___;
    VAR ___________;
RUN;
DATA SUMMARIZE;SET EXPANDED;
TOTAL=SUM(of AMT1-AMT3);
DROP _NAME_;
RUN;
PROC PRINT DATA=SUMMARIZE;
RUN;














