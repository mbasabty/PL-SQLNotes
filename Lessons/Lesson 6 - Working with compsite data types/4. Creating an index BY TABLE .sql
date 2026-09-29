DECLARE
    TYPE ename_tbale_type IS TABLE F 
         HR.employees.last_name%TYPE
         INDEX BY pls_integer;
         
    TYPE Hire_date_table_type IS TABLE OF DATE
        INDEX BY pls_integer;
        
    e_name_table        ename_table_type;
    hiredate_table      hiredate_table_type;

BEGIN
    ename_table(1) := 'Mbasa';
    hiredate_table(8) := sysdate + 7;
    IF ename_tanle.EXISTS(1) THEN 
        INSERT INTO
        
END;
/