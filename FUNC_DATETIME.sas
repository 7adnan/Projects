
*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates DATE and TIME FUNCTIONS;

DATA TIME;
FORMAT DTARRIVE MMDDYY10. TIMEARRIVE TIME10. 
       ARRIVETIME DATETIMELEAVE DATETIME19.;
INPUT @1 DTARRIVE DATE10.
      @12 TIMEARRIVE TIME10.
	  @23 DATETIMELEAVE DATETIME19.;
*MERGE DTARRIVE and TIMEARRIVE;
	  ARRIVETIME=DHMS(DTARRIVE,0,0,TIMEARRIVE);
	  SECONDS1=DATETIMELEAVE-ARRIVETIME;
	  SECONDS2=INTCK('seconds',ARRIVETIME,DATETIMELEAVE);
DATALINES;
10NOV2016  1:13 pm    10NOV2016:18:49:19
12DEC2016  9:20 am    12DEC2016:13:23:22
;
PROC PRINT DATA=TIME;RUN;



TITLE;FOOTNOTE;
