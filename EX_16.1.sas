*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC LOSISTIC procedure;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

PROC LOGISTIC DATA=mysaslib.boxstore;
CLASS GENDER FREEBIE RACE SOLD;
MODEL SOLD=GENDER FREEBIE RACE AGE PRICE100
	   / EXPB
	     SELECTION=BACKWARD;
TITLE 'What helps sales?';
RUN;
QUIT;


TITLE;FOOTNOTE;


