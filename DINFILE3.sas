*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This illustrates the INFILE statement options;

DATA PLACES;
INFILE DATALINES DLMSTR='!~!';
INPUT CITY $ STATE $ ZIP;
DATALINES;
DALLAS!~!TEXAS!~!75208
LIHUE!~!HI!~!96766
MALIBU!~!CA!~!90265
;
PROC PRINT;
RUN;

TITLE;FOOTNOTE;
