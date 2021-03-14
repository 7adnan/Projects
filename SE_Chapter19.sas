*******************************************************
Code files for Chapter 19;

*ATAB1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* Note: These GRAPH examples use the MYSASLIB library. If you have
* not created this library, you can use this code, or modify this
* code to point to the folder containing your data files;
* LIBNAME MYSASLIB "C:\SASDATA\";

* This example illustrates PROC tabulate;

PROC TABULATE DATA=MYSASLIB.REGION;
  CLASS TYPE;
  TABLE TYPE;
RUN;


*ATAB2.SAS;
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PROC tabulate;

PROC FORMAT;
VALUE $FMTCOMPASS "N"="1.North" "S"="2.South" "E"="3.East" "W"="4.West";
RUN;

PROC TABULATE DATA=MYSASLIB.REGION ORDER=FORMATTED;
  CLASS TYPE AREA SITE;
  TABLE SITE="Store Site", AREA="Area"*TYPE="Type Store";
  FORMAT AREA $FMTCOMPASS.;
RUN;


*ATAB3.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PROC tabulate;
PROC FORMAT;
VALUE $FMTCOMPASS "N"="1.North" "S"="2.South" "E"="3.East" "W"="4.West";
RUN;


PROC TABULATE DATA=MYSASLIB.REGION ORDER=FORMATTED;
  CLASS TYPE AREA SITE;
  VAR SALES_K;
  TABLE SITE="Store Site", AREA="Area"*TYPE="Type Store"*SALES_K;
  FORMAT AREA $FMTCOMPASS.;
RUN;


*ATAB4.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PROC tabulate;
PROC FORMAT;
VALUE $FMTCOMPASS "N"="1.North" "S"="2.South" "E"="3.East" "W"="4.West";
RUN;


PROC TABULATE DATA=MYSASLIB.REGION ORDER=FORMATTED;
  CLASS TYPE AREA SITE;
  VAR SALES_K;
  
  TABLE SITE="", 
        (AREA="" ALL)*TYPE=""
        *MEAN="Mean Sales $1000"*SALES_K=""*F=DOLLAR6.2;

  FORMAT AREA $FMTCOMPASS.;
RUN;


*ATAB5.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PROC tabulate;
PROC FORMAT;
VALUE $FMTCOMPASS "N"="1.North" "S"="2.South" "E"="3.East" "W"="4.West";
RUN;


PROC TABULATE DATA=MYSASLIB.REGION ORDER=FORMATTED;
  CLASS TYPE AREA SITE;
  VAR SALES_K;
  TABLE(AREA="" ALL),(SITE="" ALL)*TYPE=""
        *MEAN=""*SALES_K=""*F=6.2;
  FORMAT AREA $FMTCOMPASS.;
RUN;

*ATAB6.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PROC tabulate;
PROC FORMAT;
VALUE $FMTCOMPASS "N"="1.North" "S"="2.South" "E"="3.East" "W"="4.West";
RUN;


ODS TAGSETS.EXCELXP BODY='C:\SASDATA\TABLE.XLS';
PROC TABULATE DATA=MYSASLIB.REGION ORDER=FORMATTED;
  CLASS TYPE AREA SITE;
  VAR SALES_K;
TABLE(AREA="" ALL="By Area"),(SITE="" ALL="By Site")*TYPE=""
        *(N="" MEAN="")*SALES_K=""*F=6.2 
   / BOX="Fall Sales";
  FORMAT AREA $FMTCOMPASS.;
RUN;
ODS TAGSETS.EXCELXP CLOSE;


TITLE;FOOTNOTE;


*AREPORT1.SAS;
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* Note: These GRAPH examples use the MYSASLIB library. If you have
* not created this library, you can use this code, or modify this
* code to point to the folder containing your data files;
* LIBNAME MYSASLIB "C:\SASDATA\";

* This example illustrates the PROC REPORT procedure;

TITLE 'PROC REPORT DISPLAY Example';
PROC REPORT DATA=MYSASLIB.CARS NOFS;
  COLUMN BRAND MODEL CITYMPG HWYMPG;
  DEFINE CITYMPG/DISPLAY FORMAT=6.1 'CITY/MPG';
