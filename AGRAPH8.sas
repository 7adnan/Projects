*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC GCHART procedure;

PATTERN1 V=L3 COLOR=LIGHTBLUE;
AXIS1 LABEL=(A=90 H=1.5 F="SWISS" "OBSERVATION" C=BLUE);
AXIS2 LABEL=(H=1.5 F="SWISS" "GROUP");
TITLE1 'Mean displayed with 95% error bars';
PROC GCHART DATA=MYSASLIB.SOMEDATA;
VBAR GP /
WIDTH=10 
TYPE=MEAN
SUMVAR=TIME1
INSIDE=MEAN
CLM=99
ERRORBAR=TOP 
RAXIS=AXIS1 MAXIS=AXIS2
COUTLINE=SAME WOUTLINE=2;
RUN;
QUIT;



TITLE;FOOTNOTE;

