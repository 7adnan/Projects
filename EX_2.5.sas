*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example is for end of chapter exercise 2.5;
DATA TRAUMA2;
INFILE 'filename' DLM=  FIRSTOBS=  ; * Finish the INFILE statement;
INPUT SUBJECT $ AGE  GENDER $ PLACE $ STATUS $; 
Title "Exercise 2.5 – your name"; 
PROC MEANS; 
RUN;
