library IEEE;
use IEEE.STD_LOGIC_1164.all;

ENTITY adder_tb IS
END adder_tb;

ARCHITECTURE sum_tb OF adder_tb IS
    COMPONENT sumador
        PORT (a: IN std_logic_vector(31 DOWNTO 0);
              b: IN std_logic_vector(31 DOWNTO 0);
              y: OUT std_logic_vector(31 DOWNTO 0));
    END COMPONENT;
    SIGNAL a: std_logic_vector(31 DOWNTO 0);
    SIGNAL b: std_logic_vector(31 DOWNTO 0);
    SIGNAL y: std_logic_vector(31 DOWNTO 0);

BEGIN
    u0: adder PORT MAP (a, b, y);
    a <= x"00000007" after 0 fs, x"00000014" after 5 fs, x"00000001" after 10 fs;
    b <= x"FF000000" after 0 fs, x"EEFF0010" after 5 fs, x"FFFFFFFF" after 10 fs;
END sum_tb;
