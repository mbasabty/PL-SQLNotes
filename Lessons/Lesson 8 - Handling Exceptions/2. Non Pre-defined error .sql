SET SERVEROUTPUT ON;

DECLARE

    e_insert_excep EXCEPTION;

    -- Associate the exception with ORA-01400
    PRAGMA EXCEPTION_INIT(e_insert_excep, -01400);

BEGIN

    INSERT INTO HR.departments (
        department_id,
        department_name
    )
    VALUES (
        280,
        NULL
    );

EXCEPTION
    WHEN e_insert_excep THEN
        DBMS_OUTPUT.PUT_LINE('Insert operation failed');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);

END;
/
