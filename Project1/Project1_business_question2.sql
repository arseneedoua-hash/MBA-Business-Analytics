/*Which African Country has improved fastest since 2010 and Which one is stagnating?*/

WITH base AS( 
SELECT 

entity AS COUNTRY, 
year AS YEAR,
ROUND("Access to electricity (% of population)",2) AS PERCENTAGE_ACCESS_TO_ELECTRICITY,
ROUND(
    LAG("Access to electricity (% of population)") OVER (PARTITION BY entity ORDER BY year
    ), 
     2
     ) AS YEAR_2010_ACCESS_TO_ELECTRICITY,
     

     ( 
       ( "Access to electricity (% of population)"  -
       LAG("Access to electricity (% of population)") OVER (PARTITION BY entity ORDER BY year ) )
         / NULLIF(
    LAG("Access to electricity (% of population)") OVER (PARTITION BY entity ORDER BY year),0
     ) )*100 AS PERCENTAGE_CHANGE_FROM_2010_TO_2020

          
FROM "D:\certification\sql project1\archive\access_to_electricity_by_country.csv"

WHERE "Access to electricity (% of population)" IS NOT NULL
AND YEAR IN(2010, 2020)
AND Entity IN (
    'Chad','Guinea-Bissau','Zimbabwe','Angola','Equatorial Guinea','Eswatini',
'Sierra Leone','Benin','Lesotho','Namibia','Cape Verde','Comoros','Central African Republic',
'Ghana','Niger','Algeria','Burundi','Gambia','Kenya','Lybia','Mali','Mauritania','Mauritius',
'Sudan','Tanzania','Tunisia','Uganda','Congo','Ethiopia','Madagascar','Morocco','Mozambique'
,'Eritrea','Gabon','Malawi','South Sudan','Somalia','Botswana','Burkina Faso','Liberia',
'Seychelles','South Africa','Cameroon','Democratic Republic of Congo','Guinea','Nigeria'
,'Egypt','Senegal','Togo','Zambia','Rwanda','Cote d''Ivoire')

)
SELECT * ,
DENSE_RANK() OVER ( ORDER BY PERCENTAGE_CHANGE_FROM_2010_TO_2020 DESC )  AS ROW_NUMBER
FROM base
ORDER BY COUNTRY, YEAR
;


