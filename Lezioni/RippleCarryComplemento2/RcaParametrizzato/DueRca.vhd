entity dueRcaDiversi is 
port(
    --porte a 8 bit--
    A,B : in bit_vector(7 downto 0);

    --porte a 16 bit--
    AA,BB : in bit_vector(15 downto 0);  

    Cin : in bit;
    --porte di uscita del nostro circuito prima a 8 bit e poi 16 bit--
    Sum9Bit : out bit_vector(8 downto 0);
    Sum16Bit : out bit_vector(16 downto 0);
)
end dueRcaDiversi;

architecture Behavioral of dueRcaDiversi is 
    component RcaBehavioral 
        generic (n : integer:= 4);
        port(
            A,B :in  bit_vector(n - 1   downto 0);
            Cin :in  bit;
            Sum : out bit_vector(n - 1  downto 0)
        );
    end component;
    begin
        rca8Bit: RcaBehavioral generic map (8) port map (A,B,Cin,Sum9Bit);
        rca16Bit: RcaBehavioral generic map(16) port map(AA,BB,Cin,Sum16Bit);
end Behavioral