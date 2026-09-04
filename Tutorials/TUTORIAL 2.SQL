SET SERVEROUTPUT ON;

-- Question     1
DECLARE
    sFirstname      VARCHAR2(20) DEFAULT 'Steven';
    sLastname       VARCHAR2(20) DEFAULT 'King';
    sPosition       VARCHAR2(20) DEFAULT 'President';
    sHireDate       DATE DEFAULT TO_DATE('17/JUN/03', 'DD/MON/RR');
    iEmpYears       NUMBER;
    
BEGIN
    iEmpyears := TRUNC(MONTHS_BETWEEN(SYSDATE,sHireDate)/12);
    DBMS_OUTPUT.PUT_LINE(sFirstname || ' ' || 
                         sLastname || ' is the ' || 
                         sPosition || ' of the the company.');
    DBMS_OUTPUT.PUT_LINE('He was hired on ' || 
                          TO_CHAR(sHireDate, 'DD/MON/RR') ||
                          ' and has been employed for ' || 
                          iEmpYears || ' years.');
END;
/
   

-- Question     2 
DECLARE
    iDeptId             HR.departments.department_id%TYPE := 60;
    sDeptName1          HR.departments.department_name%TYPE;
    rTotalMaxSal1       NUMBER(10,2);
    sDeptName2          HR.departments.department_name%TYPE;
    rTotalMaxSal2       NUMBER(10,2);
    rDiff               NUMBER(10,2);
BEGIN
    SELECT d.department_name, 
           SUM(j.max_salary)
        INTO sDeptName1, 
             rTotalMaxSal1
    FROM   HR.departments d
    JOIN   HR.employees e ON e.department_id = d.department_id
    JOIN   HR.jobs j      ON j.job_id = e.job_id
    WHERE  d.department_id = iDeptId
    GROUP BY d.department_name;

    DBMS_OUTPUT.PUT_LINE('The wage bill of the '||
                         sDeptName1||' 
                         department is R '||
                         rTotalMaxSal1);
    
    iDeptId := 70;
 
    SELECT d.department_name, 
           SUM(j.max_salary)
        INTO   sDeptName2, 
               rTotalMaxSal2
    FROM   HR.departments d
    JOIN   HR.employees e ON e.department_id = d.department_id
    JOIN   HR.jobs j      ON j.job_id = e.job_id
    WHERE  d.department_id = iDeptId
    GROUP BY d.department_name;

    rDiff := rTotalMaxSal1 - rTotalMaxSal2;

    DBMS_OUTPUT.PUT_LINE('Which is R'||rDiff||
                         ' higher than the wage bill of the '||sDeptName2||
                         ' department.');
END;
/