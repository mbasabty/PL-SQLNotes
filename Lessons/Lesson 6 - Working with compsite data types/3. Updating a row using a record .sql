SET VERIFY OFF
SET SERVEROUTPUT ON

DECLARE
    employee_number  NUMBER := 124;
    emp_record       retired_emp%ROWTYPE;   -- one variable name, used consistently
BEGIN
    -- Fetch ONE row, and lock it since we're about to update it
    SELECT *
    INTO   emp_record
    FROM   retired_emp
    WHERE  empno = employee_number
    FOR UPDATE;

    
    emp_record.leave_date := SYSDATE;     -- Change the field in the record (must be the real column name)

    -- SET ROW = record updates every column from the record
    UPDATE retired_emp
    SET    ROW = emp_record
    WHERE  empno = employee_number;

    COMMIT;   -- saves the change and releases the lock

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee ' || employee_number || ' not found in retired_emp.');
END;
/

SELECT * FROM retired_emp;
