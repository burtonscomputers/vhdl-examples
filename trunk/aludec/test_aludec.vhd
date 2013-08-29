library ieee;
use ieee.std_logic_1164.all;

entity test_aludec is
end entity;

architecture arq_test_aludec of test_aludec is
    component aludec
        port (funct: in std_logic_vector(5 downto 0);
              aluop: in std_logic_vector(1 downto 0);
              alucontrol: out std_logic_vector(2 downto 0));
    end component;
    signal funct_1: std_logic_vector(5 downto 0);
    signal aluop_1: std_logic_vector(1 downto 0);
    signal alucontrol_1: std_logic_vector(2 downto 0);
begin
    prueba: aludec port map (funct_1, aluop_1, alucontrol_1);
    process
    begin
        aluop_1 <= "00";
        wait for 5 ns;
        aluop_1 <= "01";
        wait for 5 ns;
        aluop_1 <= "10";
        wait for 5 ns;
        aluop_1 <= "11";
        wait for 5 ns;
        aluop_1 <= "11";
        wait for 5 ns;
        aluop_1 <= "10";
        wait for 5 ns;
        aluop_1 <= "01";
        wait for 5 ns;
        aluop_1 <= "11";
        wait for 5 ns;
        aluop_1 <= "10";
        wait for 5 ns;
    end process;
    process
    begin
        funct_1 <= "000000";
        wait for 5 ns;
        funct_1 <= "010101";
        wait for 5 ns;
        funct_1 <= "100000";
        wait for 5 ns;
        funct_1 <= "100100";
        wait for 5 ns;
        funct_1 <= "100101";
        wait for 5 ns;
        funct_1 <= "101010";
        wait for 5 ns;
        funct_1 <= "100010";
        wait for 5 ns;
        funct_1 <= "100101";
        wait for 5 ns;
        funct_1 <= "100000";
        wait for 5 ns;
        funct_1 <= "100010";
        wait for 5 ns;
    end process;
end architecture;
