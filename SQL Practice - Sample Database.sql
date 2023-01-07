--Selecting Columns using *
SELECT *
FROM [dbo].[Melbourne Housing Master] 

--Selecting columns by listing
SELECT [Suburb]
      ,[Address]
      ,[Rooms]
      ,[Type]
      ,[Price]
      ,[Suburb Price Average]
      ,[Final Price]
      ,[Method]
      ,[SellerG]
      ,[Date]
      ,[Distance]
      ,[Postcode]
      ,[Bedroom2]
      ,[Bathroom]
      ,[Car]
      ,[Landsize]
      ,[BuildingArea]
      ,[YearBuilt]
      ,[CouncilArea]
      ,[Latitude]
      ,[Longitude]
      ,[Regionname]
      ,[Propertycount]
  FROM [dbo].[Melbourne Housing Master] 

--Renaming Columns
SELECT [Suburb]   AS [Suburb Name]
      ,[Address]  AS [Property Address] 
      ,[Rooms]    AS [No. of Rooms]
      ,[Type]     AS [Property Type]
FROM [dbo].[Melbourne Housing Master]

--Mathematical Operations
SELECT [Suburb]   
      ,[Rooms]   
      ,([Final Price] / 1000) AS [Price (000)]
FROM [dbo].[Melbourne Housing Master]

--String Operations 
SELECT [Suburb]   
      ,[Address]   
      ,[Suburb] + ' - ' + [Address] AS [Suburb - Address] 
FROM [dbo].[Melbourne Housing Master]

--Selecting a small sample
SELECT top(10) *
FROM [dbo].[Melbourne Housing Master] 

--Using the WHERE statement (Simple filter - String)
SELECT [Suburb]
      ,[Address]
      ,[Rooms]
      ,[Type]
      ,[Price]
      ,[Suburb Price Average]
      ,[Final Price]
      ,[Method]
      ,[SellerG]
      ,[Date]
      ,[Distance]
      ,[Postcode]
      ,[Bedroom2]
      ,[Bathroom]
      ,[Car]
      ,[Landsize]
      ,[BuildingArea]
      ,[YearBuilt]
      ,[CouncilArea]
      ,[Latitude]
      ,[Longitude]
      ,[Regionname]
      ,[Propertycount]
  FROM [dbo].[Melbourne Housing Master]
  WHERE [Suburb] = 'Werribee'


--Using the WHERE statement (Simple filter - Number)
SELECT [Suburb]
      ,[Address]
      ,[Rooms]
      ,[Type]
      ,[Price]
      ,[Suburb Price Average]
      ,[Final Price]
      ,[Method]
      ,[SellerG]
      ,[Date]
      ,[Distance]
      ,[Postcode]
      ,[Bedroom2]
      ,[Bathroom]
      ,[Car]
      ,[Landsize]
      ,[BuildingArea]
      ,[YearBuilt]
      ,[CouncilArea]
      ,[Latitude]
      ,[Longitude]
      ,[Regionname]
      ,[Propertycount]
  FROM [dbo].[Melbourne Housing Master]
  WHERE [Rooms] = 4


--Using the WHERE statement (Simple filter - Date)
SELECT [Suburb]
      ,[Address]
      ,[Rooms]
      ,[Type]
      ,[Price]
      ,[Suburb Price Average]
      ,[Final Price]
      ,[Method]
      ,[SellerG]
      ,[Date]
      ,[Distance]
      ,[Postcode]
      ,[Bedroom2]
      ,[Bathroom]
      ,[Car]
      ,[Landsize]
      ,[BuildingArea]
      ,[YearBuilt]
      ,[CouncilArea]
      ,[Latitude]
      ,[Longitude]
      ,[Regionname]
      ,[Propertycount]
  FROM [dbo].[Melbourne Housing Master]
  WHERE [Date] = '2017-06-24'