RUN;

TITLE;FOOTNOTE;

*AREPORT2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC REPORT procedure;
TITLE "PROC REPORT ORDER Example";
PROC REPORT DATA=MYSASLIB.CARS NOFS;
  COLUMN BRAND CITYMPG HWYMPG;
  DEFINE BRAND/ORDER 'Brand';
  DEFINE CITYMPG/DISPLAY FORMAT=6.1 'City MPG';
  DEFINE HWYMPG/DISPLAY FORMAT=6.1 'Highway MPG';
RUN;

*AREPORT3.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC REPORT procedure;

TITLE "PROC REPORT GROUP Example";
PROC REPORT DATA=MYSASLIB.CARS NOFS;
  COLUMN BRAND (CITYMPG HWYMPG), MEAN;
  DEFINE BRAND/GROUP;
  DEFINE CITYMPG/DISPLAY FORMAT=6.1 'CITY MPG';
RUN;

TITLE;FOOTNOTE;


*AREPORT4.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC REPORT procedure;

TITLE "PROC REPORT ANALYSIS Example";
PROC REPORT DATA=MYSASLIB.CARS NOFS;
  COLUMN BRAND CITYMPG HWYMPG;
  DEFINE BRAND/GROUP;
  DEFINE CITYMPG/ANALYSIS MEAN FORMAT=6.1 'CITY/MPG';
RUN;


TITLE;FOOTNOTE;


*AREPOR5.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC REPORT procedure;

TITLE "PROC REPORT COMPUTE Example";
PROC REPORT DATA=MYSASLIB.CARS NOFS SPLIT="~";
  COLUMN BRAND CITYMPG,MEAN HWYMPG, MEAN RATIO_MPG;
  DEFINE BRAND/ORDER;
  DEFINE BRAND/GROUP;
  DEFINE CITYMPG/DISPLAY FORMAT=6.1 'City MPG';
  DEFINE HWYMPG/DISPLAY FORMAT=6.1 'Highway MPG';
  DEFINE RATIO_MPG/COMPUTED FORMAT=6.2 'Ratio~CITY/HWY';
  COMPUTE RATIO_MPG;
     RATIO_MPG=_C2_/_C3_;
  ENDCOMP;
RUN;

TITLE;FOOTNOTE;



*AREPOR6.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC REPORT procedure;

TITLE "PROC REPORT ACROSS Example";
PROC FORMAT; 
VALUE FMTSUV 0="NOT SUV" 1="SUV";
PROC REPORT DATA=MYSASLIB.CARS NOFS;
  COLUMN BRAND CITYMPG,SUV HWYMPG,SUV;
  DEFINE BRAND/ORDER;
  DEFINE BRAND/GROUP;
  DEFINE CITYMPG/ANALYSIS MEAN FORMAT=6.1;
  DEFINE HWYMPG/ANALYSIS MEAN FORMAT=6.1;
  DEFINE SUV/ ACROSS 'BY SUV'; 
  FORMAT SUV FMTSUV.;
RUN;

TITLE;FOOTNOTE;




*AREPORT7.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC REPORT procedure;

TITLE "PROC REPORT Multiple Statistics Example";
PROC REPORT DATA=MYSASLIB.CARS NOFS;
COLUMN BRAND CITYMPG,(N MEAN STD) HWYMPG ENGINESIZE ;
  DEFINE BRAND/GROUP;
  DEFINE CITYMPG/ FORMAT=6.1 'City MPG';
  DEFINE N / 'N' format=4.;
  DEFINE HWYMPG/ ANALYSIS MEAN FORMAT=6.1;
  DEFINE ENGINESIZE/ ANALYSIS MEAN FORMAT=6.1;
RUN;


TITLE;FOOTNOTE;


*AREPORT8.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC REPORT procedure;

