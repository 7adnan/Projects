*******************************************************
Code files for Chapter 12;

*ACORR1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC COOR procedure;
* You could use MYSASLIB.SOMEDATA in the DATA= Statement;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

PROC CORR DATA="C:\SASDATA\SOMEDATA";
     VAR AGE TIME1 TIME2;
TITLE "Example correlations using PROC CORR";
RUN;



TITLE;FOOTNOTE;


*ACORR2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC CORR procedure;
* You could use MYSASLIB.SOMEDATA in the DATA= Statement;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

PROC CORR DATA="C:\SASDATA\SOMEDATA" PLOTS=MATRIX;
     VAR AGE TIME1 TIME2;
TITLE 'Example correlations using PROC CORR';
RUN;


TITLE;FOOTNOTE;

*ACORR3.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PROC CORR;
* You could use MYSASLIB.SOMEDATA in the DATA= Statement;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

PROC CORR DATA="C:\SASDATA\SOMEDATA";
     VAR TIME1-TIME4; WITH AGE;
TITLE "Example correlation calculations using a WITH statement";
RUN;


TITLE;FOOTNOTE;


*AREG1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC REG procedure;

DATA ART;
INPUT SUBJECT $ CREATE TASK;
DATALINES;
AE	28	4.5
FR	35	3.9
HT	37	3.9
IO	50	6.1
DP	69	4.3
YR	84	8.8
QD	40	2.1
SW	65	5.5
DF	29	5.7
ER	42	3.0
RR	51	7.1
TG	45	7.3
EF	31	3.3
TJ	40	5.2
;
RUN;
PROC REG;
MODEL TASK=CREATE;
TITLE 'Example simple linear regression using PROC REG';
RUN;
QUIT;


TITLE;FOOTNOTE;



*AREG2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PROC REG;
DATA JOB;
INPUT SUBJECT $ TEST1 TEST2 TEST3 TEST4 JOBSCORE;
CARDS;
   1         75     100      90      88      78 
   2         51      85      88      89      71 
   3         99      96      94      93      85 
   4         92     106      84      84      67 
   5         90      89      83      77      69 
   6         67      77      83      73      65 
   7        109      67      71      65      50 
   8         94     112     105      91     107 
   9        105     110      99      95      96 
  10         74     102      88      69      63 
;
PROC REG;
MODEL JOBSCORE=TEST1 TEST2 TEST3 TEST4;
TITLE 'Job Score Analysis using PROC REG';
RUN;
QUIT;


*AREG3.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PROC REG;
DATA JOB;
INPUT SUBJECT $ TEST1 TEST2 TEST3 TEST4 JOBSCORE;
CARDS;
   1         75     100      90      88      78 
   2         51      85      88      89      71 
   3         99      96      94      93      85 
   4         92     106      84      84      67 
   5         90      89      83      77      69 
   6         67      77      83      73      65 
   7        109      67      71      65      50 
   8         94     112     105      91     107 
   9        105     110      99      95      96 
  10         74     102      88      69      63 
;
PROC REG;
MODEL JOBSCORE=TEST1 TEST2 TEST3 TEST4
       /SELECTION=BACKWARD;
TITLE 'Job Score Analysis using PROC REG';
RUN;
QUIT;

TITLE;FOOTNOTE;


*AREG4.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PROC REG;
DATA JOB;
    INPUT SUBJECT $ TEST1 TEST2 TEST3 TEST4 JOBSCORE;
DATALINES;
   1         75     100      90      88      78 
   2         51      85      88      89      71 
   3         99      96      94      93      85 
   4         92     106      84      84      67 
   5         90      89      83      77      69 
   6         67      77      83      73      65 
   7        109      67      71      65      50 
   8         94     112     105      91     107 
   9        105     110      99      95      96 
  10         74     102      88      69      63 
;

PROC REG;
MODEL JOBSCORE=TEST3;
TITLE 'Job Score Final Model';
RUN;
DATA NEWAPPS; 
      INPUT SUBJECT $ TEST3; 
DATALINES; 
101 79 
102 87 
103 98 
104 100 
105 49 
106 88 
107 91 
108 79 
109 84 
110 87 
   ; 
DATA REPORT; SET JOB NEWAPPS; 
PREDICT_ID=CATS(SUBJECT,": ",TEST3);
RUN;
PROC REG DATA=REPORT; 
     ID PREDICT_ID;
     MODEL JOBSCORE=TEST3 /P CLI;
RUN;
QUIT;


TITLE;FOOTNOTE;


*AREG5.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PROC REG;
DATA JOB;
INPUT SUBJECT $ TEST1 TEST2 TEST3 TEST4 JOBSCORE;
CARDS;
   1         75     100      90      88      78 
   2         51      85      88      89      71 
   3         99      96      94      93      85 
   4         92     106      84      84      67 
   5         90      89      83      77      69 
   6         67      77      83      73      65 
   7        109      67      71      65      50 
   8         94     112     105      91     107 
   9        105     110      99      95      96 
  10         74     102      88      69      63 
;
RUN;
TITLE ' Residual Analysis';
PROC REG DATA=JOB;
MODEL JOBSCORE=TEST3/R;
RUN;
QUIT;

TITLE;FOOTNOTE;


*EX_12.1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example is for an exercise for Chapter 12;

* Note: If you have data in a folder other than C:\SASDATA you need to modify
        the INFILE statement;

PROC REG DATA="C:\SASDATA\DC_CRIME78_93";
	MODEL ASSAULT=YEAR;
RUN;
QUIT;


TITLE;FOOTNOTE;

*EX_12.1B.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example is for an exercise for Chapter 12;

* Note: If you have data in a folder other than C:\SASDATA you need to modify
        the INFILE statement;

PROC REG DATA="C:\SASDATA\DC_CRIME78_07";
	MODEL ASSAULT=YEAR;
RUN;
QUIT;


TITLE;FOOTNOTE;


*EX_12.2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example is for an exercise for Chapter 12;

PROC REG DATA="C:\SASDATA\CARS";
	MODEL CITYMPG=AUTOMATIC ENGINESIZE CYLINDERS HYBRID
    /SELECTION=BACKWARD AIC;
RUN;
QUIT;


TITLE;FOOTNOTE;


*ACORR4.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PROC CORR;
* You could use MYSASLIB.SOMEDATA in the DATA= Statement;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

DATA JOB;
PROC CORR DATA="C:\SASDATA\SOMEDATA" NOSIMPLE;
     VAR ____________; WITH ______;
TITLE 'Example correlation calculations using a WITH statement';
RUN;

