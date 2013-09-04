LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;

ENTITY sl2 IS
    PORT(a: IN std_logic_vector(0 TO 31);
         y: OUT std_logic_vector(0 TO 31));
END Sl2;
    
ARCHITECTURE sl2_est OF sl2 IS
BEGIN
    PROCESS(a)
        VARIABLE temp: std_logic_vector(0 TO 31);
        VARIABLE length: integer := 0;
    BEGIN
        length := a'LENGTH;
        FOR i IN 0 TO length-3 LOOP --los primeros 29 bits
            temp(i) := a(i+2);
        END LOOP;
        temp(length-2) := '0';      
        temp(length-1) := '0';      
        y <= temp;
    END PROCESS;
END sl2_est;       
