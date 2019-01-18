library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of color_gen is
type color_state is (field_black, field_blue, field_white, snake_state, food_state, speed_state, invert_state, flicker_state);
signal state, next_state : color_state;
--signal flicker, new_flicker : std_logic;
--signal field_type, new_field_type : unsigned(1 downto 0);
signal flick_cnt : unsigned(6 downto 0);
begin
	flick_cnt <= unsigned(color_cnt);
	process(state, video_on, snake, item, item_type, flick_cnt, enable_flick)
	begin
		case state is

			--- black field ---
			when field_black =>
				red	<= '0';
				green	<= '0';
				blue 	<= '0';

				------------------------------------
				if(enable_flick = '1') then
					---------------------------------
					if (snake = '1') then 
						next_state <= snake_state;
					elsif(item = '1' and snake = '0') then
						------------------------------
						if(item_type = "00") then
							next_state <= food_state;
						elsif(item_type = "01") then 
							next_state <= speed_state;
						elsif(item_type = "10") then 
							next_state <= invert_state;
						else 
							next_state <= flicker_state;
						end if;
						-------------------------------
					elsif((flick_cnt <= to_unsigned(42,7)) and (enable_flick = '1')) then
						next_state <= field_blue;
					elsif((flick_cnt <= to_unsigned(84,7)) and (enable_flick = '1')) then
						next_state <= field_white;
					else
						next_state <= field_black;
					end if;
					-------------------------------------
				else
					-------------------------------------
					if(snake = '1') then
						next_state <= snake_state;
					elsif(item = '1' and snake = '0') then
						---------------------------------
						if(item_type = "00") then
							next_state <= food_state;
						elsif(item_type = "01") then 
							next_state <= speed_state;
						elsif(item_type = "10") then 
							next_state <= invert_state;
						else 
							next_state <= flicker_state;
						end if;
						--------------------------------
					else
						next_state <= field_black;
					end if;
					------------------------------------
				end if;
				----------------------------------------
								
				--- blue field ---
			when field_blue =>
				red	<= '0';
				green	<= '0';
				blue <= '1';
			
					-------------------------------------
					if((snake = '1') and (enable_flick = '1')) then
						next_state <= snake_state;
					elsif((item = '1') and (snake = '0') and (enable_flick = '1')) then
						---------------------------------
						if(item_type = "00") then
							next_state <= food_state;
						elsif(item_type = "01") then 
							next_state <= speed_state;
						elsif(item_type = "10") then 
							next_state <= invert_state;
						else 
							next_state <= flicker_state;
						end if;
					--------------------------------
					elsif(item = '0' and snake = '0') then
						if((flick_cnt <= to_unsigned(42,7)) and (enable_flick = '1')) then
							next_state <= field_blue;
						elsif((flick_cnt <= to_unsigned(84,7)) and (enable_flick = '1')) then
							next_state <= field_white;
						else
							next_state <= field_black;
						end if;
					else
						next_state <= field_black;	
					end if;
					------------------------------------		

				--- white field ---
			when field_white =>
				red	<= '1';
				green	<= '1';
				blue <= '1';
			
					-------------------------------------
					if((snake = '1') and (enable_flick = '1')) then
						next_state <= snake_state;
					elsif((item = '1') and (snake = '0') and (enable_flick = '1')) then
						---------------------------------
						if(item_type = "00") then
							next_state <= food_state;
						elsif(item_type = "01") then 
							next_state <= speed_state;
						elsif(item_type = "10") then 
							next_state <= invert_state;
						else 
							next_state <= flicker_state;
						end if;
					--------------------------------
					elsif(item = '0' and snake = '0') then next_state <= field_black;
						if((flick_cnt <= to_unsigned(42,7)) and (enable_flick = '1')) then
							next_state <= field_blue;
						elsif((flick_cnt <= to_unsigned(84,7)) and (enable_flick = '1')) then
							next_state <= field_white;
						else
							next_state <= field_black;
						end if;
					else
						next_state <= field_black;	
					end if;
					------------------------------------	
				
				--- snake ---					
			when snake_state => 
				red	<= '0';
				green	<= '1';
				blue <= '0';

				if (snake = '0' and item = '0') then next_state <= field_black;
				elsif((item = '1') and (snake = '0')) then
						---------------------------------
						if(item_type = "00") then
							next_state <= food_state;
						elsif(item_type = "01") then 
							next_state <= speed_state;
						elsif(item_type = "10") then 
							next_state <= invert_state;
						else 
							next_state <= flicker_state;
						end if;
				elsif((flick_cnt <= to_unsigned(42,7)) and (enable_flick = '1')) then
						next_state <= field_blue;	
				elsif((flick_cnt <= to_unsigned(84,7)) and (enable_flick = '1')) then
					next_state <= field_white;
				elsif((flick_cnt >= to_unsigned(84,7)) and (enable_flick = '1')) then
					next_state <= field_black;
				else 
					next_state <= state;
				end if;

				--- food --
			when food_state => 
				red	<= '1';
				green	<= '0';
				blue <= '0';

				if (snake = '1') then next_state <= snake_state;
				elsif((item = '1') and (snake = '0') and (enable_flick = '1')) then
						if(item_type = "00") then
							next_state <= food_state;
						elsif(item_type = "01") then 
							next_state <= speed_state;
						elsif(item_type = "10") then 
							next_state <= invert_state;
						else 
							next_state <= flicker_state;
						end if;
				elsif(item = '0' and snake = '0') then next_state <= field_black;
				elsif((flick_cnt <= to_unsigned(42,7)) and (enable_flick = '1')) then
						next_state <= field_blue;	
				elsif((flick_cnt <= to_unsigned(84,7)) and (enable_flick = '1')) then
					next_state <= field_white;
				elsif((flick_cnt >= to_unsigned(84,7)) and (enable_flick = '1')) then
					next_state <= field_black;
				else 
					next_state <= state;
				end if;
		
				--- speed ---
			when speed_state => 
				red	<= '0';
				green	<= '1';
				blue <= '0';

				if (snake = '1') then next_state <= snake_state;
				elsif((item = '1') and (snake = '0') and (enable_flick = '1')) then
						if(item_type = "00") then
							next_state <= food_state;
						elsif(item_type = "01") then 
							next_state <= speed_state;
						elsif(item_type = "10") then 
							next_state <= invert_state;
						else 
							next_state <= flicker_state;
						end if;
				elsif(item = '0' and snake = '0') then next_state <= field_black;
				elsif((flick_cnt <= to_unsigned(42,7)) and (enable_flick = '1')) then
						next_state <= field_blue;	
				elsif((flick_cnt <= to_unsigned(84,7)) and (enable_flick = '1')) then
					next_state <= field_white;
				elsif((flick_cnt >= to_unsigned(84,7)) and (enable_flick = '1')) then
					next_state <= field_black;
				else 
					next_state <= state;
				end if;
			
				--- invert ---
			when invert_state => 
				red	<= '0';
				green	<= '1';
				blue <= '1';

				if (snake = '1') then next_state <= snake_state;
				elsif((item = '1') and (snake = '0') and (enable_flick = '1')) then
						if(item_type = "00") then
							next_state <= food_state;
						elsif(item_type = "01") then 
							next_state <= speed_state;
						elsif(item_type = "10") then 
							next_state <= invert_state;
						else 
							next_state <= flicker_state;
						end if;
				elsif(item = '0' and snake = '0') then next_state <= field_black;
				elsif((flick_cnt <= to_unsigned(42,7)) and (enable_flick = '1')) then
						next_state <= field_blue;	
				elsif((flick_cnt <= to_unsigned(84,7)) and (enable_flick = '1')) then
					next_state <= field_white;
				elsif((flick_cnt >= to_unsigned(84,7)) and (enable_flick = '1')) then
					next_state <= field_black;
				else 
					next_state <= state;
				end if;

				--- color fickering --
			when flicker_state => 
				red	<= '1';
				green	<= '0';
				blue <= '1';

				if (snake = '1') then 
					next_state <= snake_state;
				elsif((item = '1') and (snake = '0') and (enable_flick = '1')) then
						if(item_type = "00") then
							next_state <= food_state;
						elsif(item_type = "01") then 
							next_state <= speed_state;
						elsif(item_type = "10") then 
							next_state <= invert_state;
						else 
							next_state <= flicker_state;
						end if;
				elsif(item = '0' and snake = '0') then next_state <= field_black;
				elsif((flick_cnt <= to_unsigned(42,7)) and (enable_flick = '1')) then
						next_state <= field_blue;	
				elsif((flick_cnt <= to_unsigned(84,7)) and (enable_flick = '1')) then
					next_state <= field_white;
				elsif((flick_cnt >= to_unsigned(84,7)) and (enable_flick = '1')) then
					next_state <= field_black;
				else 
					next_state <= state;
				end if;
		end case;
	end process;

	-- process that switches between states
	process(clk, video_on)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1' or video_on = '0') then
				state <= field_black;
			else 
				state <= next_state;
			end if;
		end if;
	end process;
end behaviour;
