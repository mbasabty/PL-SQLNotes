BEGIN
  DBMS_OUTPUT.PUT_LINE(REPLACE('I love Java', 'Java', 'PL/SQL'));  -- I love PL/SQL
  DBMS_OUTPUT.PUT_LINE(TRANSLATE('2026-09-29', '-', '/'));         -- 2026/09/29
  DBMS_OUTPUT.PUT_LINE(TRANSLATE('abc123', 'abc', 'xyz'));         -- xyz123
END;
/