LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY ALU IS
    PORT (a: IN std_logic_vector(31 DOWNTO 0);
          b: IN std_logic_vector(31 DOWNTO 0);
          alucontrol: IN bit_vector(2 DOWNTO 0);
          zero: OUT bit;
          result: OUT std_logic_vector(31 DOWNTO 0));
END ALU;

ARCHITECTURE ALU_arq OF ALU IS
BEGIN
    PROCESS(a, b, alucontrol)
        VARIABLE temp: std_logic_vector(31 DOWNTO 0);    
    BEGIN
        CASE alucontrol IS
            WHEN "000" => temp:= UNSIGNED(a) AND UNSIGNED(b);
            WHEN "001" => temp:= UNSIGNED(a) AND UNSIGNED(b);
            WHEN "010" => temp:= UNSIGNED(a) + UNSIGNED(b);
            WHEN "100" => temp:= UNSIGNED(a) AND (NOT UNSIGNED(b));
            WHEN "101" => temp:= UNSIGNED(a) OR (NOT UNSIGNED(b));
            WHEN "110" => temp:= UNSIGNED(a) - UNSIGNED(b);
            WHEN "111" => temp:= SLT
