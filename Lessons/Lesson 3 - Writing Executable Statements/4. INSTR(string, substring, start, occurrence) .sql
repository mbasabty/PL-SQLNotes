DECLARE
  v_email VARCHAR2(50) := 'student@uwc.ac.za';
  v_pos   NUMBER;
BEGIN
  v_pos := INSTR(v_email, '@');
  DBMS_OUTPUT.PUT_LINE(v_pos);                          -- 8
  DBMS_OUTPUT.PUT_LINE(SUBSTR(v_email, 1, v_pos - 1));  -- student
  DBMS_OUTPUT.PUT_LINE(INSTR(v_email, '.', 1, 2));      -- 2nd '.' at position 15
END;
/