library ieee;
use ieee.std_logic_1164.all;
-- Liberia per convertire gli interi in std_logic_vector e viceversa --
use ieee.std_logic_arith.all;

entity TestbenchRCAwithRegister is
end TestbenchRCAwithRegister;

architecture testbench of TestbenchRCAwithRegister is
    -- Component da testare --
    component RippleCarryWithRegister
        port(
            AA,BB:in std_logic_vector(3 downto 0);
            clk,clear:in std_logic;
            SS:out std_logic_vector(4 downto 0)
        );
    end component;

    signal AA,BB:std_logic_vector(3 downto 0);
    signal clk,clear:std_logic :='0'; -- Inizializzati a 0 --
    signal SS:std_logic_vector(4 downto 0);

    -- Possiamo definire una costante per il valore di clock --
    constant t:time:=10 ns;

    begin
        CUT:RippleCarryWithRegister port map(AA,BB,clk,clear,SS);

        proc_clk:process begin --Impostiamo un duty cycle del 50% per il clock --
        -- Quindi in tempo iniziale 0 abbiamo il clock a 0 e in t/2 lo portiamo a 1, poi in t lo riportiamo a 0 e così via --
            wait for t/2;
                clk<=not clk; -- Ogni t/2 il clock cambia stato --
            end process;

        proc_RCA:process begin 
        -- Specifichiamo prima il comportamente del clear e dopo quello dei registri --
            clear <= '1'; -- Inizialmente il segnale di clear è a 1 --
            wait for 2 ns;
            clear <= '0'; -- Dopo 2 ns il segnale di clear va a 0 --

        -- Bisogna far passare un tempo pari a t/2 - setup time (2ns in questo caso) 
        wait for t/2 - 2 ns - 2 ns ;
        -- Registri con simulazione esaustiva a 4 bit , 2^8 valori totali --
        for i in -8 to 7 loop
            AA <= conv_std_logic_vector(i,4); -- Convertiamo l'intero i in std_logic_vector a 4 bit con la funzione conv_std_logic_vector --
            for j in -8 to 7 loop
                BB <= conv_std_logic_vector(j,4); -- Convertiamo l'intero j in std_logic_vector a 4 bit --
                
                wait for t; -- Aspettiamo un periodo di clock per far registrare i valori --
            end loop;
        end loop;
        wait;
        end process;
        
end testbench;

