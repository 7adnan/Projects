*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the use of PROC TRANSPOSE;
DATA LEMON;
INPUT DAY SALES;
IF _N_=1 then DO; TOTAL=0; END;
RETAIN TOTAL MAX;
TOTAL=SALES+TOTAL;
IF SALES>MAX then MAX=SALES;
DATALINES;
1 23.40
2 32.50
3 19.80
4 55.55
5 34.90
6 65.30
7 33.40
;
RUN;
PROC PRINT DATA=LEMON;RUN;


TITLE;FOOTNOTE;
