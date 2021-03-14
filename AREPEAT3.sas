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
