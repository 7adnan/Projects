*******************************************************
Code files for Chapter 4;

*DLABEL1.SAS;
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the use of LABELS;

DATA MYDATA;
INFILE 'C:\SASDATA\BPDATA.DAT'; * READ DATA FROM FILE;
INPUT ID $ 1 SBP 2-4 DBP 5-7 SEX $ 8 AGE 9-10 WT 11-13;
LABEL ID = 'Identification Number'
	 SBP= 'Systolic Blood Pressure'
	 DBP = 'Diastolic Blood Pressure'
	 AGE = 'Age on Jan 1, 2000'
	 WT = 'Weight'	 ;
PROC MEANS; VAR SBP DBP AGE WT;
RUN;

TITLE;FOOTNOTE;

*DLABEL2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the use of LABELS;

DATA MYDATA;
INPUT @1 FNAME $11. @12 LNAME $12. @24 BDATE DATE9.;
FORMAT BDATE WORDDATE12.;  
LABEL   FNAME="First Name"; * Complete the labels;
DATALINES;
Bill       Smith       08JAN1952
Jane       Jones       02FEB1953
Clyde      York        23MAR1949
;
PROC PRINT;
RUN;

*DCALC.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates calculating new variables.;
DATA ROOMSIZE;
INPUT ROOM $ W L;
* The next line calculates a new variable, AREA;
AREA=W*L; 
Label L="Length" W="Width" AREA="Sq. Feet";
DATALINES;
LIVING   14 22
DINING   14 12
BREAKFAST 10 12
KITCHEN 12 16
BEDROOM1 18 12
BEDROOM2 12 14
BEDROOM3 13 16
BATH1	  8 12
BATH2	  7 10
BATH3     6 8
GARAGE 23 24
;
RUN;
PROC PRINT Label; SUM AREA;
RUN;

TITLE;FOOTNOTE;

*DCONDITION.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates a conditional IF statement;

DATA MYDATA;
INPUT ID $ SBP DBP GENDER $ AGE WT;
IF SBP GE 140 then STATUS="HIGH"; else STATUS="OK";
DATALINES;
001 120 80 M 15 115
002 130 70 F 25 180
003 140 100 M 89 170
004 180 80 F 30 150
005 125 80 F 20 110
;
PROC PRINT;
RUN;

TITLE;FOOTNOTE;

*DCONDITION.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates a conditional IF statement;

DATA MYDATA;
INPUT ID $ SBP DBP GENDER $ AGE WT;
IF SBP GE 140 then STATUS="HIGH"; else STATUS="OK";
DATALINES;
001 120 80 M 15 115
002 130 70 F 25 180
003 140 100 M 89 170
004 180 80 F 30 150
005 125 80 F 20 110
;
PROC PRINT;
RUN;

TITLE;FOOTNOTE;


*DSUBSET1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates finding the FIRST and LAST values in a group;

DATA MYDATA;
INFILE 'C:\SASDATA\EXAMPLE.DAT'; 
INPUT	ID  $ 1-3 GP $ 5 AGE 6-9 TIME1 10-14 TIME2 15-19;
IF AGE LE 10;
PROC PRINT DATA=MYDATA; 
RUN;

TITLE;FOOTNOTE;

*DSUBSET2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates subsetting;
* IF your data is stored in a different location, chance the C:\SASDATA reference;

DATA MYDATA;
INFILE 'C:\SASDATA\EXAMPLE.DAT'; 
INPUT GP $ 5 AGE 6-9 @;
IF GP EQ "A" and AGE GE 10;
INPUT	ID  $ 1-3 GP $ 5 AGE 6-9 TIME1 10-14 TIME2 15-19;
PROC PRINT DATA=MYDATA; 
RUN;

TITLE;FOOTNOTE;

*DKEEP.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates DROP and KEEP;
* IF your data is stored in a different location, chance the C:\SASDATA reference;

DATA MYDATA;
INFILE 'C:\SASDATA\EXAMPLE.CSV' DLM=',' FIRSTOBS=2 OBS=26;
INPUT  GROUP $ AGE TIME1 TIME2 TIME3 TIME4 SOCIO;
KEEP AGE TIME1 SOCIO;
;
PROC PRINT; 
RUN;


TITLE;FOOTNOTE;


