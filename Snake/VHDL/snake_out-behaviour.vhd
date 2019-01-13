library IEEE;
use IEEE.std_logic_1164.all;

architecture behaviour_snake_out of snake_out is

type snake_out_state is (idle, compare_x, create_ybounds, create_xbounds, set_flags, wait_chc, wait_g, clear, set_tail, set_xbounds, set_ybounds, x2_x1, x1_x2, y2_y1, y1_y2);
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

process (state, flag_coc, corner1, corner2, clr_flag_g, clr_flag_chc)

begin

case state is

	when idle =>
	
		clr_flag_coc <= '0';
		x_bounds <= "0000000000";
		y_bounds <= "0000000000";
		flag_g <= '0';
		flag_chc <= '0';
		tail_out <= '0';
		
		if flag_coc = '1' then
			if tail = '1' then
				next_state <= set_tail;
			else
				next_state <= compare_x;
			end if;
		else
			next_state <= idle;
		end if;
		
	when set_tail =>
	
		clr_flag_coc <= '0';
		x_bounds <= "0000000000";
		y_bounds <= "0000000000";
		flag_g <= '0';
		flag_chc <= '0';
		tail_out <= '1';
		next_state <= compare_x;
		
	when compare_x =>
	
		clr_flag_coc <= '0';
		x_bounds <= "0000000000";
		y_bounds <= "0000000000";
		flag_g <= '0';
		flag_chc <= '0';
		tail_out <= tail_out;
	
		if corner1 (4 downto 0) = corner2 (4 downto 0) then
			next_state <= set_ybounds;
		else
			next_state <= set_xbounds;
		end if;
		
	when set_ybounds =>
	
		clr_flag_coc <= '0';
		x_bounds <= "0000000000";
		y_bounds <= corner1 (4 downto 0) & corner2 (4 downto 0);
		flag_g <= '0';
		flag_chc <= '0';
		tail_out <= tail_out;
		
		next_state <= create_xbounds;
		
	when set_xbounds =>
	
		clr_flag_coc <= '0';
		x_bounds <= corner1 (9 downto 5) & corner2 (9 downto 5);
		y_bounds <= "0000000000";
		flag_g <= '0';
		flag_chc <= '0';
		tail_out <= tail_out;
		
		next_state <= create_ybounds;
	
	when create_xbounds =>
	
		clr_flag_coc <= '0';
		x_bounds <= "0000000000";
		y_bounds <= y_bounds;
		flag_g <= '0';
		flag_chc <= '0';
		tail_out <= tail_out;

		if corner1 (9 downto 5) > corner2 (9 downto 5) then
			next_state <= x1_x2;
		else
			next_state <= x2_x1;
		end if;
		
	when x1_x2 =>
	
		clr_flag_coc <= '0';
		y_bounds <= y_bounds;
		flag_g <= '0';
		flag_chc <= '0';
		tail_out <= tail_out;
		x_bounds <= corner1 (9 downto 5) & corner2 (9 downto 5);
		
		next_state <= set_flags;
		
	when x2_x1 =>
	
		clr_flag_coc <= '0';
		y_bounds <= y_bounds;
		flag_g <= '0';
		flag_chc <= '0';
		tail_out <= tail_out;
		x_bounds <= corner2 (9 downto 5) & corner1 (9 downto 5);
		
		next_state <= set_flags;
	
	when create_ybounds =>
	
		clr_flag_coc <= '0';
		y_bounds <= "0000000000";
		x_bounds <= x_bounds;
		flag_g <= '0';
		flag_chc <= '0';
		tail_out <= tail_out;

		if corner1 (4 downto 0) > corner2 (4 downto 0) then
			next_state <= y1_y2;
		else
			next_state <= y2_y1;
		end if;
		
	when y1_y2 =>
	
		clr_flag_coc <= '0';
		x_bounds <= x_bounds;
		flag_g <= '0';
		flag_chc <= '0';
		tail_out <= tail_out;
		y_bounds <= corner1 (4 downto 0) & corner2 (4 downto 0);
		
		next_state <= set_flags;
		
	when y2_y1 =>
	
		clr_flag_coc <= '0';
		x_bounds <= x_bounds;
		flag_g <= '0';
		flag_chc <= '0';
		tail_out <= tail_out;
		y_bounds <= corner2 (4 downto 0) & corner1 (4 downto 0);
		
		next_state <= set_flags;
	
	when set_flags =>

		clr_flag_coc <= '0';
		flag_g <= '1';
		flag_chc <= '1';
		x_bounds <= x_bounds;
		y_bounds <= y_bounds;
		tail_out <= tail_out;
		
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
		x_bounds <= x_bounds;
		y_bounds <= y_bounds;
		tail_out <= tail_out;
		flag_g <= '1';

		if clr_flag_g = '1' then
			next_state <= clear;
		else
			next_state <= wait_g;
		end if;
		
	when wait_chc =>
	
		clr_flag_coc <= '0';
		flag_g <= '0';
		x_bounds <= x_bounds;
		y_bounds <= y_bounds;
		tail_out <= tail_out;
		flag_chc <= '1';

		if clr_flag_chc = '1' then
			next_state <= clear;
		else
			next_state <= wait_chc;
		end if;
	
	when clear =>

		clr_flag_coc <= '1';
		flag_g <= '0';
		flag_chc <= '0';
		tail_out <= '0';
		x_bounds <= x_bounds;
		y_bounds <= y_bounds;
		
		next_state <= idle;
	when others =>
	
		clr_flag_coc <= '0';
		flag_g <= '0';
		flag_chc <= '0';
		tail_out <= '0';
		x_bounds <= "0000000000";
		y_bounds <= "0000000000";
	
		next_state <= idle;		
end case;
end process;
end architecture behaviour_snake_out;
