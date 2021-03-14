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

