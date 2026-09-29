DECLARE
    TYPE emp_table_type IS TABLE OF HR.employees%ROWTYPE
    INDEX BY PLS_INTEGER;

    my_emp_table  emp_table_type;
    max_count     NUMBER(3) := 304;
    
BEGIN
    FOR i IN 100 .. max_count LOOP
        BEGIN
            SELECT *
              INTO my_emp_table(i)
              FROM HR.employees
             WHERE employee_id = i;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                NULL;  -- skip IDs that don't exist
        END;
    END LOOP;

    -- The array is now sparse, so use FIRST/NEXT, not FIRST..LAST
    DECLARE
        idx PLS_INTEGER := my_emp_table.FIRST;
    BEGIN
        WHILE idx IS NOT NULL LOOP
            DBMS_OUTPUT.PUT_LINE(my_emp_table(idx).last_name);
            idx := my_emp_table.NEXT(idx);
        END LOOP;
    END;
END;
/