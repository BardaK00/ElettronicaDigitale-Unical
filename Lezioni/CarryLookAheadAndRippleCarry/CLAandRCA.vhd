library IEEE;
use IEEE.std_logic_1164.all;

entity CLAandRCA is 
port(
    -- Gli stessi ingressi a 4 bit arrivano sia all'RCA che all'CLA --
    A,B : in std_logic_vector(3 downto 0);
    Cin :in std_logic; -- Anche lo stesso ingresso come Cin --

    -- Porte di uscita dei nostri sommatori --
    SumCLA:out std_logic_vector(4 downto 0);
    SumRCA: out std_logic_vector(4 downto 0)
);
end CLAandRCA;

architecture behav of CLAandRCA is
    -- Signal di propagate e generate per RippleCarry--
    signal p : std_logic_vector(4 downto 0);
    signal g : std_logic_vector(4 downto 0);
    signal c : std_logic_vector(5 downto 0);


    signal p2 : std_logic_vector(4 downto 0);
    signal g2 : std_logic_vector(4 downto 0);
    signal c2 : std_logic_vector(5 downto 0);
    begin 
        -- p(4) <= p(3) è l'estensione con segno siccome si vuole utilizzare numeri binari a complemento a due
        -- Inizio descrizione RippleCarry --
        p(3 downto 0) <= A xor B;
        p(4) <= p(3);

        g(3 downto 0) <= A and B;
        g(4) <= g(3);
        c(0) <= Cin;
        c(5 downto 1) <= g or (p and c(4 downto 0));
        SumRca <= p xor c(4 downto 0);
        -- Fine descrizione RippleCarry --

        -- Inizio descrizione CarryLookAhead --
         c2(0) <= Cin;
        p2 <= A xor B;
        p2(4) <= p2(3);

        g2<= A and B;
        g2(4) <= g(3);

        c2(1) <= g2(0) or (p2(0) and c2(0));
        c2(2) <= g2(1) or (p2(1) and (g2(0) or (p2(0) and c2(0))));
        c2(3) <= g2(2) or (p2(2) and (g2(1) or (p2(1) and (g2(0) or (p2(0) and c2(0))))));
        c2(4) <= g2(3) or (p(3) and (g2(2) or (p2(2) and (g2(1) or (p2(1) and (g2(0) or (p2(0) and c2(0))))))));
        SumCLA(4 downto 0) <= p2 xor c2(4 downto 0);
        -- Fine descrizione CarryLookAhead --
end behav;
