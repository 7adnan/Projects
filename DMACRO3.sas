*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates SAS Macros;

* Note: If you have data in a folder other than C:\SASDATA you need to modify
        the INFILE statement;

%MACRO REPORT(SUBJ, DSN);
     DATA REPORT;SET "&DSN";
     IF SUBJ=&SUBJ;
     TITLE "REPORT ON SUBJECT # &SUBJ";
      PROC PRINT NOOBS DATA=REPORT;
          VAR GENDER TIME_EXPOSED DIAGNOSED;
      RUN;
%MEND REPORT;
%REPORT(SUBJ=001, DSN=C:\SASDATA\SUBJECTS)
%REPORT(SUBJ=017, DSN=C:\SASDATA\SUBJECTS)
%REPORT(SUBJ=040, DSN=C:\SASDATA\SUBJECTS)

;
TITLE;FOOTNOTE;
