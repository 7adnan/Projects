*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates GCHART and ODS;
TITLE "Bar Chart";
PROC GCHART DATA=MYSASLIB.SOMEDATA;
      HBAR GP/ DISCRETE;
RUN; QUIT;

