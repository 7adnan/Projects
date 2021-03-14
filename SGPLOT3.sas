*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC SGPLOT procedure;
DATA ANCOVA;
INPUT METHOD PRETEST POSTTEST @@;
DATALINES;
1	36	38  1	37	39  1	35	41
1	43	47  1	32	33  1	33	37
2	42	41  2	30	30  2	39	45
2	26	28  2	22	25  2	37	39
3	23	30  3	40	49  3	34	43
3	30	38  3	25	32  3	31	37
;
RUN;
PROC SGPLOT DATA =ANCOVA; 
 SCATTER X=PRETEST Y=POSTTEST;
RUN; 


TITLE;FOOTNOTE;
