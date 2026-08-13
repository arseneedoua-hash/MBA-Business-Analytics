/*
Project2:  Sector Composition Analysis

Business question 3: How does the sector composition — agriculture, industry, services — compare across 
your four target markets and which has the highest services share signaling strongest consulting demand?
 */
WITH evaluation_table  AS (
    
SELECT
    "Country/Economy" AS Country,
    TRY_CAST(
        REPLACE(REPLACE("GDP (millions of $)", ',', ''), '$', '') AS DOUBLE) AS GDP,

    TRY_CAST(
        REPLACE(REPLACE("Agriculture GDP", ',', ''), '$', '') AS DOUBLE) AS agriculture_GDP,
    ROW_NUMBER() OVER (ORDER BY "Agriculture GDP" DESC) AS agriculture_rank,

    TRY_CAST(
        REPLACE(REPLACE("Industry GDP", ',', ''), '$', '') AS DOUBLE) AS industry_GDP,
    ROW_NUMBER() OVER (ORDER BY "Industry GDP" DESC) AS industry_rank,


    TRY_CAST(
        REPLACE(REPLACE("Services GDP", ',', ''), '$', '') AS DOUBLE) AS services_GDP,
    ROW_NUMBER() OVER (ORDER BY "Services GDP" DESC) AS services_rank

FROM read_csv_auto(
    'D:\certification\sql project 2_4normally\dataset2_update\List of Countries by GDP Sector Composition_header_updated.csv',
    header = true
)
WHERE "Country/Economy" IN ('China', 'New Zealand', 'Japan', 'Australia', 'Hong Kong')

              ),

average_table AS (
    SELECT 

AVG(GDP) AS avg_GDP,
AVG(agriculture_GDP) AS avg_agriculture_GDP,
AVG(industry_GDP) AS avg_industry_GDP,
AVG(services_GDP) AS avg_services_GDP
FROM evaluation_table
 )
 
 SELECT
 'Agriculture' AS Sector, avg_agriculture_GDP AS Value FROM average_table  
  UNION ALL
    SELECT
 'Industry' AS Sector, avg_industry_GDP AS Value FROM average_table
  UNION ALL
    SELECT
 'Services' AS Sector, avg_services_GDP AS Value FROM average_table

 ORDER BY Value DESC
 
 ;
