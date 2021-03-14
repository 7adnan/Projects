*******************************************************
NOTES and Code files for APPENDIX B;

**Ways to name a data set—can be used whenever 
a dataset is named;
DATA SOMEDATA;    * create working/temporary data set;
DATA "C:\SASDATA\SOMEDATA"; *create permanent data set          in specified location;
LIBNAME MYSASLIB "C:\SASDATA"; * create a temporary SAS library;
DATA MYSASLIB.SOMEDATA;    * create permanent data set in MYSASLIB library;


**Versions of the INPUT statement;
* freeform input;
INPUT ID $ GENDER $ SBP DBP WEIGHT;
* column numbers specify location of data;
INPUT ID 1-4 SEX $ 5-5 AGE 6-9;
* specify beginning column, name, informat.
INPUT @1 ID 4. @5 SEX $1. @10 BDATE DATE9.;


**Read date using format specification (see format table, Appendix A);
DATA MYDATA;
INPUT @1 FNAME $11. @12 LNAME $12. @24 BDATE DATE9.;
DATALINES;
Bill       Smith       08JAN1952
;
RUN;

**Ways to specify source of data or enter data set;
DATALINES;        * data are listed in the code following this statement;
INFILE filename;   * data are in an ASCII file on disk;
SET dataset;      * data are in a SAS data file;
PROC IMPORT;      * imports data from a non-SAS filetype;


**Common ways to manipulate data within the DATA step (Chapter 4-7);
* Conditionally specify missing value;
* NEEDS TO BE IN A DATA PARAGRAPH;
IF AGE LE 0 then AGE = .;
IF SBP GE 140 THEN HIGHBP=1; ELSE HIGHBP=0; * If-Then-Else;
IF GENDER="MALE";          * Subsetting if statement;

** Define label for a variable name;
* NEEDS TO BE IN A DATA PARAGRAPH (USUALLY);
LABEL ID="Identification";  
AREA=LENGTH * WIDTH;       * Calculate a new variable;


**Titles and footnotes (Chapter 5);
TITLE 'First title line';
TITLE2 'Up to 9 title lines';
FOOTNOTE 'First footnote line';
FOOTNOTE9 'Up to 9 footnote lines';


**ODS—Output Delivery System (Chapter 8);
ODS TRACE ON;
ODS GRAPHICS ON;
ODS LISTING; *standard output;
ODS HTML [BODY='FILENAME.HTML'];
ODS PDF [FILE='FILENAME.PDF'];
ODS RTF [FILE='FILENAME.RTF'];
ODS PS [FILE='FILENAME.PS'];

 ** PROC MEANS * PUT PROCS HERE;
ODS TYPE CLOSE;
ODS TRACE OFF;
ODS GRAPHICS OFF;

**PROC FORMAT—Used to define custom formats for values (Chapter 4);
PROC FORMAT;
VALUE $fmtsex 'F' = 'Female'
              'M' = 'Male';
VALUE  fmtyn  1='Yes'
              2='No';
PROC PRINT;     * apply a format to variables;

FORMAT SEX $fmtsex.
       QUEST fmtyn.;
RUN;


**PROC SORT—Sort a data set (Chapter 4);
PROC SORT DATA=dataset;
   BY AGE SBP descending;
RUN;

**PROC PRINT—Create a listing of the data (Chapter 5);
PROC PRINT DATA=dataset;
   VAR varlist;
   SUM sumvar;
RUN;


*PROC MEANS—Used to calculate statistics for quantitative data (Chapter 9);
PROC MEANS N MEAN MEDIAN MAXDEC=2 DATA=dataset;
  VAR varlist;
RUN;
        
PROC MEANS DATA=dataset;    * Means by group;
  CLASS groupvar;
  VAR varlist);
RUN;


**PROC UNIVARIATE—Calculate detailed statistics on a variable (Chapter 9);
PROC UNIVARIATE DATA=dataset NORMAL PLOT;
   VAR SBP;
   HISTOGRAM SBP/NORMAL;
RUN;

**PROC FREQ—Frequencies and cross-tabulations (Chapter 10);
PROC FREQ DATA=dataset; * basic frequency table;
   TABLES varlist;
