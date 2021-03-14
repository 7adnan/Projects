*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates fixing the Messy Data File;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

PROC FREQ data=MYSASLIB.cleaned NOPRINT;
     TABLES SUBJECT / OUT=FREQCNT;
RUN;
PROC PRINT DATA=FREQCNT;
WHERE COUNT>1;
RUN;

DATA TMP;SET MYSASLIB.cleaned;
tmp=subject*1;
t=CAT("|",TRIM(SUBJEcT),"|");
RUN;


TITLE;FOOTNOTE;
