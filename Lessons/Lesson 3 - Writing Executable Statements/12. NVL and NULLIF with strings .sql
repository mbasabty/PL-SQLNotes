DECLARE
  v_middle VARCHAR2(20) := NULL;
BEGIN
  DBMS_OUTPUT.PUT_LINE(NVL(v_middle, 'N/A'));      -- N/A
  DBMS_OUTPUT.PUT_LINE(NULLIF('abc', 'abc'));      -- (null)
END;
/