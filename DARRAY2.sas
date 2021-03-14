*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the ARRAY Statement;
TITLE "Example of using an ARRAY";
DATA B;
FORMAT ONE TWO THREE FOUR $10.;
INPUT ONE $ TWO $ THREE $ FOUR $;
ARRAY FRUIT(4) ONE TWO THREE FOUR;
IF "ORANGE" IN FRUIT then ISORANGE=1;ELSE ISORANGE=0;
DATALINES;
APPLE ORANGE PINEAPPLE APRICOT
LEMON APPLE KIWI STRAWBERRY
;
RUN;
proc print data=B;run;


TITLE;FOOTNOTE;


