*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates a Subsetting IF Statement;
DATA ALL; 
INPUT AGE GENDER $ FAT PROTEIN CARBO SODIUM;
DATALINES;
25	M	40	40	109	1396
26	M	47	46	125	1731
38	M	42	40	104	1431
42	M	48	46	123	1711
65	M	41	41	112	1630
68	M	34	33	96	1192
20	F	39	29	118	1454
30	F	40	40	115	1532
60	F	39	40	123	1585
;
DATA MALES; 
SET ALL; 
IF GENDER ='M';
RUN;
* Add lines from hands-on example to create FEMALE data set;
* And add a PROC PRINT and RUN at the end for each new data set;


TITLE;FOOTNOTE;


