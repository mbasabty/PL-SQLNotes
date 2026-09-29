<<two_loop>>                                  -- label for the whole block (see note 1)
DECLARE
    v_total         NUMBER := 0;              -- running counter, starts at 0
BEGIN
    <<BeforeTopLoop>>                         -- label on the outer loop so CONTINUE can target it
    FOR i IN 1..10                            -- outer loop: i = 1 to 10
    LOOP
        v_total := v_total + 1;               -- add 1 once per outer iteration
        dbms_output.put_line('Total is: ' || v_total);  -- print the counter

        FOR j IN 1..10                        -- inner loop: j = 1 to 10
        LOOP
            -- If i + j is greater than 5, abandon the inner loop and jump
            -- to the next iteration of the OUTER loop (skipping the rest of j)
            CONTINUE BeforeTopLoop
            WHEN i + j > 5;

            v_total := v_total + 1;           -- only runs while i + j <= 5
        END LOOP;
    END LOOP;
END two_loop;                                 -- END label must match the block label
/