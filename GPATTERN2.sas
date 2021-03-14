*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PFILL Patterns;
ODS GRAPHICS OFF; * NEEDED FOR SOME RELEASES OF SAS TO MAKE PFILL WORK;

GOPTIONS RESET = ALL;
DATA BARS;
INPUT A B;
DATALINES;
1 1
2 2
3 3
4 4
5 5
;
PATTERN1 V=E C=BLUE;
PATTERN2 V=R1 C=BLACK;
PATTERN3 V=X2 C=BLACK;
PATTERN4 V=L3 C=BLACK;
PATTERN5 V=S C=BLACK;
PROC GCHART ;VBAR A
/DISCRETE WIDTH=10
SUBGROUP=B;
RUN;
QUIT;


TITLE;FOOTNOTE;

