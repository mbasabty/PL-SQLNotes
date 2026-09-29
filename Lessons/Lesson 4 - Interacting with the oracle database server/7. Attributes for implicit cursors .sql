DECLARE
    v_rows_deleted       VARCHAR2(30);
    v_empno              hr.employees.employee_id%TYPE := 176;
BEGIN
    DELETE FROM HR.employees
    WHERE employee_id = v_empno;
    v_rows_deleted := (SQL%ROWCOUNT ||' row deleted.');

    DBMS_OUTPUT.PUT_LINE (v_rows_deleted);
END;