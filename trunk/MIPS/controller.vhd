library ieee;
use ieee.std_logic_1164.all;

library work;
use work.components1.all;

entity controller is
    port (Op, Funct: in std_logic_vector(5 downto 0);
          MemToReg, MemWrite, Branch, AluSrc, RegDst, RegWrite, 
          Jump: out std_logic;
          AluControl: out std_logic_vector(2 downto 0));
end entity;

architecture arq_controller of controller is
    signal AluOp: std_logic_vector(1 downto 0); --Pablo hacer señal temporal;
begin
    p0: maindec port map (Op, MemToReg, MemWrite, Branch, AluSrc, RegDst, RegWrite, 
                        Jump, AluOp);
    p1: aludec port map(aluop => AluOp, Funct => funct, AluControl => alucontrol);
end architecture;
