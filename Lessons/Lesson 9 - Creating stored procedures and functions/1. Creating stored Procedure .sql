-- 1. Create the DEPT table from HR.DEPARTMENTS
CREATE TABLE dept AS
    SELECT *
    FROM HR.departments;

-- 2. Create the ADD_DEPT procedure
CREATE OR REPLACE PROCEDURE add_dept IS
    v_dept_id   HR.dept.department_id%TYPE;
    v_dept_name HR.dept.department_name%TYPE;

BEGIN
    v_dept_id := 280;
    v_dept_name := 'ST-Curriculum';

    INSERT INTO dept (department_id, department_name)
    VALUES (v_dept_id, v_dept_name);

    DBMS_OUTPUT.PUT_LINE('Inserted ' || SQL%ROWCOUNT || ' row');
END;
/

-- 3. Enable output
SET SERVEROUTPUT ON;
-- 4. Execute the procedure
BEGIN
    add_dept;
END;
/

-- 5. Display the inserted record
SELECT department_id,
       department_name
FROM dept
WHERE department_id = 280;