RUN;
        
PROC FREQ DATA=dataset;
   TABLES var1*var2/CHISQ; * crosstabulation with                              chi-square;
RUN;

**PROC TTEST—Comparing means (Chapter 11);
PROC TTEST DATA=dataset H0=30; * Single sample t-test;
   VAR varname;
RUN;
        
PROC TTEST DATA=dataset;     * independent group                                t-test;
   CLASS groupvar;
   VAR varname;
RUN;
        
PROC TTEST DATA=dataset;      * paired t-test;
   PAIRED WBEFORE*WAFTER;
RUN;

**PROC ANOVA, GLM, and MIXED—Comparing more than three means (Chapters 13 & 14);
PROC ANOVA DATA=dataset;    * one-way independent group;
   CLASS groupvar;
   MODEL depvar= groupvar;
   MEANS groupvar /TUKEY;       
RUN;
        
PROC GLM;            * two fixed-factors;
  CLASS factor1var factor2var;
  MODEL RESPONSE= factor1var factor2var factor1var*factor2var;
RUN;
        
PROC MIXED;         * two-factor, one random;
  CLASS randomfactor fixedfactor;
  MODEL depvar = fixedfactor;
  RANDOM randomfactor randomfactor*fixedfactor;
RUN;


**PROC CORR—Correlations between pairs of variables (Chapter 12);
PROC CORR DATA=SOMEDATA Spearman Pearson;    
   VAR AGE TIME1-TIME4;
RUN;


**PROC REG—Linear regression analysis (Chapter 12);
PROC REG DATA=dataset;      * simple linear regression;
     MODEL dependentvar = independentvar/R;                              * examine residuals;
RUN;
        
PROC REG DATA=dataset;    * multiple linear regresson;
     MODEL dependentvar = ind1 ind2 ...etc
     /SELECTION=STEPWISE
      SLENTRY=0.05
      SLSTAY=0.05;   
RUN;


**PROC NPAR1WAY -- Nonparametric comparisons (Chapter 15);
PROC NPAR1WAY DATA=dataset;
    CLASS GROUP;        * compare independent groups;
    VAR SALARY;
RUN;

**PROC LOGISTIC -- Logistic regression (Chapter 16);
PROC LOGISTIC DATA=dataset;
CLASS variables;
MODEL dependentvar = independentvar(s)
/ EXPB
  SELECTION=SETPWISE
  SLENTRY=0.05
  SLSTAY=0.1
  RISKLIMITS
  CTABLE   
  OUTROC=ROC1;
RUN;

**PROC FACTOR -- Factor Analysis (Chapter 17);
PROC FACTOR DATA=dataset;
     METHOD=P PRIORS=SMC 
     ROTATE=PROMAX SCREE CORR RES;
RUN;

**PROC GPLOT -- Scatterplot with regression line (Chapter 18);
GOPTIONS RESET=ALL;
SYMBOL1 V=STAR I=RL;
PROC GPLOT DATA=dataset;
  PLOT yvar*xvar;
RUN;
QUIT;



**PROC GCHART -- Barchart (Chapter 18);
PROC GCHART DATA=dataset;
  HBAR varname;
RUN;

**PROC BOXPLOT -- Boxplot (Chapter 18);
PROC SORT DATA=dataset; BY groupvar;
PROC BOXPLOT DATA=dataset;
     PLOT varname*groupvar;
RUN;

**PROC TABULATE – Create Tables (Chapter 19);

PROC TABULATE DATA=dataset ORDER=FORMATTED;
  CLASS TYPE AREA SITE;
  VAR SALES_K;
  TABLE(AREA="" ALL),(SITE="" ALL)*TYPE=""
        *MEAN=""*SALES_K=""*F=DOLLAR6.2;
  FORMAT AREA $FMTCOMPASS.;
RUN;
;

**PROC REPORT – Create Reports (Chapter 19);

