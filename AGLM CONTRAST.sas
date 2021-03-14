*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC GLM procedure;

DATA CONTRAST;
INPUT GROUP OBSERVATION;
DATALINES;
1	9.81
1	8.92
1	11.81
1	10.57
1	11.26
1	12.45
1	12.26
1	10.5
1	8.77
1	13.25
2	12.28
2	16.33
2	14.14
2	16.61
2	12.04
2	13.43
2	15.11
2	15.85
3	4.95
3	6.4
3	7.85
3	6.86
3	3.86
3	5.17
3	4.77
4	4.25
4	7.85
4	3.99
4	8.86
4	6.8
4	5.41
4	3.94
;
PROC GLM DATA=CONTRAST;
CLASS GROUP;
MODEL OBSERVATION=GROUP;
CONTRAST 'Groups 1 vs 3&4' GROUP -1 0 .5 .5;
RUN;
quit;


TITLE;FOOTNOTE;
