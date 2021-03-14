*******************************************************
Code files for Chapter 5;

*DTITLE1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates titles and footnotes;
* Note: If you have data in a folder other than C:\SASDATA you need to modify
        the INFILE statement;


DATA MYDATA;
INFILE 'C:\SASDATA\EXAMPLE.DAT';
INPUT ID 1-3 GP $ 5 AGE 6-9 TIME1 10-14 TIME2 15-19 TIME3 20-24;
RUN;	
PROC PRINT;
Title 'Example SAS programs';
Title2 'These is data from the example file.';
Title4 'Using the EXAMPLE data set.';
Footnote 'This is a footnote';
RUN;
PROC MEANS;
Title2 'This is output from PROC Means.';
RUN;
TITLE;FOOTNOTE; * TURNS OFF TITLE AND FOOTNOTE;

*DTITLE2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates TITLE and FOOTNOTE options;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

TITLE J=RIGHT 
      FONT= 'SWISS' COLOR=RED BOLD BCOLOR=YELLOW "EXAMPLE " 
      C=BLACK BOLD ITALIC "TODAY IS &SYSDATE9";
TITLE2 J=CENTER C="CX3230B2" "THIS IS BRILLIANT BLUE.";
FOOTNOTE J=CENTER COLOR=PURPLE UNDERLINE=1
       HEIGHT=8PT "8 POINTS"
       HEIGHT=16PT " 16 POINTS"
       H=24PT " 24 POINTS";
;
PROC MEANS DATA=MYSASLIB.PEOPLE2;
RUN;

TITLE;FOOTNOTE;

*DSORTMEANS.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the use of the BY Statement;
* Note: If you have data in a folder other than C:\SASDATA you need to modify
        the INFILE statement;

DATA MYDATA;
INFILE 'C:\SASDATA\EXAMPLE.DAT';
INPUT ID 1-3 GP $ 5 AGE 6-9 TIME1 10-14 TIME2 15-19 TIME3 20-24 STATUS 31;
RUN;
* FIRST TIME ALL DATA AT ONCE;
PROC MEANS; 
   VAR TIME1 TIME2; 
RUN;*NOTE USES MYDATA BY DEFAULT;

* SECOND TIME MEANS BY GROUP;
PROC SORT DATA=MYDATA OUT=SORTED;BY GP; RUN;
PROC MEANS DATA=SORTED; 
   VAR TIME1 TIME2;
   BY GP; 
RUN;


TITLE;FOOTNOTE;


*D_ID.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the use of the ID Statement;

DATA WEIGHT;
INFORMAT MDATE MMDDYY10.;
FORMAT MDATE DATE9.; *OUTPUT FORMAT;
INPUT MDATE RAT_ID $ WT_GRAMS TRT $ PINKEYE $;
DATALINES;
02/03/2009 001 093 A Y
02/04/2009 002 087 B N
02/04/2009 003 103 A Y
02/07/2009 005 099 A Y
02/08/2009 006 096 B N
02/11/2009 008 091 B Y
;
RUN;
PROC PRINT DATA=WEIGHT;
RUN;

TITLE;FOOTNOTE;

*APRINT1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the use of  PROC PRINT;

* NOTE: You can also use DATA=MYSASLIB.SOMEDATA 
* if the MYSASLIB library has been previously defined;

PROC PRINT DATA="C:\SASDATA\SOMEDATA"
	N = 'Number of Subjects is: '
	Obs='Subjects';
SUM TIME1 TIME2 TIME3 TIME4;
TITLE 'PROC PRINT Example';
RUN;


TITLE;FOOTNOTE;

*APRINT2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* NOTE: You can also use DATA=MYDATA.TRAUMA
* if the MYDATA library has been previously defined;

* This example illustrates the use of the SPLIT Statement;
TITLE "Trauma Data Report";
PROC PRINT LABEL DATA="C:\SASDATA\TRAUMA"
     (firstobs=11 obs= 100);
VAR INC_KEY AGE GENDER ISS INJTYPE DISSTATUS;
label   INC_KEY='Subject ID '
		AGE='Age in 2014 '
		GENDER='Gender '
        ISS='Injury Severity Score '
        INJTYPE='Injury Type '
        DISSTATUS='Discharge Status';
RUN;


TITLE;FOOTNOTE;

*APRINT3.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* NOTE: You can also use DATA=MYSASLIB.TRAUMA
* if the MYSASLIB library has been previously defined;

* This example illustrates the use of the SPLIT Statement;

TITLE "Trauma Data Report";
PROC PRINT DATA="C:\SASDATA\TRAUMA" 
   (firstobs=11 obs= 100)
   SPLIT='*'
   N OBS='Observation*Number*===========';
VAR INC_KEY AGE GENDER ISS INJTYPE DISSTATUS;
LABEL INC_KEY='Subject*ID**============'
		AGE='Age in*2014**============'
		GENDER='*Gender**============'
        ISS='Injury Severity*Score**============'
        INJTYPE='Injury*Type**=========='
        DISSTATUS='Discharge*Status*==============';
RUN;

TITLE;FOOTNOTE;

*SYSOBS.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* NOTE: You can also use DATA=MYSASLIB.SOMEDATA
* if the MYSASLIB library has been previously defined;

* This example illustrates the use of the SPLIT Statement;
OPTIONS FIRSTOBS=11 OBS=20;
PROC PRINT LABEL DATA="C:\SASDATA\SOMEDATA";
RUN;
OPTIONS FIRSTOBS=1 OBS=MAX; 
* NOTE: It is important to reset FIRSTOBS and OBS, otherwise any
following analyses may not use all data in a data set;

TITLE;FOOTNOTE;

*DLABEL.SAS (For exercise 5.2);

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














