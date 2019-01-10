library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of color_gen is
type color_state is (field_state, snake_state, food_state, speed_state, invert_state, flicker_state);

signal state, next_state : color_state;
begin
	process(state, video_on, snake, item, item_type)
	begin
		case state is

			when field_state => 
				red	<= '0';
				green	<= '0';
				blue <= '0';
				if (snake = '1') then next_state <= snake_state;
					elsif(item = '1' and snake = '0') 
						if(item_type = "00") then next_state <= food_state;
						elsif(item_type = "01") then next_state <= speed_state;
						elsif(item_type = "10") then next_state <= invert_state;
						else next_state <= flicker_state;
						end if;
				else next_state <= state;
				end if;




			
			when snake_state => 
				red	<= '0';
				green	<= '1';
				blue <= '0';
				if (snake = '0' and item = '0') then next_state <= field_state;
					elsif(item = '1' and snake = '0') then next_state <= item_state;
						else next_state <= state;
				end if;

			when food_state => 
				red	<= '1';
				green	<= '0';
				blue <= '0';
				if (snake = '1') then next_state <= snake_state;
					elsif(item = '0' and snake = '0') then next_state <= field_state;
						else next_state <= state;
				end if;

			when speed_state => 
				red	<= '0';
				green	<= '1';
				blue <= '0';
				if (snake = '1') then next_state <= snake_state;
					elsif(item = '0' and snake = '0') then next_state <= field_state;
						else next_state <= state;
				end if;

			when invert_state => 
				red	<= '0';
				green	<= '1';
				blue <= '1';
				if (snake = '1') then next_state <= snake_state;
					elsif(item = '0' and snake = '0') then next_state <= field_state;
						else next_state <= state;
				end if;

			when flicker_state => 
				red	<= '1';
				green	<= '0';
				blue <= '1';
				if (snake = '1') then next_state <= snake_state and flicker <= '1';
					elsif(item = '0' and snake = '0') then next_state <= field_state;
						else next_state <= state;
				end if;

			when others =>
				red	<= '0';
				green	<= '0';
				blue <= '0';
				next_state <= field_state;
		end case;
	end process;

	-- process that switches between states
	process(clk, video_on)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1' or video_on = '0') then
				state <= field_state;
			else 
				state <= next_state;
			end if;
		end if;
	end process;

end behaviour;
