DROP FUNCTION check_sal; -- Drop the function if it already exists

-- Create the CHECK_SAL function
-- The function receives an employee number as a parameter
-- and returns TRUE or FALSE

CREATE FUNCTION check_sal(p_empno HR.employees.employee_id%TYPE)
    RETURN BOOLEAN
        IS
            v_dept_id   HR.employees.department_id%TYPE;     -- Variable to store the employee's department ID
            v_sal       HR.employees.salary%TYPE;            -- Variable to store the employee's salary
            v_avg_sal   HR.employees.salary%TYPE;            -- Variable to store the average salary of the department
            
BEGIN

    -- Get the employee's salary and department ID
    SELECT salary,
           department_id
           INTO   v_sal,
                  v_dept_id
    FROM   HR.employees
    WHERE  employee_id = p_empno;


    -- Calculate the average salary
    -- for the employee's department
    SELECT AVG(salary)
               INTO   v_avg_sal
    FROM   HR.employees
    WHERE  department_id = v_dept_id;
    
    -- Compare the employee's salary
    -- with the department's average salary
    IF v_sal > v_avg_sal THEN
        RETURN TRUE;        -- Employee salary is above average
        ELSE
            RETURN FALSE;       -- Employee salary is equal to or below average
    END IF;

    EXCEPTION
        -- If the employee number does not exist,
        -- return NULL
        WHEN NO_DATA_FOUND THEN
            RETURN NULL;
END;
/
-- Invoking the function 
SET SERVEROUTPUT ON;
DECLARE
    v_result BOOLEAN;
BEGIN

    v_result := check_sal(205);
    IF v_result = TRUE THEN
            DBMS_OUTPUT.PUT_LINE('Salary is above average.');
        ELSIF v_result = FALSE THEN
            DBMS_OUTPUT.PUT_LINE('Salary is not above average.');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Employee does not exist.');
    END IF;

END;
/
