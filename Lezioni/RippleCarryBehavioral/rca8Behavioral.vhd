entity rca8bit is port(
    A, B : in bit_vector(7 downto 0);
    Cin : in bit;
    Sum : out bit_vector(8 downto 0);
);
end rca8bit;

architecture behavioral of rca8bit is
    signal C : bit_vector(8 downto 0);
    signal P : bit_vector(7 downto 0);
    
    begin
        C(0) <= Cin;
        P <= A xor B;
        --questo funziona perchè è come se facesse un xor bit a bit tra A e B, quindi P(i) = A(i) xor B(i)--

    Fa:for i in 0 to 7 generate
            C(i+1) <= C(i) when P(i) = '1' else B(i);
            Sum(i) <= P(i) xor C(i);
        end generate;   
        Sum(8) <= C(8);
end behavioral;