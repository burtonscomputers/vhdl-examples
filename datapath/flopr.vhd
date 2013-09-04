library IEEE;
use IEEE.STD_LOGIC_1164.all;

ENTITY flopr IS
    PORT (d: IN std_logic_vector(31 DOWNTO 0);
          clk, reset: IN std_logic;
          q: OUT std_logic_vector(31 DOWNTO 0));
END flopr;

ARCHITECTURE flopr_est OF flopr IS
BEGIN
    PROCESS (clk, reset)
    BEGIN
        IF (reset='1') THEN
            q <= x"00000000";
        ELSIF (clk'EVENT AND clk='1') THEN
            q <= d;
        END IF;
    END PROCESS;
END flopr_est;
