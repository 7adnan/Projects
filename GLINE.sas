*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PFILL Patterns;
ODS GRAPHICS OFF; * NEEDED FOR SOME RELEASES OF SAS TO MAKE PFILL WORK;

GOPTIONS RESET = ALL;
SYMBOL1 V=CIRCLE C=BLUE I=R L=2 W=5;
TITLE 'REGRESSION LINE TYPE SELECTED';
PROC GPLOT DATA="C:\SASDATA\CARS";
     PLOT HWYMPG*ENGINESIZE ;
RUN;
QUIT;



TITLE;FOOTNOTE;

