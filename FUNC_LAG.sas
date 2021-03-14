
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the LAG FUNCTIONS;



*Average Gold Price (London Fix, in Jan);
DATA PRICE; 
INPUT YEAR PRICE;
 LAG_PRICE = LAG(PRICE); 
 DIFF_PRICE = PRICE - LAG_PRICE; 
 PCT_INCREASE = (DIFF_PRICE/LAG_PRICE)*100; 
DATALINES;
2005 424.15
2006 549.86
2007 631.17
2008 889.60
2009 858.69
2010 1117.96
2011 1356.40
2012 1656.12
2013 1670.95
2014 1244.80
; 
RUN;
PROC PRINT;RUN;

