*******************************************************
Code files for Chapter 13;

*AANOVA1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC ANOVA procedure;

DATA ACHE;
INPUT BRAND RELIEF;
CARDS;
1 24.5
1 23.5
1 26.4
1 27.1
1 29.9
2 28.4
2 34.2
2 29.5
2 32.2
2 30.1
3 26.1
3 28.3
3 24.3
3 26.2
3 27.8
;
PROC ANOVA DATA=ACHE;
    CLASS BRAND;
    MODEL RELIEF=BRAND;
    MEANS BRAND/TUKEY;
TITLE 'COMPARE RELIEF ACROSS MEDICINES  - ANOVA EXAMPLE';
RUN;
QUIT;


TITLE;FOOTNOTE;

* AGLM1.SAS;
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC GLM procedure;
DATA STUDY;
INPUT SUBJ DRUG RESULT;
DATALINES;
1	1	31
1	2	29
1	3	17
1	4	35
2	1	15
2	2	17
2	3	11
2	4	23
3	1	25
3	2	21
3	3	19
3	4	31
4	1	35
4	2	35
4	3	21
4	4	45
5	1	27
5	2	27
5	3	15
5	4	31
;
run;
PROC GLM DATA=STUDY;
	CLASS SUBJ DRUG;
	MODEL RESULT = SUBJ DRUG;
	MEANS DRUG/DUNCAN;
	TITLE 'Repeated Measures ANOVA';
RUN;
quit;

TITLE;FOOTNOTE;


*AGLM CONTRAST.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC GLM procedure;

DATA CONTRAST;
INPUT GROUP OBSERVATION;
DATALINES;
1	9.81
1	8.92
1	11.81
1	10.57
1	11.26
1	12.45
1	12.26
1	10.5
1	8.77
1	13.25
2	12.28
2	16.33
2	14.14
2	16.61
2	12.04
2	13.43
2	15.11
2	15.85
3	4.95
3	6.4
3	7.85
3	6.86
3	3.86
3	5.17
3	4.77
4	4.25
4	7.85
4	3.99
4	8.86
4	6.8
4	5.41
4	3.94
;
PROC GLM DATA=CONTRAST;
CLASS GROUP;
MODEL OBSERVATION=GROUP;
CONTRAST 'Groups 1 vs 3&4' GROUP -1 0 .5 .5;
RUN;
quit;


TITLE;FOOTNOTE;


* EX_13.2.SAS;
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC ANOVA procedure;


DATA DEVICE;
INPUT SUBJ $ GROUP SCORE;
DATALINES;
AE 1 99
DF 2 99
ED 1 82
FR 3 79
EE 1 89
EG 2 87
IS 3 69
OE 2 77
KY 1 100
WD 3 82
AD 2 89
TR 1 99
SS 2 83
WE 3 81
;
TITLE 'Exercise 13.2';
* PUT ANALYSIS CODE BELOW HERE;


TITLE;FOOTNOTE;

*EX_13.3.SAS;


*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC GLM procedure;

DATA REPEATED;
INPUT SID TIME OBS;
DATALINES;
1 1 113.2 
1 2 175.8 
1 3 215.6 
2 1 113.9 
2 2 172.8 
2 3 233.3 
3 1 95.3 
3 2 133.3 
3 3 189.5 
4 1 99.5 
4 2 137.1 
4 3 189.9 
5 1 73.1 
5 2 113.2 
5 3 155.6 
6 1 70.0 
6 2 128.4 
6 3 182.0 
;
run;
PROC GLM DATA=REPEATED;
	CLASS SID TIME;
	MODEL OBS = SID TIME;
	MEANS TIME/DUNCAN;
	TITLE 'Repeated Measures ANOVA';
RUN;
quit;

TITLE;FOOTNOTE;
