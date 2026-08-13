/*How has the African continent's average electricity access 
evolved decade by decade — and is the pace of improvement accelerating or slowing?*/
SELECT 
CASE
    WHEN YEAR BETWEEN 2000 AND 2009 THEN '2000s'
    WHEN YEAR BETWEEN 2010 AND 2019 THEN '2010s'
    ELSE 'Post_2020'
END AS DECADE,
AVG("Access to electricity (% of population)") AS AVERAGE_ACCESS_TO_ELECTRICITY
FROM "D:\certification\sql project1\archive\access_to_electricity_by_country.csv"

WHERE "Access to electricity (% of population)" IS NOT NULL
AND YEAR >=2000

AND Entity IN('Chad','Guinea-Bissau','Zimbabwe','Angola','Equatorial Guinea','Eswatini',
'Sierra Leone','Benin','Lesotho','Namibia','Cape Verde','Comoros','Central African Republic',
'Ghana','Niger','Algeria','Burundi','Gambia','Kenya','Lybia','Mali','Mauritania','Mauritius',
'Sudan','Tanzania','Tunisia','Uganda','Congo','Ethiopia','Madagascar','Morocco','Mozambique'
,'Eritrea','Gabon','Malawi','South Sudan','Somalia','Botswana','Burkina Faso','Liberia',
'Seychelles','South Africa','Cameroon','Democratic Republic of Congo','Guinea','Nigeria'
,'Egypt','Senegal','Togo','Zambia','Rwanda','Cote d''Ivoire')
GROUP BY DECADE
;
