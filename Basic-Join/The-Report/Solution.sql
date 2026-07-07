-- STUDENTS AND GRADES TWO COL
SELECT 
    CASE
        WHEN G.Grade >= 8 THEN S.Name
        ELSE NULL
  END AS NAME,
  G.Grade,
  S.Marks
  FROM STUDENTS AS S
  JOIN GRADES AS G
  ON S.Marks BETWEEN G.MIN_Mark AND G.MAX_Mark
  
  ORDER BY
  G.Grade DESC,
  
  CASE
    WHEN G.Grade >= 8 THEN S.Name
  END ASC,
  CASE 
    WHEN G.Grade < 8 THEN S.Marks
  END ASC;
  
