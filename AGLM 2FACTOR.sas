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
