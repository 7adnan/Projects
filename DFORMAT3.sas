*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the use of FORMATS;

*NOTE: The LIBNAME statement may be unnecessary if you 
       have already defined a MYSASLIB library;

LIBNAME MYSASLIB "C:\SASDATA";
PROC FORMAT LIBRARY = MYSASLIB.CAT1; *CREATE A FORMAT CATALOG;
     VALUE FMTMARRIED 0="No"
	    	          1="Yes";
     VALUE $FMTGENDER "F" = "Female"
 		              "M" = "Male";
RUN;


TITLE;FOOTNOTE;
