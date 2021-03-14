data PROD_Sales_Product_data;
	Infile '/folders/myfolders/prodsalesproductdatamod1.csv' dlm=',' firstobs=2;
	input OrderMethod $
			ProductName $ 
			ProductCategory $
			UnitPrice
			ProductCost
			QuantityOrdered
			NetProduct
			Tax
			ShippingCharge
			TotalOrder ;
run;

proc summary data=PROD_Sales_Product_data;
var UnitPrice
			ProductCost
			QuantityOrdered
			NetProduct
			Tax
			ShippingCharge
			TotalOrder ;
output out=totals sum=;
run;