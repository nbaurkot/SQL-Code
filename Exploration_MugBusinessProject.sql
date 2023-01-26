
--Total Order number per year
SELECT 
    SUM(CASE WHEN YEAR(Order_Date) = 2020 THEN 1 ELSE 0 END) AS '2020 Orders',
    SUM(CASE WHEN YEAR(Order_Date) = 2021 THEN 1 ELSE 0 END) AS '2021 Orders',
    SUM(CASE WHEN YEAR(Order_Date) = 2022 THEN 1 ELSE 0 END) AS '2022 Orders'
FROM Etsy_Direct_Checkout_Payments
WHERE Order_Date >= '2020-01-01' AND Order_Date <= '2022-12-31'

--Total Order number per month
SELECT DATENAME(MONTH, Order_Date) as 'Month', DATEPART(YEAR, Order_Date) as 'Year',
       COUNT(DISTINCT Order_ID) as 'Orders'
FROM Etsy_Direct_Checkout_Payments
WHERE Order_Date >= '2020-01-01' AND Order_Date <= '2022-12-31'
GROUP BY DATENAME(MONTH, Order_Date), DATEPART(YEAR, Order_Date), DATEPART(MONTH, Order_Date)
ORDER BY DATEPART(YEAR, Order_Date), DATEPART(MONTH, Order_Date)



--Total deposit $ per year
SELECT 
    SUM(CASE WHEN YEAR(Date) = 2020 THEN Amount ELSE 0 END) AS '2020 Deposits',
    SUM(CASE WHEN YEAR(Date) = 2021 THEN Amount ELSE 0 END) AS '2021 Deposits',
    SUM(CASE WHEN YEAR(Date) = 2022 THEN Amount ELSE 0 END) AS '2022 Deposits'
FROM Etsy_Deposits

--Total Deposits

SELECT
SUM(AMOUNT) AS 'Total Deposits'
FROM Etsy_Deposits

--Total Revenue per Year
SELECT 
    SUM(CASE WHEN YEAR(Sale_Date) = 2020 THEN Order_Net ELSE 0 END) AS '2020 Revenue',
    SUM(CASE WHEN YEAR(Sale_Date) = 2021 THEN Order_Net ELSE 0 END) AS '2021 Revenue',
    SUM(CASE WHEN YEAR(Sale_Date) = 2022 THEN Order_Net ELSE 0 END) AS '2022 Revenue'
FROM Etsy_Sold_Orders
WHERE Sale_Date >= '2020-01-01' AND Sale_Date <= '2022-12-31'

--Total Revenue
SELECT 
	Sum(Order_Net) AS 'Total Revenue'
FROM Etsy_Sold_Orders

--Average order price
SELECT 
CAST(ROUND(AVG(Order_Net), 2) AS DECIMAL(18,2)) as Average_Order_Total
FROM Etsy_Sold_Orders




--Most popular month for purchases

SELECT DATEPART(MONTH, Sale_Date) as Month, COUNT(*) as Total_Purchases
FROM Etsy_Sold_Orders
GROUP BY DATEPART(MONTH, Sale_Date)
ORDER BY Total_Purchases DESC
--OR to get month date name listed explicitly
SELECT DATENAME(MONTH, Sale_Date) as Month, COUNT(*) as Total_Purchases
FROM Etsy_Sold_Orders
GROUP BY DATENAME(MONTH, Sale_Date)
ORDER BY Total_Purchases DESC
-- look at by year by using case statements
SELECT DATENAME(MONTH, Sale_Date) as Month, YEAR(Sale_Date) as Year, COUNT(*) as Total_Purchases
FROM Etsy_Sold_Orders
GROUP BY DATENAME(MONTH, Sale_Date), YEAR(Sale_Date)
ORDER BY Year DESC,Total_Purchases DESC
--aggregate by year
SELECT DATENAME(MONTH, Sale_Date) as Month,
       SUM(CASE WHEN YEAR(Sale_Date) = 2020 THEN 1 ELSE 0 END) as '2020 Purchases',
       SUM(CASE WHEN YEAR(Sale_Date) = 2021 THEN 1 ELSE 0 END) as '2021 Purchases',
       SUM(CASE WHEN YEAR(Sale_Date) = 2022 THEN 1 ELSE 0 END) as '2022 Purchases'
FROM Etsy_Sold_Orders
GROUP BY DATENAME(MONTH, Sale_Date)
ORDER BY Month

--order by month
SELECT 
    CASE DATEPART(MONTH, Sale_Date) 
        WHEN 1 THEN 'Jan'
        WHEN 2 THEN 'Feb'
        WHEN 3 THEN 'Mar'
        WHEN 4 THEN 'Apr'
        WHEN 5 THEN 'May'
        WHEN 6 THEN 'Jun'
        WHEN 7 THEN 'Jul'
        WHEN 8 THEN 'Aug'
        WHEN 9 THEN 'Sep'
        WHEN 10 THEN 'Oct'
        WHEN 11 THEN 'Nov'
        WHEN 12 THEN 'Dec'
    END as Month,
    SUM(CASE WHEN YEAR(Sale_Date) = 2020 THEN 1 ELSE 0 END) as '2020 Purchases',
    SUM(CASE WHEN YEAR(Sale_Date) = 2021 THEN 1 ELSE 0 END) as '2021 Purchases',
    SUM(CASE WHEN YEAR(Sale_Date) = 2022 THEN 1 ELSE 0 END) as '2022 Purchases'
FROM Etsy_Sold_Orders
GROUP BY DATEPART(MONTH, Sale_Date)
ORDER BY DATEPART(MONTH, Sale_Date)
--


--Which products sell the most?

SELECT TOP (20) Listing_ID, Item_Name, SUM(Quantity) as 'Total Quantity Sold'
FROM Etsy_Sold_Order_Items
GROUP BY Listing_ID, Item_Name
ORDER BY SUM(Quantity) DESC


--which/how many products have never sold?


SELECT Count(DISTINCT Listing_ID) AS 'Unique Item Sales'
FROM Etsy_Sold_Order_Items

--Total No. Of listings

Select COUNT(TITLE) AS 'Amount of listings'FROM Etsy_Listings

-- No. of new customers vs No. of Returning Customers

WITH customer_purchases AS (
    SELECT Buyer_Username, COUNT(*) as Purchases
    FROM Etsy_Direct_Checkout_Payments
    GROUP BY Buyer_Username
)

SELECT 
    SUM(CASE WHEN Purchases > 1 THEN 1 ELSE 0 END) AS 'Returning Customers',
    SUM(CASE WHEN Purchases = 1 THEN 1 ELSE 0 END) AS 'New Customers'
FROM customer_purchases

-- Location of purchasers

SELECT Ship_Country
,Ship_State
,Ship_City
,Ship_Zipcode
,COUNT(*) as 'Number of Orders'
FROM Etsy_Sold_Orders
GROUP BY Ship_Country
,Ship_State
,Ship_City
,Ship_Zipcode
ORDER BY 'Number of Orders' DESC