--Filtering on multiple conditions (using AND)
SELECT [Suburb]
      ,[Address]
      ,[Rooms]
      ,[Type]
      ,[Price]
      ,[Suburb Price Average]
      ,[Final Price]
      ,[Method]
      ,[SellerG]
      ,[Date]
      ,[Distance]
      ,[Postcode]
      ,[Bedroom2]
      ,[Bathroom]
      ,[Car]
      ,[Landsize]
      ,[BuildingArea]
      ,[YearBuilt]
      ,[CouncilArea]
      ,[Latitude]
      ,[Longitude]
      ,[Regionname]
      ,[Propertycount]
  FROM [dbo].[Melbourne Housing Master]
  WHERE [Suburb] = 'Werribee'
    AND [Rooms] = 4
    AND [Date] = '2017-06-24'

--Filtering on multiple conditions (using OR)
SELECT [Suburb]
      ,[Address]
      ,[Rooms]
      ,[Type]
      ,[Price]
      ,[Suburb Price Average]
      ,[Final Price]
      ,[Method]
      ,[SellerG]
      ,[Date]
      ,[Distance]
      ,[Postcode]
      ,[Bedroom2]
      ,[Bathroom]
      ,[Car]
      ,[Landsize]
      ,[BuildingArea]
      ,[YearBuilt]
      ,[CouncilArea]
      ,[Latitude]
      ,[Longitude]
      ,[Regionname]
      ,[Propertycount]
  FROM [dbo].[Melbourne Housing Master]
  WHERE [Suburb] = 'Werribee'
    OR [Suburb] = 'Preston'


--Combining AND & OR statements together
SELECT [Suburb]
      ,[Address]
      ,[Rooms]
      ,[Type]
      ,[Price]
      ,[Suburb Price Average]
      ,[Final Price]
      ,[Method]
      ,[SellerG]
      ,[Date]
      ,[Distance]
      ,[Postcode]
      ,[Bedroom2]
      ,[Bathroom]
      ,[Car]
      ,[Landsize]
      ,[BuildingArea]
      ,[YearBuilt]
      ,[CouncilArea]
      ,[Latitude]
      ,[Longitude]
      ,[Regionname]
      ,[Propertycount]
  FROM [dbo].[Melbourne Housing Master]
  WHERE [Rooms] = 4 
    AND ([Suburb] = 'Werribee' OR [Suburb] = 'Preston') 

-- IN statement (date)
SELECT [Suburb]
      ,[Address]
      ,[Rooms]
      ,[Type]
      ,[Price]
      ,[Suburb Price Average]
      ,[Final Price]
      ,[Method]
      ,[SellerG]
      ,[Date]
      ,[Distance]
      ,[Postcode]
      ,[Bedroom2]
      ,[Bathroom]
      ,[Car]
      ,[Landsize]
      ,[BuildingArea]
      ,[YearBuilt]
      ,[CouncilArea]
      ,[Latitude]
      ,[Longitude]
      ,[Regionname]
      ,[Propertycount]
FROM [Melbourne Housing Master]
WHERE [Date] IN ('2017-10-14','2018-01-06')

--IN statement (Number)
SELECT [Suburb]
      ,[Address]
      ,[Rooms]
      ,[Type]
      ,[Price]
      ,[Suburb Price Average]
      ,[Final Price]
      ,[Method]
      ,[SellerG]
      ,[Date]
      ,[Distance]
      ,[Postcode]
      ,[Bedroom2]
      ,[Bathroom]
      ,[Car]
      ,[Landsize]
      ,[BuildingArea]
      ,[YearBuilt]
      ,[CouncilArea]
      ,[Latitude]
      ,[Longitude]
      ,[Regionname]
      ,[Propertycount]
FROM [Melbourne Housing Master]
WHERE [Rooms] IN (3,4)

