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
