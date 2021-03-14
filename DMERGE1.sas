

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates MERGE;

***********************************************************
* NOTE: THIS PROGRAM REQUIRES THAT TO MAKE CORRECTIONS 
* TO IT BEFORE IT WILL PRODUCE CORRECT RESULTS.
***********************************************************;

DATA PRE;
INPUT CASE $ PRETREAT; 
DATALINES;
001 1.02 
002 2.10 
003 1.88 
004 2.20 
005 1.44 
011 1.55 
013 1.61 
014 2.61 
015 1.56 
016 0.99 
022 1.53
;
DATA POST;
INPUT CASE  $ POSTREAT; 
DATALINES;
001 1.94 
002 1.63 
003 2.73 
004 2.18 
005 1.82 
011 1.94 
013 2.25 
014 1.70 
015 1.78 
016 1.52 
022 1.97
; 
PROC SORT DATA=PRE; BY CASE;
PROC SORT DATA=POST; __________;   * Add the BY CASE statement here;
RUN;
* IN THE FOLLOWING LINES, CREATE A NEW DATA SET CALLED 
* DATA PREPOST;
* MERGE PRE POST;
DATA _________;              * Create new data set;
  MERGE ____   ______ ; BY CASE; 
  DIFF=POSTREAT - ___________; * Calculate DIFF in new data set;

TITLE 'Merge Example';
PROC PRINT DATA=PREPOST;
RUN;
