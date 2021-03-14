*******************************************************
Code files for Chapter 7;

*DARRAY1.SAS;
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the ARRAY Statement;
TITLE "Example of using an ARRAY";
DATA A;
INPUT ONE TWO THREE FOUR;
ARRAY T(4) one two three four;
TSUM1=SUM(of one two three four);
TSUM2=SUM(of T(1) T(2) t(3) T(4));
TSUM3=SUM(of T(*));
DATALINES;
1 2 3 4
5 6 7 8
;
RUN;
proc print data=a;run;


TITLE;FOOTNOTE;

*DARRAY2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the ARRAY Statement;
TITLE "Example of using an ARRAY";
DATA B;
FORMAT ONE TWO THREE FOUR $10.;
INPUT ONE $ TWO $ THREE $ FOUR $;
ARRAY FRUIT(4) ONE TWO THREE FOUR;
IF "ORANGE" IN FRUIT then ISORANGE=1;ELSE ISORANGE=0;
DATALINES;
APPLE ORANGE PINEAPPLE APRICOT
LEMON APPLE KIWI STRAWBERRY
;
RUN;
proc print data=B;run;


TITLE;FOOTNOTE;

*DWHILE.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the DO WHILE Statement;

DATA TMP;
N=0;
SQUARESUM=0;
DO WHILE(N<5);
  SQUARESUM=SQUARESUM+N**2; OUTPUT;
  N+1;
END;
RUN;
PROC PRINT DATA=TMP;
RUN;


TITLE;FOOTNOTE;


*DDOLOOP.SAS;


*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the use of a DO LOOP;

TITLE "Illustrates the use of DO LOOPS and ARRAYS";
DATA CLINIC;
INPUT @1 ID $3. @4 VISIT1 4. @7 VISIT2 4.
      @10 VISIT3 4. @13 VISIT4 4. @16 VISIT5 4.;
ARRAY TIME (5) VISIT1-VISIT5;
LAST=VISIT1;
DO I=1 TO 5;
   IF TIME(I) > 0 THEN LAST=TIME(I);
END;
DROP I;
DATALINES;
001 34 54 34 54 65
002 23 43 54 34
003 23 43 .  43
004 45 55 21 43 23
005 54
;
PROC PRINT DATA=CLINIC; RUN;

TITLE;FOOTNOTE;

*DARRAY3.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the use of an Array and Do Loop;
* You could use MYSASLIB.DC_CRIME78_07 in the DATA= Statement;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;


TITLE "Illustrates an Array and Do Loop";
DATA CRIME;SET "C:\SASDATA\DC_CRIME78_07";
FORMAT TOTAL 6.;
ARRAY INCIDENTS(*) VIOLENT--CARTHEFT;
DO I= LBOUND(INCIDENTS) to HBOUND(INCIDENTS);
      TOTAL=SUM(of TOTAL,INCIDENTS(i));
END;
DROP I;
RUN;
PROC PRINT DATA=CRIME;
VAR YEAR POP--CARTHEFT TOTAL;
RUN;


TITLE;FOOTNOTE;

*DRETAIN1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the RETAIN statement;

DATA MYDATA;
INPUT VISIT_DATE ANYDTDTE10.;
DATALINES;
01/04/2015 
01/29/2015
03/07/2015
04/25/2015
07/06/2015
08/30/2015
;
DATA DAYS;SET MYDATA;
IF _N_=1 THEN FIRST=VISIT_DATE;
RETAIN FIRST;
DAYS=VISIT_DATE-FIRST;
RUN;
PROC PRINT DATA=DAYS;
Title 'These are the contents of the dataset DAYS';
FORMAT VISIT_DATE FIRST DATE10.;
RUN;


TITLE;FOOTNOTE;

*DRETAIN2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the use of PROC TRANSPOSE;
DATA LEMON;
INPUT DAY SALES;
IF _N_=1 then DO; TOTAL=0; END;
RETAIN TOTAL MAX;
TOTAL=SALES+TOTAL;
IF SALES>MAX then MAX=SALES;
DATALINES;
1 23.40
2 32.50
3 19.80
4 55.55
5 34.90
6 65.30
7 33.40
;
RUN;
PROC PRINT DATA=LEMON;RUN;


TITLE;FOOTNOTE;

*DMACRO1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates SAS Macros;

* Note: If you have data in a folder other than C:\SASDATA you need to modify
        the INFILE statement;

%LET DNAME=C:\SASDATA\SUBJECTS;
%LET VARIABLES = AGE TIME_EXPOSED;
PROC MEANS DATA="&DNAME";
VAR &VARIABLES;
RUN;


TITLE;FOOTNOTE;

*DMACRO2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates SAS Macros;

* Note: If you have data in a folder other than C:\SASDATA you need to modify
        the INFILE statement;


%LET PATH=C:\SASDATA\;
%LET DSN=SOMEDATA;
%LET CLASS=GP;
%LET SELECTVAR=AGE TIME1-TIME4;
TITLE "Descriptive Statistics";
PROC MEANS DATA="&PATH&DSN" MAXDEC=2;
	CLASS &CLASS;
	VAR &SELECTVAR;
RUN;


TITLE;FOOTNOTE;

*DMACRO3.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates SAS Macros;

* Note: If you have data in a folder other than C:\SASDATA you need to modify
        the INFILE statement;

%MACRO REPORT(SUBJ, DSN);
     DATA REPORT;SET "&DSN";
     IF SUBJ=&SUBJ;
     TITLE "REPORT ON SUBJECT # &SUBJ";
      PROC PRINT NOOBS DATA=REPORT;
          VAR GENDER TIME_EXPOSED DIAGNOSED;
      RUN;
