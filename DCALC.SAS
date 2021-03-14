*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates calculating new variables.;
DATA ROOMSIZE;
INPUT ROOM $ W L;
* The next line calculates a new variable, AREA;
AREA=W*L; 
Label L="Length" W="Width" AREA="Sq. Feet";
DATALINES;
LIVING   14 22
DINING   14 12
BREAKFAST 10 12
KITCHEN 12 16
BEDROOM1 18 12
BEDROOM2 12 14
BEDROOM3 13 16
BATH1	  8 12
BATH2	  7 10
BATH3     6 8
GARAGE 23 24
;
RUN;
PROC PRINT Label; SUM AREA;
RUN;

TITLE;FOOTNOTE;



