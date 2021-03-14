*******************************************************
Code files for Chapter 15;

*AGLM ANCOVA.SAS;

*ANPAR1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC NPAR1WAY procedure;

DATA FERTILIZER;
INPUT BRAND $ HEIGHT;
DATALINES;
   A   20.00
   A   23.00
   A   32.00
   A   24.00
   A   25.00
   A   28.00
   A   27.50
   B   25.00
   B   46.00
   B   56.00
   B   45.00
   B   46.00
   B   51.00
   B   34.00
   B   47.50
;

PROC NPAR1WAY WILCOXON;
     CLASS BRAND;
     VAR HEIGHT;
	 EXACT;
     Title 'Compare two groups using NPAR1WAY';
RUN;

*ANPAR2.SAS;


TITLE;FOOTNOTE;


*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC NPAR1WAY procedure;

DATA NPAR;
INPUT GROUP WEIGHT @@;
DATALINES;
1 50.8 1 57.0 1 44.6 1 51.7 1 48.2 1 51.3 1 49.0
2 68.7 2 67.7 2 66.3 2 69.8 2 66.9 2 65.2 2 62.0 
3 82.6 3 74.1 3 80.5 3 80.3 3 81.5 3 78.6 3 76.1
4 76.9 4 72.2 4 73.7 4 74.2 4 70.6 4 75.3 4 69.8
;
RUN;
PROC NPAR1WAY WILCOXON;
     CLASS GROUP;
     VAR WEIGHT;
     Title 'Four group analysis using NPAR1WAY';
RUN;



TITLE;FOOTNOTE;


*AUNIPAIRED.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC UNIVARIATE procedure;
DATA WEIGHT;
INPUT WBEFORE WAFTER;
* Calculate WLOSS in the DATA step *;
WLOSS=WBEFORE-WAFTER;  
DATALINES;
200 190
175 154
188 176
198 193
197 198
310 240
245 204
202 178
;
PROC UNIVARIATE; 
	VAR WLOSS;
	TITLE 'Paired comparison using PROC UNIVARIATE';
RUN;


TITLE;FOOTNOTE;


*AFRIEDMAN.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates FRIEDMAN'S TEST;

DATA TIME;
INPUT SUBJ DRUG	OBS;
datalines;
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
Title "Friedman Analysis";
PROC FREQ;
  TABLES SUBJ*DRUG*OBS / CMH2 SCORES=RANK NOPRINT;
RUN;


TITLE;FOOTNOTE;


*ANPAR3.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates multiple comparisons for a Kruskal-Wallis Analysis;

*************************************************************
* NOTE: YOU MUST HAVE THE FOLLOWING FILE IN THE INDICATED
* IN THE "%INCLUDE" STATEMENT AT THE DESIGNATED
* LOCATION ON YOUR HARD DRIVE FOR THIS PROGRAM TO WORK.
*************************************************************;
* See http://www.alanelliott.com/kw/ for the latest version
of KW_MC.sas;
*************************************************************;
OPTIONS LS=80; * may be needed for ouput to fit on the screen correctly;
%INCLUDE 'C:\SASDATA\KW_MC.SAS';
DATA NPAR;
INPUT GROUP WEIGHT @@;
DATALINES;
1 50.8 1 57.0 1 44.6 1 51.7 1 48.2 1 51.3 1 49.0
2 68.7 2 67.7 2 66.3 2 69.8 2 66.9 2 65.2 2 62.0 
3 82.6 3 74.1 3 80.5 3 80.3 3 81.5 3 78.6 3 76.1
4 76.9 4 72.2 4 73.7 4 74.2 4 70.6 4 75.3 4 69.8
;
RUN;
* BEGIN INFORMATION FOR USING THE SAS MACRO KW_MC;
%LET NUMGROUPS=4;
%LET DATANAME=NPAR;
%LET OBSVAR=WEIGHT;
%LET GROUP=GROUP;
%LET ALPHA=0.05;
Title 'Kruskal-Wallis Multiple Comparisons';
*****************************************************************
*invoke the KW_MC macro                                         *
*****************************************************************;

%KW_MC(source=&DATANAME, groups=&NUMGROUPS, obsname=&OBSVAR, gpname=&GROUP, sig=&alpha);



TITLE;FOOTNOTE;





