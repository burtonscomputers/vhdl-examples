LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY test_sl2 IS
END test_sl2;

ARCHITECTURE t_sl2_est OF test_sl2 IS
    COMPONENT sl2
        PORT(a: IN std_logic_vector(31 DOWNTO 0);
             y: OUT std_logic_vector(31 DOWNTO 0));
    END COMPONENT;
    SIGNAL a: std_logic_vector(31 DOWNTO 0) := x"FFFF1111";
    SIGNAL y: std_logic_vector(31 DOWNTO 0); 
BEGIN
    u0: sl2 PORT MAP (a, y);
    a <= x"1110FFFF" AFTER 5 fs, x"22224444" AFTER 10 fs, x"12345678" AFTER 15 fs;
END t_sl2_est;
