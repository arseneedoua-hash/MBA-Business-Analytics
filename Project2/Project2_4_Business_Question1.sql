/*
Project2:  Sector Composition Analysis

Business Question 1: How do Australia, Singapore, Japan and New Zealand rank on total GDP and 
GDP growth rate over the last decade — and which market is growing fastest? 
*/
WITH ranked_2023 AS ( 
SELECT *,
ROW_NUMBER() OVER (ORDER BY "2023" DESC) AS Rank_GDP_2023,
 ROUND((("2023" - "2013") / "2023") * 100, 4) AS GDP_Growth_Rate_2013_2023,
 ROW_NUMBER() OVER(ORDER BY GDP_Growth_Rate_2013_2023 DESC) AS Rank_GDP_Growth_Rate_2013_2023


FROM read_csv_auto ("D:\certification\sql project 2_4normally\dataset\All Countries and Economies GDP (US) 1960-2023.csv"
, header =TRUE) 

  )
 SELECT *,
FROM ranked_2023
WHERE "Country Name" IN ('Australia', 'Singapore', 'Japan', 'New Zealand')
;
