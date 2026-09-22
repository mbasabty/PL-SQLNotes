SET SERVEROUTPUT ON;
--DECLARE CALCULATING THE LENGTH OF A STRING
--    sName       VARCHAR2(20):= 'Mbasa Batyi';
--    iLength     INTEGER;
--    
--BEGIN 
--    iLength := length(sName);
--    DBMS_OUTPUT.PUT_LINE('The length of sName is ' ||iLength);
--END;

--DECLARE  /*NESTED BLOCKS*/
--    NUMB1  NUMBER := 1;
--    NUMB2  NUMBER := 2;
--BEGIN
--    DECLARE 
--        NUMB3  NUMBER := 3;
--        NUMB4  NUMBER := 4;
--    BEGIN
--        DBMS_OUTPUT.PUT_LINE('Number 3: ' || NUMB3);
--        DBMS_OUTPUT.PUT_LINE('Number 4: ' || NUMB4);
--    END;
--
--    DBMS_OUTPUT.PUT_LINE('Number 1: ' || NUMB1);
--    DBMS_OUTPUT.PUT_LINE('Number 2: ' || NUMB2);
--END;
--/

--DECLARE
--    sIDNum  NUMBER;
--BEGIN
--    sIDNum  := my.seq.NEXTLEVAL;
--END;
--/

/*DATA CONVERSION*/
--DECLARE 
--    Date_joining1  DATE := '02-FEB-2000';
--    Date_joining2  DATE := 'February 02, 2000';
--    Date_joining3  DATE := TO_DATE('FEBRUARY 02,2000','MONTH DD, YYYY');
--BEGIN
--   DBMS_OUTPUT.PUT_LINE('Date of joining 1: ' || Date_joining1);
--   DBMS_OUTPUT.PUT_LINE('Date of joining 2: ' || Date_joining2);
--   DBMS_OUTPUT.PUT_LINE('Date of joining 3: ' || Date_joining3);
--END;
--/

<<outer>>
DECLARE 
    v_sal       NUMBER(7,2) := 6000;
    v_com       NUMBER(7,2) := v_sal * 0.20;
    v_message   VARCHAR2(255) := 'Eligible for commission';
BEGIN
    DECLARE
        v_sal        NUMBER(7,2) := 5000;
        v_com        NUMBER(7,2) := 0;
        v_total_comp NUMBER(7,2) := v_sal + v_com;
    BEGIN
        BEGIN
            v_message := 'Clerk not ' || v_message;
            outer.v_com := v_sal * 0.30;
        END;

        v_message := 'Salesman ' || v_message;
    END;

    DBMS_OUTPUT.PUT_LINE('Final message: ' || v_message);
    DBMS_OUTPUT.PUT_LINE('Outer v_com: ' || outer.v_com);
END outer;
/


















































            
                
    