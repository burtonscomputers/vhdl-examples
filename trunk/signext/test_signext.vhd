LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY test_signext IS
END ENTITY;

ARCHITECTURE test_signext_arq OF test_signext is
    COMPONENT signext IS
        PORT( a: IN std_logic_vector(15 DOWNTO 0);
              y: OUT std_logic_vector(31 DOWNTO 0));
    END COMPONENT;
    SIGNAL a: std_logic_vector(15 DOWNTO 0) := x"FFFA";
    SIGNAL y: std_logic_vector(31 DOWNTO 0);
BEGIN
    ronda1: signext PORT MAP (a, y);
    a <= x"1111" AFTER 5 fs, x"22FB" AFTER 10 fs, x"AA91" AFTER 15 fs;
END test_signext_arq;
