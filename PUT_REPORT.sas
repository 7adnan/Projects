*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PUT REPORT process;

DATA GRADES;
INPUT NAME $15. G1 G2 G3;
AVE=MEAN(of G1-G3);
DATALINES;
Alice, Adams   88.4 91 79
Jones, Steve   99 100 88.4
Zabar,Fred     78.6 87 88.4
;
RUN;

PROC MEANS DATA=GRADES NOPRINT;OUTPUT OUT=GMEAN;RUN;
* CAPTURE THE MEAN AND MAKE IT A MACRO VARIABLE;
DATA _NULL_;SET GMEAN;
IF _STAT_="MEAN" THEN CALL SYMPUT('CLASSMEAN',ROUND(AVE,.01));
RUN;

TITLE "Grade Report for Course 1234";
DATA _NULL;
SET GRADES END=EOF;
TABLEHEAD="SUMMARY OF GRADES";
FILE PRINT;
IF _N_= 1 then DO; * PUT HEADER;
	L=5+(60-LENGTH(TABLEHEAD))/2; * CENTER HEAD;
    PUT @L "SUMMARY OF GRADES";
	PUT @5 60*'=';
	PUT @5 "NAME" @20 "| TEST 1" @30 "| TEST 2 " 
        @40 "| TEST 3" @50 "| AVERAGE";
	PUT @5 60*'-';
END;

PUT @5 NAME @20 "|" G1 5.1 @30 "|" G1 5.1 
        @40 "|" G1 5.1 @50 "|" AVE 5.1;

IF EOF =1 then do; * PUT BOTTOM OF TABLE;
      PUT @5 60*'-';
      PUT @5 "CLASS AVERAGE " @; * HOLDS THE LINE FOR NEXT PUT;
      PUT @50 "| %TRIM(&CLASSMEAN) " ;
	  PUT @5 60*'=';
END;
RUN;


TITLE;FOOTNOTE;
