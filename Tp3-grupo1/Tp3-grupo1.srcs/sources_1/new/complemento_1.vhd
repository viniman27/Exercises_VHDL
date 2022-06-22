
-- Arquivo para realizar o complemento de 1



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity complemento_de_1 is
    Port ( P : in STD_LOGIC_VECTOR (3 downto 0);  --Vetor inicial P
           Z : out STD_LOGIC_VECTOR (3 downto 0); --Vetor mantido ou transformado Z
           SEL : in STD_LOGIC);            --Seletor SEL
end complemento_de_1;

architecture Behavioral of complemento_de_1 is


BEGIN

    process(P,SEL)
    begin
        if (SEL = '1') then --Realiza o complemento de 1
           Z <= not P ;
        else                --Não realiza o complemento de 1
           Z <= P;
        end if;
    end process;
    
end Behavioral;
