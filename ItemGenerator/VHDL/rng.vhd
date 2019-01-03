library IEEE;
use IEEE.std_logic_1164.ALL;

entity rng is
   port(clk   : in  std_logic;		--General clk signal
        reset : in  std_logic;		--General reset signal
        z     : out std_logic);		--Random bit
end rng;

