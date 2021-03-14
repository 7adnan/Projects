*******************************************************
Code files for Chapter 3


*WRITE.SAS;
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates how to create a permanent data set.;

DATA "C:\SASDATA\PEOPLE";
INPUT ID $ 1-3 SBP 4-6 DBP 7-9 GENDER $ 10 AGE 11-12 WT 13-15;
DATALINES;
001120 80M15115
002130 70F25180
003140100M89170
004120 80F30150
005125 80F20110
;
RUN;
PROC MEANS;
RUN;

TITLE;FOOTNOTE;


*LIBNAME.SAS;
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates how to create a SAS library using code;

LIBNAME MYLIB2 "C:\SASDATA";
RUN;


*READFILE.SAS;
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This illustrates how to access a SAS file;

PROC MEANS DATA='c:\sasdata\somedata';RUN;

TITLE;FOOTNOTE;

*IMPORTEXAMPLE.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates how to import a CSV file;

PROC IMPORT OUT= WORK.MPG_FOR_CARS 
            DATAFILE= "C:\SASDATA\CARSMPG.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;


TITLE;FOOTNOTE;

*IMPORTEXAMPLE2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates how to import an EXCEL XLS file;

PROC IMPORT OUT= WORK.FROMXL 
            DATAFILE= "C:\SASDATA\EXAMPLE.XLS" 
            DBMS=XLS REPLACE;
     SHEET="Database"; 
     GETNAMES=YES;
RUN;
PROC PRINT DATA=FROMXL;RUN;

TITLE;FOOTNOTE;

*EXPORT.SAS;
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PROC EXPORT;

* LIBNAME MYSASLIB "C:\SASDATA"; * Needed if you have not defined the MYSASLIB library;
PROC EXPORT DATA=MYSASLIB.SOMEDATA
            OUTFILE="C:\SASDATA\EXPORTED.CSV" 
            DBMS=CSV
           REPLACE;
RUN;

TITLE;FOOTNOTE;

*CONTENTS.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates how to import a CSV file;

PROC DATASETS; 
CONTENTS DATA= 'C:\SASDATA\SOMEDATA'; 
RUN;

QUIT; * Sometimes required to cause a SAS process to stop;

TITLE;FOOTNOTE;


EX_3.2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example is for a Chapter 3 End of Chapter Exercise;

DATA WEIGHT;
INPUT TREATMENT LOSS @@;
DATALINES;
1 1.0 1 3.0 1 -1.0 1 1.5 1 0.5 1 3.5
2 4.5 2 6.0 2 3.5 2 7.5 2 7.0 2 6.0 2 5.5
3 1.5 3 -2.5 3 -0.5 3 1.0 3 .5
;
PROC PRINT;
RUN;

TITLE;FOOTNOTE;







