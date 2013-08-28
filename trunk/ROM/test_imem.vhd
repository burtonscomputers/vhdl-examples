library ieee;
use ieee.std_logic_1164.all;

entity test_imem is
end entity;

architecture arq_test_imem of test_imem is
    component imem
        port (a: in std_logic_vector(5 downto 0);
          y: out std_logic_vector(31 downto 0));    
    end component;
    signal a1: std_logic_vector(5 downto 0):="000000";
    signal y1: std_logic_vector(31 downto 0);
begin
    prueba0: imem port map (a=>a1, y=>y1);
    process
    begin
        a1 <= "100000";
        wait for 5 ns;
        a1 <= "000100";
        wait for 5 ns;
        a1 <= "111000";
        wait for 5 ns;
        a1 <= "111111";
        wait for 5 ns;
        a1 <= "110000";
        wait for 5 ns;
        a1 <= "101010";
    end process;
end architecture;
