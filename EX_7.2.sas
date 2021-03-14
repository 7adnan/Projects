
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This is for an excerise in Chapter 7;

%MACRO _________(CHOICE=);
  DATA TEMP; SET "C:\___________________";
  IF BRAND="&CHOICE";
  TITLE "CAR SELECTION FOR ___________";
  PROC PRINT; VAR BRAND MODEL CITYMPG;
  RUN;
%MEND GETCARS;
ODS HTML;
%GETCARS(CHOICE=SCION)
%GETCARS(CHOICE=______)
%GETCARS(CHOICE=______)

