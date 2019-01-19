library IEEE;
use IEEE.std_logic_1164.ALL;

entity movecounter is
   port(clk   : in  std_logic;
        reset : in  std_logic;
        start : in  std_logic;
        fps  : in  std_logic;
        z_out : out std_logic);
end movecounter;

