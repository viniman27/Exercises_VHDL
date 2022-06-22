
--Arquivo para realizar  a deteccao de overflow



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity detecoverflow is
    Port ( A3 : in std_logic;  --bit de sinal do primeiro numero
           B3 : in std_logic;  --bit de sinal do segundo numero
           Cof : in std_logic;  --carry anterior
           overflow: out STD_LOGIC);  --indicador de overflow
end detecoverflow; 

architecture Behavioral of detecoverflow is

begin
    overflow <= (A3 and B3) or (A3 and Cof) or (B3 and Cof);

end Behavioral;
