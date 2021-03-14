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

