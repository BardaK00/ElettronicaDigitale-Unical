library Ieee;
use Ieee.Std_logic_1164.all;

entity FF_RP is 
port(
    D,clk,preset:in std_logic;
    Q:out std_logic
)
end FF_RP;

architecture behav of FF_RP is --descrizione comportamentale --
begin
    process(clk,preset) -- nessun cambiamento di D può provocare un cambiamento di Q, quindi D non è incluso nella sensitivity list
    begin
        -- Bisogna prima controllare il valore del preset --
        if(preset ='1') then -- Se il preset è alto, Q assume il valore di 1 --
            Q<='1';

        -- Bisogna verificare la condizione dello stato di clock --
        else if falling_edge(clk) then 
            Q<=D; -- se il clock è alto, Q assume il valore di D --
            end if;
        end if;
        -- nel caso in cui non si abbia un cambiamento di clock, Q mantiene il suo valore precedente --
    end process;
end behav;
