library IEEE;
use IEEE.STD_LOGIC_1164.all;

ENTITY test_flopr IS
END test_flopr;

ARCHITECTURE t_flopr OF test_flopr IS
    COMPONENT flopr
        PORT (d: IN std_logic_vector(31 DOWNTO 0);
              clk, reset: IN std_logic;
              q: OUT std_logic_vector(31 DOWNTO 0));
    END COMPONENT;
    SIGNAL d: std_logic_vector(31 DOWNTO 0);
    SIGNAL clk: std_logic;
    SIGNAL reset: std_logic;
    SIGNAL q: std_logic_vector(31 DOWNTO 0);

BEGIN
    u0: flopr PORT MAP (d, clk, reset, q);
    d <= x"FF000500" after 0 fs, x"AA937110" after 10 fs;
    clk <= '1' after 0 fs;
    reset <= '0' after 0 fs, '1' after 5 fs, '0' after 10 fs, '0' after 15 fs;
END t_flopr;
