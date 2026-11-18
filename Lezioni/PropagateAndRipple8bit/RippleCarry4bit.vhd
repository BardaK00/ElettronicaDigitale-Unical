entity RippleCarry8bit is port(
    A,B : in bit_vector(7 downto 0);
    Cin : in bit; --come fosse C0 --
    S: out bit_vector(8 downto 0);
)

architecture myRca8 of RippleCarry8bit is
    component fullAdder2 port(
        A, B, Cin : in bit;
        Cout, S : out bit
    );
    end component;

    signal C: bit_vector(8 downto 0); --C(0) = Cin, C(8) = S(8)--
    begin
        C(0) <= Cin;
        S(8) <= C(8); --possiamo farlo poichè concurrent --
        FA:for i in 1 to 8 generate --parte da 1 perchè C(0) = Cin--
            FullAdd: fullAdder2 port map(
                A(i-1),B(i-1),C(i-1),C(i),S(i-1)
            );
            end generate;
end myRca8;
    