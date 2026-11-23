library ieee;
use ieee.std_logic_1164.all;

-- Per semplicità consideriamo degli ingressi a 4bit in C2 (1 bit in più per il segno) --
entity RippleCarryWithRegister is
    port(
        AA,BB:in std_logic_vector(3 downto 0);
        clk,clear:in std_logic;
        SS:out std_logic_vector(4 downto 0)
    );
end RippleCarryWithRegister;

architecture Behavioral of RippleCarryWithRegister is
    -- Segnale per gli ingressi al Ripple Carry --
    signal A,B:std_logic_vector(3 downto 0);

    --Segnale per l'uscita del Ripple Carry --
    signal S:std_logic_vector(4 downto 0);

    --Segnale di propagate per il Ripple Carry --
    signal P:std_logic_vector(4 downto 0);

    --Segnale di riporto tra i vari stadi del Ripple Carry --
    signal C:std_logic_vector(5 downto 0);

    -- Segnale di generate per il Ripple Carry --
    signal G:std_logic_vector(4 downto 0);

begin
    -- Parte sequenziale per registrare gli ingressi e il comportamento dei registri --
    seq:process (clk,clear)
    begin
        if clear='1' then
            A<=(others=>'0');
            B<=(others=>'0');
            SS<=(others=>'0');
        elsif rising_edge(clk) then
            A<=AA;
            B<=BB;
            SS <= S;
        end if;
    end process;
    
    -- Ripple Carry --
    C(0)<='0'; -- Riporto iniziale a 0 per scelta --
    P(3 downto 0) <= A xor B; -- Propagate --
    P(4) <= P(3); -- Propagate per il bit di segno --

    G(3 downto 0) <= A and B; -- Generate --
    G(4) <= G(3); -- Generate per il bit di segno --

    C(5 downto 1) <=  G or(P and C(4 downto 0)); -- Riporto tra i vari stadi del Ripple Carry --
    S <= P xor C(4 downto 0); -- Somma finale --
end Behavioral;
