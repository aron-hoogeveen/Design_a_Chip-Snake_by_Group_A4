library IEEE;
use IEEE.std_logic_1164.all;

architecture behaviour of snake_out is

type snake_out_state is (idle, set_flags, set_flags_with_tail, wait_chc, wait_g, wait_chc_with_tail, wait_g_with_tail, clear);
signal state, next_state: snake_out_state;

begin

process (clk) 
begin 	
	if (rising_edge (clk)) then
		if (reset = '1') then
			state <= idle;
		else
			state <= next_state;
		end if;
	end if;
end process;

process (corner1, corner2) -- calculates x and y bounds
begin
	if corner1 (4 downto 0) = corner2 (4 downto 0) then -- if y corner1 = y corner2
		
			if corner1 (9 downto 5) < corner2 (9 downto 5) then -- if x corner1 < x corner2
				x_bounds <= corner1 (9 downto 5) & corner2 (9 downto 5); -- lower bound x is x corner1 upper bound is x corner2
			else
				x_bounds <= corner2 (9 downto 5) & corner1 (9 downto 5); -- lower bound x is x corner2 upper bound is x corner1
			end if;
	
	y_bounds <= corner1 (4 downto 0) & corner2 (4 downto 0); -- y bounds are two times the same y coordinate
				
	else							-- x coordinates are the same
		if corner1 (4 downto 0) < corner2 (4 downto 0) then -- if y corner1 < y corner2
			y_bounds <= corner1 (4 downto 0) & corner2 (4 downto 0); -- lower bound y is y corner1 upper bound is y corner2
		else
			y_bounds <= corner2 (4 downto 0) & corner1 (4 downto 0); -- lower bound y is y corner2 upper bound is y corner1
		end if;
			
	x_bounds <= corner1 (9 downto 5) & corner2 (9 downto 5); -- x bounds are two times the same x coordinates

	end if;
end process;

process (state, flag_coc, clr_flag_g, clr_flag_chc, tail) -- determines when the x and y bounds are passed on to graphics and check collision

begin

case state is

	when idle =>
	
		clr_flag_coc <= '0';
		flag_chc <= '0';
		tail_out <= '0';
		
		if flag_coc = '1' then
			if tail = '1' then
				next_state <= set_flags_with_tail;
			else
				next_state <= set_flags;
			end if;
		else
			next_state <= idle;
		end if;
		
	when set_flags_with_tail =>

		clr_flag_coc <= '0';
		flag_chc <= '1';
		tail_out <= '1';
		
		if clr_flag_g = '1' then
			if clr_flag_chc = '1' then
				next_state <= clear;
			else
				next_state <= wait_chc_with_tail;
			end if;
		else
			if clr_flag_chc = '1' then
				next_state <= wait_g_with_tail;
			else
				next_state <= set_flags_with_tail;
			end if;
		end if;
		
	when wait_g_with_tail =>
	
		clr_flag_coc <= '0';
		flag_chc <= '0';
		tail_out <= '0';

		if clr_flag_g = '1' then
			next_state <= clear;
		else
			next_state <= wait_g_with_tail;
		end if;
		
	when wait_chc_with_tail =>
	
		clr_flag_coc <= '0';
		tail_out <= '1';
		flag_chc <= '1';

		if clr_flag_chc = '1' then
			next_state <= clear;
		else
			next_state <= wait_chc_with_tail;
		end if;	

	when set_flags =>

		clr_flag_coc <= '0';
		flag_chc <= '1';
		tail_out <= '0';
		
		if clr_flag_g = '1' then
			if clr_flag_chc = '1' then
				next_state <= clear;
			else
				next_state <= wait_chc;
			end if;
		else
			if clr_flag_chc = '1' then
				next_state <= wait_g;
			else
				next_state <= set_flags;
			end if;
		end if;
		
	when wait_g =>
	
		clr_flag_coc <= '0';
		flag_chc <= '0';
		tail_out <= '0';

		if clr_flag_g = '1' then
			next_state <= clear;
		else
			next_state <= wait_g;
		end if;
		
	when wait_chc =>
	
		clr_flag_coc <= '0';
		tail_out <= '0';
		flag_chc <= '1';

		if clr_flag_chc = '1' then
			next_state <= clear;
		else
			next_state <= wait_chc;
		end if;
	
	when clear =>

		clr_flag_coc <= '1';
		flag_chc <= '0';
		tail_out <= '0';

		next_state <= idle;
	
end case;
end process;
end architecture behaviour;

