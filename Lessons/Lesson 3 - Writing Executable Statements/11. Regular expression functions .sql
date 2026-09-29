DECLARE
  v_phone VARCHAR2(30) := 'Call 068-185-8060 now';
BEGIN
  -- Extract the phone number
  DBMS_OUTPUT.PUT_LINE(REGEXP_SUBSTR(v_phone, '\d{3}-\d{3}-\d{4}'));  -- 068-185-8060

  -- Remove all non-digits
  DBMS_OUTPUT.PUT_LINE(REGEXP_REPLACE(v_phone, '[^0-9]', ''));        -- 0681858060

  -- Validate an email format
  IF REGEXP_LIKE('student@uwc.ac.za', '^[A-Za-z0-9._]+@[A-Za-z0-9.]+\.[A-Za-z]{2,}$') THEN
    DBMS_OUTPUT.PUT_LINE('Valid email');
  END IF;
END;
/