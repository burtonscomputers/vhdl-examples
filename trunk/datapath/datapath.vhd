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
    --signal MemToReg, MemWrite, Branch, AluSrc, RegDst, RegWrite, Jump,
    --      dump, reset, clk,: std_logic;
    --signal AluControl: std_logic_vector(2 downto 0);
    --signal pc, instr: std_logic_vector(31 downto 0));
    signal PCSrc: std_logic;
    signal PCPlus4, PCBranch, PCNext, PCJump, PC1, 
            Instr1, Result, SrcA, WriteData, SrcB,
            SignImm, SignImms2, ALUResult, 
            ReadData: std_logic_vector(31 downto 0);
    signal WriteReg: std_logic_vector(4 downto 0);
    signal zero: std_logic;
begin
    PCSrc <= Branch and zero;
    a0: mux2 port map(d0=>PCNext, d1=>PCBranch, s=>PCSrc, y=>PCNext);
    PCJump <= PCPlus4(31 downto 28) & Instr1(25 downto 0) & "00";
    a1: mux2 port map(d0=>PCNext, d1=>PCJump, s=>Jump, y=>PC1);
    a2: flopr port map(d=>PC1, clk=>clk, reset=>reset, q=>PC1);
    a3: adder port map(a=>PC1, b=>x"00000100", y=>PCPlus4);
    a4: imem port map(a=>PC1(7 downto 2), rd=>Instr1);
    a5: regfile port map(ra1=>Instr1(25 downto 21), ra2=>Instr1(20 downto 16),
                        wa3=>WriteReg, wd3=>Result, we3=>RegWrite, clk=>clk,
                        rd1=>SrcA, rd2=>WriteData);
    a6: mux2 port map(d0=>WriteData, d1=>SignImm, s=>AluSrc, y=>SrcB);
    a7: signext port map(a=>Instr1(15 downto 0), y=>SignImm);
    a8: mux2 generic map(N=>5) port map(d0=>Instr1(20 downto 16), 
                    d1=>Instr1(15 downto 11), s=>RegDst, y=>WriteReg);
    a9: sl2 port map(a=>SignImm, y=>SignImms2);
    a10: adder port map(a=>SignImms2, b=>PCPlus4, y=>PCBranch);
    a11: ALU port map(a=>SrcA, b=>SrcB, alucontrol=>AluControl, zero=>zero,
                    result=>ALUResult);
    a12: dmem port map(a=>ALUResult, wd=>WriteData, clk=>clk, we=>MemWrite,
                    rd=>ReadData, dump=>dump);
    a13: mux2 port map(d0=>ALUResult, d1=>ReadData, s=>MemToReg, y=>Result);
    pc <= PC1;
    instr <= Instr1;
end architecture;
