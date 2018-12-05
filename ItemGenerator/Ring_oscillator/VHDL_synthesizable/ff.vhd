library IEEE;
use IEEE.std_logic_1164.ALL;

entity ff is
   port(d     : in  std_logic;
        clk   : in  std_logic;
        reset : in  std_logic;
        q     : out std_logic);
end ff;

