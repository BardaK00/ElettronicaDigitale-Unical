entity RcaBehavioral is 
    generic (n : integer:= 4);
    port(
        A,B :in  bit_vector(n - 1   downto 0);
        Cin :in  bit;
        Sum : out bit_vector(n - 1  downto 0)
        );
end RcaBehavioral;

architecture rcaBehav of RcaBehavioral is
    signal p : bit_vector(n-1  downto 0);
    signal c: bit_vector(n downto 0);
    begin
        c(0) <= Cin;
        myfor: for i in 0 to n-1 generate
            p(i) <= A(i) xor B(i);
            c(i+1) <= A(i) when p(i)='0' else c(i);
            Sum(i) <= p(i) xor c(i);
        end generate;
        Sum(n) <= p(n-1) xor c(n);
        
end rcaBehav;