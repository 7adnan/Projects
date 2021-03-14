*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the use of the ID Statement;

DATA WEIGHT;
INFORMAT MDATE MMDDYY10.;
FORMAT MDATE DATE9.; *OUTPUT FORMAT;
INPUT MDATE RAT_ID $ WT_GRAMS TRT $ PINKEYE $;
DATALINES;
02/03/2009 001 093 A Y
02/04/2009 002 087 B N
02/04/2009 003 103 A Y
02/07/2009 005 099 A Y
02/08/2009 006 096 B N
02/11/2009 008 091 B Y
;
RUN;
PROC PRINT DATA=WEIGHT;
RUN;

TITLE;FOOTNOTE;
