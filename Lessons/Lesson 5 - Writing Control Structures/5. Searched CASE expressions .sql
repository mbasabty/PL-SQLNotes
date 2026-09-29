DECLARE
    grade       CHAR(1) := UPPER('&Grade');
    appraisal   VARCHAR2(20);
BEGIN
    appraisal := CASE   
                    WHEN grade = 'A' THEN 'EXCELLENT'
                    WHEN grade  IN ('B','C') THEN 'GOOD'
                    ELSE 'NO SUCH GRADE'
                 END;
    DBMS_OUTPUT.PUT_LINE('Grade: '|| grade ||' Appraisal ' || appraisal);
END;
/