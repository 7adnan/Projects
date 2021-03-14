*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates SAS Macros;

* Note: If you have data in a folder other than C:\SASDATA you need to modify
        the INFILE statement;

%LET DNAME=C:\SASDATA\SUBJECTS;
%LET VARIABLES = AGE TIME_EXPOSED;
PROC MEANS DATA="&DNAME";
VAR &VARIABLES;
RUN;


TITLE;FOOTNOTE;
