*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example is for end of chapter exercise 2.5;
DATA BPDATA;
INFILE 'inputfilename'; * Finish the INFILE statement;
INPUT ID 1 SBP 2-4 ;    * Finish the input statement;
Title "Exercise 2.4 - your name";
PROC MEANS;
RUN;