PROC REPORT DATA=MYSASLIB.CARS NOFS;
  COLUMN BRAND CITYMPG,SUV HWYMPG,SUV;
  DEFINE BRAND/ORDER;
  DEFINE BRAND/GROUP;
  DEFINE CITYMPG/ANALYSIS MEAN FORMAT=6.1;
  DEFINE HWYMPG/ANALYSIS MEAN FORMAT=6.1;
  DEFINE SUV/ ACROSS 'BY SUV'; 
  FORMAT SUV FMTSUV.;
RUN;

**PUT STATEMENTS – Create Reports (Chapter 19);
DATA _NULL; SET GRADES END=EOF;
TABLEHEAD="SUMMARY OF GRADES";
FILE PRINT;
IF _N_= 1 then DO; * PUT HEADER;
	L=5+(60-LENGTH(TABLEHEAD))/2; * CENTER HEAD;
      PUT @L TABLEHEAD;
	PUT @5 60*'=';
	PUT @5 "NAME" @20 "| TEST 1" @30 "| TEST 2 " 
          @40 "| TEST 3" @50 "| AVERAGE";
	PUT @5 60*'-';
END;

PUT @5 NAME @20 "|" G1 5.1 @30 "|" G2 5.1 
            @40 "|" G3 5.1 @50 "|" AVE 5.1;

IF EOF =1 then do; * PUT BOTTOM OF TABLE;
      PUT @5 60*'-';
      PUT @5 "CLASS AVERAGE " @; * HOLDS LINE FOR NEXT PUT;
      PUT @50 "| %TRIM(&CLASSMEAN) " ;
	PUT @5 60*'=';
END;
RUN;

 


** SampleProgram.SAS;

***** Sample SAS Program Illustrates components of the
      SAS DATA Step;
***** PROC FORMAT defines formats for categorical variables;
PROC FORMAT;
VALUE $fmtgender 'F' = 'Female'  'M' = 'Male';
VALUE  fmtversion  1='Test Version 1' 2='Test Version 2'; 
VALUE  fmtyn      1='Yes' 0='No';
RUN;
* Define up to 9 titles and footnotes;
TITLE 'Example SAS Program';
TITLE2 'From SAS Essentials by Elliott and Woodward';
FOOTNOTE 'Uses the SURVEY data Set';
FOOTNOTE3 'Illustrates typical SAS DATA statements';
* Begin a data set by reading a current SAS data set;
DATA NEW; SET MYSASLIB.SAMPLE;
****** apply formats to several variables;
FORMAT GENDER $fmtgender. VERSION  fmtversion. SATISFIED MARRIED FMTYN.; 
FORMAT SCHOOLING $14.;
****** Create a new variable by calculation;
IF SATISFACTION GT 80 then SATISFIED=1; ELSE SATISFIED=0;
****** Create a new variable using IN statement;
IF ARRIVE IN("BUS" "CAR") then HOW="Arrive by Vehicle"; else HOW='Arrived by Walking';
****** define labels;
LABEL  GENDER="Gender"
       MARRIED="Married"
       SATISFIED="Satisfied with Service"
       HOW="How Arrived at Clinic?"
       SCHOOLING="How Much School"
       AGE="Age in 2016";
****** set missing values;
IF TEMP GT 110 then TEMP=.;
IF GENDER="X" then GENDER="";
****** Use a subsetting IF to limit records in the dataset;
IF STAYMINUTES GE 20;
****** Recode a value using SELECT;
SELECT;
   WHEN (EDU LT 12 and EDU GT 5)  SCHOOLING="Less than 12";
   WHEN (EDU EQ 12)  SCHOOLING="High School";
   OTHERWISE SCHOOLING="Some College";
END;
****** drop (or keep) certain variables;
DROP SATISFACTION EDU;
RUN;

PROC PRINT LABEL DATA=NEW;
VAR 	GENDER AGE MARRIED HOW SATISFIED SCHOOLING;
RUN;

PROC MEANS MAXDEC=2 DATA=NEW;
CLASS SCHOOLING;
VAR TEMP STAYMINUTES;
RUN;

PROC FREQ DATA=NEW;
TABLES SCHOOLING*HOW/CHISQ NOPERCENT NOCOL;
RUN;
