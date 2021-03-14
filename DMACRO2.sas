*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates SAS Macros;

* Note: If you have data in a folder other than C:\SASDATA you need to modify
        the INFILE statement;


%LET PATH=C:\SASDATA\;
%LET DSN=SOMEDATA;
%LET CLASS=GP;
%LET SELECTVAR=AGE TIME1-TIME4;
TITLE "Descriptive Statistics";
PROC MEANS DATA="&PATH&DSN" MAXDEC=2;
	CLASS &CLASS;
	VAR &SELECTVAR;
RUN;


TITLE;FOOTNOTE;
