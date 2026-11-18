library ieee;
use ieee.std_logic_1164.all;

entity RegisterTestBench is
    -- Essendo la simulazione di un registro generico, è necessario definire il numero di bit del registro stesso. --
    generic(N:integer:=8);
end RegisterTestBench; 

architecture testbench of RegisterTestBench is
    -- Definizione del componente da testare --
    component GenericBitRegisterBehavioral is
        -- La definzione del generic in questo caso non è necessaria poichè N è già definito nella entity del testbench --
    port(
        D:in std_logic_vector(N-1 downto 0);
        clk,preset:in std_logic;
        Q:out std_logic_vector(N-1 downto 0)
    );
    end component;
    
    -- Necessario un signal per ogni valore di ingresso e uscita del componente da testare. --
    signal D:std_logic_vector(N-1 downto 0);
    signal clk,preset:std_logic := '0'; -- Inizializziamo il clock e il preset a 0 --
    signal Q:std_logic_vector(N-1 downto 0);

    constant clk_period:time:=10 ns; -- Definizione del periodo del clock, necessario per la simulazione --

    begin
        -- Instanziazione del componente da testare --
        CUT: GenericBitRegisterBehavioral port map(D,clk,preset,Q);

        -- Sarà necessario un processo per generare ogni segnale in ingresso -- 
        -- Nel testbench la sensitivy list è vuota --
        procPr:process begin -- istante t=0
            -- Nella nostra simulazione vogliamo impostare il preset a 1 solo da 2-4 ns --
            preset<='0';
            wait for 2 ns; -- istante t=2 , facciamo salire il preset a 1
            preset<='1';
            wait for 2 ns; -- istante t=4 , facciamo scendere il preset a 0
            preset<='0';
            wait;
        end process;

        procD : process begin -- istante t=0 , quindi concorrenziale con quello sopra --
            -- Nella nostra simulazione immaginiamo di voler simulare l'ingresso D<=00000000 e poi D<=11111111 --
            D<=(others=>'0');

            wait for 8 ns; -- istante t=8 , rispettando il tempo di setup che abbiamo stabilito --
            -- ovvero 2 ns prima della discesa del clock, quindi il clock deve scendere a multipli di 10 ns--

            -- Dopo aver posizionato la prima che rispetta il tempo di setup possiamo ricavare una costante --
            -- che rappresenta il periodo del clock, in questo caso 10 ns. --
            -- Quindi il clock scenderà a 10 ns, 20 ns, 30 ns, 40 ns ecc --
            -- Per questo possiamo definire una costante di tipo time clk_period nella sezione delle dichiarazioni --

            D<=(others=>'1');
            wait for clk_period; -- istante t=18 --
            D<=(others=>'0');
            wait for clk_period; -- istante t=28 --
            D<=(others=>'1');
            wait;
            -- Abbiamo così fatto variare il nostro valore in ingresso D per 4 volte --
        end process;

        procClk : process begin --clock = 0 poichè specificato nella dichiarazione
            wait for clk_period/2; -- avendo scelto un duty cycle pari al 50% il clock deve rimanere basso (in questo caso) per metà periodo--
            clk <= not clk; -- istante t=5 , clock sale a 1 --
            end process;
         -- La scrittura di questo process è abbastanza per far capire al simulatore che il clock deve continuare a salire e scendere per tutta la durata della simulazione in modo automatico. --
        -- Questo perchè non abbiamo inserito il wait; alla fine del processo --
end testbench;
