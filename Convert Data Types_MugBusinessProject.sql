--Etsy_Deposits Table
BEGIN TRANSACTION
GO

ALTER TABLE Etsy_Deposits
ALTER COLUMN [Date] DATE;

ALTER TABLE Etsy_Deposits
ALTER COLUMN Amount DECIMAL(18,2);

COMMIT TRANSACTION

--Etsy_Direct_Checkout_Payments

BEGIN TRANSACTION
GO

ALTER TABLE Etsy_Direct_Checkout_Payments
ALTER COLUMN Payment_ID BIGINT;

ALTER TABLE Etsy_Direct_Checkout_Payments
ALTER COLUMN Order_ID BIGINT;

ALTER TABLE Etsy_Direct_Checkout_Payments
ALTER COLUMN Gross_Amount DECIMAL(18,2);

ALTER TABLE Etsy_Direct_Checkout_Payments
ALTER COLUMN Fees DECIMAL(18,2);

ALTER TABLE Etsy_Direct_Checkout_Payments
ALTER COLUMN Net_Amount DECIMAL(18,2);

ALTER TABLE Etsy_Direct_Checkout_Payments
ALTER COLUMN Posted_Gross DECIMAL(18,2);

ALTER TABLE Etsy_Direct_Checkout_Payments
ALTER COLUMN Posted_Fees DECIMAL(18,2);

ALTER TABLE Etsy_Direct_Checkout_Payments
ALTER COLUMN Posted_Net DECIMAL(18,2);

ALTER TABLE Etsy_Direct_Checkout_Payments
ALTER COLUMN Exchange_Rate DECIMAL(18,2);

ALTER TABLE Etsy_Direct_Checkout_Payments
ALTER COLUMN Funds_Available DATE;

ALTER TABLE Etsy_Direct_Checkout_Payments
ALTER COLUMN Order_Date DATE;

ALTER TABLE Etsy_Direct_Checkout_Payments
ALTER COLUMN Listing_Amount DECIMAL(18,2);

COMMIT TRANSACTION


--Etsy_Listings

BEGIN TRANSACTION
GO

ALTER TABLE Etsy_Listings
ALTER COLUMN QUANTITY BIGINT;

ALTER TABLE Etsy_Listings
ALTER COLUMN PRICE DECIMAL(18,2);

COMMIT TRANSACTION


--Etsy_Sold_Order_Items

BEGIN TRANSACTION
GO

ALTER TABLE Etsy_Sold_Order_Items
ALTER COLUMN Sale_Date DATE;

ALTER TABLE Etsy_Sold_Order_Items
ALTER COLUMN Quantity BIGINT;

ALTER TABLE Etsy_Sold_Order_Items
ALTER COLUMN Price DECIMAL(18,2);

ALTER TABLE Etsy_Sold_Order_Items
ALTER COLUMN Discount_Amount DECIMAL(18,2);

ALTER TABLE Etsy_Sold_Order_Items
ALTER COLUMN Shipping_Discount DECIMAL(18,2);

ALTER TABLE Etsy_Sold_Order_Items
ALTER COLUMN Order_Shipping DECIMAL(18,2);

ALTER TABLE Etsy_Sold_Order_Items
ALTER COLUMN Order_Sales_Tax DECIMAL(18,2);

ALTER TABLE Etsy_Sold_Order_Items
ALTER COLUMN Item_Total DECIMAL(18,2);

ALTER TABLE Etsy_Sold_Order_Items
ALTER COLUMN Transaction_ID BIGINT;

ALTER TABLE Etsy_Sold_Order_Items
ALTER COLUMN Listing_ID BIGINT;

ALTER TABLE Etsy_Sold_Order_Items
ALTER COLUMN Date_Paid DATE;

ALTER TABLE Etsy_Sold_Order_Items
ALTER COLUMN Date_Shipped DATE;

ALTER TABLE Etsy_Sold_Order_Items
ALTER COLUMN Order_ID BIGINT;


COMMIT TRANSACTION



--Etsy_Sold_Orders

BEGIN TRANSACTION
GO

ALTER TABLE Etsy_Sold_Orders
ALTER COLUMN Sale_Date DATE

ALTER TABLE Etsy_Sold_Orders
ALTER COLUMN Order_ID BIGINT;

ALTER TABLE Etsy_Sold_Orders
ALTER COLUMN Number_of_Items BIGINT;

ALTER TABLE Etsy_Sold_Orders
ALTER COLUMN Date_Shipped DATE

ALTER TABLE Etsy_Sold_Orders
ALTER COLUMN Order_Value DECIMAL(18,2);

ALTER TABLE Etsy_Sold_Orders
ALTER COLUMN Discount_Amount DECIMAL(18,2);

ALTER TABLE Etsy_Sold_Orders
ALTER COLUMN Shipping_Discount DECIMAL(18,2);

ALTER TABLE Etsy_Sold_Orders
ALTER COLUMN Shipping DECIMAL(18,2);

ALTER TABLE Etsy_Sold_Orders
ALTER COLUMN Sales_Tax DECIMAL(18,2);

ALTER TABLE Etsy_Sold_Orders
ALTER COLUMN Order_Total DECIMAL(18,2);

ALTER TABLE Etsy_Sold_Orders
ALTER COLUMN Card_Processing_Fees DECIMAL(18,2);

ALTER TABLE Etsy_Sold_Orders
ALTER COLUMN Order_Net DECIMAL(18,2);

ALTER TABLE Etsy_Sold_Orders
ALTER COLUMN Adjusted_Order_Total DECIMAL(18,2);

ALTER TABLE Etsy_Sold_Orders
ALTER COLUMN Adjusted_Card_Processing_Fees DECIMAL(18,2);

ALTER TABLE Etsy_Sold_Orders
ALTER COLUMN Adjusted_Net_Order_Amount DECIMAL(18,2);


COMMIT TRANSACTION
