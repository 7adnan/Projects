*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC GCHART procedure;
GOPTIONS RESET=ALL;
AXIS1 LABEL=NONE VALUE=(H=1.2);
AXIS2 LABEL=(A=90 "Count");
TITLE "Vertical Bar Chart";
PROC GCHART DATA=MYSASLIB.SOMEDATA;
VBAR GENDER/GROUP=GP MAXIS=AXIS1 AXIS=AXIS2;
PATTERN1 VALUE=R1 COLOR=GREEN;
RUN;
QUIT;


TITLE;FOOTNOTE;
