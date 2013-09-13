library ieee;
use ieee.std_logic_1164.all;

package components1 is
    component aludec
        port (funct: in std_logic_vector(5 downto 0);
              aluop: in std_logic_vector(1 downto 0);
              alucontrol: out std_logic_vector(2 downto 0));
    end component;

    component maindec
        port (Op: in std_logic_vector(5 downto 0);
              MemToReg, MemWrite, Branch, AluSrc, RegDst, RegWrite, 
              Jump: out std_logic;
              AluOp: out std_logic_vector(1 downto 0));
    end component;
end package;
