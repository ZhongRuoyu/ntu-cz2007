UPDATE employee
SET street = 'Newstreet',
    city = 'Newtown'
WHERE person_name = 'Mark';


UPDATE works
SET salary = 1.1 * salary
WHERE company_name = 'FaceMatch';


UPDATE works
SET salary = 1.1 * salary
WHERE company_name = 'FaceMatch'
    AND person_name IN
        (SELECT DISTINCT manager_name
         FROM manages);