--IN statement (string)
SELECT [Suburb]
      ,[Address]
      ,[Rooms]
      ,[Type]
      ,[Price]
      ,[Suburb Price Average]
      ,[Final Price]
      ,[Method]
      ,[SellerG]
      ,[Date]
      ,[Distance]
      ,[Postcode]
      ,[Bedroom2]
      ,[Bathroom]
      ,[Car]
      ,[Landsize]
      ,[BuildingArea]
      ,[YearBuilt]
      ,[CouncilArea]
      ,[Latitude]
      ,[Longitude]
      ,[Regionname]
      ,[Propertycount]
FROM [Melbourne Housing Master]
WHERE [Suburb] IN ('Werribee','Preston')


--LIKE statement 1
SELECT [Suburb]
      ,[Address]
      ,[Rooms]
      ,[Type]
      ,[Price]
      ,[Suburb Price Average]
      ,[Final Price]
      ,[Date]
      ,[Distance]
      ,[Postcode]
      ,[Bedroom2]
      ,[Bathroom]
      ,[Car]
FROM [Melbourne Housing Master]
WHERE [Address] LIKE ('%St')

--LIKE statement 2
SELECT [Suburb]
      ,[Address]
      ,[Rooms]
      ,[Type]
      ,[Price]
      ,[Suburb Price Average]
      ,[Final Price]
      ,[Date]
      ,[Distance]
      ,[Postcode]
      ,[Bedroom2]
      ,[Bathroom]
      ,[Car]
FROM [Melbourne Housing Master]
WHERE [Address] LIKE ('%Ash%') 

--LIKE statement 3
SELECT [Suburb]
      ,[Address]
      ,[Rooms]
      ,[Type]
      ,[Price]
      ,[Suburb Price Average]
      ,[Final Price]
      ,[Date]
      ,[Distance]
      ,[Postcode]
      ,[Bedroom2]
      ,[Bathroom]
      ,[Car]
FROM [Melbourne Housing Master]
WHERE [Address] LIKE ('17%') 

--Advanced Filter 1
SELECT [Suburb]
      ,[Address]
      ,[Rooms]
      ,[Type]
      ,[Price]
      ,[Final Price]
      ,[Date]
      ,[Distance]
      ,[Postcode]
      ,[Bedroom2]
      ,[Bathroom]
      ,[Car]
FROM [Melbourne Housing Master]
WHERE [Address] LIKE ('[0-9]%')

--Advanced Filter 2
SELECT [Suburb]
      ,[Address]
      ,[Rooms]
      ,[Type]
      ,[Price]
      ,[Final Price]
      ,[Date]
      ,[Distance]
      ,[Postcode]
      ,[Bedroom2]
      ,[Bathroom]
      ,[Car]
FROM [Melbourne Housing Master]
WHERE [Address] LIKE ('%[a-z]')

--NOT (string)
SELECT [Suburb]
      ,[Address]
      ,[Rooms]
      ,[Type]
      ,[Final Price]
FROM [Melbourne Housing Master]
WHERE [Address] NOT LIKE ('%St')

--Not (Numeric)
SELECT [Suburb]
      ,[Address]
      ,[Rooms]
      ,[Type]
      ,[Final Price]
FROM [Melbourne Housing Master]
WHERE [Rooms] NOT IN (3,4)

SELECT [Suburb]
      ,[Address]
      ,[Rooms]
      ,[Type]
      ,[Price]
      ,[Final Price]
      ,[Method]
      ,[SellerG]
      ,[Date]
      ,[Distance]
      ,[Postcode]
      ,[Bedroom2]
      ,[Bathroom]
      ,[Car]
  INTO [Results 0001]
  FROM [Melbourne Housing Master]
  WHERE [Distance] < 3

  --ORDER BY ASCENDING
SELECT [Suburb]
      ,[Rooms]
      ,[Final Price]
FROM [Melbourne Housing Master]
ORDER BY [Suburb] ASC

--ORDER BY DESCENDING
SELECT [Suburb]
      ,[Rooms]
      ,[Final Price]
FROM [Melbourne Housing Master]
ORDER BY [Final Price] DESC

