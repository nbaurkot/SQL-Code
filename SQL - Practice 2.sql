-- (a) Convert blanks to NULL (Prepare)
UPDATE [Restaurant - Master] 
SET [Meal Sides] = NULL 
WHERE [Meal Sides] = '';

UPDATE [Restaurant - Master] 
SET [Additional Details 1] = NULL 
WHERE [Additional Details 1] = '';

UPDATE [Restaurant - Master] 
SET [Additional Details 2] = NULL 
WHERE [Additional Details 2] = '';

UPDATE [Restaurant - Master] 
SET [Additional Details 3] = NULL 
WHERE [Additional Details 3] = '';

-- (b) Quick check of the table
SELECT * FROM [Restaurant - Master]

-- (1) ISNULL CODE
SELECT [Restaurant Name]
      ,[Meal Release Date]
      ,[Meal]
      ,[Meal Description]
      ,ISNULL([Meal Sides],'--N/A--') AS 'Meal Sides'
      ,[Cost]
      ,[Quantity]
      ,[Additional Details 1]
      ,[Additional Details 2]
      ,[Additional Details 3]
  FROM [dbo].[Restaurant - Master]

-- (2) COALESCE CODE
SELECT [Restaurant Name]
      ,[Meal Release Date]
      ,[Meal]
      ,[Meal Description]
      ,[Meal Sides]
      ,[Cost]
      ,[Quantity]
      ,[Additional Details 1]
      ,[Additional Details 2]
      ,[Additional Details 3]
	  ,COALESCE([Additional Details 1],[Additional Details 2],[Additional Details 3],'No Comment') AS [Meal Comment]
  FROM [dbo].[Restaurant - Master]

-- (3) CONVERSION -> STRING TO INT & DECIMAL
  SELECT [Restaurant Name]
        ,[Meal Release Date]
        ,[Meal]
        ,[Meal Description]
        ,[Meal Sides]
        ,CAST([Cost] AS decimal(18,2)) AS [Cost]
        ,CAST([Quantity] AS int) AS [Quantity]
        ,[Additional Details 1]
        ,[Additional Details 2]
        ,[Additional Details 3]
  FROM [dbo].[Restaurant - Master]

-- (4) CONVERSION -> STRING TO DATE
  SELECT [Restaurant Name]
        ,CONVERT(date,[Meal Release Date],103) AS [Meal Release Date]
        ,[Meal]
        ,[Meal Description]
        ,[Meal Sides]
        ,[Cost]
        ,[Quantity]
        ,[Additional Details 1]
        ,[Additional Details 2]
        ,[Additional Details 3]
  FROM [dbo].[Restaurant - Master]

-- (5) DATA CLEANSING (REPALCE FUNCTION)
    SELECT [Restaurant Name]
          ,[Meal Release Date]
          ,[Meal]
          ,[Meal Description]
          ,REPLACE([Meal Sides],'and','&') AS [Meal Sides]
          ,[Cost]
          ,[Quantity]
          ,[Additional Details 1]
          ,[Additional Details 2]
          ,[Additional Details 3]
  FROM [dbo].[Restaurant - Master]

-- (6) DATA CLEASING (BRINGING IT ALL TOGETHER)
  SELECT [Restaurant Name]
        ,[Meal Release Date]
        ,[Meal]
        ,[Meal Description]
        ,REPLACE( ISNULL([Meal Sides],'--N/A--') ,'and','&') AS [Meal Sides]
        ,CAST([Cost] AS decimal(18,2)) AS [Cost]
        ,CAST([Quantity] AS int) AS [Quantity]
	    ,COALESCE([Additional Details 1],[Additional Details 2],[Additional Details 3],'No Comment') AS [Meal Comment]
  INTO [Restaurant - Master (Cleansed)]
  FROM [dbo].[Restaurant - Master]


-- (7) WINDOW FUNCTION - INTRODUCE REVENUE COLUMN
    SELECT [Restaurant Name]
          ,[Meal Release Date]
          ,[Meal]
          ,[Meal Description]
          ,[Meal Sides]
          ,[Cost]
          ,[Quantity]
		  ,([Quantity]*[Cost]) AS [Revenue]
		  ,[Meal Comment]
  INTO [dbo].[Restaurant - Master (Cleansed) - Revenue]
  FROM [dbo].[Restaurant - Master (Cleansed)]



-- (8) WINDOW FUNCTION - ROW COUNT
  SELECT ROW_NUMBER() 
			OVER (ORDER BY [Restaurant Name]) 
				 AS [Row Number]
	    ,[Restaurant Name]
        ,[Meal Release Date]
        ,[Meal]
        ,[Meal Description]
        ,[Meal Sides]
        ,[Cost]
        ,[Quantity]
		,[Revenue]
		,[Meal Comment]
  FROM [dbo].[Restaurant - Master (Cleansed) - Revenue]
  
-- (9) WINDOW FUNCTION - RANK
  SELECT [Restaurant Name]
        ,[Meal Release Date]
        ,[Meal]
        ,[Meal Description]
        ,[Meal Sides]
        ,[Cost]
        ,[Quantity]
		,[Revenue]
		,RANK() 
			OVER (ORDER BY [Revenue] DESC) 
				 AS [Rank]
		,[Meal Comment]
  FROM [dbo].[Restaurant - Master (Cleansed) - Revenue]

-- (10) WINDOW FUNCTION - RANK (Introducing PARTITION)
  SELECT [Restaurant Name]
        ,[Meal Release Date]
        ,[Meal]
        ,[Meal Description]
        ,[Meal Sides]
        ,[Cost]
        ,[Quantity]
		,[Revenue]
        ,RANK() 
			OVER (PARTITION BY [Restaurant Name] 
				  ORDER BY [Revenue] DESC)
				  AS [Meal Rank]
		,[Meal Comment]
  FROM [dbo].[Restaurant - Master (Cleansed) - Revenue]

