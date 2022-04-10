SELECT employee_name
FROM works AS W
WHERE salary >
        (SELECT AVG(salary)
         FROM works
         WHERE works.company_name = W.company_name);

