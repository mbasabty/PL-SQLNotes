SET SERVEROUTPUT ON;
DECLARE
    -- Variable to store the employee's last name
    lname VARCHAR2(15);
BEGIN

    -- Find the last name of the employee
    -- whose first name is John
    SELECT last_name
           INTO   lname
    FROM   HR.employees
    WHERE  first_name = 'John';

    -- Display the last name
    DBMS_OUTPUT.PUT_LINE(q'[John's last name is: ]' || lname);
    
EXCEPTION
    -- Handles the situation where more than one
    -- employee has the first name John
    
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Your SELECT statement retrieved multiple rows. ' ||
            'Consider using a cursor.'
        );

END;
/
