*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example reads data using MULTILINE data entry;

DATA MYDATA;
INPUT ID $ SEX $ AGE WT/ SBP DBP BLDCHL/ OBS1 OBS2 OBS3;
DATALINES;
10011 M 15 115  
   120 80 254
   15 65 102
10012 F 25 180
   130 70 240 
   34 120 132
10013 M 89 170
   140 100	279
   19 89 111 
;
PROC PRINT DATA=MYDATA;
RUN;

TITLE;FOOTNOTE;
