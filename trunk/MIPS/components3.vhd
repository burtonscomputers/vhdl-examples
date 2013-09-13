library ieee;
use ieee.std_logic_1164.all;

package components3 is
    component controller
        port (Op, Funct: in std_logic_vector(5 downto 0);
              MemToReg, MemWrite, Branch, AluSrc, RegDst, RegWrite, 
              Jump: out std_logic;
              AluControl: out std_logic_vector(2 downto 0));
    end component;

    component datapath
        port (MemToReg, MemWrite, Branch, AluSrc, RegDst, RegWrite, Jump,
              dump, reset, clk: in std_logic;
              AluControl: in std_logic_vector(2 downto 0);
              pc, instr: out std_logic_vector(31 downto 0));
    end component;
end package;
