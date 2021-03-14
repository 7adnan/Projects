*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates Cleaning a MESSY data file;
******************************************************************;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries
****************************************************************** 
STEP 1;
* THIS CODE MAKES A COPY OF THE ORIGINAL FILE;
* SO ALL CHANGES ARE MADE IN A COPY OF THE DATA SET;

DATA MYSASLIB.CLEANED;SET MYSASLIB.MESSYDATA;
LABEL 
      EDUCATION='Years of Schooling'
      HOW_ARRIVED='How Arrived at Clinic'
      TOP_REASON='Top Reason for Coming'
      SATISFACTION='Satisfaction Score'
	  ARRIVAL='Arrival Temperature';
	  * You don't really need the ARRIVAL Label;
TEMP=ARRIVAL; 
DROP ARRIVAL;
LABEL TEMP='Arrival Temperature';
RUN;
PROC PRINT LABEL 
     DATA=MYSASLIB.CLEANED 
     (firstobs=1 obs=10);
     VAR  SUBJECT EDUCATION TEMP 
          TOP_REASON SATISFACTION;
RUN;



TITLE;FOOTNOTE;

* EACH VERSION OF MESSYn.SAS BUILDS ON THIS PROGRAM;
