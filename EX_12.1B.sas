*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example is for an exercise for Chapter 12;

* Note: If you have data in a folder other than C:\SASDATA you need to modify
        the INFILE statement;

PROC REG DATA="C:\SASDATA\DC_CRIME78_07";
	MODEL ASSAULT=YEAR;
RUN;
QUIT;


TITLE;FOOTNOTE;
