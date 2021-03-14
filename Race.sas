Data  WORK.RACE;
 set  WORK.RACE;
if Race= 'American Indian or Alaska Native' then D1=1; else D1=0;
if Race= 'Asian' then D2=1; else D2=0;
if Race= 'Black' then D3=1; else D3=0;
if Race= 'Hispanic' then D4=1; else D4=0;
if Race= 'Other' then D5=1; else D5=0;
proc print;
run;

Data  WORK.RACE;
if Race= 'American Indian or Alaska Native' then D1=1; else D1=0;
if Race= 'Asian' then D2=1; else D2=0;
if Race= 'Black' then D3=1; else D3=0;
if Race= 'Hispanic' then D4=1; else D4=0;
if Race= 'Other' then D5=1; else D5=0;
proc print;
run;

PROC UNIVARIATE DATA=WORK.RACE;
	HISTOGRAM AllCausesPer100K;
	RUN;

title "Histogram of All Causes of Death Per 100K By Race";
proc sgplot data=work.race;
   histogram AllCausesPer100K / transparency=0.5 scale=count;
   density AllCausesPer100K / type=normal group=Race;
   keylegend / location=inside position=topright across=1;
run;
title;

PROC REG DATA=WORK.RACE;
	MODEL AllCausesPer100K = D1 D2 D3 D4 D5;
	RUN;
	
title "Histogram of Natural Causes of Death Per 100K By Race";
proc sgplot data=work.race;
   histogram NaturalCausesPer100K / transparency=0.5 scale=count;
   density NaturalCausesPer100K / type=normal group=Race;
   keylegend / location=inside position=topright across=1;
run;
Title;



PROC REG DATA=WORK.RACE;
	MODEL NaturalCausesPer100K = D1 D2 D3 D4 D5;
	RUN;
	
/*Malignant Neoplasms*/
title "Malignant Neoplasms As Cause Of Death Per 100K By Race";
proc sgplot data=work.race;
   histogram MalignantNeoplasmsPer100K/ transparency=0.5 scale=count;
   density MalignantNeoplasmsPer100K/ type=normal group=Race;
   keylegend / location=inside position=topright across=1;
run;
Title;

PROC REG DATA=WORK.RACE;
	MODEL MalignantNeoplasmsPer100K = D1 D2 D3 D4 D5;
	RUN;


/*Chronic Lower Respiratory Disease*/
title "Chronic Lower Respiratory Disease As Cause Of Death Per 100K By Race";
proc sgplot data=work.race;
   histogram ChronicLowerRespPer100K/ transparency=0.5 scale=count;
   density ChronicLowerRespPer100K/ type=normal group=Race;
   keylegend / location=inside position=topright across=1;
run;
Title;

PROC REG DATA=WORK.RACE;
	MODEL ChronicLowerRespPer100K = D1 D2 D3 D4 D5;
	RUN;

/*Heart Disease*/
title "Heart  Disease As Cause Of Death Per 100K By Race";
proc sgplot data=work.race;
   histogram HeartDiseasePer100K/ transparency=0.5 scale=count;
   density HeartDiseasePer100K/ type=normal group=Race;
   keylegend / location=inside position=topright across=1;
run;
Title;

PROC REG DATA=WORK.RACE;
	MODEL HeartDiseasePer100K= D1 D2 D3 D4 D5;
	RUN;

/*Cerebrovascular Disease*/
title "Cerebrovascular Disease As Cause Of Death Per 100K By Race";
proc sgplot data=work.race;
   histogram CerebrovascularPer100K/ transparency=0.5 scale=count;
   density CerebrovascularPer100K/ type=normal group=Race;
   keylegend / location=inside position=topright across=1;
run;
Title;

PROC REG DATA=WORK.RACE;
	MODEL CerebrovascularPer100K= D1 D2 D3 D4 D5;
	RUN;
