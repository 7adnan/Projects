*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates FACTOR ANALYSIS;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;


PROC FACTOR DATA=MYSASLIB.INTEL SIMPLE CORR SCORE
METHOD=PRINCIPAL
 ROTATE=VARIMAX
 PRIORS=SMC
 OUT=FS
 NFACTOR=2
 PLOTS=SCREE;
RUN;



TITLE;FOOTNOTE;

