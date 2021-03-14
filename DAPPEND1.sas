*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates appending data sets;

DATA OLD1;
INPUT SUBJ $ AGE YRS_SMOKE;
datalines;
001 34 12
003 44 14
004 55 35
006 21 3
;
DATA OLD2;
INPUT SUBJ $ AGE YRS_SMOKE;
datalines;
011 33 11
012 25 19
023 65 45
032 71 55
;
RUN;
* YOU MUST ADD ADDITIONAL LINES TO PERFORM THE APPEND;



TITLE;FOOTNOTE;
