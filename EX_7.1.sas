*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates SAS Macros;

DATA GRADES;
INPUT IDNO GRADE1 GRADE2 GRADE3 GRADE4 GRADE5;
ARRAY G(5) ; *FINISH THE STATEMENT;
* FIND LOWEST GRADE;
LOW=100;
DO ; * FINISH THE STATEMENT;
   if G(I)<LOW then LOW=G(I);
END;
TOTAL=; * FINISH THE STATEMENT;
AVERAGE=TOTAL/4;
DATALINES;
001 90 34 88 79 88
002 99 69 87 86 98
003 91 75 85 94 100
004 88 57 68 74 89
;
RUN;
PROC PRINT DATA=GRADES;RUN;
