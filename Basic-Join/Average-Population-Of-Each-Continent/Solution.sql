-- SELECT 
-- COUNTRY.Continent,
-- Floor(AVG(CITY.Population))
-- FROM CITY
-- JOIN COUNTRY
-- ON CITY.CountryCode = COUNTRY.Code
-- GROUP BY COUNTRY.Continent

-- SELECT 
-- C.Continent,
-- FLOOR(AVG(CT.Population))
-- FROM CITY AS CT
-- JOIN COUNTRY AS C
-- ON CT.CountryCode = C.code
-- GROUP BY C.Continent

SELECT
    -- Name of the continent
    C.Continent,
    -- Calculate the average population of all cities, in the continent and round it down
    
    FLOOR(AVG(CT.Population)) AS Average_Population
FROM CITY AS CT
-- Join CITY with COUNTRY
-- so each city gets its corresponding continent
JOIN COUNTRY AS C
ON CT.CountryCode = C.Code
-- Group all cities by continent. This allows AVG() to calculate-- one average population for each continent.
GROUP BY C.Continent;
