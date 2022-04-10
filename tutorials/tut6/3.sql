SELECT employee.employee_name
FROM employee AS employee,
     employee AS manager,
     manages
WHERE employee.employee_name = manages.employee_name
    AND manager.employee_name = manages.manager_name
    AND employee.city = manager.city
    AND employee.street = manager.street;

