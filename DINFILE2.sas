*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This illustrates the INFILE statement options;

DATA MYDATA;
INFILE 'C:\SASDATA\EXAMPLE.CSV' DLM=',' FIRSTOBS=2	OBS=11;
INPUT GROUP $ AGE TIME1 TIME2 TIME3 Time4 SOCIO;
PROC PRINT DATA=MYDATA;
RUN;


TITLE;FOOTNOTE;
