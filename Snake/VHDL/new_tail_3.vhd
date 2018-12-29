library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity new_tail is
port (  reset, clk : in std_logic;
	flag_tail : in std_logic;
	clear_flag_storage : in std_logic;
	collision_food : in std_logic;
	move : in std_logic;
	last_corner : in std_logic_vector (9 downto 0);
	tail : in std_logic_vector (9 downto 0);
	flag_new_tail : out std_logic;
	flg_ok_tail : out std_logic;
	clr_food : out std_logic;
	new_tail_out : out std_logic_vector (9 downto 0)
     );
end entity new_tail;

architecture behaviour_new_tail of new_tail is

type new_tail_state is (wait_state, wait_for_tale, move_state, end_move_state, wait_low_level_move_1, 
wait_low_level_move_2, wait_for_move, send_back_1, send_back_2, send_back_3, send_back_4, clear_food_1, clear_food_2);
signal state, next_state: new_tail_state;
signal new_tail_concatenate_x : std_logic_vector (9 downto 0);
signal increase_y_tail, increase_x_tail, decrease_y_tail, decrease_x_tail : integer;
signal new_tail_concatenate_x1, new_tail_concatenate_x2, new_tail_concatenate_y1, new_tail_concatenate_y2 : std_logic_vector (9 downto 0);

begin

decrease_x_tail <= to_integer(signed(tail (9 downto 5) ) ) - 1;
increase_x_tail <= to_integer(signed(tail (9 downto 5) ) ) + 1;
increase_y_tail <= to_integer(signed(tail (4 downto 0) ) ) + 1;
decrease_y_tail <= to_integer(signed(tail (4 downto 0) ) ) - 1;
new_tail_concatenate_x1 <= tail (9 downto 5) & std_logic_vector(to_signed(increase_y_tail, 5)); -- tail with increased y coordinate
new_tail_concatenate_x2 <= tail (9 downto 5) & std_logic_vector(to_signed(decrease_y_tail, 5)); -- tail with decreased y coordinate
new_tail_concatenate_y1 <= std_logic_vector(to_signed(increase_x_tail, 5)) &  tail (4 downto 0); -- tail with increased x coordinate
new_tail_concatenate_y2 <= std_logic_vector(to_signed(decrease_x_tail, 5)) & tail (4 downto 0); -- tail with decreased x coordinate

process (flag_tail, tail, last_corner, new_tail_concatenate_x1, new_tail_concatenate_x2, new_tail_concatenate_y1, new_tail_concatenate_y2)
begin
		if (tail (9 downto 5) = last_corner (9 downto 5) ) then -- if x lc = x tail -- 
			if (last_corner (4 downto 0) > tail (4 downto 0) ) then -- if y lc > y tail --
				new_tail_out <= new_tail_concatenate_x1;
			else                                                  -- y lc < y tail --
				new_tail_out <= new_tail_concatenate_x2;
			end if;
		else							      -- y lc = y tail --														
			if (last_corner (9 downto 5) > tail (9 downto 5) ) then -- if x lc > x  tail --
				new_tail_out <= new_tail_concatenate_y1;
			else						-- x lc < x tail --
				new_tail_out <= new_tail_concatenate_y2; 
			end if;
		end if;

end process;

process (clk)
begin 	
	if (rising_edge (clk)) then
		if (reset = '1') then
			state <= wait_state;
		else
			state <= next_state;
		end if;
	end if;
end process;

process (flag_tail, collision_food, move, tail, state, last_corner, clear_flag_storage)

begin

case state is

	when wait_state =>
		
		if (move = '1' and collision_food = '1') then		
			next_state <= wait_low_level_move_1;
		elsif (move = '1') then
			next_state <= wait_for_tale;
		elsif (collision_food = '1') then
			next_state <= clear_food_1;
		elsif (flag_tail = '1') then
			next_state <= send_back_1;
		else
			next_state <= wait_state;
		end if;

		flg_ok_tail <= '0';
		flag_new_tail <= '1';
		clr_food <= '0';
	
	when wait_for_move =>

		if (move = '1') then
			next_state <= wait_low_level_move_1;
		elsif (flag_tail = '1') then
			next_state <= send_back_2;
		else
			next_state <= wait_for_move;
		end if;
	
		flg_ok_tail <= '0';
		flag_new_tail <= '0';
		clr_food <= '0';

	when wait_for_tale =>

		if (flag_tail = '1') then
			next_state <= move_state;
		else
			next_state <= wait_for_tale;
		end if;
		
		flg_ok_tail <= '0';
		flag_new_tail <= '0';
		clr_food <= '0';

	when move_state =>
	
		if (clear_flag_storage = '1') then
			next_state <= end_move_state;
		else
			next_state <= move_state;
		end if;

		flg_ok_tail <= '0';
		flag_new_tail <= '1';
		clr_food <= '0';

	when end_move_state =>

		next_state <= wait_low_level_move_1;

		flg_ok_tail <= '1';
		flag_new_tail <= '0';
		clr_food <= '0';

	when wait_low_level_move_1 =>

		if (move = '0') then
			next_state <= wait_state;
		elsif(collision_food = '1') then
			next_state <= clear_food_2;
		elsif (flag_tail = '1') then
			next_state <= send_back_3;
		else
			next_state <= wait_low_level_move_1;
		end if;

		flg_ok_tail <= '0';
		flag_new_tail <= '0';
		clr_food <= '0';

	when send_back_1 =>

		next_state <= wait_state;

		flg_ok_tail <= '1';
		flag_new_tail <= '0';
		clr_food <= '0';

	when send_back_2 =>

		next_state <= wait_for_move;

		flg_ok_tail <= '1';
		flag_new_tail <= '0';
		clr_food <= '0';

	when send_back_3 =>

		next_state <= wait_low_level_move_1;

		flg_ok_tail <= '1';
		flag_new_tail <= '0';
		clr_food <= '0';
	
	when send_back_4 =>

		next_state <= wait_low_level_move_2;

		flg_ok_tail <= '1';
		flag_new_tail <= '0';
		clr_food <= '0';
	
	when clear_food_1 =>

		next_state <= wait_for_move;
		
		flg_ok_tail <= '0';
		flag_new_tail <= '0';
		clr_food <= '1';

	when clear_food_2 =>

		next_state <= wait_low_level_move_2;

		flg_ok_tail <= '0';
		flag_new_tail <= '0';
		clr_food <= '1';

	when wait_low_level_move_2 =>

		if (move = '0') then
			next_state <= wait_for_move;
		elsif (flag_tail = '1') then
			next_state <= send_back_4;
		else
			next_state <= wait_low_level_move_2;
		end if;
		
end case;
end process;
end architecture behaviour_new_tail;