%MEND REPORT;
%REPORT(SUBJ=001, DSN=C:\SASDATA\SUBJECTS)
%REPORT(SUBJ=017, DSN=C:\SASDATA\SUBJECTS)
%REPORT(SUBJ=040, DSN=C:\SASDATA\SUBJECTS)

;
TITLE;FOOTNOTE;

*DMACRODISCLAIM.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates SAS Macros;

* THIS IS A MACRO ROUTINE. IT DOES NOT PRIDUCE ANY OUTPUT ON ITS OWN;

%MACRO DISCLAIM;
PROC GSLIDE;
NOTE J=C H=1
"Data provided by ACME Company exchanges may be delayed";
NOTE J=C H=1
"as specified by financial exchanges or our data providers. ";
NOTE J=C H=1
"ACME does not verify any data and disclaims any obligation to do so.";
run;
quit;
%MEND DISCLAIM;

*DMACRO4.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates SAS Macros;
%MACRO GROUPS(COUNT);
   %DO I=1 %TO &COUNT;
      DATA GP&I;
        SET MYSASLIB.SOMEDATA;
        WHERE STATUS=&I;
      RUN;
   %END;
%MEND GROUPS;

%GROUPS(COUNT=5);
TITLE "Listing for STATUS=1";
PROC PRINT DATA=GP1;RUN;
TITLE "Listing for STATUS=2";
PROC PRINT DATA=GP2;RUN;


;
TITLE;FOOTNOTE;

DMACRO5.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates SAS Macros;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

%MACRO CARINFO(WHICHPLACE);
DATA _NULL_;
CALL SYMPUT('TIMEVAR', CATT('&WHICHPLACE.','MPG' ));
RUN;

TITLE "THE VALUE OF THE MACRO VARIABLE TIMEVAR IS &TIMEVAR ";

PROC MEANS MAXDEC=2 DATA=MYSASLIB.CARS;
VAR &TIMEVAR;
RUN;

%MEND CARINFO;

%CARINFO(CITY);


TITLE;FOOTNOTE;

*EX_7.1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates SAS Macros;

DATA GRADES;
INPUT IDNO GRADE1 GRADE2 GRADE3 GRADE4 GRADE5;
ARRAY G(5) ; *FINISH THE STATEMENT;
* FIND LOWEST GRADE;
LOW=100;
DO ; * FINISH THE STATEMENT;
   if G(I)<LOW then LOW=G(I);
END;
TOTAL=; * FINISH THE STATEMENT;
AVERAGE=TOTAL/4;
DATALINES;
001 90 34 88 79 88
002 99 69 87 86 98
003 91 75 85 94 100
004 88 57 68 74 89
;
RUN;
PROC PRINT DATA=GRADES;RUN;

*EX_7.2.SAS;


*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This is for an excerise in Chapter 7;

%MACRO _________(CHOICE=);
  DATA TEMP; SET "C:\___________________";
  IF BRAND=&CHOICE;
  TITLE "CAR SELECTION FOR ___________";
  PROC PRINT; VAR BRAND MODEL CITYMPG;
  RUN;
%MEND GETCARS;
ODS HTML;
%GETCARS(CHOICE="SCION")
%GETCARS(CHOICE=______)
%GETCARS(CHOICE=______)



*EX_7.3.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates SAS Macros;

DATA GRADES;
INPUT IDNO GRADE1 GRADE2 GRADE3 GRADE4 GRADE5;
ARRAY G(5) ; *FINISH THE STATEMENT;
* FIND LOWEST GRADE;
LOW=100;
DO ; * FINISH THE STATEMENT;
   if G(I)<LOW then LOW=G(I);
END;
TOTAL=; * FINISH THE STATEMENT;
AVERAGE=TOTAL/4;
DATALINES;
001 90 34 88 79 88
002 99 69 87 86 98
003 91 75 85 94 100
004 88 57 68 74 89
;
RUN;
PROC PRINT DATA=GRADES;RUN;

EX_7.1;
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates SAS Macros;

DATA GRADES;
INPUT IDNO GRADE1 GRADE2 GRADE3 GRADE4 GRADE5;
ARRAY G(5) ; *FINISH THE STATEMENT;
* FIND LOWEST GRADE;
LOW=100;
DO ; * FINISH THE STATEMENT;
   if G(I)<LOW then LOW=G(I);
END;
TOTAL=; * FINISH THE STATEMENT;
AVERAGE=TOTAL/4;
DATALINES;
001 90 34 88 79 88
002 99 69 87 86 98
003 91 75 85 94 100
004 88 57 68 74 89
;
RUN;
PROC PRINT DATA=GRADES;RUN;

EX_7.2;



*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This is for an excerise in Chapter 7;

%MACRO _________(CHOICE=);
  DATA TEMP; SET "C:\___________________";
  IF BRAND="&CHOICE";
  TITLE "CAR SELECTION FOR ___________";
  PROC PRINT; VAR BRAND MODEL CITYMPG;
  RUN;
%MEND GETCARS;
ODS HTML;
%GETCARS(CHOICE=SCION)
%GETCARS(CHOICE=______)
%GETCARS(CHOICE=______)





* EX_7.3;


*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This is for an excerise in Chapter 7;

*Use DRETAIN1.SAS as your template to write the code for this exercise.

The data are:

Game Yards_Gained
1 55
2 105
3 110
4 153
5 99
6 69
7 34
8 101
9 110
10 120
;














