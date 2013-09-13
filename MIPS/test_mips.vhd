library ieee;
use ieee.std_logic_1164.all;

entity test_mips is
end entity;

architecture behaviour of test_mips is
    component mips 
        port(reset, clk, dump: in std_logic;
              instr, pc: out std_logic_vector(31 downto 0));
    end component
    signal reset1, clk1, dump1: std_logic;
    signal instr1, pc: std_logic_vector(31 downto 0));
begin
    prueba: mips port map(reset1, clk1, dump1, instr1, pc1);
    process
    begin
        clk = '0';
        wait for 5 ns;
        clk = '1';
    end process;

    process
    begin
        reset1 <= '1';
        wait for 10 ns;
        dump <= '1';
        reset <= '0';
    end process;
end architecture;
