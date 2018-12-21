library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of snake_image is
type snake_state is (reset_state, write_snake, flag_state);

signal state, next_state: snake_state;
signal loc_x_L, loc_x_H, loc_y_L, loc_y_H : unsigned(9 downto 0);
begin
-- convert matrix elements to correspondig counter values
loc_x_L <= 10*unsigned(loc_xL);
loc_x_H <= 10*unsigned(loc_xH);
loc_y_L <= 20*unsigned(loc_yL);
loc_y_H <= 20*unsigned(loc_yH);

-- process that defines the FSM
	process(state, h_count, v_count, loc_x_L, loc_x_H, loc_y_L, loc_y_H)
	begin
		case state is

			when reset_state => 
				snake	<= '0';
				clr_flag	<= '0';
				if((unsigned(h_count) >= loc_x_L) and (unsigned(h_count) <= loc_x_H + 10) and (unsigned(v_count) >= loc_y_L) and (unsigned(v_count) <= loc_y_H + 20)) then
					next_state <= write_snake;
				else
					next_state <= reset_state;
				end if;
					

			when write_snake => 
				snake	<= '1';
				clr_flag	<= '0';

				if(unsigned(h_count) >= loc_x_H + 10) then
					if(unsigned(v_count) >= loc_y_H + 20) then
						next_state <= flag_state;
					else
						next_state <= reset_state;
					end if;
				else
					next_state <= state;
				end if;
			
			when flag_state =>
				snake	<= '0';
				clr_flag	<= '1';		
				next_state <= reset_state;

			when others =>
				snake	<= '0';
				clr_flag	<= '0';
				next_state <= reset_state;
		end case;
	end process;

	-- process that switches between states
	process(clk)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				state <= reset_state;
			else 
				state <= next_state;
			end if;
		end if;
	end process;
end behaviour;

