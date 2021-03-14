*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the use of FORMATS;

PROC FORMAT;
     VALUE FMTMARRIED 0="No"
	    	          1="Yes";
	 VALUE $FMTGENDER "F" = "Female"
 					  "M" = "Male";
RUN;
PROC PRINT DATA="C:\SASDATA\SURVEY";
     VAR SUBJECT MARRIED GENDER;
     FORMAT MARRIED FMTMARRIED. GENDER $FMTGENDER.;
RUN;

TITLE;FOOTNOTE;
