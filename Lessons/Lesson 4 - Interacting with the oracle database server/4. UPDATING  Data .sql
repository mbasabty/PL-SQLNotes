DECLARE
    SalaryIncrease      HR.employees.salary%TYPE := 800;
BEGIN
    UPDATE     HR.employees
    SET        salary = salary + SalaryIncrease
    WHERE      job_id = 'ST_CLERK';
END;
/