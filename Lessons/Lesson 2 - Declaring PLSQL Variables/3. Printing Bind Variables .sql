VARIABLE b_emp_salary NUMBER

BEGIN
    SELECT salary 
    INTO :b_emp_salary
    FROM HR.employees 
    WHERE employee_id = 178;
END;
/

PRINT b_emp_salary

SELECT first_name, last_name 
FROM HR.employees
WHERE salary=:b_emp_salary;