*******************************************************
Code files for Chapter 16;

*ALOG1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC LOSISTIC procedure;
* You could use MYSASLIB.ACCIDENTS in the DATA= Statement;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

PROC LOGISTIC DATA="C:\SASDATA\ACCIDENTS" DESCENDING;                                                                                                               
   MODEL DEAD=PENETRATE / RISKLIMITS;                                                                                       
   TITLE 'Trauma Data Model Death by Penetration Wound ';                                                                                 
RUN;      

TITLE;FOOTNOTE;


*ALOG2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC LOSISTIC procedure;

PROC LOGISTIC DATA="C:/SASDATA/ACCIDENTS" DESCENDING;                                                                                                               
   MODEL DEAD=ISS / RISKLIMITS;    
   OUTPUT OUT=LOGOUT PREDICTED=PROB;  
   TITLE "Simple binary logistic regession with plot.";                                                                                 
RUN;           
*---------------------------------------LOGISTIC PLOT;
*GOPTIONS RESET=ALL; * May be necessary in some SAS installations;
PROC SORT DATA=LOGOUT;BY ISS;   RUN;                                                                                                        
TITLE 'LOGISTIC PLOT'; 
PROC GPLOT DATA=LOGOUT;
   PLOT PROB*ISS; 
RUN;   
QUIT;


TITLE;FOOTNOTE;

*ALOG3.SAS;


*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC LOSISTIC procedure;
* You could use MYSASLIB.ACCIDENTS in the DATA= Statement;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

PROC LOGISTIC DATA="C:\SASDATA\ACCIDENTS" DESCENDING;
CLASS GENDER ;
MODEL DEAD =  PENETRATE ISS AGE GENDER SBP GCS
	   / EXPB
       SELECTION=STEPWISE
	   INCLUDE=1
       SLENTRY=0.05
       SLSTAY=0.05
       RISKLIMITS;

      TITLE 'LOGISTIC ON TRAUMA DATA WHERE AGE LE 18';
RUN;
QUIT;


TITLE;FOOTNOTE;


*ALOG4.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC LOSISTIC procedure;
* You could use MYSASLIB.ACCIDENTS in the DATA= Statement;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

PROC LOGISTIC DATA="C:/SASDATA/ACCIDENTS" DESCENDING;
MODEL DEAD =  PENETRATE ISS AGE GCS
	   / EXPB
  	     LACKFIT
         RISKLIMITS
	     CTABLE	
         OUTROC=ROC1;
TITLE 'Assess models predictive ability';
RUN;

QUIT;


TITLE;FOOTNOTE;


*EX_16.1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC LOSISTIC procedure;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

PROC LOGISTIC DATA=mysaslib.boxstore;
CLASS GENDER FREEBIE RACE SOLD;
MODEL SOLD=GENDER FREEBIE RACE AGE PRICE100
	   / EXPB
	     SELECTION=BACKWARD;
TITLE 'What helps sales?';
RUN;
QUIT;


TITLE;FOOTNOTE;




