*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates SAS Macros;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

%MACRO CARINFO(WHICHPLACE);
DATA _NULL_;
CALL SYMPUT('TIMEVAR', CATT('&WHICHPLACE.','MPG' ));
RUN;

TITLE "THE VALUE OF THE MACRO VARIABLE TIMEVAR IS &TIMEVAR ";

PROC MEANS MAXDEC=2 DATA=MYSASLIB.CARS;
VAR &TIMEVAR;
RUN;

%MEND CARINFO;

%CARINFO(CITY);


TITLE;FOOTNOTE;
