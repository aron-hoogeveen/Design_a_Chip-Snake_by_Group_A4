library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour_corner_calc of corner_calc is

type corner_calculation_state is (start, calculate, request_next_list, send_tail, send_list, wait_snake_out, send_tail_2, extra_tail, only_send);
signal state, next_state: corner_calculation_state;
signal corner2_concatenate_x : std_logic_vector (9 downto 0);
signal corner2_concatenate_y : std_logic_vector (9 downto 0); 

begin

corner2_concatenate_x <= snake_list (6 downto 2) & snake_list (11 downto 7); -- x corner2 concatenated with y corner1 --
corner2_concatenate_y <= snake_list (16 downto 12) & snake_list (6 downto 2); -- x corner1 concatenated with y corner2

process (snake_list, corner2_concatenate_x, corner2_concatenate_y) -- calculates two corners --
begin
	if ( snake_list (1) = '0' ) then -- snake_list (1) determines which coordinate of corner2 is available  
		corner2 <= corner2_concatenate_x; -- to determine how corner2 should be created
	else
		corner2 <= corner2_concatenate_y;
	end if;
corner1 <= snake_list (16 downto 7);
end process;

process (clk) 
begin 	
	if (rising_edge (clk)) then
		if (reset = '1') then
			state <= start;
		else
			state <= next_state;
		end if;
	end if;
end process;

process (snake_list, state, clear_flag_sl, clear_flag_so, flg_ok_tail)


begin

case state is

	when start =>
		
		next_state <= calculate;
		
		flag_next_list <= '0';
		flag_tail <= '0';
		flag_snake_out <= '1';
		flag_tail_so <= '1';

	when calculate => 

		if (snake_list (0) = '1' and clear_flag_so = '1') then
			next_state <= send_tail_2;
		elsif (snake_list (0) = '1') then
			next_state <= send_tail;
		elsif (clear_flag_so = '1') then
			next_state <= request_next_list;
		else
			next_state <= calculate;
		end if;
		
		flag_snake_out <= '0';	
		flag_next_list <= '0';
		flag_tail <= '0';
		flag_tail_so <= '0';
	
	when request_next_list =>

		if (clear_flag_sl = '1') then
			next_state <= send_list;
		else
			next_state <= request_next_list;
		end if;
		
		flag_snake_out <= '0';
		flag_next_list <= '1';
		flag_tail <= '0';
		flag_tail_so <= '0';	

	when send_list =>
		
		if (snake_list (0) = '1') then
			next_state <= extra_tail;
		else
			next_state <= only_send;
		end if;

		flag_snake_out <= '0';	
		flag_next_list <= '0';
		flag_tail <= '0';
		flag_tail_so <= '0';
	
	when send_tail =>

		if (clear_flag_so = '1' and flg_ok_tail = '1') then
			next_state <= request_next_list;
		elsif (flg_ok_tail = '1') then
			next_state <= wait_snake_out;
		elsif (clear_flag_so = '1') then
			next_state <= send_tail_2;
		else
			next_state <= send_tail;
		end if;
		
		flag_snake_out <= '0';
		flag_next_list <= '0';
		flag_tail <= '1';
		flag_tail_so <= '0';

	when send_tail_2 =>

		if (flg_ok_tail = '1') then
			next_state <= request_next_list;
		else
			next_state <= send_tail_2;
		end if;

		flag_snake_out <= '0';
		flag_next_list <= '0';
		flag_tail <= '1';
		flag_tail_so <= '0';

	when wait_snake_out =>

		if (clear_flag_so = '1') then
			next_state <= request_next_list;
		else
			next_state <= wait_snake_out;
		end if;

		flag_snake_out <= '0';
		flag_next_list <= '0';
		flag_tail <= '0';
		flag_tail_so <= '0';
	
	when extra_tail =>

		next_state <= calculate;

		flag_snake_out <= '1';
		flag_next_list <= '0';
		flag_tail <= '0';
		flag_tail_so <= '1';
	
	when only_send =>

		next_state <= calculate;

 		flag_snake_out <= '1';
		flag_next_list <= '0';
		flag_tail <= '0';
		flag_tail_so <= '0';		

end case;
end process;
end behaviour_corner_calc;
