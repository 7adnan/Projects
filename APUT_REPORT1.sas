*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PUT REPORT process;
DATA _NULL_; SET MYSASLIB.SOMEDATA;
     PUT AGE;
RUN;

* SEE RESULTS IN THE LOG;

TITLE;FOOTNOTE;
