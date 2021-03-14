*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the use of PROC TRANSPOSE;

DATA SUBJECTS;                                                         
INPUT LAB $ SUB1 $ SUB2 $ SUB3 $ SUB4 $;                                     
DATALINES;                                                             
BASELINE 12 21 13 14                                                 
TIME1 13 21 12 14                                                 
TIME2 15 31 23 23                                                 
TIME3 15 33 21 32                                                  
GENDER  M  F  F  M                                                  
;                                                                   
PROC TRANSPOSE DATA=SUBJECTS OUT=TRANSPOSED;  
  ID LAB; 
  VAR SUB1 SUB2 SUB3 SUB4;           
RUN;                                                                   
PROC PRINT DATA=TRANSPOSED;
RUN;


TITLE;FOOTNOTE;
