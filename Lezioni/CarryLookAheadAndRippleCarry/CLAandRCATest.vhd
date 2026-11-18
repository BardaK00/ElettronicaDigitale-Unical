Library IEEE ;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity test is 
end test;

architecture testbench of test is 

    component CLAandRCA is port(
        A,B : in std_logic_vector(3 downto 0);
        Cin :in std_logic; -- Anche lo stesso ingresso come Cin --

    -- Porte di uscita dei nostri sommatori --
        SumCLA:out std_logic_vector(4 downto 0);
        SumRCA: out std_logic_vector(4 downto 0)
    );
    end component;

    signal sigA,sigB : std_logic_vector(3 downto 0);
    signal sigCin : std_logic;
    signal sumCla: std_logic_vector(4 downto 0);
    signal sumRCA:std_logic_vector(4 downto 0);

    signal verificaRisultati:std_logic_vector(4 downto 0);
    begin
        CUT:CLAandRCA port map(sigA,sigB,sigCin,sumCla,sumRca);
        
        process begin
            for c in 0 to 1 loop
                if c = 0 then sigCin <= '0'; else sigCin <= '1'; end if;

                for i in -8 to 7 loop
                    sigA <= conv_std_logic_vector(i,4);
                    for j in -8 to 7 loop
                        sigB <= conv_std_logic_vector(j,4);
                        verificaRisultati <= sumRca xor sumCla;
                        wait for 10 ns;
                    end loop;
                end loop;
            end loop;
            wait;
        end process;
end testbench;