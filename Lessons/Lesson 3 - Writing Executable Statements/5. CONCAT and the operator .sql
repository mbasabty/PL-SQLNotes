DECLARE
  v_first VARCHAR2(20) := 'Mbasa';
  v_last  VARCHAR2(20) := 'Batyi';
BEGIN
  DBMS_OUTPUT.PUT_LINE(CONCAT(v_first, v_last));           -- MbasaBatyi
  DBMS_OUTPUT.PUT_LINE(v_first || ' ' || v_last);          -- Mbasa Batyi
END;
/