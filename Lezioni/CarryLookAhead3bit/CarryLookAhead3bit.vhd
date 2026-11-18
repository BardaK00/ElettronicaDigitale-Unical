entity CarryLookAhead3bit is port(
    A,B : in bit_vector(2 downto 0);
    Cin : in bit;
    Sum : out bit_vector(3 downto 0)
);
end CarryLookAhead3bit;

architecture behavioral of CarryLookAhead3bit is
    signal C : bit_vector(3 downto 0);
    signal P : bit_vector(2 downto 0);
    signal G : bit_vector(2 downto 0);

    begin 
        C(0) <= Cin;
        P <= A xor B;
        G<= A and B; ;

        C(1) <= G(0) or (P(0) and C(0));
        C(2) <= G(1) or (P(1) and (G(0) or (P(0) and C(0))));
        C(3) <= G(2) or (P(2) and (G(1) or (P(1) and (G(0) or (P(0) and C(0))))));
        Sum(2 downto 0) <= P xor C(2 downto 0);
        Sum(3) <= C(3);
end behavioral;
        
