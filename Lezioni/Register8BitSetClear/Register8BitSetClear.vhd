Library ieee;
Use ieee.std_logic_1164.all;

entity Register8BitSetClear is
    port(
        D:in std_logic_vector(7 downto 0);
        clk, set, clear:in std_logic;
        Q:out std_logic_vector(7 downto 0)
    );
end Register8BitSetClear;

architecture Behavioral of Register8BitSetClear is
begin
    process(clk,clear) -- Il clear è un segnale asincrono, quindi lo mettiamo nella sensitivity list --
    begin
        -- Bisogna ora gestire le priorità --
        if clear='1' then -- Se il clear è alto, azzeriamo l'uscita --
            Q<=(others=>'0');
        elsif rising_edge(clk) then -- Se il clear è basso, allora possiamo gestire il clock --
        -- Bisogna ora gestire la priorità tra il set e l'ingresso --
            if set='0' then -- Se il set è basso, allora possiamo settare l'uscita pari a tutti 1 --
                Q<=(others=>'1');  
            else -- Se il set è alto, allora dobbiamo settare l'uscita pari all'ingresso    --
                Q<=D;
            end if;
        end if;
    end process;
end Behavioral;