*DSUBSET3.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates a Subsetting IF Statement;
DATA ALL; 
INPUT AGE GENDER $ FAT PROTEIN CARBO SODIUM;
DATALINES;
25	M	40	40	109	1396
26	M	47	46	125	1731
38	M	42	40	104	1431
42	M	48	46	123	1711
65	M	41	41	112	1630
68	M	34	33	96	1192
20	F	39	29	118	1454
30	F	40	40	115	1532
60	F	39	40	123	1585
;
DATA MALES; 
SET ALL; 
IF GENDER ='M';
RUN;
* Add lines from hands-on example to create FEMALE data set;
* And add a PROC PRINT and RUN at the end for each new data set;


TITLE;FOOTNOTE;


*DSORT1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the use of the SORT Command;

DATA MYDATA;
INPUT GROUP RECTIME;
DATALINES;
1    4.2
2    3.6
2    3.1
1    2.1
1    2.8
2    1.5
1    1.8
;
PROC SORT DATA=MYDATA OUT=S1; BY RECTIME; 
Title 'Sorting Example - Ascending';
PROC PRINT DATA=S1;
RUN;

* PUT NEW CODE HERE;

/* NOTE: The syntax for using the DESCENDING option is:

PROC SORT DATA=MYDATA OUT=S2; BY DESCENDING RECTIME;
PROC PRINT DATA=S2;
RUN;
*/
TITLE;FOOTNOTE;


*DSORT2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the use of KEEP, DROP, and RENAME;

*********************************************************
* Note correction in the book p 93
* There is no GENDER variable in this data set
* GENDER has been removed from this code.
*********************************************************;

PROC SORT DATA="C:\SASDATA\SOMEDATA"
       OUT=ANALYSIS
       (KEEP=ID GP AGE GENDER RENAME=( ID=SUBJECT AGE=DXAGE)); 
BY ID; 
RUN;
TITLE "Example of KEEP and RENAME in SORT";
PROC PRINT DATA=ANALYSIS;RUN;


TITLE;FOOTNOTE;



*DAPPEND1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates appending data sets;

DATA OLD1;
INPUT SUBJ $ AGE YRS_SMOKE;
datalines;
001 34 12
003 44 14
004 55 35
006 21 3
;
DATA OLD2;
INPUT SUBJ $ AGE YRS_SMOKE;
datalines;
011 33 11
012 25 19
023 65 45
032 71 55
;
RUN;
* YOU MUST ADD ADDITIONAL LINES TO PERFORM THE APPEND;



TITLE;FOOTNOTE;


*DAPPEND2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates appending data sets;
DATA OLD1;
INPUT SUBJ $ AGE YRS_SMOKE;
datalines;
001 34 12
003 44 14
004 55 35
006 21 3
;
DATA OLD2;
INPUT SUBJ $ AGE YRS_SMOKE MARRIED;
datalines;
011 33 11 1
012 25 19 0
023 65 45 1
032 71 55 1
;
RUN;
DATA NEW;SET OLD1 OLD2; RUN;
PROC PRINT DATA=NEW;RUN;


TITLE;FOOTNOTE;

*DMERGE1.SAS;

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

*DMERGE2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates a few-to-many merge;
DATA SALES;
FORMAT ITEM $20. BUYERTYPE $8.;
INPUT ITEM BUYERTYPE  PRICE;
DATALINES;
CARBCLEANER REPAIR 2.30
BELT CONSUMER 6.99
MOTOROIL CONSUMER 14.34
CHAIN STORE 18.99
SPARKPLUGS REPAIR 28.99
CLEANER CONSUMER 1.99
WRENCH STORE 18.88
;
RUN;
PROC PRINT DATA=SALES;RUN;
DATA DISCOUNT;
FORMAT BUYERTYPE $10.;
INPUT BUYERTYPE DISCOUNT;
DATALINES;
CONSUMER 0
REPAIR .33
STORE .40
;
RUN;
PROC PRINT DATA=SDISCOUNT;RUN;

* CODE TO PERFORM THE MERGE;
* YOU MUST COMPLETE THIS CODE FOR IT TO WORK;
PROC SORT DATA=SALES; BY BUYERTYPE;
PROC SORT _____________________________; *COMPLETE THIS;
DATA REPORT;
   MERGE ________________;BY _____________;*COMPLETE THIS;
   FINAL = ROUND(PRICE*(1-DISCOUNT),.01);
