library ieee;
use ieee.std_logic_1164.all;    

entity GenericBitRegisterBehavioral is
generic(
    N:integer:=8
);
port(
    D:in std_logic_vector(N-1 downto 0);
    clk,preset:in std_logic;
    Q:out std_logic_vector(N-1 downto 0)
);
end GenericBitRegisterBehavioral;

architecture behav of GenericBitRegisterBehavioral is
begin
    process(clk,preset) begin
        -- Se preset alto forziamo l'uscita a 1111, --
        if(preset='1') then
            Q<=(others=>'1');
        -- altrimenti se c'è un fronte di discesa del clock, Q assume il valore di D. --
        else if falling_edge(clk) then
            Q<=D;
        end if;
         --In caso contrario Q mantiene il suo valore precedente --
        end if;
    end process;
end behav;