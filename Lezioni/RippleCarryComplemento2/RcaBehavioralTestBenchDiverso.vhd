library ieee;
use ieee.numeric_bit.all;

entity testBench2 is
end testBench2;

architecture simRcaC2Diverso of testBench2 is 
component RcaBehavioral is port(
     A,B :in  bit_vector(3 downto 0);
     Cin :in  bit;
     Sum : out bit_vector(4 downto 0)
);
end component;

signal sigA,sigB :bit_vector(3 downto 0);
signal Cin :bit;
signal Sum :bit_vector(4 downto 0);
signal error : bit_vector(4 downto 0);
signal sommaAttesa : integer;
begin 
    CUT:RcaBehavioral port map(sigA,sigB,Cin,Sum);
    process begin
        Cin <= '1';cint <= 1;
        -- in c2 il min a 4 bit è -8 e max 7--
        for i in -8 to 7 loop
            -- non posso utilizzare i per dare input ai signal poichè i è int mentre i signal sono bit--
            --costrutto per trasformare il numero i in un bit_vector signed a 4 bit
            sigA<= bit_vector(to_signed(i,4));
            --annestiamo i for per testare ogni ingresso possibile
            for j in -8 to 7 loop
                sigB <= bit_vector(to_signed(j,4));
                --invece di printare nella wave il risultato esatto si fa la xor , se ogni risultato della xor è 0 allora il circuito è corretto --
                sommaAttesa <= i+j+cint;
                error <= sum xor bit_vector(to_signed(sommaAttesa,5));
                --bisogna aggiungere un wait --
                wait for 10 ns;
            end loop;
        end loop;
        wait;
    end process;
end simRcaC2Diverso;