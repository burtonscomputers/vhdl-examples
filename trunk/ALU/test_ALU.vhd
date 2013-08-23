library ieee;
use ieee.std_logic_1164.all;

entity test_ALU is
end entity;

architecture test_ALU_arq of test_ALU is
    component ALU
        port (a: in std_logic_vector(31 downto 0);
              b: in std_logic_vector(31 downto 0);
              alucontrol: in bit_vector(2 downto 0);
              zero: out bit;
              result: out std_logic_vector(31 downto 0));
    end component;
    signal a, b, result: std_logic_vector(31 downto 0);
    signal alucontrol: bit_vector(2 downto 0);
    signal zero: bit;
begin
    u0: ALU port map(a, b, alucontrol, zero, result);
    process
    begin
        alucontrol <= "011";
        wait for 5 fs;
        alucontrol <= "001";
        wait for 8 fs;
        alucontrol <= "010";
        wait for 5 fs;
        alucontrol <= "100";
        wait for 2 fs;
        alucontrol <= "000";
        wait for 15 fs;
        alucontrol <= "110";
        wait for 30 fs;
        alucontrol <= "101";
        wait for 5 fs;
        alucontrol <= "110";
    end process;
    process
    begin
        wait for 15 fs;
        a <= x"66271000";
        wait for 9 fs;
        a <= x"00000001";
        wait for 6 fs;
        a <= x"22211000";
        wait for 20 fs;
        a <= x"11118700";
        wait for 15 fs;
        a <= x"11111111";
        wait for 21 fs;
        a <= x"00000001";
    end process;
    process
    begin
        wait for 30 fs;
        b <= x"AA110000";
        wait for 15 fs;
        b <= x"FFFF0001";
        wait for 7 fs;
        b <= x"11110001";
        wait for 9 fs;
        b <= x"CCCD0000";
        wait for 9 fs;
        b <= x"ABCD0000";
    end process;
end architecture;
