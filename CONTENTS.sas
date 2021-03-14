*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates how to import a CSV file;

PROC DATASETS; 
CONTENTS DATA= 'C:\SASDATA\SOMEDATA'; 
RUN;

QUIT; * Sometimes required to cause a SAS process to stop;

TITLE;FOOTNOTE;
