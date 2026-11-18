library Ieee;
use Ieee.Std_logic_1164.all;

entity 4BitRegister is
port(
    D:in std_logic_vector(3 downto 0);
    clk,preset:in std_logic;
    Q:out std_logic_vector(3 downto 0)
)
end 4BitRegister;

architecture structural of 4BitRegister is
component FF_RP is
port(
    D,clk,preset:in std_logic;
    Q:out std_logic
);
end component;
begin 
    FF0: FF_RP port map(D(0),clk,preset,Q(0));
    FF1: FF_RP port map(D(1),clk,preset,Q(1));
    FF2: FF_RP port map(D(2),clk,preset,Q(2));
    FF3: FF_RP port map(D(3),clk,preset,Q(3));
    -- Poteva anche essere realizzato con un for generate --
   --for i in 0 to 3 generate
      --  FF: FF_RP port map(D(i),clk,preset,Q(i));
   -- end generate;
end structural;