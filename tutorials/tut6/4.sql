SELECT *
FROM q
EXCEPT
SELECT *
FROM r;


SELECT r.A,
       r.C,
       s.D
FROM r,
     s
WHERE r.C = s.C;

