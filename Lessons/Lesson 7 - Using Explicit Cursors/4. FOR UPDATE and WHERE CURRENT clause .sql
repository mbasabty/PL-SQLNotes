-- Explicit cursor with FOR UPDATE: rows are locked as soon as the cursor is OPENED
-- OF employees.salary : lock only rows from the employees table (matters in joins)
-- NOWAIT              : don't wait if another session holds the lock, raise ORA-00054 instead

SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_emp IS
        SELECT employee_id, last_name, salary
        FROM   HR.employees
        WHERE  department_id = 50
        FOR UPDATE OF salary NOWAIT;
        -- Alternative: FOR UPDATE WAIT 5;  (wait up to 5 seconds, then raise an error)

    v_emp       c_emp%ROWTYPE;   -- Record matching the cursor's columns

                                -- Handle ORA-00054 (resource busy and acquire with NOWAIT specified)
    e_row_locked EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_row_locked, -54);
    
BEGIN
    OPEN c_emp;   -- Rows are locked HERE, before any update happens
        LOOP
            FETCH c_emp 
                INTO v_emp;
            EXIT WHEN c_emp%NOTFOUND;
    
            -- WHERE CURRENT OF updates the row the cursor is currently pointing at
            -- No need to repeat the key condition (e.g. employee_id = ...)
            UPDATE HR.employees
            SET    salary = v_emp.salary * 1.10
            WHERE CURRENT OF c_emp;
    
            DBMS_OUTPUT.PUT_LINE('Updated: ' || v_emp.last_name);
        END LOOP;
    CLOSE c_emp;
    
    -- COMMIT (or ROLLBACK) releases all the locks
    COMMIT;

EXCEPTION
    WHEN e_row_locked THEN
        -- Another session already holds a lock on one of these rows
        DBMS_OUTPUT.PUT_LINE('Rows are locked by another session. Try again later.');
        ROLLBACK;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END;
/

---- Anonymous PL/SQL block that gives a raise to employees in one department
--DECLARE
--    -- Variable declarations
--    v_dept_id      HR.employees.department_id%TYPE := 50;       -- Department to update
--    v_raise_pct    NUMBER := 0.10;                              -- 10% raise
--    v_rows_updated NUMBER;                                      -- Holds number of rows changed
--BEGIN
--    
--    UPDATE HR.employees                                            -- UPDATE clause: names the table to change
--    SET    salary = salary * (1 + v_raise_pct)                  -- SET clause: defines the new value for the column
--    WHERE  department_id = v_dept_id;                           -- WHERE clause: limits which rows are updated (without it, ALL rows change)
--    v_rows_updated := SQL%ROWCOUNT;                             -- SQL%ROWCOUNT is an implicit cursor attribute: rows affected by the last DML
--
--    IF v_rows_updated = 0 THEN                                  -- Check whether anything was actually updated
--        DBMS_OUTPUT.PUT_LINE('No employees found in department ' || v_dept_id);
--    ELSE
--        DBMS_OUTPUT.PUT_LINE(v_rows_updated || ' employee(s) updated.');
--    END IF;
--    COMMIT; -- Make the change permanent
--
--EXCEPTION
--    -- Error handling: runs if anything in the BEGIN block fails
--    WHEN OTHERS THEN
--        ROLLBACK;  -- Undo any partial changes
--        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);  -- SQLERRM holds the error message
--END;
--/