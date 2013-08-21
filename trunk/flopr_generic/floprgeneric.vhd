LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;

ENTITY floprgeneric IS
    GENERIC (N: INTEGER:=32);
    PORT (d: IN std_logic_vector(N-1 DOWNTO 0);
          clk, reset: IN std_logic;
          q: OUT std_logic_vector(N-1 DOWNTO 0));
END floprgeneric;

ARCHITECTURE flopr_est OF floprgeneric IS
BEGIN
    PROCESS(clk, reset)
        VARIABLE temp: std_logic_vector(q'RANGE);
    BEGIN
        IF (reset='1') THEN
            FOR i IN  temp'RANGE LOOP
                temp(i) := '0';
            END LOOP;
            q <= temp;
        ELSIF (clk'EVENT AND clk='1') THEN
            q <= d;
        END IF;
    END PROCESS;
END flopr_est;
                     
