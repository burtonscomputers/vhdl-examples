--   -a --ieee=synopsis -fexplicit -Wc,-m32 -Wa,--32
--   -e -Wa,--32 -Wl,-m32
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dmem is
    port (a: in std_logic_vector(31 downto 0);
          wd: in std_logic_vector(31 downto 0);
          clk, we: in std_logic;
          rd: out std_logic_vector(31 downto 0));
end entity;

architecture arq_dmem of dmem is
    type mem is array (0 to 63) of std_logic_vector(31 downto 0);
begin
    process(clk)
        variable my_mem: mem;
        variable address: std_logic_vector(5 downto 0);
        variable pos_a: integer;
    begin
        for pos in 0 to 63 loop --Inicializo mi memoria
            my_mem(pos) := std_logic_vector(to_unsigned(pos, 32));
        end loop;
        if clk'EVENT and clk='1' then
            address := a(7 downto 2);
            pos_a := to_integer(unsigned(address));
            if we='1' then
                my_mem(pos_a) := wd;
                rd <= wd;
            else
                rd <= my_mem(pos_a);
            end if;
        end if;
    end process;
end architecture;
