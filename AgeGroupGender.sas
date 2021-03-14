Data   WORK.AGEGENDER;
SET   WORK.AGEGENDER;
if AgeGroup_Gender= '0-4 years Female' then A1=1; else A1=0; 
if AgeGroup_Gender= '0-4 years Male' then A2=1; else A2=0; 
if AgeGroup_Gender= '15-24 years Female' then A3=1; else A3=0; 
if AgeGroup_Gender= '15-24 years Male' then A4=1; else A4=0; 
if AgeGroup_Gender= '25-34 years Female' then A5=1; else A5=0; 
if AgeGroup_Gender= '25-34 years Male' then A6=1; else A6=0; 
if AgeGroup_Gender= '35-44 years Female' then A7=1; else A7=0; 
if AgeGroup_Gender= '35-44 years Male' then A8=1; else A8=0; 
if AgeGroup_Gender= '45-54 years Female' then A9=1; else A9=0; 
if AgeGroup_Gender= '45-54 years Male' then A10=1; else A10=0; 
if AgeGroup_Gender= '5-14 years Female' then A11=1; else A11=0; 
if AgeGroup_Gender= '5-14 years Male' then A12=1; else A12=0; 
if AgeGroup_Gender= '55-64 years Female' then A13=1; else A13=0; 
if AgeGroup_Gender= '55-64 years Male' then A14=1; else A14=0; 
if AgeGroup_Gender= '65-74 years Female' then A15=1; else A15=0; 
if AgeGroup_Gender= '65-74 years Male' then A16=1; else A16=0; 
if AgeGroup_Gender= '75-84 years Female' then A17=1; else A17=0; 
if AgeGroup_Gender= '75-84 years Male' then A18=1; else A18=0; 
if AgeGroup_Gender= '85 years and over Female' then A19=1; else A19=0; 
proc print;
run;

title "Histogram of All Causes of Death Per 100K By Age Group and Gender";
proc sgplot data=work.agegender;
   histogram AllCausesPer100K / transparency=0.5 scale=count;
   density AllCausesPer100K / type=normal group=AgeGroup_Gender;
   keylegend / location=inside position=topright across=1;
run;
Title;


PROC REG DATA=WORK.AGEGENDER;
	MODEL AllCausesPer100K = A1 A2 A3 A4 A5 A6 A7 A8 A9 A10 A11 A12 A13 A14 A15 A16 A17 A18 A19;
	RUN;

title "Histogram of Natural Causes of Death Per 100K By Age Group and Gender";
proc sgplot data=work.agegender;
   histogram NaturalCausesPer100K / transparency=0.5 scale=count;
   density NaturalCausesPer100K / type=normal group=AgeGroup_Gender;
   keylegend / location=inside position=topright across=1;
run;
Title;


PROC REG DATA=WORK.AGEGENDER;
	MODEL NaturalCausesPer100K = A1 A2 A3 A4 A5 A6 A7 A8 A9 A10 A11 A12 A13 A14 A15 A16 A17 A18 A19;
	RUN;
	

title "Histogram of Malignant Neoplasms As Causes of Death Per 100K By Age Group and Gender";
proc sgplot data=work.agegender;
   histogram MalignantNeoplasmsPer100K / transparency=0.5 scale=count;
   density MalignantNeoplasmsPer100K / type=normal group=AgeGroup_Gender;
   keylegend / location=inside position=topright across=1;
run;
Title;


PROC REG DATA=WORK.AGEGENDER;
	MODEL MalignantNeoplasmsPer100K = A1 A2 A3 A4 A5 A6 A7 A8 A9 A10 A11 A12 A13 A14 A15 A16 A17 A18 A19;
	RUN;
	
title "Histogram of Chronic Lower Respiratory Disease As Cause Of Death Per 100K By Age Group and Gender";
proc sgplot data=work.agegender;
   histogram ChronicLowerRespPer100K / transparency=0.5 scale=count;
   density ChronicLowerRespPer100K / type=normal group=AgeGroup_Gender;
   keylegend / location=inside position=topright across=1;
run;
Title;


PROC REG DATA=WORK.AGEGENDER;
	MODEL ChronicLowerRespPer100K = A1 A2 A3 A4 A5 A6 A7 A8 A9 A10 A11 A12 A13 A14 A15 A16 A17 A18 A19;
	RUN;
	
title "Histogram of Heart Disease As Cause Of Death Per 100K By Age Group and Gender";
proc sgplot data=work.agegender;
   histogram HeartDiseasePer100K / transparency=0.5 scale=count;
   density HeartDiseasePer100K / type=normal group=AgeGroup_Gender;
   keylegend / location=inside position=topright across=1;
run;
Title;


PROC REG DATA=WORK.AGEGENDER;
	MODEL HeartDiseasePer100K = A1 A2 A3 A4 A5 A6 A7 A8 A9 A10 A11 A12 A13 A14 A15 A16 A17 A18 A19;
	RUN;
	
title "Histogram of Cerebrovascular Disease As Cause Of Death Per 100K By Age Group and Gender";
proc sgplot data=work.agegender;
   histogram CerebrovascularPer100K / transparency=0.5 scale=count;
   density CerebrovascularPer100K / type=normal group=AgeGroup_Gender;
   keylegend / location=inside position=topright across=1;
run;
Title;


PROC REG DATA=WORK.AGEGENDER;
	MODEL CerebrovascularPer100K = A1 A2 A3 A4 A5 A6 A7 A8 A9 A10 A11 A12 A13 A14 A15 A16 A17 A18 A19;
	RUN;