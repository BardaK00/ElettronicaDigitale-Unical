entity SimRca2 is 
-- la entity SimRca2 non ha porte, quindi non ha bisogno di port() --
-- è la sintassi di vhdl a richiedere la presenza di entity --
end SimRca2;

architecture mySimRca2 of SimRca2 is
    --all'interno del testbench bisogna dichiarare il circuito da testare--
    component RippleCarryAdder2bit is port(
        A1 , A0: in bit;
        B1 , B0: in bit;
        Cin : in bit;
        Cout : out bit;
        S1 , S0 : out bit
    );
    end component;
    --ora bisogna dare un nome ai collegamenti tra il testbench e il circuito --
    -- ci deve essere un segnale per ognuna delle porte del mio component--
    signal A1 , A0 , B1 , B0 , Cin , Cout , S1 , S0 : bit;
    
    begin 
        --l'ordine con cui descrivo le onde di test dei segnali è importante--
        --questo perchè sulla base del segnale, i signal variano il proprio valore--

        --per specificare che un gruppo di signal non è concorrente ma sequenziale--
        process begin 
            --tutto quello dopo il begin inizia a tempo t = 0 --
            --test case n.1 --
            A1 <= '0';A0 <= '0';
            B1 <= '0';B0 <= '1';
            Cin <= '0';
            --per dire che voglio mantenere questi valori per un tot di tempo--
            wait for 10 ns;
            
            --dopo 10 ns possiamo modificare gli ingressi--
            --test case n.2 --
            A1 <= '1';A0 <= '1';

            --non è necessario modificare gli altri poichè restano invariati, in questo caso--
            wait for 10 ns;

            --test case n.3 --
            --in questo caso cambiano tutti gli ingressi--
            A1 <= '0';A0 <= '1';
            B1 <= '1';B0 <= '0';
            Cin <= '1';
            wait for 10 ns;
        end process;

    --bisogna ora richiamare il component e utilzzarlo--
    --CUT (circuit under test) -- 
    CUT : RippleCarryAdder2bit port map(A1,A0,B1,B0,Cin,Cout,S1,S0);
end mySimRca2;