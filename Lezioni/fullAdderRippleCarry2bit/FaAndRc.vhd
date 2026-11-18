entity fullAdder is 
port(
    A, B, Cin : in bit;
    Sum, Cout : out bit
);
end fullAdder;

architecture myFA of fullAdder is
    signal p,x,y : bit;
begin
    p <= A xor B;
    x <= p and Cin;
    y <= A and B;
    Cout <= x or y;
    Sum <= p xor Cin;
end myFA;


entity RippleCarryAdder2bit is port(
    A1 , A0: in bit;
    B1 , B0: in bit;
    Cin : in bit;
    Cout : out bit;
    S1 , S0 : out bit
);
end RippleCarryAdder2bit;

architecture myRca2 of RippleCarryAdder2bit is
    signal c1 : bit;

    component fullAdder is port(
        A, B, Cin : in bit;
        Sum, Cout : out bit
    );
    end component;

    begin
        FA0 : fullAdder port map(A0,B0,Cin,S0,c1);
        -- c1 viene dato in output da FA0 e dato in input a FA1 automaticamente --
        FA1 : fullAdder port map(A1,B1,c1,S1,Cout);
end myRca2;

