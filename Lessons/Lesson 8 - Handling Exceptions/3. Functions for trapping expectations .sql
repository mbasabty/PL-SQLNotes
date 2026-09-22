SET SERVEROUTPUT ON;
DECLARE
    v_deptno NUMBER     := 500;         -- Department ID to search for
    v_name VARCHAR2(20) := 'Testing';   -- New department name
    e_invalid_department EXCEPTION;     -- User-defined exception
    
BEGIN
    UPDATE HR.departments               -- Update the department name
    SET department_name = v_name
    WHERE department_id = v_deptno;
    
    IF SQL%NOTFOUND THEN                -- Check whether any row was updated
        RAISE e_invalid_department;     -- No department with this ID was found
    END IF;
    
    COMMIT;                             -- Save the changes

EXCEPTION                          
    WHEN e_invalid_department THEN      -- Handle the user-defined exception
        DBMS_OUTPUT.PUT_LINE(
            'No such department id.'
        );

END;
/
