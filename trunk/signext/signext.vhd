LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY signext IS
    PORT (a: IN std_logic_vector(0 TO 15);
          y: OUT std_logic_vector(0 TO 31));
END signext;

ARCHITECTURE signext_arq OF signext IS
BEGIN
    PROCESS(a)
        VARIABLE temp: std_logic_vector(0 TO 31);
    BEGIN
        IF (a(0)='0') THEN
            FOR i IN 0 TO 15 LOOP
                temp(i) := '0';
            END LOOP;
        ELSIF (a(0)='1') THEN
            FOR i IN 0 TO 15 LOOP
                temp(i) := '1';
            END LOOP;
        END IF;
        FOR i IN 16 TO 31 LOOP
            temp(i) := a(i-16);
        END LOOP;
        y <= temp;
    END PROCESS;
END signext_arq;
