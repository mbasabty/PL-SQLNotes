DECLARE
  v_text VARCHAR2(30) := 'Cape Town';
BEGIN
  DBMS_OUTPUT.PUT_LINE(SUBSTR(v_text, 1, 4));   -- Cape
  DBMS_OUTPUT.PUT_LINE(SUBSTR(v_text, 6));      -- Town
  DBMS_OUTPUT.PUT_LINE(SUBSTR(v_text, -4));     -- Town
END;
/