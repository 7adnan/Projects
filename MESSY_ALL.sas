*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates Cleaning a MESSY data file;
******************************************************************;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

* THESE ARE ALL THE STEPS IN CLEANING THE MESSY DATA SET;

****************************************************************** STEP 1;
DATA MYSASLIB.CLEANED;SET MYSASLIB.MESSYDATA;

LABEL 
      EDUCATION='Years of Schooling'
      HOW_ARRIVED='How Arrived at Clinic'
      TOP_REASON='Top Reason for Coming'
      SATISFACTION='Satisfaction Score'
      Subject="Subject ID"
      DateArrived="Date Arrived"
      TimeArrive="Time Arrived"
      DateLeft="Date Left"
      TimeLeft="Time Left"
      Married="Married?"
      Single="Single?"
      Age="Age Jan 1, 2014"
      Gender="Gender"
      Race="Race"
      Satisfaction="Satisfaction Score";
TEMP=ARRIVAL;
DROP ARRIVAL;
LABEL TEMP='Arrival Temperature';

****************************************************************** STEP 2;
GENDER=UPCASE(GENDER);
RACE=UPCASE(RACE);
HOW_ARRIVED=UPCASE(HOW_ARRIVED);
* FIX 2 SET BAD UNKNOWN VALUES TO MISSING;
IF HOW_ARRIVED NOT IN ('CAR','BUS','WALK') THEN HOW_ARRIVED="";


* FIX 2 - GET RID OF EMPTY ROWS;
IF GENDER NOT IN ('M','F') THEN GENDER="";
IF SUBJECT="" THEN DELETE;
IF RACE="MEX" OR RACE="M" then RACE="H";
IF RACE="A" then RACE="AA";
IF RACE="W" then RACE="C";
IF RACE="X" OR RACE="NA" then RACE="";

****************************************************************** STEP 3;


FORMAT ARRIVEDT DATETIME18.;
FORMAT DATEARRIVED2 DATE10. TIMEARRIVET TIME8.;
DATEARRIVED2=INPUT(TRIM(DATEARRIVED),MMDDYY10.);
I= FIND(TIMEARRIVE," ");
P=FIND(TIMEARRIVE,"P");
TIMEARRIVE2=SUBSTR(TIMEARRIVE,1,I-1);
TIMEARRIVET=INPUT(TRIM(TIMEARRIVE2),TIME8.);
IF P>0 THEN TIMEARRIVET=TIMEARRIVET+43200; * ADD SECONDS FOR 12 HRS;
ARRIVEDT=DHMS(DATEARRIVED2,0,0,TIMEARRIVET) ;

Label ARRIVEDT="Date & Time Arrived";


****************************************************************** STEP 4;

IF TEMP=1018 then TEMP=101.8;
IF EDUCATION=99 then EDUCATION=.;
IF TEMP LT 45 THEN TEMP=(9/5)*TEMP+32;
IF SATISFACTION=-99 THEN SATISFACTION=.;
* Convert AGE from character to numeric;
AGEN=INPUT(AGE,5.);
IF AGEN LT 10 OR AGEN GT 99 THEN AGE=.;
DROP AGE;
LABEL AGEN="Age Jan 1, 2014";

*****************************************************************STEP 5;

FORMAT  ARRIVEDT LEFTDT DATETIME18.;

DATEARRIVED2=INPUT(TRIM(DATEARRIVED),MMDDYY10.);
I= FIND(TIMEARRIVE," ");
P=FIND(TIMEARRIVE,"P");
TIMEARRIVE=SUBSTR(TIMEARRIVE,1,I-1);
TIMEARRIVET=INPUT(TRIM(TIMEARRIVE),TIME8.);
IF P>0 THEN TIMEARRIVET=TIMEARRIVET+43200; * ADD SECONDS FOR 12 HRS;
ARRIVEDT=DHMS(DATEARRIVED2,0,0,TIMEARRIVET) ;

DATELEFT2=INPUT(TRIM(DATELEFT),MMDDYY10.);
I= FIND(TIMELEFT," ");
P=FIND(TIMELEFT,"P");
TIMELEFT=SUBSTR(TIMELEFT,1,I-1);
TIMELEFTT=INPUT(TRIM(TIMELEFT),TIME8.);
if P>0 then TIMELEFTT=TIMELEFTT+43200;
LEFTDT=DHMS(DATELEFT2,0,0,TIMELEFTT) ;
Label ARRIVEDT="Date & Time Arrived"
      LEFTDT ="Date & Time Left";
*DROP I P DATEARRIVED DATEARRIVED2 TIMEARRIVE TIMEARRIVET
       DATELEFT TIMELEFT DATELEFT2 TIMELEFT TIMELEFTT;

STAYMINUTES=INTCK( 'MINUTE', ARRIVEDT, LEFTDT );
STAYHOURS=ROUND(STAYMINUTES/60,.1);

IF STAYHOURS<0 or STAYHOURS>48 then STAYHOURS=.;

IF _N_=27 THEN SUBJECT=27;

RUN;



PROC PRINT LABEL 
     DATA=MYSASLIB.CLEANED 
     (firstobs=1 obs=30) ;
RUN;
