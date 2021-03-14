*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This illustrates the INFILE statement options;

DATA TEST;
 INFILE "C:\SASDATA\DINFILEDAT.TXT" TRUNCOVER;
 INPUT LAST $1-21 FIRST $ 22-30 ID $ 31-36 ROLE $ 37-44;
RUN;
PROC PRINT DATA=TEST;RUN;


TITLE;FOOTNOTE;
