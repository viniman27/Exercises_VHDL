
--Arquivo para realizar a soma de 1 bit


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity somador_1bit is
    Port ( a : in STD_LOGIC;           --Porta a
           b : in STD_LOGIC;           --Porta b
           cin : in STD_LOGIC;         --Carry in
           s : out STD_LOGIC;          --Saida s
           cout : out STD_LOGIC);      --Carry out
end somador_1bit;

architecture Behavioral of somador_1bit is

    begin
       s <= (a xor b) xor cin;
       cout <= (a and b) or (b and cin) or (a and cin);

end Behavioral;
