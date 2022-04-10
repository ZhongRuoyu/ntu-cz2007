SELECT eid
FROM EMPLOYEES
WHERE salary =
        (SELECT DISTINCT salary
         FROM EMPLOYEES
         ORDER BY salary DESC
         LIMIT 1
         OFFSET 1);

