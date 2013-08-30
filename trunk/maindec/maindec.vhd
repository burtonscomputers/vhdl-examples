LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY maindec IS
    GENERIC (n: INTEGER := 6;
             m: INTEGER := 2);
    PORT (Op: IN STD_LOGIC_VECTOR ((n-1) DOWNTO 0);
          MemToReg, MemWrite, Branch, AluSrc, RegDst, RegWrite, 
          Jump: OUT STD_LOGIC;
          AluOp: OUT STD_LOGIC_VECTOR((m-1) DOWNTO 0));
END maindec;

---------------------------------------------------------

ARCHITECTURE arch1 OF maindec IS
    SIGNAL parcial_result: STD_LOGIC_VECTOR(8 DOWNTO 0);
BEGIN
    parcial_result <= ("110000010") WHEN (Op = "000000") ELSE
                      ("101001000") WHEN (Op = "100011") ELSE
                      ("001010000") WHEN (Op = "101011") ELSE
                      ("000100001") WHEN (Op = "000100") ELSE
                      ("101000000") WHEN (Op = "001000") ELSE
                      ("000000100") WHEN (Op = "000010") ELSE
                      ("---------");

    RegWrite <= parcial_result(8);
    RegDst <= parcial_result(7);
    AluSrc <= parcial_result(6);
    Branch <= parcial_result(5);
    MemWrite <= parcial_result(4);
    MemToReg <= parcial_result(3);
    Jump <= parcial_result(2);
    AluOp <= parcial_result(1 DOWNTO 0);

END arch1;
