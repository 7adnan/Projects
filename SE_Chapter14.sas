*******************************************************
Code files for Chapter 14;

*AGLM ANCOVA.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC GLM procedure;

DATA ANCOVA;
INPUT METHOD EXAM FINAL @@;
DATALINES;
1	36	38  1	37	39  1	35	41
1	43	47  1	32	33  1	33	37
2	42	41  2	30	30  2	39	45
2	26	28  2	22	25  2	37	39
3	23	30  3	40	49  3	34	43
3	30	38  3	25	32  3	31	37
;
RUN;
* CHECK THE ASSUMPTION THAT SLOPES ARE PARALLEL;
PROC GLM;
   CLASS METHOD;
    MODEL FINAL=EXAM METHOD EXAM*METHOD;
	TITLE 'Analysis of Covariance Example';
RUN;
* IF SLOPES ARE PARALLEL, DROP THE INTERACTION TERM;
PROC GLM;
   CLASS METHOD;
    MODEL FINAL=EXAM METHOD;
	LSMEANS METHOD/STDERR PDIFF ADJUST=SCHEFFE;
RUN; 
QUIT;
TITLE;FOOTNOTE;

*AGLM 2FACTOR.SAS;
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC GLM procedure;

DATA SLIM;
INPUT CONDITION STATUS RESPONSE @@;
DATALINES;
1 1 -13.67 1 1 -12.85 1 1 -9.55 1 1 -17.03 1 1 13.61 
1 2 .91 1 2 2.48 1 2 2.84 1 2 3.46 1 2 2.20 1 2 -.73 
1 2 -3.05 1 2 -5.68 1 2 -3.44 1 2 -7.18 1 2 -3.40 1 2 -.74 
2 1 -3.29 2 1 -4 2 1 -2.31 2 1 -3.4 2 1 -7.49 2 1 -13.62 
2 1 -7.34 2 1 -7.39 2 1 -1.32 2 1 -12.01 2 1 -8.35
2 2 5.94 2 2 1.91 2 2 -4.0 2 2 -5.19 2 2 0 2 2 -2.8
;
RUN;
TITLE "Two-Way ANOVA Example";
PROC GLM;
CLASS CONDITION STATUS;
    MODEL RESPONSE=CONDITION STATUS CONDITION*STATUS;
	MEANS CONDITION STATUS CONDITION*STATUS;
RUN;
QUIT;

TITLE;FOOTNOTE;


*AMIXED1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC MIXED procedure;

DATA HEIGHTS; 
INPUT FAMILY GENDER$ HEIGHT @@; 
DATALINES; 
1 F 67   1 F 66   1 F 64   1 M 71   1 M 72   2 F 63 
2 F 63   2 F 67   2 M 69   2 M 68   2 M 70   3 F 63 
3 M 64   4 F 67   4 F 66   4 M 67   4 M 67   4 M 69 
   ;
RUN;
PROC MEANS MAXDEC=2 MEAN DATA=HEIGHTS;
  CLASS FAMILY GENDER;
  VAR HEIGHT; 
PROC MIXED; 
     CLASS FAMILY GENDER; 
     MODEL HEIGHT = GENDER;
	 RANDOM FAMILY FAMILY*GENDER; 
RUN;

TITLE;FOOTNOTE;


*AREPEAT1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC MIXED procedure;

DATA REPMIXED(KEEP= SUBJECT GENDER TIME OUTCOME);
INPUT SUBJECT GENDER $ HOUR1-HOUR4 ;
OUTCOME = HOUR1;  TIME = 1; OUTPUT;
OUTCOME = HOUR2;  TIME = 2; OUTPUT;
OUTCOME = HOUR3;  TIME = 3; OUTPUT;
OUTCOME = HOUR4;  TIME = 4; OUTPUT;
DATALINES;
1	M	1	1.5	6	5.1
2	M	4	2.2	6.1	5.2
3	M	5.2	4.1	5.8	3.2
4	F	5.1	3.3	5.2	4.8
5	F	6.3	4.9	7.9	6.9
6	F	8.2	5.9	9.5	9.1
7   F   8.3 6.1  .  9.2
;
TITLE "PROC MIXED Repeated Measures Analysis";
PROC MIXED DATA=REPMIXED;
	 CLASS GENDER TIME SUBJECT;
	 MODEL OUTCOME=GENDER TIME GENDER*TIME;
	 REPEATED / TYPE=UN SUB=SUBJECT;
RUN;
PROC MIXED DATA=REPMIXED;
	 CLASS GENDER TIME SUBJECT;
	 MODEL OUTCOME=GENDER TIME GENDER*TIME;
	 REPEATED / TYPE=CS SUB=SUBJECT;