TITLE "PROC REPORT Subtotals";
PROC REPORT DATA=MYSASLIB.CARS NOFS;
COLUMN BRAND CYLINDERS AUTOMATIC SUV  ;
  DEFINE BRAND/GROUP;
  DEFINE CYLINDERS/GROUP;
  BREAK AFTER BRAND/SUMMARIZE SUPPRESS;
  RBREAK AFTER/ SUMMARIZE ;
  WHERE CYLINDERS NE -1 ;
RUN;


TITLE;FOOTNOTE;


*APUT_REPORT1.SAS;
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PUT REPORT process;
DATA _NULL_; SET MYSASLIB.SOMEDATA;
     PUT AGE;
RUN;

* SEE RESULTS IN THE LOG;

TITLE;FOOTNOTE;


*APUT_REPORT2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PUT REPORT process;
****************************************PRELIMINARY CALCULATIONS;
DATA GRADES;
INPUT NAME $15. G1 G2 G3;
AVE=MEAN(of G1-G3);
DATALINES;
Alice, Adams   88.4 91 79
Jones, Steve   99 100 88.4
Zabar,Fred     78.6 87 88.4
;
RUN;
*******************************CALCULATE THE OVERALL CLASS AVERAGE;
PROC MEANS DATA=GRADES NOPRINT;OUTPUT OUT=GMEAN;RUN;
******************** CAPTURE THE MEAN AND MAKE IT A MACRO VARIABLE;
DATA _NULL_;SET GMEAN;
IF _STAT_="MEAN" THEN CALL SYMPUT('CLASSMEAN',ROUND(AVE,.01));
********** NOTE: In the book p 461, the code for Standard Deviation should be as follows:
********** where it is ROUND(AVE instead of ROUND(STD
* IF _STAT_="STD" THEN CALL SYMPUT('CLASSSTD',ROUND(AVE,.01));
RUN;
************************************END OF PRELIMINARY CALCULATIONS;

************************************BEGINNING OF THE REPORT;
TITLE "Grade Report for Course 1234";
DATA _NULL_;SET GRADES END=EOF;
TABLEHEAD="SUMMARY OF GRADES";
FILE PRINT;
IF _N_= 1 then DO; * PUT HEADER;
	L=5+(60-LENGTH(TABLEHEAD))/2; * CENTER HEAD;
    PUT @L TABLEHEAD;
	PUT @5 60*'=';
	PUT @5 "NAME" @20 "| TEST 1" @30 "| TEST 2 " 
        @40 "| TEST 3" @50 "| AVERAGE";
	PUT @5 60*'-';
END;

PUT @5 NAME @20 "|" G1 5.1 @30 "|" G2 5.1 
        @40 "|" G3 5.1 @50 "|" AVE 5.1;

IF EOF =1 then do; * PUT BOTTOM OF TABLE;
      PUT @5 60*'-';
      PUT @5 "CLASS AVERAGE " @; * HOLDS THE LINE FOR NEXT PUT;
      PUT @50 "| %TRIM(&CLASSMEAN) " ;
	  PUT @5 60*'=';
END;
RUN;


TITLE;FOOTNOTE;



*EX_19.1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example is an exercise for Chapter 19;
TITLE "Exercise 19.1";

PROC TABULATE DATA=MYSASLIB.CARS;
  CLASS BRAND SUV ;
  VAR CITYMPG;
  TABLE BRAND, SUV*MEAN*CITYMPG;
RUN;

TITLE;FOOTNOTE;


*EX_19.2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC REPORT procedure;

TITLE "PROC REPORT Exercise 19.2";
PROC REPORT DATA=MYSASLIB.SOMEDATA NOFS ;
  COLUMN AGE STATUS TIME1-TIME4 MEANTIME;
  DEFINE AGE/GROUP;
  DEFINE TIME1/ANALYSIS MEAN ;
  DEFINE MEANTIME/COMPUTED  'AVE TIME 1 TO 2' ;
  COMPUTE MEANTIME;
     MEANTIME=(_C3_+_C4_)/2; *MEAN OF TIME1 AND TIME2;
  ENDCOMP;
RUN;



TITLE;FOOTNOTE;






TITLE;FOOTNOTE;




