SET VERIFY OFF
DECLARE
    v_grade CHAR(1) := UPPER('&grade');
    appraisal VARCHAR2(20);
BEGIN
    appraisal := CASE v_grade
                    WHEN 'A' THEN 'Excellent'
                    WHEN 'B' THEN 'Very Good'
                    WHEN 'C' THEN 'Good'
                    ELSE 'No such grade'
                    END;
                    DBMS_OUTPUT.PUT_LINE ('Grade: '|| v_grade ||
                                          ' Appraisal ' || appraisal);
END;
/