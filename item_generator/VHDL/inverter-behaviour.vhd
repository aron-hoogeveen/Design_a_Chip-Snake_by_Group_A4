library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of inverter is
begin
	z <= not a after 3.14159265 ns;
end behaviour;

