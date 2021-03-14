*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;


DATA LOAN;
PAYMENT= MORT(30000,.,.06/12,48); 
RUN;
PROC PRINT;RUN;
