*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates ODS;
* Note: If you have data in a folder other than C:\SASDATA you need to modify
        the INFILE statement;

DATA TEST; SET "C:\SASDATA\SOMEDATA";
* DEFINE WHERE HTML LISTING WILL GO;
TITLE 'ODS PDF Example';
ODS PDF FILE='C:\SASDATA\ODS.PDF' STYLE=STATISTICAL;
PROC MEANS MAXDEC=2; VAR AGE TIME1-TIME4;
RUN;
* CLOSE THE PDF OUTPUT;
ODS PDF CLOSE;
RUN;

TITLE;FOOTNOTE;
