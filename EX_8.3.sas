*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This is code for an example in chapter 8 - ODS;

DATA TABLE;
INPUT EXPOSURE DISEASE COUNT;
DATALINES;
0 0 24
0 1 8
1 0 9
1 1 19
;


PROC FREQ DATA=TABLE; WEIGHT COUNT;
TABLES EXPOSURE*DISEASE/CHISQ;
RUN;




TITLE;FOOTNOTE;
