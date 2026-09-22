-- Enable DBMS_OUTPUT
SET SERVEROUTPUT ON;

-- Create the function
CREATE OR REPLACE FUNCTION check_sal
RETURN BOOLEAN
IS
    iDept_id    HR.employees.department_id%TYPE;
    iEmpNo      HR.employees.employee_id%TYPE;
    rSalary     HR.employees.salary%TYPE;
    rAvg_Salary HR.employees.salary%TYPE;

BEGIN
    -- Employee number
    iEmpNo := 205;

    -- Get employee salary and department
    SELECT salary,
           department_id
    INTO   rSalary,
           iDept_id
    FROM   HR.employees
    WHERE  employee_id = iEmpNo;

    -- Calculate the average salary in the employee's department
    SELECT AVG(salary)
    INTO   rAvg_Salary
    FROM   HR.employees
    WHERE  department_id = iDept_id;

    -- Compare employee salary with department average
    IF rSalary > rAvg_Salary THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/

DECLARE
    v_result BOOLEAN;
BEGIN
    v_result := check_sal;

    IF v_result = TRUE THEN
        DBMS_OUTPUT.PUT_LINE('Employee salary is above the department average.');
        ELSIF v_result = FALSE THEN
            DBMS_OUTPUT.PUT_LINE('Employee salary is not above the department average.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Employee was not found.');
    END IF;
END;
/

