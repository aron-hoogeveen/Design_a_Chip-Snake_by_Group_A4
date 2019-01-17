library IEEE;
use IEEE.std_logic_1164.ALL;

entity pulse_speed is
   port(length : in  std_logic_vector(5 downto 0);
        clk    : in  std_logic;
        speed  : out std_logic;
	reset  : in  std_logic);
end pulse_speed;

