library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all; --función (+) y UNSIGNED

ENTITY adder IS
    PORT (a: IN std_logic_vector(31 DOWNTO 0);
          b: IN std_logic_vector(31 DOWNTO 0);
          y: OUT std_logic_vector(31 DOWNTO 0));
END adder;

ARCHITECTURE sum_estructure OF adder IS
BEGIN

    PROCESS (a, b) IS
    BEGIN
        y <= std_logic_vector(UNSIGNED(a) + UNSIGNED(b));
    END PROCESS;
END sum_estructure;

--ghdl -a -Wc,-m32 -Wa,--32 nombre.vhdl
--Para maquinas de 64bits 