RUN;

* CODE TO PRINT THE REPORT;
PROC PRINT DATA=REPORT;
SUM _________;
RUN;


TITLE;FOOTNOTE;

*DFORMAT1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the use of FORMATS;

PROC FORMAT;
     VALUE FMTMARRIED 0="No"
	    	          1="Yes";
	 VALUE $FMTGENDER "F" = "Female"
 					  "M" = "Male";
RUN;
PROC PRINT DATA="C:\SASDATA\SURVEY";
     VAR SUBJECT MARRIED GENDER;
     FORMAT MARRIED FMTMARRIED. GENDER $FMTGENDER.;
RUN;

TITLE;FOOTNOTE;

*DFORMAT2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the use of FORMATS;
PROC FORMAT;
	VALUE FMTAGE	LOW-12 = 'Child'
				    13,14,15,16,17,18,19 = 'Teen'
				    20-59 = 'Adult'
				    60-HIGH = 'Senior';
	VALUE FMTSTAT	1='Lower Class'
				    2='Lower-Middle'
				    3='Middle Class'
				    4='Upper-Middle'
				    5='Upper';
RUN;
PROC PRINT DATA="C:\SASDATA\SOMEDATA"; 
VAR AGE STATUS GP;
FORMAT AGE FMTAGE. STATUS FMTSTAT.;
TITLE 'PROC FORMAT Example';
RUN;


TITLE;FORMAT;

*DFORMAT3.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the use of FORMATS;

*NOTE: The LIBNAME statement may be unnecessary if you 
       have already defined a MYSASLIB library;

LIBNAME MYSASLIB "C:\SASDATA";
PROC FORMAT LIBRARY = MYSASLIB.CAT1; *CREATE A FORMAT CATALOG;
     VALUE FMTMARRIED 0="No"
	    	          1="Yes";
     VALUE $FMTGENDER "F" = "Female"
 		              "M" = "Male";
RUN;


TITLE;FOOTNOTE;

*DFINDFIRST.SAS;

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

*EX_4.1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example is a Chapter 4 exercise;

DATA MYDATA;
INPUT @1 LAST $20. @21 FIRST $20. @45 PHONE $12.;
Label LAST = 'Last Name'
      FIRST = 'First Name'
      PHONE = 'Phone Number';
DATALINES;
Reingold            Lucius                  201-876-0987
Jones               Pam                     987-998-2948
Abby                Adams                   214-876-0987
Smith               Bev                     213-765-0987
Zoll                Tim Bob                 303-987-2309
Baker               Crusty                  222-324-3212
Smith               John                    234-943-0987
Smith               Arnold                  234-321-2345
Jones               Jackie                  456-987-8077
;
*-------- Modify to sort by first name within last (by last first);
PROC SORT; BY LAST; 
PROC PRINT LABEL;
TITLE 'ABC Company';
TITLE2 'Telephone Directory';
RUN;


*EX_4.4.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example is a Chapter 4 exercise;

PROC FORMAT;
     VALUE fmtYN    0 = 'No'
                    1 = 'Yes';
DATA QUESTIONS;
INPUT Q1 Q2 Q3 Q4 Q5;
DATALINES;
1 0 1 1 0
0 1 1 1 0
0 0 0 1 1
1 1 1 1 1 
1 1 1 0 1
;
PROC PRINT;
* PUT FORMAT STATEMENT HERE;
RUN;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example is a Chapter 4 exercise;

PROC FORMAT LIBRARY = MYSASLIB.CAT2;
	VALUE FMTAGE	LOW-12 = 'Child'
				    13,14,15,16,17,18,19 = 'Teen'
				    20-59 = 'Adult'
				    60-HIGH = 'Senior';
	VALUE FMTSTAT	1='Lower Class'
				    2='Lower-Middle'
				    3='Middle Class'
				    4='Upper-Middle'
				    5='Upper';
RUN;


*EX_4.5A.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the use of FORMATS;

PROC PRINT DATA="C:\SASDATA\SOMEDATA"; 
VAR AGE STATUS GP;
FORMAT AGE FMTAGE. STATUS FMTSTAT.;
TITLE 'PROC FORMAT Example';
RUN;

























