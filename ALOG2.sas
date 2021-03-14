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
