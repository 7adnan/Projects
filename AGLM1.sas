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
