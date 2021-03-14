*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates FACTOR ANALYSIS;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

PROC FACTOR SIMPLE CORR DATA=MYSASLIB.OLYMPIC
METHOD=PRINCIPAL MSA
   PRIORS=SMC 
   ROTATE=VARIMAX
   OUTSTAT=FACT_ALL 
   PLOTS=SCREE;
   VAR RUN100 LONGJUMP SHOTPUT HIGHJUMP RUN400 
       HURDLES DISCUS POLEVAULT JAVELIN RUN1500S;
RUN;


TITLE;FOOTNOTE;
