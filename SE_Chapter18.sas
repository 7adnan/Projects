*******************************************************
Code files for Chapter 18;

*AGRAPH1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;
* 
* Note: These GRAPH examples use the MYSASLIB library. 
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

* This example illustrates the PROC GPLOT procedure;

GOPTIONS RESET=ALL;
Title "Simple Scatterplot";
PROC GPLOT DATA=MYSASLIB.CARS;
     PLOT HWYMPG*ENGINESIZE;
RUN;
QUIT;

TITLE;FOOTNOTE;


*AGRAPH2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC GPLOT procedure;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

GOPTIONS RESET=ALL;
Title "Simple Scatterplot, Change symbol";
PROC GPLOT DATA=MYSASLIB.CARS;
     PLOT HWYMPG*CITYMPG;
     SYMBOL1 V=STAR I=RL C=BLUE L=2;
RUN;
QUIT;


TITLE;FOOTNOTE;


*AGRAPH2A.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC GPLOT procedure;

GOPTIONS RESET=ALL;
AXIS1 C=RED ORDER=(0 TO 80 BY 5) 
      LABEL=('City Miles Per Gallon' FONT=SWISS)
	  OFFSET=(5) WIDTH=2 VALUE=(H=2);
AXIS2 C=GREEN ORDER=(0 TO 80 BY 5) 
      LABEL=(A=90 'Highway Miles Per Gallon' FONT=SWISS)
	  OFFSET=(5) WIDTH=4 VALUE=(H=1);
TITLE "Enhanced Scatterplot";

PROC GPLOT DATA=MYSASLIB.CARS;
     PLOT HWYMPG*CITYMPG/HAXIS=AXIS1 VAXIS=AXIS2 NOFRAME;
	 SYMBOL1 V=DOT I=RL C=PURPLE L=2;
RUN;
QUIT;


TITLE;FOOTNOTE;


*AGRAPH3.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC GPLOT procedure;

GOPTIONS RESET=ALL;
AXIS1 ORDER=(4 TO 12 BY 1)
      LABEL=('Number of Cylinders' FONT=SWISS HEIGHT=4)
	  OFFSET=(5);
AXIS2 ORDER=(0 TO 50 BY 5) 
      LABEL=(A=90 'Highway Miles Per Gallon' FONT=SWISS HEIGHT=4)
	  OFFSET=(5);
PROC GPLOT DATA=MYSASLIB.CARS;
     PLOT HWYMPG*CYLINDERS/HAXIS=AXIS1 VAXIS=AXIS2;
     SYMBOL1 I=STD1JT H=1 LINE=1 VALUE=NONE;
RUN;
QUIT;

TITLE;FOOTNOTE;


*AGRAPH4.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC GCHART procedure;
* Note: If you don't already have the MYSASLIB defined, 
        see Chapter 3 Working with SAS Libraries;

GOPTIONS RESET=ALL;
Title "Horizontal Bar Chart";
PROC GCHART DATA=MYSASLIB.SOMEDATA; 
HBAR STATUS/DISCRETE;
;
RUN;
QUIT;


TITLE;FOOTNOTE;


*AGRAPH5.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC GCHART procedure;
GOPTIONS RESET=ALL;
AXIS1 LABEL=NONE VALUE=(H=1.2);
AXIS2 LABEL=(A=90 "Count");
TITLE "Vertical Bar Chart";
PROC GCHART DATA=MYSASLIB.SOMEDATA;
VBAR GENDER/GROUP=GP MAXIS=AXIS1 AXIS=AXIS2;
PATTERN1 VALUE=R1 COLOR=GREEN;
RUN;
QUIT;


TITLE;FOOTNOTE;

*AGRAPH6.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC GCHART procedure;
GOPTIONS RESET=ALL;
TITLE 'Bar Chart by Group with different bar colors';
PROC GCHART DATA=MYSASLIB.SOMEDATA;
VBAR GENDER/GROUP=GP SUBGROUP=GENDER;
PATTERN1 VALUE=R1 COLOR=RED;
PATTERN2 VALUE=R1 COLOR=BLUE;
RUN;
QUIT;

TITLE;FOOTNOTE;


*AGRAPH7.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC GCHART procedure;
GOPTIONS RESET=ALL;
PATTERN1 V=R1 C=RED; * FOR BUS;
PATTERN2 V=R1 C=BLUE; * FOR CAR;
PATTERN3 V=R1 C=BLACK; * FOR WALK;
TITLE C=RED 'Stacked Bars, Method of Arrival';
PROC GCHART DATA=MYSASLIB.SURVEY;
 	 VBAR GENDER / SUBGROUP=ARRIVE WIDTH=15;
RUN;QUIT;

TITLE;FOOTNOTE;

*AGRAPH7A.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC GCHART procedure;
GOPTIONS RESET=ALL;
PATTERN1 V=R1 C=RED; * FOR BUS;
PATTERN2 V=R2 C=BLUE; * FOR CAR;
PATTERN3 V=R3 C=BLACK; * FOR WALK;
LEGEND1 
 ACROSS=1 LABEL=("Gender")
 POSITION=(top inside left) 
 VALUE=(H=1 'Male' 'Female'); 
