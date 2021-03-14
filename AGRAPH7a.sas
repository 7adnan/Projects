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

