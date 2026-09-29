-- Creating the table
CREATE TABLE retired_emp (
    empno       NUMBER(6),
    ename       VARCHAR2(25),
    job         VARCHAR2(10),
    mgr         NUMBER(6),
    hiredate    DATE,
    leave_date  DATE,
    sal         NUMBER(8,2),
    comm        NUMBER(2,2),
    deptno      NUMBER(4)
);


-- Ask the user for the ID (SQL*Plus / SQL Developer script mode)
ACCEPT p_emp_id NUMBER PROMPT 'Enter the Employee ID: '

DECLARE
    emp_number  NUMBER := &p_emp_id;      -- Value typed by the user is substituted here
    emp_record  HR.employees%ROWTYPE;     -- Holds one full row from HR.employees
BEGIN
    SELECT *
    INTO   emp_record
    FROM   HR.employees
    WHERE  employee_id = emp_number;      -- Use the variable, not the prompt text

    INSERT INTO retired_emp (empno,
                             ename,
                             job,
                             mgr,
                             hiredate,
                             leave_date,
                             sal,
                             comm,
                             deptno)
    VALUES (emp_record.employee_id,
            emp_record.last_name,
            emp_record.job_id,
            emp_record.manager_id,
            emp_record.hire_date,
            SYSDATE,
            emp_record.salary,
            emp_record.commission_pct,
            emp_record.department_id);

    COMMIT;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee ' || emp_number || ' not found.');
END;
/