*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC GPLOT procedure;

GOPTIONS RESET=ALL;
AXIS1 ORDER=(4 TO 12 BY 1)
      LABEL=('Number of Cylinders' FONT=SWISS HEIGHT=4)
	  OFFSET=(5);
AXIS2 ORDER=(0 TO 50 BY 5) 
      LABEL=(A=90 'Highway Miles Per Gallon' FONT=SWISS HEIGHT=4)
	  OFFSET=(5);
PROC GPLOT DATA=MYSASLIB.CARS;
     PLOT HWYMPG*CYLINDERS/HAXIS=AXIS1 VAXIS=AXIS2;
     SYMBOL1 I=STD1JT H=1 LINE=1 VALUE=NONE;
RUN;
QUIT;

TITLE;FOOTNOTE;
