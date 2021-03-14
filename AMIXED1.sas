*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC MIXED procedure;

DATA HEIGHTS; 
INPUT FAMILY GENDER$ HEIGHT @@; 
DATALINES; 
1 F 67   1 F 66   1 F 64   1 M 71   1 M 72   2 F 63 
2 F 63   2 F 67   2 M 69   2 M 68   2 M 70   3 F 63 
3 M 64   4 F 67   4 F 66   4 M 67   4 M 67   4 M 69 
   ;
RUN;
PROC MEANS MAXDEC=2 MEAN DATA=HEIGHTS;
  CLASS FAMILY GENDER;
  VAR HEIGHT; 
PROC MIXED; 
     CLASS FAMILY GENDER; 
     MODEL HEIGHT = GENDER;
	 RANDOM FAMILY FAMILY*GENDER; 
RUN;

TITLE;FOOTNOTE;
