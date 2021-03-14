*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;
PROC FORMAT;
VALUE FMTSEVERE
	  LOW-<0="BLACK"
      0-<10="GREEN"
	  10-<20="BLUE"
	  20-HIGH="RED";


* This example illustrates the use of Traffic Signal highlights;
	  * Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

TITLE "Trauma Data Report";
PROC PRINT LABEL DATA=MYSASLIB.TRAUMA  (firstobs=1 obs=10);
ID INC_KEY;
VAR  AGE GENDER ;
VAR ISS/STYLE={FOREGROUND=FMTSEVERE.};
VAR  INJTYPE DISSTATUS;
label   INC_KEY='Subject ID '
		AGE='Age in 2014 '
		GENDER='Gender '
        ISS='Injury Severity Score '
        INJTYPE='Injury Type '
        DISSTATUS='Discharge Status';
RUN;

TITLE;FOOTNOTE;

