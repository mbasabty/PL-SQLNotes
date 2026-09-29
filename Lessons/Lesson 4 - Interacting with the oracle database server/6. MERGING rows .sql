-- 0. SETUP -------------------------------------------------------------
SET SERVEROUTPUT ON;

-- 1. CREATE THE COPY TABLE (plain SQL, NOT inside BEGIN...END) ---------
-- Drop first if it already exists (ignore ORA-00942 if it doesn't)
DROP TABLE copy_emp;

CREATE TABLE copy_emp AS
    SELECT * FROM HR.employees WHERE 1 = 2;    -- structure only, no rows

-- 2. MERGE (plain SQL, ends with ; and no END;) ------------------------
MERGE INTO copy_emp c
USING HR.employees e
   ON (c.employee_id = e.employee_id)
WHEN MATCHED THEN
    UPDATE SET
        c.first_name     = e.first_name,
        c.last_name      = e.last_name,
        c.email          = e.email,
        c.phone_number   = e.phone_number,
        c.hire_date      = e.hire_date,
        c.job_id         = e.job_id,
        c.salary         = e.salary,
        c.commission_pct = e.commission_pct,
        c.manager_id     = e.manager_id,
        c.department_id  = e.department_id
WHEN NOT MATCHED THEN
    INSERT (employee_id, first_name, last_name, email, phone_number,
            hire_date, job_id, salary, commission_pct,
            manager_id, department_id)
    VALUES (e.employee_id, e.first_name, e.last_name, e.email, e.phone_number,
            e.hire_date, e.job_id, e.salary, e.commission_pct,
            e.manager_id, e.department_id);

COMMIT;

-- 3. VERIFY ------------------------------------------------------------
SELECT COUNT(*) AS rows_in_copy FROM copy_emp;          -- expect 107
SELECT employee_id, last_name, department_id
  FROM copy_emp
 WHERE department_id = 10;                              -- Jennifer Whalen

-- 4. SAFE DELETE PRACTICE ON THE COPY (no foreign keys, so it works) ---
DECLARE
    deptno  copy_emp.department_id%TYPE := 10;   -- department to delete from
BEGIN
    DELETE FROM copy_emp
     WHERE department_id = deptno;

    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' row(s) deleted');

    ROLLBACK;                                    -- change to COMMIT to keep it
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Delete failed: ' || SQLERRM);
        ROLLBACK;
END;
/

-- 5. NESTED LOOP WITH HR. PREFIX ---------------------------------------
DECLARE
    CURSOR c_depts IS
        SELECT department_id, department_name
          FROM HR.departments
         WHERE department_id IN (10, 20, 30);
BEGIN
    FOR d IN c_depts LOOP
        DBMS_OUTPUT.PUT_LINE('Department: ' || d.department_name);

        FOR e IN (SELECT last_name, salary
                    FROM HR.employees
                   WHERE department_id = d.department_id
                   ORDER BY last_name) LOOP
            DBMS_OUTPUT.PUT_LINE('   ' || e.last_name || ' - ' || e.salary);
        END LOOP;

        DBMS_OUTPUT.PUT_LINE('');
    END LOOP;
END;
/

-- 6. LABELLED LOOPS WITH COMMENTS --------------------------------------
<<two_loop>>
DECLARE
    v_total  NUMBER := 0;                        -- running counter
BEGIN
    <<BeforeTopLoop>>
    FOR i IN 1..10 LOOP                          -- outer loop
        v_total := v_total + 1;
        DBMS_OUTPUT.PUT_LINE('Total is: ' || v_total);

        FOR j IN 1..10 LOOP                      -- inner loop
            CONTINUE BeforeTopLoop WHEN i + j > 5;   -- jump to next i
            v_total := v_total + 1;
        END LOOP;
    END LOOP;
END two_loop;
/

-- 7. CLEAN UP WHEN FINISHED --------------------------------------------
-- DROP TABLE copy_emp;