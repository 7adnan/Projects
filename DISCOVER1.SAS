*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates fixing the Messy Data File;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

PROC FREQ data=MYSASLIB.cleaned; 
TABLES  MARRIED SINGLE TOP_REASON RACE GENDER HOW_ARRIVED;
run;


TITLE;FOOTNOTE;
