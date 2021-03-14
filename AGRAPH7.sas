*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC GCHART procedure;
GOPTIONS RESET=ALL;
PATTERN1 V=R1 C=RED; * FOR BUS;
PATTERN2 V=R1 C=BLUE; * FOR CAR;
PATTERN3 V=R1 C=BLACK; * FOR WALK;
TITLE C=RED 'Stacked Bars, Method of Arrival';
PROC GCHART DATA=MYSASLIB.SURVEY;
 	 VBAR GENDER / SUBGROUP=ARRIVE WIDTH=15;
RUN;QUIT;

TITLE;FOOTNOTE;

