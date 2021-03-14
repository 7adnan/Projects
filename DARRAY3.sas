*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the use of an Array and Do Loop;
* You could use MYSASLIB.DC_CRIME78_07 in the DATA= Statement;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;


TITLE "Illustrates an Array and Do Loop";
DATA CRIME;SET "C:\SASDATA\DC_CRIME78_07";
FORMAT TOTAL 6.;
ARRAY INCIDENTS(*) VIOLENT--CARTHEFT;
DO I= LBOUND(INCIDENTS) to HBOUND(INCIDENTS);
      TOTAL=SUM(of TOTAL,INCIDENTS(i));
END;
DROP I;
RUN;
PROC PRINT DATA=CRIME;
VAR YEAR POP--CARTHEFT TOTAL;
RUN;


TITLE;FOOTNOTE;
