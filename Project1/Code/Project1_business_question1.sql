/*Where does each African country stand today on electricity access — and how severe 
is the gap?*/
SELECT 

       entity AS COUNTRY, 
       year AS YEAR, 
     ROUND("Access to electricity (% of population)",2) AS PERCENTAGE_ACCESS_TO_ELECTRICITY,
      ROUND(100 - "Access to electricity (% of population)",2)AS GAP_TO_ELECTRICITY_ACCESS,




CASE
    WHEN 100 - "Access to electricity (% of population)" < 25 THEN 'Mild'
    WHEN 100 - "Access to electricity (% of population)" BETWEEN 25 AND 50 THEN 'Moderate'
    WHEN 100 - "Access to electricity (% of population)" BETWEEN 50 AND 75 THEN 'Severe'
    WHEN 100 - "Access to electricity (% of population)" > 75 THEN 'Critical'
    ELSE 'Data Not Available'
END AS GAP_SEVERITY

FROM "D:\certification\sql project1\archive\access_to_electricity_by_country.csv"

WHERE "Access to electricity (% of population)" IS NOT NULL

AND YEAR = 2020

AND Entity IN('Chad','Guinea-Bissau','Zimbabwe','Angola','Equatorial Guinea','Eswatini',
'Sierra Leone','Benin','Lesotho','Namibia','Cape Verde','Comoros','Central African Republic',
'Ghana','Niger','Algeria','Burundi','Gambia','Kenya','Lybia','Mali','Mauritania','Mauritius',
'Sudan','Tanzania','Tunisia','Uganda','Congo','Ethiopia','Madagascar','Morocco','Mozambique'
,'Eritrea','Gabon','Malawi','South Sudan','Somalia','Botswana','Burkina Faso','Liberia',
'Seychelles','South Africa','Cameroon','Democratic Republic of Congo','Guinea','Nigeria'
,'Egypt','Senegal','Togo','Zambia','Rwanda','Cote d''Ivoire')
ORDER BY GAP_TO_ELECTRICITY_ACCESS ASC;
