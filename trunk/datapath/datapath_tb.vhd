library ieee;
	use ieee.std_logic_1164.all;

entity datapath_tb is
end entity;



architecture TB of datapath_tb is
    component datapath 
        port (MemToReg, MemWrite, Branch, AluSrc, RegDst, RegWrite, Jump,
              dump, reset, clk: in std_logic;
              AluControl: in std_logic_vector(2 downto 0);
              pc, instr: out std_logic_vector(31 downto 0));
    end component;

    signal MemToReg1, MemWrite1, Branch1, AluSrc1, RegDst1, RegWrite1, Jump1,
            dump1, reset1, clk1 : std_logic;
    signal AluControl1 : std_logic_vector(2 downto 0);
    signal pc1, instr1 : std_logic_vector(31 downto 0);

    begin
    dut : datapath port map (
                        MemToReg => MemToReg1,
                        MemWrite => MemWrite1,
                        Branch => Branch1,
                        AluSrc => AluSrc1,
                        RegDst => RegDst1,
                        RegWrite => RegWrite1,
                        Jump => Jump1,
                        AluControl => AluControl1,
                        dump => dump1,
                        pc => pc1,
                        instr => instr1,
                        reset => reset1,
                        clk => clk1
                    );

    process begin
        clk1 <= '1';
        wait for 5 ns;
        clk1 <= '0';
        wait for 5 ns;
    end process;

    process begin
        --STORE WORD--
        MemToReg1 <= '1';
        MemWrite1 <= '1';
        Branch1 <= '1'; --??
        AluSrc1 <= '1';
        RegDst1 <= '0'; --??
        RegWrite1 <= '0';
        Jump1 <= '1';
        AluControl1 <= "010";
        wait for 20 ns;
        dump1 <= '1';
        wait for 20 ns;
        dump1 <= '0';
    end process;


end TB;
