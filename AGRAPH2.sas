*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC GPLOT procedure;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

GOPTIONS RESET=ALL;
Title "Simple Scatterplot, Change symbol";
PROC GPLOT DATA=MYSASLIB.CARS;
     PLOT HWYMPG*CITYMPG;
     SYMBOL1 V=STAR I=RL C=BLUE L=2;
RUN;
QUIT;


TITLE;FOOTNOTE;
