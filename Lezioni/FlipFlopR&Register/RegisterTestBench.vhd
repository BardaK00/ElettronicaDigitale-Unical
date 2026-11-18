library ieee;
use ieee.std_logic_1164.all;

entity RegisterTestBench is
end RegisterTestBench; 

architecture testbench of RegisterTestBench is
    signal D:std_logic_vector(3 downto 0);
    signal clk,preset:std_logic;
    signal Q:std_logic_vector(3 downto 0);
begin