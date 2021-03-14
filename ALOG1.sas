*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC LOSISTIC procedure;
* You could use MYSASLIB.ACCIDENTS in the DATA= Statement;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

PROC LOGISTIC DATA="C:\SASDATA\ACCIDENTS" DESCENDING;                                                                                                               
   MODEL DEAD=PENETRATE / RISKLIMITS;                                                                                       
   TITLE 'Trauma Data Model Death by Penetration Wound ';                                                                                 
RUN;      

TITLE;FOOTNOTE;