--ORDER BY MULTIPLE FIELDS
SELECT [Suburb]
      ,[Rooms]
      ,[Final Price]
FROM [Melbourne Housing Master]
ORDER BY [Suburb] ASC
        ,[Rooms]  DESC

--COUNT
SELECT [Name]
      ,COUNT([Name]) AS [Count]
FROM [Pay - Female]
GROUP BY [Name]

--SUM
SELECT [Name]
      ,SUM([Pay]) AS [Pay (Sum)]
FROM [Pay - Female]
GROUP BY [Name]

--AVG
SELECT [Name]
      ,AVG([Pay]) AS [Pay (Average)]
FROM [Pay - Female]
GROUP BY [Name]

--MAX, MIN and Range
SELECT [Name]
      ,MAX([Pay]) AS [Max Pay]
      ,MIN([Pay]) AS [Min Pay]
      ,(MAX([Pay]) - MIN([Pay])) AS [Pay Range]
FROM [Pay - Female]
GROUP BY [Name]

--Final report
SELECT [Name]
      ,SUM([Pay]) AS [Pay (Sum)]
      ,COUNT([Name]) AS [Count]
      ,AVG([Pay]) AS [Pay (Average)]
      ,MAX([Pay]) AS [Max Pay]
      ,MIN([Pay]) AS [Min Pay]
      ,(MAX([Pay]) - MIN([Pay])) AS [Pay Range]
FROM [Pay - Female]
GROUP BY [Name]

--HAVING Example 1
SELECT [Name]
      ,SUM([Pay]) AS [Pay (Sum)]
FROM [Pay - Female]
GROUP BY [Name]
HAVING SUM([Pay]) > 6000


--HAVING Example 2
SELECT [Name]
      ,COUNT([Name]) AS [Count]
FROM [Pay - Female]
GROUP BY [Name]
HAVING COUNT([Name]) <> 3


--HAVING and WHERE
SELECT [Name]
      ,SUM([Pay]) AS [Pay]
FROM [dbo].[Pay - Female]
WHERE [Name] IN ('Rachel','Monica')
GROUP BY [NAME]
HAVING SUM([Pay]) > 50000

--Popultion CASE Statement
SELECT [Country]
  ,[Population]
  ,[Year]
  ,CASE WHEN [Country] = 'Brazil' THEN 'TRUE'
     WHEN [Country] = 'Ecuador' THEN 'TRUE'
     ELSE 'FALSE'
END AS [Flag - SA]
  ,CASE WHEN [Population] > 100000000 THEN 'High'
     WHEN [Population] BETWEEN  10000000 
       AND 100000000 THEN 'Medium'
     WHEN [Population] < 10000000 THEN 'Low'
       ELSE 'N/A'
     END AS [Category Population] 
FROM [dbo].[Country Population]


--Housing CASE statement
SELECT [Suburb]
      ,[Address]
      ,[Rooms]
      ,[Final Price]
      ,[Car]
  ,CASE WHEN [Rooms] > 4 THEN 'High'
     WHEN [Rooms] < 3 THEN 'Low'
     ELSE 'Medium'
     END AS [Category - Rooms]
  ,CASE WHEN [Car] = 0 THEN 'No'
     ELSE 'Yes'
     END AS [Flag - Car]
FROM [Melbourne Housing Master]


--Putting results into a table
SELECT [Suburb]
      ,[Address]
      ,[Rooms]
      ,[Final Price]
      ,[Car]
  ,CASE WHEN [Rooms] > 4 THEN 'High'
     WHEN [Rooms] < 3 THEN 'Low'
     ELSE 'Medium'
     END AS [Category - Rooms]
  ,CASE WHEN [Car] = 0 THEN 'No'
     ELSE 'Yes'
     END AS [Flag - Car]
INTO [Case - results]
FROM [Melbourne Housing Master]


