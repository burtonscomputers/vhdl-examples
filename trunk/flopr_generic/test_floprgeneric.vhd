LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;

ENTITY test_floprgeneric IS
END test_floprgeneric;

ARCHITECTURE t_flopG OF test_floprgeneric IS
    COMPONENT floprgeneric
        GENERIC (N: INTEGER:=32);
        PORT (d: IN std_logic_vector(N-1 DOWNTO 0);
              clk, reset: IN std_logic;
              q: OUT std_logic_vector(N-1 DOWNTO 0));
    END COMPONENT;
    SIGNAL d1: std_logic_vector(31 DOWNTO 0) := x"00000000";
    SIGNAL d2: std_logic_vector(15 DOWNTO 0) := X"FFFF";
    SIGNAL clk: std_logic := '0';
    SIGNAL reset: std_logic := '0';
    SIGNAL out1: std_logic_vector(31 DOWNTO 0);
    SIGNAL out2: std_logic_vector(15 DOWNTO 0);    

BEGIN
    u1: floprgeneric GENERIC MAP (N => 32) PORT MAP (d1, clk, reset, out1);
    d1 <= x"100FA000" after 5 fs, x"00000111" after 10 fs, x"111FAB00" after 15 fs;
    clk <= not clk after 5 fs;
    reset <= '1' after 8 fs, '0' after 13 fs;

    u2: floprgeneric GENERIC MAP (N => 16) PORT MAP (d2, clk, reset, out2);
    d2 <= x"4444" after 5 fs, x"F001" after 10 fs, x"1234" after 15 fs;
    clk <= not clk after 5 fs;
    reset <= '1' after 8 fs, '0' after 13 fs;
END t_flopG;
     
