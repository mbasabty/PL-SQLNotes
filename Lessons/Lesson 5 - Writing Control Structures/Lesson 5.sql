--LOOP
DECLARE 
    counter NUMBER := 1;
BEGIN
    LOOP 
        DBMS_OUTPUT.PUT(counter || ' ');
        counter := counter + 1;
        EXIT WHEN counter > 10;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(''); /*writing the output numbers in one line*/
END;
/

/*IMPLICIT IS UNDER BEGIN
  EXPICIT CURSOR IS WHITHIN THE DECLARE AREA THEY BOTH INCLUDE STATEMENT*/

--WHILE LOOP
DECLARE 
        counter     NUMBERR := 0;
BEGIN
        WHILE (counter < 20) LOOP
            counter := counter + 1;
            DBMS_OUTPUT.PUT_LINES('Value of number: ' || counter);
        END LOOP;
END;
/

--FOR LOOP
0;
    
BEGIN
    FOR counter IN REVERSE 10 .. 20 LOOP
        DBMS_OUTPUT.PUT_LINES('Value of number :' || counter);
    END LOOP;
END;
/
    
-- ADD AN EXPECTION - IT SHOULD SHOW THE MEANING OF THE ERROR

DECLARE
    CURSOR emp_cursor IS
        SELECT employee_ID,
               first_name,
               salary
        FROM HR.employees
        WHERE department_id = 30;
        
--    v_emp_id       HR.EMPLOYEES.employee_id%TYPE;
--    v_name         HR.EMPLOYEES.first_name%TYPE;
--    v_salary       HR.EMPLOYEES.salary%TYPE;


-- Method 1
--BEGIN
--    OPEN emp_cursor;
--        LOOP 
--            FETCH emp_cursor
--                INTO 
--                    v_emp_id,
--                    v_name,
--                    v_salary;
--            EXIT WHEN emp_cursor%NOTFOUND;
--            DBMS_OUTPUT.PUT_LINE(v_emp_id ||'-'||v_name||'-'||v_salary);
--        END LOOP;
--    CLOSE emp_cursor;
--END;
--/

--Method 2
BEGIN
   FOR emp IN  emp_cursor LOOP
     DBMS_OUTPUT.PUT_LINE( emp.employee_ID||'-'||emp.first_name||'-'||emp.salary);
END;
/



