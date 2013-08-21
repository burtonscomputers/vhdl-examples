LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;

ENTITY test_mux2 IS
END test_mux2;

ARCHITECTURE t_mux2_est OF test_mux2 IS
    COMPONENT mux2
        GENERIC (N: INTEGER:=32);
        PORT (d0, d1: IN std_logic_vector(N-1 DOWNTO 0);
              s: IN std_logic;
              y: OUT std_logic_vector(N-1 DOWNTO 0));
    END COMPONENT;
    SIGNAL d0: std_logic_vector(31 DOWNTO 0):= x"00000000";
    SIGNAL d1: std_logic_vector(31 DOWNTO 0):= x"11111111";
    SIGNAL s: std_logic:= '0';
    SIGNAL y0: std_logic_vector(31 DOWNTO 0);
    SIGNAL b0: std_logic_vector(3 DOWNTO 0):= x"0";
    SIGNAL b1: std_logic_vector(3 DOWNTO 0):= x"F";
    SIGNAL y1: std_logic_vector(3 DOWNTO 0);

BEGIN
    u1: mux2 GENERIC MAP (N => 32) PORT MAP(d0, d1, s, y0);
    d0 <= x"00001111" AFTER 10 fs, x"0000122F" AFTER 20 fs;
    d1 <= x"11110000" AFTER 10 fs, x"1111FABC" AFTER 20 fs;
    s <= NOT s AFTER 5 fs;

    u2: mux2 GENERIC MAP (N => 4) PORT MAP (b0, b1, s, y1);
    b0 <= x"A" AFTER 10 fs, x"B" AFTER 20 fs;
    b1 <= x"2" AFTER 10 fs, x"9" AFTER 20 fs;
    s <= NOT s AFTER 5 fs;
END t_mux2_est;
