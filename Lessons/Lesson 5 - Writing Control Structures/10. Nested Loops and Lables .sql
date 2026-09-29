DECLARE
    CURSOR c_depts IS
        SELECT department_id, department_name
          FROM HR.departments
         WHERE department_id IN (10, 20, 30);
BEGIN
    FOR d IN c_depts 
        LOOP                       -- outer: each department
            DBMS_OUTPUT.PUT_LINE('Department: ' || d.department_name);
            
            FOR e IN (SELECT last_name, salary      -- inner: employees in that department
                      FROM HR.employees
                      WHERE department_id = d.department_id
                      ORDER BY last_name) 
                    LOOP
                        DBMS_OUTPUT.PUT_LINE('   ' || e.last_name || ' - ' || e.salary);
                    END LOOP;
    
            DBMS_OUTPUT.PUT_LINE('');               -- blank line between departments
        END LOOP;
END;
/