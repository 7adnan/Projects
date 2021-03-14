*******************************************************
Code files for Chapter 2

DFREEFORM.SAS

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example reads data using the freeform entry technique;

DATA MYDATA;
INPUT ID $ SBP DBP GENDER $ AGE WT;
DATALINES;
001 120 80 M    15    115
002 130 70 F 25 180
003 140 100 M 89 170
004 120 80 F 30 150
005 125 80 F 20 110
;
PROC PRINT DATA=MYDATA;
RUN;


TITLE;FOOTNOTE;

* DCOLUMN.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example reads data using the column entry technique;

DATA MYDATA;
INPUT ID $ 1-3 SBP 4-6 DBP 7-9 
      GENDER $ 10 AGE 11-12 WT 13-15;
DATALINES;
001120 80M15115
002130 70F25180
003140100M89170
004120 80F30150
005125 80F20110
;
RUN;
PROC PRINT DATA=MYDATA;
RUN;


TITLE;FOOTNOTE;


*DINFORMAT.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example reads data using the FORMAT entry technique;

DATA MYDATA;
INPUT @1 SBP 3. @4 DBP 3. @7 GENDER $1. @8 WT 3. @12 OWE COMMA9.;
DATALINES;
120 80M115 $5,431.00
130 70F180 $12,122
140100M170 7550
120 80F150 4,523.2
125 80F110 $1000.99
;
PROC PRINT DATA=MYDATA;
RUN;


TITLE;FOOTNOTE;

*DINFORMAT2.SAS;

********************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates FORMATS and INFORMATS;

DATA REPORT;
INPUT @1 NAME $10. @11 SCORE 5.2 @17 BDATE DATE9.;
FORMAT BDATE WORDDATE12.;  
DATALINES;
Bill      22.12 09JAN2016
Jane      33.01 02FEB2000
Clyde     15.45 23MAR1999
;
PROC PRINT DATA=REPORT;
RUN;

TITLE;FOOTNOTE;



*DINFILE1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example reads data using INFILE;
* NOTE: If your data is in a folder other than C:\SASDATA, 
  you will need to change the INFILE statement;

DATA MYDATA;
INFILE 'C:\SASDATA\EXAMPLE.TXT';
INPUT ID $ 1-3 GP $ 5 AGE 6-9 
      TIME1 10-14 TIME2 15-19 TIME3 20-24;
PROC MEANS DATA=MYDATA;
RUN;

TITLE;FOOTNOTE


*DMULTLINE.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example reads data using MULTILINE data entry;

DATA MYDATA;
INPUT ID $ SEX $ AGE WT/ SBP DBP BLDCHL/ OBS1 OBS2 OBS3;
DATALINES;
10011 M 15 115  
   120 80 254
   15 65 102
10012 F 25 180
   130 70 240 
   34 120 132
10013 M 89 170
   140 100	279
   19 89 111 
;
PROC PRINT DATA=MYDATA;
RUN;

TITLE;FOOTNOTE;

*DINFILE2.SAS;
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This illustrates the INFILE statement options;

DATA MYDATA;
INFILE 'C:\SASDATA\EXAMPLE.CSV' DLM=',' FIRSTOBS=2	OBS=11;
INPUT GROUP $ AGE TIME1 TIME2 TIME3 Time4 SOCIO;
PROC PRINT DATA=MYDATA;
RUN;


TITLE;FOOTNOTE;

*DINFILE3.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This illustrates the INFILE statement options;

DATA PLACES;
INFILE DATALINES DLMSTR='!~!';
INPUT CITY $ STATE $ ZIP;
DATALINES;
DALLAS!~!TEXAS!~!75208
LIHUE!~!HI!~!96766
MALIBU!~!CA!~!90265
;
PROC PRINT;
RUN;

TITLE;FOOTNOTE;


*DINFILE4.SAS;
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This illustrates the INFILE statement options;

DATA TEST;
 INFILE "C:\SASDATA\DINFILEDAT.TXT" TRUNCOVER;
 INPUT LAST $1-21 FIRST $ 22-30 ID $ 31-36 ROLE $ 37-44;
RUN;
PROC PRINT DATA=TEST;RUN;


TITLE;FOOTNOTE;


*EX_2.1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example is for end of chapter exercise 2.1;

DATA CHILDREN;
* WT is in column 1-2, HEIGHT is in 4-5 and AGE is in 7-8;
* Create an INPUT statement that will read in this data set;
INPUT     ;
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
Title "Exercise 2.1 – your name";
PROC PRINT DATA=CHILDREN;
RUN;


TITLE;FOOTNOTE;


*EX_2.2.SAS;
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example is for end of chapter exercise 2.2;

DATA PEOPLE;
INPUT ID $ 1-5 ; * finish INPUT statement;
DATALINES;
0000123MY201
0002143FY154
0004333FN133
0005429MN173
0013249FY114
;
Title "Exercise 2.2 – your name";
PROC PRINT DATA=PEOPLE;
RUN;

TITLE;FOOTNOTE;

*EX_2.3.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example is for end of chapter exercise 2.4;

DATA BIRTHDATES;
INPUT ID $ 1-5 ;          * finish INPUT statement;
FORMAT BDATE someformat.; * finish OUTPUT FORMAT statement;
DATALINES;
00001M112JAN1999
00021F003MAR1989
00043F018JUL1991
00054M022DEC1998
00132F110JUL1992
;
Title "Exercise 2.3 - your name";
PROC PRINT DATA=BIRTHDATES;
RUN;

TITLE;FOOTNOTE;


* BPDATA.DAT;

1120 80M15115
2130 70F25180
3140100M89170
4120 80F30150
5125 80F20110


* EX_2.4.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example is for end of chapter exercise 2.5;
DATA BPDATA;
INFILE 'inputfilename'; * Finish the INFILE statement;
INPUT ID 1 SBP 2-4 ;    * Finish the input statement;
Title "Exercise 2.4 - your name";
PROC MEANS;
RUN;


*EX_2.5.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example is for end of chapter exercise 2.5;
DATA TRAUMA2;
INFILE 'filename' DLM=  FIRSTOBS=  ; * Finish the INFILE statement;
INPUT SUBJECT $ AGE  GENDER $ PLACE $ STATUS $; 
Title "Exercise 2.5 – your name"; 
PROC MEANS; 
RUN;
