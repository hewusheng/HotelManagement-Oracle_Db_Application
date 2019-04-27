DECLARE
    v_efirst        GP_EMPLOYEE.FIRSTNAME%TYPE;
    v_elast         GP_EMPLOYEE.LASTNAME%TYPE;
    v_job           GP_EMPLOYEE.TITLE%TYPE := 'Calling Center';
    v_emp_refcur    SYS_REFCURSOR;
BEGIN
    DBMS_OUTPUT.PUT_LINE('EMPLOYEES WITH JOB ' || v_job);
    DBMS_OUTPUT.PUT_LINE('FirstName    LastName');
    DBMS_OUTPUT.PUT_LINE('---------    --------');
    emp_sp_findemp(v_job, v_emp_refcur);
    LOOP
        FETCH v_emp_refcur INTO v_efirst, v_elast;
        EXIT WHEN v_emp_refcur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_efirst || '            ' || v_elast);
    END LOOP;
    CLOSE v_emp_refcur;
END;

SELECT * FROM GP_GUEST;