BEGIN
    FOR emp_record IN (SELECT employee_id, 
                              last_name
                       FROM HR.employees 
                       WHERE department_id =30)
    LOOP
        DBMS_OUTPUT.PUT_LINE( emp_record.employee_id||' '||emp_record.last_name);
    END LOOP;
END;
/

-- can use rowcount because this is an implicit cursor i would have to a counter to replace ROWCOUNT%

DECLARE
    v_count PLS_INTEGER := 0;   -- manual counter, since implicit cursors have no name
BEGIN
    FOR emp_record IN (SELECT employee_id,
                              last_name
                       FROM   HR.employees
                       WHERE  department_id = 30)
    LOOP
        DBMS_OUTPUT.PUT_LINE(emp_record.employee_id || ' ' || emp_record.last_name);
        v_count := v_count + 1;   -- increment on every row processed
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Total rows: ' || v_count);
END;
/