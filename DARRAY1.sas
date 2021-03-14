*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the ARRAY Statement;
TITLE "Example of using an ARRAY";
DATA A;
INPUT ONE TWO THREE FOUR;
ARRAY T(4) one two three four;
TSUM1=SUM(of one two three four);
TSUM2=SUM(of T(1) T(2) t(3) T(4));
TSUM3=SUM(of T(*));
DATALINES;
1 2 3 4
5 6 7 8
;
RUN;
proc print data=a;run;


TITLE;FOOTNOTE;
