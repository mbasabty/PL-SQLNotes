--DECLARE
--    v_hiredate          DATE;
--    v_deptno            NUMBER(2) NOT NULL := 10;
--    v_location          VARCHAR2(13) := 'Atlanta';
--    c_comm              CONSTANT NUMBER := 1400;
--    
--    
DECLARE
    v_myName              VARCHAR2(20):= 'John';
BEGIN
    v_myName := 'Steven';
    DBMS_OUTPUT.PUT_LINE('My name is: '|| v_myName);
END;
/