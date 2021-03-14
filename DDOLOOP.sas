
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the use of a DO LOOP;

TITLE "Illustrates the use of DO LOOPS and ARRAYS";
DATA CLINIC;
INPUT @1 ID $3. @4 VISIT1 4. @7 VISIT2 4.
      @10 VISIT3 4. @13 VISIT4 4. @16 VISIT5 4.;
ARRAY TIME (5) VISIT1-VISIT5;
LAST=VISIT1;
DO I=1 TO 5;
   IF TIME(I) > 0 THEN LAST=TIME(I);
END;
DROP I;
DATALINES;
001 34 54 34 54 65
002 23 43 54 34
003 23 43 .  43
004 45 55 21 43 23
005 54
;
PROC PRINT DATA=CLINIC; RUN;

TITLE;FOOTNOTE;