RUN;
PROC MIXED DATA=REPMIXED;
	 CLASS GENDER TIME SUBJECT;
	 MODEL OUTCOME=GENDER TIME GENDER*TIME;
	 REPEATED / TYPE=AR(1) SUB=SUBJECT;
RUN;

TITLE;FOOTNOTE;


*AREPEAT2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC MIXED procedure;

DATA REPMIXED(KEEP= SUBJECT GENDER TIME OUTCOME);
INPUT SUBJECT GENDER $ HOUR1-HOUR4 ;
OUTCOME = HOUR1;  TIME = 1; OUTPUT;
OUTCOME = HOUR2;  TIME = 2; OUTPUT;
OUTCOME = HOUR3;  TIME = 3; OUTPUT;
OUTCOME = HOUR4;  TIME = 4; OUTPUT;
DATALINES;
1	M	1	1.5	6	5.1
2	M	4	2.2	6.1	5.2
3	M	5.2	4.1	5.8	3.2
4	F	5.1	3.3	5.2	4.8
5	F	6.3	4.9	7.9	6.9
6	F	8.2	5.9	9.5	9.1
7   F   8.3 6.1  .  9.2
;
TITLE "PROC MIXED Repeated Measures Analysis";
*--------------------PRODUCE GRAPHS OF MEANS;
PROC SORT DATA=REPMIXED;BY GENDER TIME;
PROC MEANS noprint; BY GENDER TIME; 
     OUTPUT OUT=FORPLOT MEAN=;
RUN;
TITLE "Repeated Measures Example";
PROC GPLOT;
PLOT OUTCOME*GENDER=TIME;
SYMBOL1 V=CIRCLE I=JOIN L=1 C=BLACK;
SYMBOL2 V=DOT I=JOIN L=2 C=BLUE;
SYMBOL3 V=STAR I=JOIN L=2 C=RED;
SYMBOL4 V=SQUARE I=JOIN L=2 C=GREEN;
RUN;

PROC SORT DATA=REPMIXED;BY TIME GENDER;
PROC MEANS noprint; BY TIME GENDER; 
     OUTPUT OUT=FORPLOT MEAN=;
RUN;
PROC GPLOT;
PLOT OUTCOME*TIME=GENDER;
SYMBOL1 V=CIRCLE I=JOIN L=1 C=BLACK;
SYMBOL2 V=DOT I=JOIN L=2 C=BLUE;
RUN;

QUIT;
TITLE;FOOTNOTE;


*AREPEAT3.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC MIXED procedure;

DATA REPMIXED(KEEP= SUBJECT GENDER TIME OUTCOME);
INPUT SUBJECT GENDER $ HOUR1-HOUR4 ;
OUTCOME = HOUR1;  TIME = 1; OUTPUT;
OUTCOME = HOUR2;  TIME = 2; OUTPUT;
OUTCOME = HOUR3;  TIME = 3; OUTPUT;
OUTCOME = HOUR4;  TIME = 4; OUTPUT;
DATALINES;
1	M	1	1.5	6	5.1
2	M	4	2.2	6.1	5.2
3	M	5.2	4.1	5.8	3.2
4	F	5.1	3.3	5.2	4.8
5	F	6.3	4.9	7.9	6.9
6	F	8.2	5.9	9.5	9.1
7   F   8.3 6.1  .  9.2
;
TITLE "PROC MIXED Repeated Measures Analysis";
PROC MIXED DATA=REPMIXED;
	 CLASS GENDER TIME SUBJECT;
	 MODEL OUTCOME=GENDER TIME GENDER*TIME;
	 REPEATED / TYPE=AR(1) SUB=SUBJECT;
	 LSMEANS TIME/PDIFF;
RUN;
QUIT;

TITLE;FOOTNOTE;


*EX_14.2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This file is for an exercise in Chapter 14;

DATA REPEAT;
INPUT SUBJECT GENDER $ HOUR1-HOUR4 ;
DATALINES;
1	M	1	1.5	6	5.1
2	M	4	2.2	6.1	5.2
3	M	5.2	4.1	5.8	3.2
4	F	5.1	3.3	5.2	4.8
5	F	6.3	4.9	7.9	6.9
6	F	8.2	5.9	9.5	9.1
7   F   8.3 6.1  .  9.2
;

PROC GLM DATA=REPEAT;
CLASS GENDER;
MODEL HOUR1-HOUR4=GENDER / NOUNI;
REPEATED HOUR 4 (1 2 3 4) / PRINTE;
TITLE 'REPEATED MEASURES EXAMPLES USING GLM';
RUN;
QUIT;
TITLE; FOOTNOTE;

