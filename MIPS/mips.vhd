library ieee;
library work;

use ieee.std_logic_1164.all;
use work.components.all;

entity mips is
    port(reset, clk, dump: in std_logic;
          instr, pc: out std_logic_vector(31 downto 0));
end entity;

architecture arq_mips of mips is
    signal instr1, pc1: std_logic_vector(31 downto 0);
    signal MemToReg, MemWrite, Branch, AluSrc, RegDst, RegWrite, 
        Jump: std_logic;
    signal AluControl: std_logic_vector(2 downto 0);
begin
    a0: controller port map(instr1(31 downto 26),instr1(5 downto 0), 
                    MemToReg, MemWrite, Branch, AluSrc, RegDst, RegWrite, 
                    Jump, AluControl);
    a1: datapath port map(MemToReg, MemWrite, Branch, AluSrc, RegDst, RegWrite, 
                    Jump, dump, reset, clk, AluControl, pc, instr);
end architecture;
