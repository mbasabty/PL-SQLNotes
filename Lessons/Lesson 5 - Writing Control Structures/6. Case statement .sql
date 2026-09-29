DECLARE
    v_deptid    NUMBER;
    v_deptname  VARCHAR2(20);
    v_emps      NUMBER;
    v_mngid     NUMBER := 108;
    
BEGIN
    CASE v_mngid
        WHEN 108 THEN
            SELECT department_id, department_name
              INTO v_deptid, v_deptname
            FROM departments
            WHERE manager_id = 108;

            SELECT COUNT(*)
              INTO v_emps
            FROM employees
            WHERE department_id = v_deptid;

        WHEN 200 THEN
            NULL;  -- replace with your logic for manager 200
        ELSE
            NULL;  -- or raise an error / set defaults
    END CASE;

    DBMS_OUTPUT.PUT_LINE('You are working in the ' || v_deptname ||
                         ' department. There are ' || v_emps ||
                         ' employees in this department');
END;
/