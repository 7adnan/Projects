*******************************************************
Code files for Chapter 10;

*AFREQ1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PROC FREQ;
* You could use MYSASLIB.SOMEDATA in the DATA= Statement;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

PROC FREQ DATA='C:\SASDATA\SOMEDATA'; 
     TABLES STATUS;
TITLE 'Simple Example of PROC FREQ';
RUN;
PROC FREQ DATA='C:\SASDATA\SOMEDATA'  ORDER=FREQ; 
     TABLES STATUS;
TITLE 'Example of PROC FREQ Using ORDER= Option';
RUN;

TITLE;FOOTNOTE;

*AFREQ2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PROC FREQ;
* You could use MYSASLIB.SURVEY in the DATA= Statement;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

PROC FORMAT; 
VALUE $FMTRACE "AA"="African American" 
               "H"="Hispanic"
               "OTH"="Other"
				"C"="White";
RUN;

PROC FREQ ORDER=FORMATTED DATA="C:\SASDATA\SURVEY"; 
     TABLES RACE;
     TITLE 'Example of PROC FREQ using OPTION=Formatted';
     FORMAT RACE $FMTRACE.;
RUN;


TITLE;FOOTNOTE;

*AFREQ3.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC FREQ procedure;

DATA COINS;
     INPUT @1 CATEGORY $9. @11 NUMBER 3.;
DATALINES; 
CENTS     152
CENTS     100
NICKELS   49
DIMES     59
QUARTERS  21
HALF      44
DOLLARS   21
;
PROC FREQ; WEIGHT NUMBER; 
  TITLE 'Reading Summarized Count data';
  TABLES CATEGORY;
RUN;

*AFREQ4.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC FREQ procedure;

DATA GENE;
     INPUT @1 COLORTYPE $13. @15 NUMBER 3.;
DATALINES; 
YELLOWSMOOTH  315
YELLOWWRINKLE 108
GREENSMOOTH   101
GREENWRINKLE   32
;
* HYPOTHESIZING A 9:3:3:1 RATIO;
PROC FREQ ORDER=DATA ; WEIGHT NUMBER; 
  TITLE 'GOODNESS OF FIT ANALYSIS';
  TABLES COLORTYPE / NOCUM CHISQ 
         TESTP=(0.5625 0.1875 0.1875 0.0625);
RUN;


TITLE;FOOTNOTE;

*AFREQ5.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC FREQ procedure;

DATA DRINKERS;
INPUT CRIME $ DRINKER COUNT;
DATALINES;
Arson		1	50
Arson		0	43
Rape		1	88
Rape		0	62
Violence	1	155
Violence	0	110
Stealing	1	379
Stealing	0	300
Coining		1	18
Coining		0	14
Fraud		1	63
Fraud		0	144
;

PROC FREQ DATA=DRINKERS;WEIGHT COUNT;
     TABLES CRIME*DRINKER/CHISQ;  
TITLE 'Chi Square Analysis of a Contingency Table';
RUN;


TITLE;FOOTNOTE;

*AFREQ6.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC FREQ procedure;
* You could use MYSASLIB.RASH in the DATA= Statement;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

PROC FREQ DATA="C:\SASDATA\RASH";
   TABLES CLEANER*RASH /CHISQ;
   TITLE 'CHI-SQUARE ANALYSIS FOR A 2X2 TABLE';
RUN;


TITLE; FOOTNOTE;

*AFREQ7.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC FREQ procedure;

DATA LEARN;
INPUT CLASS $ LEC $ COUNT;
DATALINES;
S Y 4
S N 11
F Y 5
F N 3
;
PROC FREQ DATA=LEARN;WEIGHT COUNT;
     TABLES CLASS*LEC/CHISQ ;  
TITLE 'Chi Square Analysis of a Contingency Table';
RUN;

TITLE;FOOTNOTE;

*AKAPPA1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC FREQ procedure;

DATA KAPPA;
INPUT RATER1 RATER2 WT;
DATALINES;
1	1	75
1	2	1
1	3	4
2	1	5
2	2	4
2	3	1
3	1	0
3	2	0
3	3	10
;

PROC FREQ ;
   WEIGHT WT;
   TABLE  RATER1*RATER2 / AGREE ; TEST KAPPA;
   TITLE 'KAPPA EXAMPLE FROM FLEISS';
RUN;

TITLE;FOOTNOTE;

*AKAPPA2.SAS;

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

*AEX_10.1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This an exercise file for CHapter 10, Goodness-of-Fit;
;
DATA FOOD;
INPUT @1 CATEGORY $13. @14 NUMBER 3.;
DATALINES;
Mexican      66
Home cooking 25
Italian      33
Chinese      38
;
RUN;




TITLE;FOOTNOTE;












