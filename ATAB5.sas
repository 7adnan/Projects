*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates PROC tabulate;
PROC FORMAT;
VALUE $FMTCOMPASS "N"="1.North" "S"="2.South" "E"="3.East" "W"="4.West";
RUN;


PROC TABULATE DATA=MYSASLIB.REGION ORDER=FORMATTED;
  CLASS TYPE AREA SITE;
  VAR SALES_K;
  TABLE(AREA="" ALL),(SITE="" ALL)*TYPE=""
        *MEAN=""*SALES_K=""*F=6.2;
  FORMAT AREA $FMTCOMPASS.;
RUN;

