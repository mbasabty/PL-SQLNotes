DECLARE
    v_countryid         HR.locations.country_id%TYPE := 'CA';
    v_loc_id            HR.locations.location_id%TYPE;
    v_new_city          HR.locations.city%TYPE := 'Montreal';
    v_counter           NUMBER := 1;
BEGIN
    SELECT MAX(location_id) 
        INTO v_loc_id 
    FROM HR.locations
    WHERE country_id = v_countryid;
    
    WHILE v_counter <= 3 
        LOOP
            INSERT INTO HR.locations(location_id, city, country_id)
            VALUES((v_loc_id + v_counter), v_new_city, v_countryid);
            v_counter := v_counter + 1;
        END LOOP;
END;
/