*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the use of the SORT Command;

DATA MYDATA;
INPUT GROUP RECTIME;
DATALINES;
1    4.2
2    3.6
2    3.1
1    2.1
1    2.8
2    1.5
1    1.8
;
PROC SORT DATA=MYDATA OUT=S1; BY RECTIME; 
Title 'Sorting Example - Ascending';
PROC PRINT DATA=S1;
RUN;

* PUT NEW CODE HERE;

/* NOTE: The syntax for using the DESCENDING option is:

PROC SORT DATA=MYDATA OUT=S2; BY DESCENDING RECTIME;
PROC PRINT DATA=S2;
RUN;
*/
TITLE;FOOTNOTE;
