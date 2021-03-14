*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC UNIVARIATE procedure;
DATA WEIGHT;
INPUT WBEFORE WAFTER;
* Calculate WLOSS in the DATA step *;
WLOSS=WBEFORE-WAFTER;  
DATALINES;
200 190
175 154
188 176
198 193
197 198
310 240
245 204
202 178
;
PROC UNIVARIATE; 
	VAR WLOSS;
	TITLE 'Paired comparison using PROC UNIVARIATE';
RUN;


TITLE;FOOTNOTE;
