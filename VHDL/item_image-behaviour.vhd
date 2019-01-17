library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;


architecture behaviour of item_image is
signal loc_x : unsigned(9 downto 0);
signal loc_y : unsigned(9 downto 0);
signal pow_x : unsigned(9 downto 0);
signal pow_y : unsigned(9 downto 0);

begin

loc_x <= 10*unsigned(location_in(11 downto 7));
loc_y <= 20*unsigned(location_in(6 downto 2));
pow_x <= 10*unsigned(location_pow_in(11 downto 7));
pow_y <= 20*unsigned(location_pow_in(6 downto 2));

bdraw: process (h_count, v_count, loc_x, loc_y, pow_x, pow_y) is
begin
	if (unsigned(h_count) >= loc_x) and
		(unsigned(h_count) <= loc_x + to_unsigned(10, 9)) and
		(unsigned(v_count) >= loc_y ) and
		(unsigned(v_count) <= loc_y + to_unsigned(20, 10)) then
		item <= '1'; 
		item_type <= "00";
	elsif
		(unsigned(h_count) >= pow_x) and
		(unsigned(h_count) <= pow_x + to_unsigned(10, 9)) and
		(unsigned(v_count) >= pow_y ) and
		(unsigned(v_count) <= pow_y + to_unsigned(20, 10)) then
		item <= '1'; 
		item_type <= location_pow_in(1 downto 0);
	else
		item <= '0';
		item_type <= "00";
	end if;
end process;
end behaviour;
