library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity imem is
    port (a: in std_logic_vector(5 downto 0);
          y: out std_logic_vector(31 downto 0));
end entity;

architecture imem_arq of imem is
    type mem is array (0 to 63) of std_logic_vector(31 downto 0);
    begin
    process(a)
        variable my_mem: mem ;
        variable t1: std_logic_vector(31 downto 0);
    begin
        for pos in 0 to 63 loop
            t1 := std_logic_vector(to_unsigned(pos, 32));
            my_mem(pos) := t1;
        end loop;
            y <= x"ffffffff";
    end process;
end architecture;
