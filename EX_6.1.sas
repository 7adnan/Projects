*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example is for end of chapter exercise 6.1;

DATA OWED;
INPUT ID $3. AMOUNTOWED DOLLAR9.;
DATALINES;
001 $3,209
002 $29
002 $34.95
003 2,012
003 312.45
003 34.23
004 2,312
004 $3.92
005 .98
;
RUN;
PROC TRANSPOSE DATA=OWED OUT=________ PREFIX=____;
    BY ___;
    VAR ___________;
RUN;
DATA SUMMARIZE;SET EXPANDED;
TOTAL=SUM(of AMT1-AMT3);
DROP _NAME_;
RUN;
PROC PRINT DATA=SUMMARIZE;
RUN;

