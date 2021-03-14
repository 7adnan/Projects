*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC GPLOT procedure;

GOPTIONS RESET=ALL;
AXIS1 C=RED ORDER=(0 TO 80 BY 5) 
      LABEL=('City Miles Per Gallon' FONT=SWISS)
	  OFFSET=(5) WIDTH=2 VALUE=(H=2);
AXIS2 C=GREEN ORDER=(0 TO 80 BY 5) 
      LABEL=(A=90 'Highway Miles Per Gallon' FONT=SWISS)
	  OFFSET=(5) WIDTH=4 VALUE=(H=1);
TITLE "Enhanced Scatterplot";

PROC GPLOT DATA=MYSASLIB.CARS;
     PLOT HWYMPG*CITYMPG/HAXIS=AXIS1 VAXIS=AXIS2 NOFRAME;
	 SYMBOL1 V=DOT I=RL C=PURPLE L=2;
RUN;
QUIT;


TITLE;FOOTNOTE;
