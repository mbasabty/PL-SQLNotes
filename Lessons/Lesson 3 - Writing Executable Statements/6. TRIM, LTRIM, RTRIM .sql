DECLARE
  v_text VARCHAR2(30) := '   PL/SQL   ';
BEGIN
  DBMS_OUTPUT.PUT_LINE('[' || TRIM(v_text)  || ']');   -- [PL/SQL]
  DBMS_OUTPUT.PUT_LINE('[' || LTRIM(v_text) || ']');   -- [PL/SQL   ]
  DBMS_OUTPUT.PUT_LINE('[' || RTRIM(v_text) || ']');   -- [   PL/SQL]
  DBMS_OUTPUT.PUT_LINE(TRIM('x' FROM 'xxHelloxx'));    -- Hello
  DBMS_OUTPUT.PUT_LINE(LTRIM('0012345', '0'));         -- 12345
END;
/