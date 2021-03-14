*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates TITLE and FOOTNOTE options;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

TITLE J=RIGHT 
      FONT= 'SWISS' COLOR=RED BOLD BCOLOR=YELLOW "EXAMPLE " 
      C=BLACK BOLD ITALIC "TODAY IS &SYSDATE9";
TITLE2 J=CENTER C="CX3230B2" "THIS IS BRILLIANT BLUE.";
FOOTNOTE J=CENTER COLOR=PURPLE UNDERLINE=1
       HEIGHT=8PT "8 POINTS"
       HEIGHT=16PT " 16 POINTS"
       H=24PT " 24 POINTS";
;
PROC MEANS DATA=MYSASLIB.PEOPLE2;
RUN;

TITLE;FOOTNOTE;


