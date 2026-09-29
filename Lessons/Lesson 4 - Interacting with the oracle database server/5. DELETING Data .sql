DECLARE
    deptno  HR.employees.department_id%TYPE := 10;
BEGIN
    -- 1. Remove her job history rows (child table)
    DELETE FROM HR.job_history
     WHERE employee_id IN (SELECT employee_id
                             FROM HR.employees
                            WHERE department_id = deptno);

    -- 2. Clear the department's manager so nothing points at her
    UPDATE HR.departments
       SET manager_id = NULL
     WHERE department_id = deptno;

    -- 3. Clear her as manager of other employees, if any
    UPDATE HR.employees
       SET manager_id = NULL
     WHERE manager_id IN (SELECT employee_id
                            FROM HR.employees
                           WHERE department_id = deptno);

    -- 4. Now the delete can succeed
    DELETE FROM HR.employees
     WHERE department_id = deptno;

    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' employee(s) deleted');

    ROLLBACK;   -- change to COMMIT only when you're sure
END;
/