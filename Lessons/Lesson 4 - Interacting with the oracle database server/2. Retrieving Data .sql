DECLARE
    v_emp_hiredate  HR.employees.hire_date%TYPE;
    v_emp_salary    HR.employees.salary%TYPE;
BEGIN
    SELECT hire_date, salary
    INTO v_emp_hiredate, v_emp_salary
    FROM HR.employees
    WHERE employee_id = 100;
END;
/