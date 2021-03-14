*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates DROP and KEEP;
* IF your data is stored in a different location, chance the C:\SASDATA reference;

DATA MYDATA;
INFILE 'C:\SASDATA\EXAMPLE.CSV' DLM=',' FIRSTOBS=2 OBS=26;
INPUT  GROUP $ AGE TIME1 TIME2 TIME3 TIME4 SOCIO;
KEEP AGE TIME1 SOCIO;
;
PROC PRINT; 
RUN;


TITLE;FOOTNOTE;
