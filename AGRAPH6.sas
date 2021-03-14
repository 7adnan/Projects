*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC GCHART procedure;
GOPTIONS RESET=ALL;
TITLE 'Bar Chart by Group with different bar colors';
PROC GCHART DATA=MYSASLIB.SOMEDATA;
VBAR GENDER/GROUP=GP SUBGROUP=GENDER;
PATTERN1 VALUE=R1 COLOR=RED;
PATTERN2 VALUE=R1 COLOR=BLUE;
RUN;
QUIT;

TITLE;FOOTNOTE;
