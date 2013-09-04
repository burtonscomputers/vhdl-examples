library ieee;
use ieee.std_logic_1164.all;

library work;
use work.components.all;

entity datapath is
    port (MemToReg, MemWrite, Branch, AluSrc, RegDst, RegWrite, Jump,
          dump, reset, clk: in std_logic;
          AluControl: in std_logic_vector(2 downto 0);
          pc, instr: out std_logic_vector(31 downto 0));
end entity;

architecture arq_datapath of datapath is
    signal MemToReg, MemWrite, Branch, AluSrc, RegDst, RegWrite, Jump,
          dump, reset, clk: std_logic;
    signal AluControl: std_logic_vector(2 downto 0);
    signal pc, instr: std_logic_vector(31 downto 0));
begin
