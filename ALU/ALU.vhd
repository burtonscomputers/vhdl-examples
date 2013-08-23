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
            WHEN "000" => temp:= a AND b;
            WHEN "001" => temp:= a OR b;
            WHEN "010" => temp:= std_logic_vector(unsigned(a) + unsigned(b));
            WHEN "011" => temp := "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU";
            WHEN "100" => temp:= a AND (NOT b);
            WHEN "101" => temp:= a OR (NOT b);
            WHEN "110" => temp:= std_logic_vector(unsigned(a) - unsigned(b));
            WHEN "111" => 
                IF a<b THEN 
                    temp := x"00000001";
                ELSE
                    temp := x"00000000";
                END IF;
            WHEN OTHERS => temp := "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU";
        END CASE;
        result <= temp;
        IF temp=x"00000000" THEN
            zero <= '1';
        ELSIF temp=x"00000001" THEN
            zero <= '0';
        END IF;
    END PROCESS;
END ARCHITECTURE;
