library IEEE;
use IEEE.std_logic_1164.ALL;

entity h_counter is
   port(clk     : in  std_logic;
        reset   : in  std_logic;
        h_count : out std_logic_vector(8 downto 0));
end h_counter;

