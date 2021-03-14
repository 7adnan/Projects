*******************************************************
* This SAS code is an example from the text			  *
* SAS ESSENTIALS 2nd Ed, Wiley                        *
* (C) 2016 Elliott, Alan C. and Woodward, Wayne A.    *
*******************************************************;

* This example illustrates SAS Macros;
%MACRO GROUPS(COUNT);
   %DO I=1 %TO &COUNT;
      DATA GP&I;
        SET MYSASLIB.SOMEDATA;
        WHERE STATUS=&I;
      RUN;
   %END;
%MEND GROUPS;

%GROUPS(COUNT=5);
TITLE "Listing for STATUS=1";
PROC PRINT DATA=GP1;RUN;
TITLE "Listing for STATUS=2";
PROC PRINT DATA=GP2;RUN;


;
TITLE;FOOTNOTE;
