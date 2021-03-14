
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the ZIP FUNCTIONS;



DATA ZIP;
INPUT BEGIN $ END $;
HOSPITAL=ZIPCITY(BEGIN);
SUBJECT=ZIPCITY(END);
DISTANCE=ZIPCITYDISTANCE(BEGIN, END);
datalines;
75275 75201
75275 10001 
75275 96801
75275 96951 
;
PROC PRINT;
RUN;


TITLE;FOOTNOTE;
