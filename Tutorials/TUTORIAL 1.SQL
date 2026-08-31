
DECLARE
    firstname    HR.employees.first_name%TYPE;
    lastname     HR.employees.last_name%TYPE;
    jobtitle     HR.jobs.job_title%TYPE;
    minsalary    HR.jobs.min_salary%TYPE;
    maxsalary    HR.jobs.max_salary%TYPE;
BEGIN
    SELECT e.first_name,
           e.last_name,
           j.job_title,
           j.min_salary,
           j.max_salary
      INTO firstname,
           lastname,
           jobtitle,
           minsalary,
           maxsalary
      FROM HR.employees e
      JOIN HR.jobs j ON e.job_id = j.job_id
     WHERE e.employee_id = 105;

    DBMS_OUTPUT.PUT_LINE(firstname || ' ' || lastname || ' ' || jobtitle || ' ' || minsalary || ' ' || maxsalary);
END;
