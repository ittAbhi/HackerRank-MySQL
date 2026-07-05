-- SELECT CITY.NAME FROM CITY 
-- -- here, name is in both table, so we write city.name
-- JOIN COUNTRY
-- ON CITY.CountryCode = COUNTRY.Code
-- -- WHERE CONTINENT='AFRICA'
-- -- It is better
-- WHERE COUNTRY.Continent = 'Africa'


-- -- // with alias
-- SELECT c.Name
-- FROM CITY AS c
-- JOIN COUNTRY AS co
-- ON c.CountryCode = co.Code
-- WHERE co.Continent = 'Africa';

--  with alias but if we remove as still its same
SELECT c.Name
FROM CITY c
JOIN COUNTRY co
ON c.CountryCode = co.Code
WHERE co.Continent = 'Africa';
