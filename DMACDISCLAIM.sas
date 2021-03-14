*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates SAS Macros;

* THIS IS A MACRO ROUTINE. IT DOES NOT PRIDUCE ANY OUTPUT ON ITS OWN;

%MACRO DISCLAIM;
PROC GSLIDE;
NOTE J=C H=1
"Data provided by ACME Company exchanges may be delayed";
NOTE J=C H=1
"as specified by financial exchanges or our data providers. ";
NOTE J=C H=1
"ACME does not verify any data and disclaims any obligation to do so.";
run;
quit;
%MEND DISCLAIM;
