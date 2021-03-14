*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the use of LABELS;

DATA MYDATA;
INFILE 'C:\SASDATA\BPDATA.DAT'; * READ DATA FROM FILE;
INPUT ID $ 1 SBP 2-4 DBP 5-7 SEX $ 8 AGE 9-10 WT 11-13;
LABEL ID = 'Identification Number'
	 SBP= 'Systolic Blood Pressure'
	 DBP = 'Diastolic Blood Pressure'
	 AGE = 'Age on Jan 1, 2000'
	 WT = 'Weight'	 ;
PROC MEANS; VAR SBP DBP AGE WT;
RUN;

TITLE;FOOTNOTE;
