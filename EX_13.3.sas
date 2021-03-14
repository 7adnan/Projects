
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