-- (11) RUNNING TOTAL
  SELECT [Restaurant Name]
        ,[Meal Release Date]
        ,[Meal]
        ,[Meal Description]
        ,[Meal Sides]
        ,[Cost]
        ,[Quantity]
		,[Revenue]
		,SUM([Revenue]) 
			OVER (ORDER BY [Revenue]) 
				 AS [Overall Running Total]
		,[Meal Comment]
  FROM [dbo].[Restaurant - Master (Cleansed) - Revenue]


-- (12) RUNNING TOTAL (PARTITION)
  SELECT [Restaurant Name]
        ,[Meal Release Date]
        ,[Meal]
        ,[Meal Description]
        ,[Meal Sides]
        ,[Cost]
        ,[Quantity]
		,[Revenue]
		,SUM([Revenue]) 
			OVER (PARTITION BY [Restaurant Name] 
			ORDER BY [Revenue]) 
			AS [Restaunt Running Total]
		,[Meal Comment]
  FROM [dbo].[Restaurant - Master (Cleansed) - Revenue]

-- (13) SUBQUERY (INTO)
SELECT A.* 
INTO [Pay - Appended]
FROM 
	(
	  SELECT [Name]
			,[Pay]
	  FROM [dbo].[Female Pay]
  
	  UNION ALL
  
	  SELECT [Name]
			,[Pay]
	  FROM [dbo].[Male Pay] 
	) AS A


-- (14) SUBQUERY (Filtering)
	SELECT A.[Restaurant Name]
          ,A.[Meal Release Date]
          ,A.[Meal]
          ,A.[Meal Description]
          ,A.[Meal Sides]
          ,A.[Cost]
          ,A.[Quantity]
          ,A.[Revenue]
          ,A.[Meal Comment]
    FROM [Restaurant - Master (Cleansed) - Revenue] as A
	WHERE [Restaurant Name] IN (SELECT B.[Restaurant]
							   FROM [Restaurant - Customer Reach] as B
							   WHERE [Customer %] > 20) 


-- (15) VIEWS
    CREATE VIEW [Missing Meal Sides]
	AS 
	SELECT [Restaurant Name]
          ,[Meal Release Date]
          ,[Meal]
          ,[Meal Description]
          ,[Meal Sides]
          ,[Cost]
          ,[Quantity]
          ,[Revenue]
          ,[Meal Comment]
	FROM [Restaurant - Master (Cleansed) - Revenue]
	WHERE [Meal Sides] = '--N/A--'
 
-- (16) SELECTING THE VIEW
  SELECT *
  FROM [Missing Meal Sides]

-- (17) CHECKING FOR DUPLICATES
  SELECT [Restaurant]
        ,[Ranking]
        ,[Description]
	    ,COUNT(*) AS [Row Count]
  FROM [Restaurant Rankings (Duplicates)]
  GROUP BY [Restaurant]
          ,[Ranking]
          ,[Description]
  HAVING COUNT(*) > 1


-- (18) VARIABLE (Filter)
  DECLARE @restaurant nvarchar(100)
   
  SET @restaurant = 'Data Pizza'

  	SELECT [Restaurant Name]
          ,[Meal Release Date]
          ,[Meal]
          ,[Meal Description]
          ,[Meal Sides]
          ,[Cost]
          ,[Quantity]
          ,[Revenue]
          ,[Meal Comment]
	FROM [Restaurant - Master (Cleansed) - Revenue]
	WHERE [Restaurant Name] = @Restaurant

-- (19) VARIABLE (Table)
  DECLARE @table nvarchar(100) 
  DECLARE @filter nvarchar(100)
  DECLARE @SQL_query nvarchar(max)

  SET @table = '[Restaurant - Master (Cleansed) - Revenue]'
  SET @filter = 'Data Pizza'
  SET @SQL_query = '

  	SELECT [Restaurant Name]
          ,[Meal Release Date]
          ,[Meal]
          ,[Meal Description]
          ,[Meal Sides]
          ,[Cost]
          ,[Quantity]
          ,[Revenue]
          ,[Meal Comment]
	FROM ' + @table + ' 
	WHERE [Restaurant Name] = ''' + @filter + ''' 
	ORDER BY [Revenue] 
	
	'

  PRINT @SQL_query 
  EXEC (@SQL_query)

-- (20) STORED PROCEDURE (STORING CODE)
  CREATE PROCEDURE [Duplicate Code]
  AS

  SELECT [Restaurant]
        ,[Ranking]
        ,[Description]
	    ,COUNT(*) AS [Row Count]
  FROM [Restaurant Rankings (Duplicates)]
  GROUP BY [Restaurant]
          ,[Ranking]
          ,[Description]
  HAVING COUNT(*) > 1

-- (21) STORED PROCEDURE (Variable)
  CREATE PROCEDURE [Restaurant Select]
	@Restaurant nvarchar(100)
  AS
    
	SELECT [Restaurant Name]
          ,[Meal Release Date]
          ,[Meal]
          ,[Meal Description]
          ,[Meal Sides]
          ,[Cost]
          ,[Quantity]
          ,[Revenue]
          ,[Meal Comment]
	FROM [Restaurant - Master (Cleansed) - Revenue]
	WHERE [Restaurant Name] = @Restaurant

-- (22) RUNNING STORED PROCEDURE
  
    EXEC  [dbo].[Restaurant Select]
		  @Restaurant = 'Big Data Burger'