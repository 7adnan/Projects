*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC FREQ procedure;
* You could use MYSASLIB.SECURITY in the DATA= Statement;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

PROC FREQ data="C:\SASDATA\SECURITY";
   TABLE  RATER1*RATER2 / AGREE ;TEST WTKAP;
   TITLE 'Security Data';
RUN;

