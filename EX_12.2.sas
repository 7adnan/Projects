*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example is for an exercise for Chapter 12;

PROC REG DATA="C:\SASDATA\CARS";
	MODEL CITYMPG=AUTOMATIC ENGINESIZE CYLINDERS HYBRID
    /SELECTION=BACKWARD AIC;
RUN;
QUIT;


TITLE;FOOTNOTE;
