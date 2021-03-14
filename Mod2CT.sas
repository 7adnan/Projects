data salesProd;
	Infile '/folders/myfolders/salesmod2.csv' dlm=',' firstobs=2;
	input Obs
salesProd1
salesProd2
salesProd3
salesProd4;
run;

PROC CONTENTS data=salesprod;
RUN;

PROC PRINT;

PROC MEANS MAXDEC=2; VAR salesProd1 salesProd2 salesProd3 salesProd4;
RUN;

PROC UNIVARIATE NORMAL PLOT DATA=salesProd; VAR salesProd1;
TITLE 'Product 1 Sales';
RUN;


PROC UNIVARIATE NORMAL PLOT DATA=salesProd; VAR salesProd2;
TITLE 'Product 2 Sales';
RUN;

PROC UNIVARIATE NORMAL PLOT DATA=salesProd; VAR salesProd3;
TITLE 'Product 3 Sales';
RUN;

PROC UNIVARIATE NORMAL PLOT DATA=salesProd; VAR salesProd4;
TITLE 'Product 4 Sales';
RUN;


PROC UNIVARIATE DATA=salesProd NOPRINT; 
VAR salesProd1 salesProd2 salesProd3 salesProd4;
HISTOGRAM /NORMAL;
RUN;

PROC TTEST H0=25 SIDES=U ALPHA=0.05; 
VAR salesProd1;
RUN;

PROC REG DATA=salesProd;
MODEL salesProd2 = salesProd4;
RUN;

