*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* NOTE: You can also use DATA=MYSASLIB.SOMEDATA
* if the MYSASLIB library has been previously defined;

* This example illustrates the use of the SPLIT Statement;
OPTIONS FIRSTOBS=11 OBS=20;
PROC PRINT LABEL DATA="C:\SASDATA\SOMEDATA";
RUN;
OPTIONS FIRSTOBS=1 OBS=MAX; 
* NOTE: It is important to reset FIRSTOBS and OBS, otherwise any
following analyses may not use all data in a data set;

TITLE;FOOTNOTE;

