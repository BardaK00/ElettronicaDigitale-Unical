entity testRca8bitRidotto is
    -- Testbench for rca8bit entity
end testRca8bitRidotto;
architecture simRca8 of testRca8bitRidotto is
    --istanzio il component --
    component rca8bit is
        port(
            A, B : in bit_vector(7 downto 0);
            Cin : in bit;
            Sum : out bit_vector(8 downto 0)
        );
    end component;

        --istanzio i segnali , uno per ogni ingresso --
        signal sigA , sigB : bit_vector(7 downto 0);
        signal sigCin : bit;
        signal sigSum : bit_vector(8 downto 0);

    begin
        process begin
            sigA <= "00000000";
            sigB <= "00000000";
            sigCin <= '0';
            wait for 10 ns;
            sigA <= "00000001";
            sigB <= "00000001";
            sigCin <= '0';
            wait for 10 ns;
            sigA <= "11111111";
            sigB <= "11111111";
            sigCin <= '1';
            wait for 10 ns;
            sigA <= "10101010";
            sigB <= "01010101";
            sigCin <= '0';
            wait for 10 ns;
            wait;
        end process;
        CUT: rca8bit port map(
            A => sigA,
            B => sigB,
            Cin => sigCin,
            Sum => sigSum
        );
end simRca8;