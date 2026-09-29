DECLARE
  v_name VARCHAR2(30) := 'mbasa junior batyi';
BEGIN
  DBMS_OUTPUT.PUT_LINE(UPPER(v_name));    -- MBASA JUNIOR BATYI
  DBMS_OUTPUT.PUT_LINE(LOWER('HELLO'));   -- hello
  DBMS_OUTPUT.PUT_LINE(INITCAP(v_name));  -- Mbasa Junior Batyi
END;
/