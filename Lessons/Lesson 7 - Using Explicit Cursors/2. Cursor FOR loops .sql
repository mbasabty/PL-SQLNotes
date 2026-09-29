DECLARE
    -- Declare an explicit cursor named c_emp.
    -- A cursor is essentially a named "handle" to a SQL query result set,
    -- letting you process rows one at a time.
    CURSOR c_emp IS
        SELECT employee_id,
               last_name
        FROM   HR.employees
        WHERE  department_id = 30;   -- Only fetch employees from department 30

BEGIN
    -- Cursor FOR LOOP:
    -- This is shorthand that automatically does 4 things for you:
    --   1. OPENs the cursor (runs the query)
    --   2. Declares emp_record as a record whose fields match the
    --      cursor's SELECT list (employee_id, last_name)
    --   3. FETCHes each row into emp_record, looping until no rows remain
    --   4. CLOSEs the cursor when the loop ends (even if you exit early)
    FOR emp_record IN c_emp
        LOOP
            -- Print each employee's ID and last name to the DBMS output buffer.
            -- '||' concatenates strings; employee_id (a NUMBER) is
            -- implicitly converted to text here.
            DBMS_OUTPUT.PUT_LINE(emp_record.employee_id || ' ' || emp_record.last_name);
        END LOOP;
END;
/

--Method 2
DECLARE
    CURSOR c_emp IS
        SELECT employee_id, last_name
        FROM   HR.employees
        WHERE  department_id = 30;

    v_employee_id       HR.employees.employee_id%TYPE;
    v_last_name         HR.employees.last_name%TYPE;
    
BEGIN
    OPEN c_emp;                                                         -- Must open manually
        LOOP
            FETCH c_emp 
                INTO v_employee_id, v_last_name;
            EXIT WHEN c_emp%NOTFOUND OR c_emp%ROWCOUNT > 2;             -- Must check manually or loop forever or stop the loop when the rowcount is >= n
            DBMS_OUTPUT.PUT_LINE(v_employee_id || ' ' || v_last_name);
        END LOOP;
    CLOSE c_emp;                                                        -- Must close manually
END;
/