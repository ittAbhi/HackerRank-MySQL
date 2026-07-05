-- SELECT IF(
--     A + B <= C OR A + C <= B OR B + C <= A,
--     'Not A Triangle',
--     IF(
--         A = B AND B = C,
--         'Equilateral',
--         IF(
--             A = B OR A = C OR B = C,
--             'Isosceles',
--             'Scalene'
--         )
--     )
-- )
-- FROM TRIANGLES;



SELECT
    CASE
        WHEN A + B <= C OR B + C <= A OR A + C <= B
            THEN 'Not A Triangle'
        WHEN A = B AND B = C
            THEN 'Equilateral'
        WHEN A = B OR B = C OR A = C
            THEN 'Isosceles'
        ELSE 'Scalene'
    END
FROM TRIANGLES;

