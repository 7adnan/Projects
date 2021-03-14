*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PROC FREQ;
* You could use MYSASLIB.SURVEY in the DATA= Statement;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

PROC FORMAT; 
VALUE $FMTRACE "AA"="African American" 
               "H"="Hispanic"
               "OTH"="Other"
				"C"="White";
RUN;

PROC FREQ ORDER=FORMATTED DATA="C:\SASDATA\SURVEY"; 
     TABLES RACE;
     TITLE 'Example of PROC FREQ using OPTION=Formatted';
     FORMAT RACE $FMTRACE.;
RUN;


TITLE;FOOTNOTE;
