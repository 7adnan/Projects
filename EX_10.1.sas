*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This an exercise file for CHapter 10, Goodness-of-Fit;
;
DATA FOOD;
INPUT @1 CATEGORY $13. @14 NUMBER 3.;
DATALINES;
Mexican      66
Home cooking 25
Italian      33
Chinese      38
;
RUN;




TITLE;FOOTNOTE;
