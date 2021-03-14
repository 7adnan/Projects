*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates the PROC REG procedure;

DATA ART;
INPUT SUBJECT $ CREATE TASK;
DATALINES;
AE	28	4.5
FR	35	3.9
HT	37	3.9
IO	50	6.1
DP	69	4.3
YR	84	8.8
QD	40	2.1
SW	65	5.5
DF	29	5.7
ER	42	3.0
RR	51	7.1
TG	45	7.3
EF	31	3.3
TJ	40	5.2
;
RUN;
PROC REG;
MODEL TASK=CREATE;
TITLE 'Example simple linear regression using PROC REG';
RUN;
QUIT;


TITLE;FOOTNOTE;



