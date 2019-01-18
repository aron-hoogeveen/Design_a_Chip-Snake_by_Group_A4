library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of color_counter is
signal color_cnt_in, new_color_cnt_in : unsigned(9 downto 0);
type color_state is (idle_state, cnt_state);
signal state, next_state : color_state;
signal enable : std_logic;
begin

-------------------------
-- Increment the value --
-------------------------
bcnt: process(state, flicker, color_cnt_in, pulse_60hz)
begin
	case state is


when idle_state =>

	enable	<= '0';
	if((flicker = '1') or (color_cnt_in(9 downto 7) >= to_unsigned(6, 3))) then
		next_state <= cnt_state;
	else 
		next_state <= idle_state;
	end if;

when cnt_state =>

		enable <= '1';
		if(color_cnt_in <= to_unsigned(762,10)) then 
			next_state <= cnt_state;
		else 
			next_state <= idle_state;
		end if;

end case;
end process;
------------------------------------
-- Map new_color_cnt_in to color_cnt_in --
------------------------------------
process(clk, pulse_60hz, enable, color_cnt_in)
begin

	if(enable = '1')then
		if(pulse_60hz = '1') then
				new_color_cnt_in <= color_cnt_in + 1;
		else 
				new_color_cnt_in <= color_cnt_in;
		end if;
	else 
			new_color_cnt_in <=  (others => '0');
	end if;
end process;
	
color_cnt <= std_logic_vector(color_cnt_in(6 downto 0));

process(clk, reset)
begin
	if(clk'event and clk = '1') then
		if(reset = '1')then 
			state <= idle_state;
			color_cnt_in <= (others => '0');
		else 
			state <= next_state;
			color_cnt_in <= new_color_cnt_in;
		end if;
	end if;
end process;
enable_flick <= enable;
end behaviour;

