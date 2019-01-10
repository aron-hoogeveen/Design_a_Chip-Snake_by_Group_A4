library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;


architecture behaviour of item_image is
signal loc_x : unsigned(9 downto 0);
signal loc_y : unsigned(9 downto 0);
signal pow_x : unsigned(9 downto 0);
signal pow_y : unsigned(9 downto 0);

begin

loc_x <= 10*unsigned(location_x);
loc_y <= 20*unsigned(location_y);
pow_x <= 10*unsigned(location_x_pow);
pow_y <= 20*unsigned(location_y_pow);

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
		item_type <= pow_type;
	else
		item <= '0';
	end if;
end process;
end behaviour;
