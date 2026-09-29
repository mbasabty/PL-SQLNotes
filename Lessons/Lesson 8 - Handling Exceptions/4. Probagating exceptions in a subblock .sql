SET SERVEROUTPUT ON;
DECLARE
    e_no_rows EXCEPTION;                                    -- Exception raised when no row is affected
    e_integrity EXCEPTION;                                  -- Exception for integrity constraint violation
    PRAGMA EXCEPTION_INIT(e_integrity, -2292);              -- Associate e_integrity with Oracle error ORA-02292


    -- Cursor to retrieve employees
    CURSOR emp_cursor IS
        SELECT employee_id,
               department_id,
               salary
        FROM HR.employees;

BEGIN

    FOR c_record IN emp_cursor LOOP                         -- Loop through each employee
        BEGIN                                               -- Start of nested PL/SQL block
            UPDATE HR.employees                             -- Example: update the employee's salary
            SET salary = salary + 100
            WHERE employee_id = c_record.employee_id;
            
            IF SQL%NOTFOUND THEN                            -- Check whether the UPDATE affected any rows
                RAISE e_no_rows;
            END IF;
        END;                                                -- End of nested block
    END LOOP;

EXCEPTION

    WHEN e_integrity THEN                                   -- Handle integrity constraint violation
        DBMS_OUTPUT.PUT_LINE(
            'Integrity constraint violation occurred.'
        );
    
    WHEN e_no_rows THEN                                     -- Handle the custom no-rows exception
        DBMS_OUTPUT.PUT_LINE(
            'No rows were affected by the operation.'
        );

END;
/
