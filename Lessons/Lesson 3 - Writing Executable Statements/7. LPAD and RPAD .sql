BEGIN
  DBMS_OUTPUT.PUT_LINE(LPAD('42', 5, '0'));     -- 00042
  DBMS_OUTPUT.PUT_LINE(RPAD('Name', 10, '.'));  -- Name......
  DBMS_OUTPUT.PUT_LINE(LPAD('Hi', 6, '*'));     -- ****Hi
END;
/