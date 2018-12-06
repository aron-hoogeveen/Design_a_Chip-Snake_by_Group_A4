library IEEE;
use IEEE.std_logic_1164.ALL;

entity rng is
   port(clk  : in  std_logic;
        reset : in  std_logic;
        z    : out std_logic);
end rng;

