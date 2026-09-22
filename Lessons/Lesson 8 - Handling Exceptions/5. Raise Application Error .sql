BEGIN
    DELETE FROM HR.employees                                                -- Try to delete employees who report to this manager
    WHERE manager_id = v_mgr;
    
    IF SQL%NOTFOUND THEN                                                    -- Check if the delete actually removed any rows
        RAISE_APPLICATION_ERROR(-20202,'This is not a valid manager');      -- No rows deleted = v_mgr is not a real manager
    END IF;

EXCEPTION
  WHEN NO_DATA_FOUND THEN                                                   -- This runs automatically if a SELECT INTO finds no matching row
    RAISE_APPLICATION_ERROR(-20201, 'Manager is not a valid employee.');    -- Raise our own clearer error message instead of the default one
END;
/