entity fullAdder2 is
port(
    A, B, Cin : in bit;
    Cout, S : out bit
);
end fullAdder2;

architecture myFA2 of fullAdder2 is
    signal p: bit;
begin
    --bisogna definire il multiplexer per il segnale di propagate--
    Cout <= Cin when p = '1' else B;
    p <= A xor B;
    S <= p xor Cin;
end myFA2;


