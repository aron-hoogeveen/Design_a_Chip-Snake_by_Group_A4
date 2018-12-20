library IEEE;
use IEEE.std_logic_1164.ALL;

entity v_counter is
   port(clk     : in  std_logic;
        reset   : in  std_logic;
        enable  : in  std_logic;
        v_count : out std_logic_vector(9 downto 0));
end v_counter;

