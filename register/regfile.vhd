library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity regfile is
    port (ra1, ra2, wa3: in std_logic_vector(4 downto 0);
          wd3: in std_logic_vector(31 downto 0);
          we3, clk: in std_logic;
          rd1, rd2: out std_logic_vector(31 downto 0));
end entity;

architecture arq_regfile of regfile is
    type mem is array (0 to 31) of std_logic_vector(31 downto 0);
begin
    process(clk)
        variable my_mem: mem := (0 => x"00000000", others => "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU");
        variable pos_ra1, pos_ra2, pos_wa3: integer;
    begin
        if clk'EVENT and clk='1' then
            pos_ra1 := to_integer(unsigned(ra1));
            pos_ra2 := to_integer(unsigned(ra2));
            rd1 <= my_mem(pos_ra1);
            rd2 <= my_mem(pos_ra2);
            if we3='1' then
                pos_wa3 := to_integer(unsigned(wa3));
                my_mem(pos_wa3) := wd3;
            end if;
        end if;
    end process;
end architecture;
                
            
            
            
            
    
    
          
