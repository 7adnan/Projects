*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;
* 
* Note: These GRAPH examples use the MYSASLIB library. 
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

* This example illustrates the PROC GPLOT procedure;

GOPTIONS RESET=ALL;
Title "Simple Scatterplot";
PROC GPLOT DATA=MYSASLIB.CARS;
     PLOT HWYMPG*ENGINESIZE;
RUN;
QUIT;

TITLE;FOOTNOTE;
