*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates titles and footnotes;
* Note: If you have data in a folder other than C:\SASDATA you need to modify
        the INFILE statement;


DATA MYDATA;
INFILE 'C:\SASDATA\EXAMPLE.DAT';
INPUT ID 1-3 GP $ 5 AGE 6-9 TIME1 10-14 TIME2 15-19 TIME3 20-24;
RUN;	
PROC PRINT;
Title 'Example SAS programs';
Title2 'These is data from the example file.';
Title4 'Using the EXAMPLE data set.';
Footnote 'This is a footnote';
RUN;
PROC MEANS;
Title2 'This is output from PROC Means.';
RUN;
TITLE;FOOTNOTE; * TURNS OFF TITLE AND FOOTNOTE;
