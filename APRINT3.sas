*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* NOTE: You can also use DATA=MYSASLIB.TRAUMA
* if the MYSASLIB library has been previously defined;

* This example illustrates the use of the SPLIT Statement;

TITLE "Trauma Data Report";
PROC PRINT DATA="C:\SASDATA\TRAUMA" 
   (firstobs=11 obs= 100)
   SPLIT='*'
   N OBS='Observation*Number*===========';
VAR INC_KEY AGE GENDER ISS INJTYPE DISSTATUS;
LABEL INC_KEY='Subject*ID**============'
		AGE='Age in*2014**============'
		GENDER='*Gender**============'
        ISS='Injury Severity*Score**============'
        INJTYPE='Injury*Type**=========='
        DISSTATUS='Discharge*Status*==============';
RUN;

TITLE;FOOTNOTE;
