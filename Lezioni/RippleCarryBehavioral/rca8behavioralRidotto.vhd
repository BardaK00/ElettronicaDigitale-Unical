entity rca8bit is port(
    A, B : in bit_vector(7 downto 0);
    Cin : in bit;
    Sum : out bit_vector(8 downto 0)
);
end rca8bit;
architecture behavioral of rca8bit is
    signal C : bit_vector(8 downto 0);
    signal P : bit_vector(7 downto 0);
    
    begin
        C(0) <= Cin;
        P <= A xor B;
        --questo funziona perchè è come se facesse un xor bit a bit tra A e B, quindi P(i) = A(i) xor B(i)--
        Sum(7 downto 0) <= P xor C(7 downto 0);
        --non si può utilizzare l'aggregazione anche su c perchè bisognerebbe enumerare tutte le condizioni possibili di p, a 8 bit sono 256--
        C(8 downto 1) <= (P and C(7 downto 0)) or (A and B);
        Sum(8) <= C(8);

end behavioral;