*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC SGPLOT procedure;
PROC SGPLOT DATA =MYSASLIB.CORONARY; 
   TITLE 'BUBBLE PLOT USING CORONARY DATA';
   TITLE2 'Bubble is BMI';
   BUBBLE X = AGE Y = SBP SIZE = BMI
         / TRANSPARENCY = 0.5;
   YAXIS GRID;
RUN;
