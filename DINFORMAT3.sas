*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the INFORMAT statement;

DATA PEOPLE;
   INFORMAT LASTNAME FIRSTNAME $12. AGE 3. SCORE 4.2;
   INPUT LASTNAME FIRSTNAME AGE SCORE;
DATALINES;
Lincoln    George      35 3.45
Ryan       Lacy        33 5.5
;
PROC PRINT DATA=PEOPLE; 
RUN;

