DECLARE
    v_countryid         HR.locations.country_id%TYPE := 'CA';
    v_loc_id            HR.locations.location_id%TYPE;
    v_counter           NUMBER(2) := 1;
    v_new_city          HR.locations.city%TYPE := 'Montreal';

BEGIN
    SELECT MAX(location_id)
        INTO v_loc_id 
    FROM HR.locations
    WHERE country_id = v_countryid;
    LOOP
        INSERT INTO HR.locations(location_id, city, country_id)
             VALUES((v_loc_id + v_counter), v_new_city, v_countryid);
        v_counter := v_counter + 1;
        EXIT WHEN v_counter > 3;
    END LOOP;
END;
/