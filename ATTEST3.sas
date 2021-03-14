*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC TTEST procedure;
* NOTE: Depending on your version of SAS, you may need to use 

*ODS GRAPHICS ON;

* in order for this example to produce graphs.;

DATA WEIGHT;
INPUT WBEFORE WAFTER;
DATALINES;
200 185
175 154
188 176
198 193
197 198
310 275
245 224
202 188
;
PROC TTEST;
PAIRED WBEFORE*WAFTER;
TITLE 'Paired t-test Example';
RUN;


TITLE;FOOTNOTE;
