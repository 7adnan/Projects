*******************************************************
Code files for Chapter 1

FIRST.SAS
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

DATA EMPLOYEES;
INPUT GENDER $ AGE;
DATALINES;
MALE 34
MALE 37
MALE 19
MALE 18
MALE 46
MALE 64
MALE 54
MALE 44
MALE 33
FEMALE 36
FEMALE 32
FEMALE 43
FEMALE 24
FEMALE 29
FEMALE 52
FEMALE 72
FEMALE 38
FEMALE 42
;
PROC MEANS;
   CLASS GENDER;
RUN;


* SECOND.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

*
* PUT YOUR TITLE ON THE NEXT LINE;

DATA EXAMPLE;
INPUT AGE @@;
DATALINES;
12 11 12 12 9 11 8 8 7 11 12 14 9 10 7 13
6 11 12 4 11 9 13 6 9 7 13 9 13 12 10 13
11 8 11 15 12 14 10 10 13 13 10 8 12 7 13
11 9 12
;
PROC MEANS; 
    VAR AGE;
RUN;
