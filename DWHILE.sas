*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the DO WHILE Statement;

DATA TMP;
N=0;
SQUARESUM=0;
DO WHILE(N<5);
  SQUARESUM=SQUARESUM+N**2; OUTPUT;
  N+1;
END;
RUN;
PROC PRINT DATA=TMP;
RUN;


TITLE;FOOTNOTE;
