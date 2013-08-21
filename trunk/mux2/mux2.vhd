LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;

ENTITY mux2 IS
    GENERIC (N: INTEGER:=32);
    PORT (d0, d1: IN std_logic_vector(N-1 DOWNTO  0);
          s: IN std_logic;
          y: OUT std_logic_vector(N-1 DOWNTO 0));
END mux2;

ARCHITECTURE mux_est OF mux2 IS
BEGIN
    PROCESS(s)
    BEGIN
        IF (s='0') THEN
            y <= d0;
        ELSIF (s='1') THEN
            y <= d1;
        END IF;
    END PROCESS;
END mux_est;
