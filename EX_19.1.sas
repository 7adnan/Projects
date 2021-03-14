*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example is an exercise for Chapter 19;
TITLE "Exercise 19.1";

PROC TABULATE DATA=MYSASLIB.CARS;
  CLASS BRAND SUV ;
  VAR CITYMPG;
  TABLE BRAND, SUV*MEAN*CITYMPG;
RUN;

TITLE;FOOTNOTE;
