SET SERVEROUTPUT ON

ACCEPT emp_id_input NUMBER PROMPT 'Please enter the employee id: '

DECLARE
    CURSOR c_emp(p_emp_id NUMBER) IS
        SELECT employee_id,
               last_name
        FROM   HR.employees
        WHERE  employee_id = p_emp_id;

    v_emp_id   HR.employees.employee_id%TYPE;
    v_lastname HR.employees.last_name%TYPE;
BEGIN
    OPEN c_emp(&emp_id_input);

    LOOP
        FETCH c_emp INTO v_emp_id, v_lastname;
        EXIT WHEN c_emp%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_emp_id || ' ' || v_lastname);
    END LOOP;

    CLOSE c_emp;
END;
/

DECLARE
    CURSOR c_emp(p_dept_id NUMBER) IS
        SELECT employee_id, last_name
        FROM   HR.employees
        WHERE  department_id = p_dept_id;

    v_emp_id   HR.employees.employee_id%TYPE;
    v_lastname HR.employees.last_name%TYPE;
BEGIN
    OPEN c_emp(30);   -- pass the parameter value when opening
    LOOP
        FETCH c_emp INTO v_emp_id, v_lastname;
        EXIT WHEN c_emp%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_emp_id || ' ' || v_lastname);
    END LOOP;
    CLOSE c_emp;
END;
/