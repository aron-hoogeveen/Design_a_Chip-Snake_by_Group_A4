library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of or2 is
begin
	z <= a or b after 3.14 ns;
end behaviour;

