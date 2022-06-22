
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;



entity somador_4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);  --vetor A
           B : in STD_LOGIC_VECTOR (3 downto 0);  --vetor B
           SEL : in STD_LOGIC;                    --Seletor SEL
           S : out STD_LOGIC_VECTOR (3 downto 0); -- resultado 
           E : out STD_LOGIC;                     --detector overflow
           Cout : out STD_LOGIC);                 --carry out
end somador_4bit;

architecture Behavioral of somador_4bit is




signal c0,c1,c2,c3: STD_LOGIC;
signal cin: STD_LOGIC:='0';
signal Y : STD_LOGIC_VECTOR (3 downto 0);

component somador_1bit 
    Port ( a : in STD_LOGIC;       --Porta a
           b : in STD_LOGIC;       --Porta b
           cin : in STD_LOGIC;     --Carry in
           s : out STD_LOGIC;      --Saida s
           cout : out STD_LOGIC);  --Carry out
end component;

component detecoverflow 
    Port ( A3 : in std_logic;       --bit de sinal do primeiro numero
           B3 : in std_logic;       --bit de sinal do segundo numero
           Cof : in std_logic;      --carry anterior
           overflow: out STD_LOGIC);--indicador de overflow
end component;

component complemento_1
    Port ( P : in STD_LOGIC_VECTOR (3 downto 0);  --Vetor inicial P
           Z : out STD_LOGIC_VECTOR (3 downto 0); --Vetor mantido ou transformado Z
           SEL : in STD_LOGIC); --Seletor SEL
end component;

begin

    comp1 : complemento_1 port map (P=>B,Z=>Y,SEL=>SEL);
    process(SEL, Y, c0, c1, c2, c3)
    BEGIN
        if SEL = '1' then
            somaSEL1 : somador_1bit port map (a =>Y(0),b=>SEL,cin=>cin,s=>Y(0),cout=>c0);
            somaSEL2 : somador_1bit port map (a =>Y(1),b=>c0,cin=>cin,s=>Y(1),cout=>c1);
            somaSEL3 : somador_1bit port map (a =>Y(2),b=>c1,cin=>cin,s=>Y(2),cout=>c2);
            somaSEL4 : somador_1bit port map (a =>Y(3),b=>c2,cin=>cin,s=>Y(3),cout=>c3);
        end if;
    end process;
     
            
    soma1 :  somador_1bit port map (a =>A(0),b=>Y(0),cin=>cin,s=>S(0),cout=>c0);
    soma2 :  somador_1bit port map (a =>A(1),b=>Y(1),cin=>c0,s=>S(1),cout=>c1);
    soma3 :  somador_1bit port map (a =>A(2),b=>Y(2),cin=>c1,s=>S(2),cout=>c2);
    soma4 :  somador_1bit port map (a =>A(3),b=>Y(3),cin=>c2,s=>S(3),cout=>c3); 
    overflow : detecoverflow port map (A3=>A(3),B3=>Y(3),Cof=>C3,overflow=>E);
    Cout<= c3;
    
    
    
    
end Behavioral;
