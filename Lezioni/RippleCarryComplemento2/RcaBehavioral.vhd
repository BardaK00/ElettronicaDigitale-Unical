entity RcaBehavioral is 
    port(
        A,B :in  bit_vector(3 downto 0);
        Cin :in  bit;
        Sum : out bit_vector(4 downto 0)
        );
end RcaBehavioral;

architecture rcaBehav of RcaBehavioral is
    signal p : bit_vector(3 downto 0);
    signal c: bit_vector(4 downto 0);
    begin
        c(0) <= Cin;
        myfor: for i in 0 to 3 generate
            p(i) <= A(i) xor B(i);
            c(i+1) <= A(i) when p(i)='0' else c(i);
            Sum(i) <= p(i) xor c(i);
        end generate;
        Sum(4) <= p(3) xor c(4);
        
end rcaBehav;