--Filtering on the table
SELECT [Suburb]
      ,[Address]
      ,[Rooms]
      ,[Final Price]
      ,[Car]
      ,[Category - Rooms]
      ,[Flag - Car]
  FROM [Case - results]
  WHERE [Category - Rooms] = 'Medium'
    AND [Flag - Car] = 'Yes'

--Appending 
SELECT [Name]
      ,[Pay]
FROM [dbo].[Pay - Female]

UNION ALL

SELECT [Name]
      ,[Pay]
FROM [dbo]. [Pay - Male]

--Appending (Removing duplicates)
SELECT [Name]
      ,[Pay]
FROM [dbo].[Pay - Female]

UNION

SELECT [Name]
      ,[Pay]
FROM [dbo]. [Pay - Male]

--INNER Join
SELECT A.[Shop ID]
      ,A.[Shop Name]
      ,A.[Shop Region]
      ,A.[Revenue]
      ,A.[Profit]
      ,B.[No  of Employees]
      ,B.[Shop Size (Square Ft)]
FROM [Joins - 1 Key - Table 1] AS A
INNER JOIN [Joins - 1 Key - Table 2 - Inner] AS B
  ON A.[Shop ID] = B.[Shop ID]

 --LEFT Join
SELECT A.[Shop ID]
      ,A.[Shop Name]
      ,A.[Shop Region]
      ,A.[Revenue]
      ,A.[Profit]
      ,B.[No  of Employees]
      ,B.[Shop Size (Square Ft)]
FROM [Joins - 1 Key - Table 1] AS A
LEFT JOIN [Joins - 1 Key - Table 2 - Left] AS B
  ON A.[Shop ID] = B.[Shop ID]

--RIGHT Join
SELECT A.[Shop ID]
      ,A.[Shop Name]
      ,A.[Shop Region]
      ,A.[Revenue]
      ,A.[Profit]
      ,B.[No  of Employees]
      ,B.[Shop Size (Square Ft)]
FROM [Joins - 1 Key - Table 1] AS A
RIGHT JOIN [Joins - 1 Key - Table 2 - Right] AS B
  ON A.[Shop ID] = B.[Shop ID]

--FULL OUTER Join
SELECT A.[Shop ID]
      ,A.[Shop Name]
      ,A.[Shop Region]
      ,A.[Revenue]
      ,A.[Profit]
  ,B.[No  of Employees]
  ,B.[Shop Size (Square Ft)]
FROM [Joins - 1 Key - Table 1] AS A
FULL OUTER JOIN [Joins - 1 Key - Table 2 - Outer] AS B
  ON A.[Shop ID] = B.[Shop ID]

--UNMATCHING Join
SELECT A.[Shop ID]
      ,A.[Shop Name]
      ,A.[Shop Region]
      ,A.[Revenue]
      ,A.[Profit]
  ,B.[No  of Employees]
  ,B.[Shop Size (Square Ft)]
FROM [Joins - 1 Key - Table 1] AS A
FULL OUTER JOIN [Joins - 1 Key - Table 2 - Outer] AS B
  ON A.[Shop ID] = B.[Shop ID]
WHERE A.[Shop ID] IS NULL
   OR B.[Shop ID] IS NULL

--Joining using multiple fields
SELECT A.[Shop ID]
      ,A.[Shop Name]
      ,A.[Shop Region]
      ,A.[Revenue]
      ,A.[Profit]
      ,B.[No  of Employees]
      ,B.[Shop Size (Square Ft)]
FROM [Joins - 2 Keys - Table 1] AS A
LEFT JOIN [Joins - 2 Keys - Table 2] AS B
  ON A.[Shop ID] = B.[Shop ID]
  AND A.[Department] = B.[Department]

  --USE and GO
USE [SQL - Core]
GO

SELECT [Name]
      ,COUNT([Name]) AS [Count]
FROM [Pay - Female]
GROUP BY [Name]

--DROP Table
USE [SQL - Core]
GO

DROP TABLE [Pay - Female_]