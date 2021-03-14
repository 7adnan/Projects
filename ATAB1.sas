*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* Note: These GRAPH examples use the MYSASLIB library. If you have
* not created this library, you can use this code, or modify this
* code to point to the folder containing your data files;
* LIBNAME MYSASLIB "C:\SASDATA\";

* This example illustrates PROC tabulate;

PROC TABULATE DATA=MYSASLIB.REGION;
  CLASS TYPE;
  TABLE TYPE;
RUN;