AXIS1 label=(a=90 Color=RED H=2 f="Swiss/Bold" "Count");
TITLE C=RED 'Example Bar Chart';
PROC GCHART DATA=MYSASLIB.SURVEY;
 	 VBAR GENDER / GROUP=ARRIVE SUBGROUP=GENDER WIDTH=10
                   LEGEND=LEGEND1 RAXIS=AXIS1
                   OUTSIDE=FREQ ;
RUN;
QUIT;

TITLE;FOOTNOTE;

*AGRAPH8.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC GCHART procedure;

PATTERN1 V=L3 COLOR=LIGHTBLUE;
AXIS1 LABEL=(A=90 H=1.5 F="SWISS" "OBSERVATION" C=BLUE);
AXIS2 LABEL=(H=1.5 F="SWISS" "GROUP");
TITLE1 'Mean displayed with 95% error bars';
PROC GCHART DATA=MYSASLIB.SOMEDATA;
VBAR GP /
WIDTH=10 
TYPE=MEAN
SUMVAR=TIME1
INSIDE=MEAN
CLM=99
ERRORBAR=TOP 
RAXIS=AXIS1 MAXIS=AXIS2
COUTLINE=SAME WOUTLINE=2;
RUN;
QUIT;



TITLE;FOOTNOTE;

*AGRAPH9.SAS;


*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC GCHART procedure;

GOPTIONS RESET=ALL;
ODS GRAPHICS OFF; * Needed for some SAS version to display colors;
Title "Distribution of HwyMPG by Cylinders";
* You must sort the data on the grouping variable;
PROC SORT DATA="C:\SASDATA\CARS"
     OUT=CARDATA;BY CYLINDERS;
PROC BOXPLOT DATA=CARDATA;
     PLOT HWYMPG*CYLINDERS/CBOXFILL=LIGHTGREEN;
     WHERE CYLINDERS GT 1;
RUN;


TITLE;FOOTNOTE;


*AGRAPH10.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates GCHART and ODS;
TITLE "Bar Chart";
PROC GCHART DATA=MYSASLIB.SOMEDATA;
      HBAR GP/ DISCRETE;
RUN; QUIT;

*AGRAPH11.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates GCHART and ODS;

*......PART 1: CREATE REPORTS FOR GROUPS A, B, and C;
ODS HTML BODY="C:\SASDATA\GPA.HTM";
PROC MEANS DATA= "C:\SASDATA\SOMEDATA" MAXDEC=2 N MEAN STD;
VAR AGE TIME1-TIME4;
WHERE GP="A";
TITLE 'Summary for GROUP A';
RUN;
ODS HTML BODY="C:\SASDATA\GPB.HTM";
PROC MEANS DATA= "C:\SASDATA\SOMEDATA" MAXDEC=2 N MEAN STD;
VAR AGE TIME1-TIME4;
WHERE GP="B";
TITLE 'Summary for GROUP B';
RUN;
ODS HTML BODY="C:\SASDATA\GPC.HTM";
PROC MEANS DATA= "C:\SASDATA\SOMEDATA" MAXDEC=2 N MEAN STD;
VAR AGE TIME1-TIME4;
WHERE GP="C";
TITLE 'Summary for GROUP C';
RUN;
*.......PART 2: CREATE THE LINKS IN  A DATA STEP;
DATA BARCHART;SET "C:\SASDATA\SOMEDATA";
LENGTH HTMLLINK $40;
IF GP="A" THEN HTMLLINK='HREF="GPA.HTM"';
IF GP="B" THEN HTMLLINK='HREF="GPB.HTM"';
IF GP="C" THEN HTMLLINK='HREF="GPC.HTM"';
ODS HTML FILE="C:\SASDATA\GCHART.HTM" GPATH="C:\SASDATA\";
*.......PART 3: CREATE THE GRAPH;
PROC GCHART;
      HBAR GP/ HTML=HTMLLINK;
      TITLE 'Summary information for each GP.';
RUN; QUIT;
ODS HTML CLOSE;
ODS PREFERENCES; *Reset HTML output;


*SGPLOT1.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates SGPLOT;

PROC SGPLOT DATA=MYSASLIB.WOUND; 
   HISTOGRAM SBP;
TITLE "SGPLOT Histogram"; 
RUN; 


TITLE;FOOTNOTE;


*SGPLOT2.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC SGPLOT procedure;

PROC SGPLOT DATA=MYSASLIB.WOUND; 
 HBAR RACE_CAT;
 TITLE "SGPLOT Bar Chart"; 
RUN; 


TITLE;FOOTNOTE;


*SGPLOT3.SAS;

*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC SGPLOT procedure;
DATA ANCOVA;
INPUT METHOD PRETEST POSTTEST @@;
DATALINES;
1	36	38  1	37	39  1	35	41
1	43	47  1	32	33  1	33	37
2	42	41  2	30	30  2	39	45
2	26	28  2	22	25  2	37	39
3	23	30  3	40	49  3	34	43
3	30	38  3	25	32  3	31	37
;
RUN;
PROC SGPLOT DATA =ANCOVA; 
 SCATTER X=PRETEST Y=POSTTEST;
RUN; 


TITLE;FOOTNOTE;


*SGPLOT4.SAS;

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
