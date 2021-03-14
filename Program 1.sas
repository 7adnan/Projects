/*Data Exploration*/
proc univariate data=work.import;
   histogram;
run;

ods noproctitle;

proc npar1way data=WORK.IMPORT wilcoxon plots(only)=(wilcoxonboxplot);
	class CC_CARD;
	var AVRG;
run;


/*Randomize the data using ranuni function*/
data temp; 
	set work.import; 
	n=ranuni(100);
run; 
proc sort data=temp; by n;

/*Split retail store data into training (70%) and testing datasets (30%).*/
data training testing; 
/* Number of Observations*/
	set temp nobs= nobs; 
	if _n_<=.70*nobs then output training; 
	else output testing; 

run;

proc reg data=work.import alpha=0.05 plots=all;
  model Sales_per_Visit =  Number_of_Visits CC_CARD GMPCNT CLUSTYPE  / selection=stepwise;
  run;
  
proc reg data=work.import alpha=0.05 plots=all;
  model PSWEATERS = POUTERWEAR;
  run;
  
 proc reg data=work.import alpha=0.05 plots=all;
  model AVRG = ln_days_between_purchases;
  run;


/*Stepwise Multiple Linear Regression with All variables*/
proc reg data=training alpha=0.05 plots=all;
  model AVRG = Customer_Id ZIP_CODE FRE MON CC_CARD  
  				PSWEATERS PKNIT_TOPS PKNIT_DRES PBLOUSES PJACKETS
  				PCAR_PNTS PCAS_PNTS PSHIRTS PDRESSES PSUITS POUTERWEAR 
  				PJEWELRY PFASHION PLEGWEAR PCOLLSPND GMP PROMOS DAYS MARKDOWN 
  				CLUSTYPE PERCRET ln_days_between_purchases ln_lifetime_ave_time_betw_visits / selection=stepwise;
output out=work.reg_stats;
  run;
  
/*Stepwise Multiple Linear Regression with All variables*/
proc reg data=training alpha=0.05 plots=all;
  model PROMOS= Customer_Id ZIP_CODE FRE MON CC_CARD  
  				PSWEATERS PKNIT_TOPS PKNIT_DRES PBLOUSES PJACKETS
  				PCAR_PNTS PCAS_PNTS PSHIRTS PDRESSES PSUITS POUTERWEAR 
  				PJEWELRY PFASHION PLEGWEAR PCOLLSPND GMP AVRG DAYS MARKDOWN 
  				CLUSTYPE PERCRET ln_days_between_purchases ln_lifetime_ave_time_betw_visits / selection=stepwise;
  run;
  
  
  
  
 proc logistic data=training alpha=0.05 plots=all;
  model CLUSTYPE= Customer_Id ZIP_CODE FRE MON CC_CARD  
  				PSWEATERS PKNIT_TOPS PKNIT_DRES PBLOUSES PJACKETS
  				PCAR_PNTS PCAS_PNTS PSHIRTS PDRESSES PSUITS POUTERWEAR 
  				PJEWELRY PFASHION PLEGWEAR PCOLLSPND GMP AVRG DAYS MARKDOWN 
  				AVRG PERCRET ln_days_between_purchases ln_lifetime_ave_time_betw_visits / selection=stepwise;
  run;
  
  
 /*Stepwise Multiple Linear Regression with All variables*/
proc reg data=training alpha=0.05 plots=all;
  model PROMOS= Customer_Id ZIP_CODE FRE MON CC_CARD  
  				PSWEATERS PKNIT_TOPS PKNIT_DRES PBLOUSES PJACKETS
  				PCAR_PNTS PCAS_PNTS PSHIRTS PDRESSES PSUITS POUTERWEAR 
  				PJEWELRY PFASHION PLEGWEAR PCOLLSPND GMP AVRG DAYS MARKDOWN 
  				CLUSTYPE PERCRET ln_days_between_purchases ln_lifetime_ave_time_betw_visits / selection=stepwise;
  run;



