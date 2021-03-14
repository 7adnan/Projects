
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates FINANCIAL FUNCTIONS;



DATA LOAN;
FORMAT VALUE DOLLAR12.
       INTRATE1-INTRATE3 4.2
	   NUMBER 4.;
INPUT VALUE INTRATE1-INTRATE3 NUMBER;
ARRAY INT(3) INTRATE1-INTRATE3;
ARRAY PAY(3);
DO I=1 to 3;
   PAY(I)= MORT(VALUE,.,INT(I)/12,NUMBER); 
END;
LABEL MORT="Mortgage Payment";
LABEL INTRATE1="Int. Rate 1 ";
LABEL INTRATE2="Int. Rate 2 ";
LABEL INTRATE3="Int. Rate 3 ";
LABEL PAYMENT= "Amount of Payment";
LABEL VALUE="Loan Amount";
LABEL NUMBER="Num. Payments";
DROP I;
DATALINES;
100000 .05 .04 .03 360
100000 .05 .04 .03 180
150000 .05 .04 .03 360
150000 .05 .04 .03 180
;
RUN;
PROC PRINT LABEL DATA=LOAN ;
RUN;


TITLE;FOOTNOTE;
