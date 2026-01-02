--------------------------------------------------------------------------------------------------------------------------------------------------------------
														-- DATA PROFILING AND QUALITY CHECKS --
---------------------------------------------------------------------------------------------------------------------------------------------------------------



---------------------- CREATE AND USE DATABASE ---------------------------------------------------------------------------------------------------------------

CREATE DATABASE MUNICIPAL_ERP;
USE MUNICIPAL_ERP;

---------------------- IMPORT DATASET AS A FLAT FILE AND VIEW THE FULL TABLE-----------------------------------------------------------------------------------

SELECT * FROM dbo.stg_emp_remuneration;


------------------------ CHECK CURRENT DATA TYPES ------------------------------------------------------------------------------------------------------------

SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS 
	WHERE TABLE_SCHEMA = 'DBO' AND TABLE_NAME = 'stg_emp_remuneration';


------------------------- CHANGE THE TEXT DATA TYPE INTO NVARCHAR TYPE IN NAME, DEPARTMENT, AND TITLE COLUMNS --------------------------------------------------

ALTER TABLE DBO.stg_emp_remuneration ALTER COLUMN[NAME] NVARCHAR(200) NULL;
ALTER TABLE DBO.stg_emp_remuneration ALTER COLUMN[DEPARTMENT] NVARCHAR(200) NULL;
ALTER TABLE DBO.stg_emp_remuneration ALTER COLUMN[TITLE] NVARCHAR(200) NULL;


-------------------------- CHECK TOTAL ROW COUNT ---------------------------------------------------------------------------------------------------------------

SELECT COUNT(*) AS ROW_COUNT FROM DBO.stg_emp_remuneration;

--------------------------- CHECK THE YEAR RANGE OF THE RECORDS ------------------------------------------------------------------------------------------------

SELECT MIN([YEAR]) AS MIN_YEAR, MAX([YEAR]) AS MAX_YEAR FROM DBO.stg_emp_remuneration; 


-------------------------- HOW MANY ROWS PER YEAR --------------------------------------------------------------------------------------------------------------

SELECT [YEAR], COUNT(*) AS ROWS_PER_YEAR FROM DBO.stg_emp_remuneration GROUP BY [YEAR] ORDER BY [YEAR];


--------------------------- CHECK NULLS IN EACH COLUMN ----------------------------------------------------------------------------------------------------------



SELECT SUM(CASE WHEN [YEAR] IS NULL THEN 1 ELSE 0 END) AS YEAR_NULLS,
		SUM(CASE WHEN LTRIM(RTRIM([NAME])) = '' OR [NAME] IS NULL THEN 1 ELSE 0 END) NAME_NULLS,
		SUM(CASE WHEN LTRIM(RTRIM([DEPARTMENT])) = '' OR [DEPARTMENT] IS NULL THEN 1 ELSE 0 END) AS DEPT_NULLS,
		SUM(CASE WHEN LTRIM(RTRIM([TITLE])) = '' OR [TITLE] IS NULL THEN 1 ELSE 0 END) AS TITLE_NULLS,
		SUM(CASE WHEN [REMUNERATION] IS NULL THEN 1 ELSE 0 END) AS REM_NULLS,
		SUM(CASE WHEN [EXPENSES] IS NULL THEN 1 ELSE 0 END) AS EXP_NULLS
FROM DBO.stg_emp_remuneration;

-- 2412 RECORDS IN EXPENSES COLUMNS HAVE NULL VALUES --



--------------------- CHECK FOR NEGATIVE VALUES IN REMUNERATION AND EXPENSES COLUMNS -----------------------------------------------------------------------------


SELECT COUNT(*) AS NEG_VALUES FROM DBO.stg_emp_remuneration WHERE [REMUNERATION] < 0 OR [EXPENSES] < 0;



-- ALL THE VALUES ARE POSITIVE. CLEANING NOT NEEDED! --  

--------------------- FIND DUPLICATE RECORDS (YEAR + NAME + DEPARTMENT + TITLE) ---------------------------------------------------------------------------------

SELECT [YEAR], [NAME], [DEPARTMENT], [TITLE], COUNT(*) AS DUP_REC FROM DBO.stg_emp_remuneration 
		GROUP BY [YEAR], [NAME], [DEPARTMENT], [TITLE] HAVING COUNT(*)>1 ORDER BY DUP_REC;

-- THERE ARE DUPLICATE RECORDS IN THE DATASET. CLEANING IS NEEDED! --
