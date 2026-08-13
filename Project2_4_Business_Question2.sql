/*
Project2:  Sector Composition Analysis

Business question 2:
Which APAC country improved its GDP most consistently year on year — with fewest years of negative growth since 2010?
*/

WITH APAC_table AS( 
SELECT
    "Country Name" AS Country,
    "Country Code" AS Country_Code,
    "Indicator Name" AS Indicator_Name,
    "Indicator Code" AS Indicator_Code, 

    "2010","2011",     ROUND(("2011"-"2010")/"2010" *100, 2) AS improvment_2010_2011, 
    "2012",     ROUND(("2012"-"2011")/"2011" *100, 2) AS improvment_2011_2012,
    
    "2013",        ROUND(("2013"-"2012")/"2012" *100, 2) AS improvment_2012_2013,
    "2014",    ROUND(("2014"-"2013")/"2013" *100, 2) AS improvment_2013_2014,
    
    "2015",    ROUND(("2015"-"2014")/"2014" *100, 2) AS improvment_2014_2015,
    "2016",    ROUND(("2016"-"2015")/"2015" *100, 2) AS improvment_2015_2016,
    
    "2017",    ROUND(("2017"-"2016")/"2016" *100, 2) AS improvment_2016_2017,
    "2018",    ROUND(("2018"-"2017")/"2017" *100, 2) AS improvment_2017_2018,

    "2019",    ROUND(("2019"-"2018")/"2018" *100, 2) AS improvment_2018_2019,

    "2020",    ROUND(("2020"-"2019")/"2019" *100, 2) AS improvment_2019_2020,
    "2021",    ROUND(("2021"-"2020")/"2020" *100, 2) AS improvment_2020_2021,

    "2022",    ROUND(("2022"-"2021")/"2021" *100, 2) AS improvment_2021_2022,
    "2023",    ROUND(("2023"-"2022")/"2022" *100, 2) AS improvment_2022_2023
    

FROM read_csv_auto("D:\certification\sql project 2_4normally\dataset\All Countries and Economies GDP (US) 1960-2023.csv"

   , header = true
)
WHERE "Country Name" IN (
        'Australia', 'Singapore','Hong Kong',
        'Japan', 'New Zealand','China', 'Indonesia','Malaysia','Thailand','Vietnam'
    )
 )

 SELECT 
Country,  improvment_2010_2011,  improvment_2011_2012, improvment_2012_2013,  improvment_2013_2014,  improvment_2014_2015, 
 improvment_2015_2016,  improvment_2016_2017,  improvment_2017_2018,  improvment_2018_2019,  improvment_2019_2020, 
  improvment_2020_2021,  improvment_2021_2022,  improvment_2022_2023 

  FROM   APAC_table
;