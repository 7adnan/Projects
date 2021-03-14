
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates CHARACTER FUNCTIONS;

DATA BP;
INPUT BP $10.;
I=FIND(BP,"/");
SBP=SUBSTR(BP,1,I-1); * get number before the /;
DBP=SUBSTR(BP,I+1); *get number after the /;
DROP I;
DATALINES;
120/80
140/90
110/70
;
PROC PRINT DATA=BP;RUN;




TITLE;FOOTNOTE;
