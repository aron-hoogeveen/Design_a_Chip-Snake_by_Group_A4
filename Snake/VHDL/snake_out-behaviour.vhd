library IEEE;
use IEEE.std_logic_1164.all;

architecture behaviour_snake_out of snake_out is

type snake_out_state is (idle, compare_x, create_ybounds, create_xbounds, set_flags, wait_chc, wait_g, clear);
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

process (clk, reset, state)


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
			next_state <= compare_x;
			if tail = '1' then
				tail_out <= '1';
			else
				tail_out <= '0';
			end if;
		else
			next_state <= idle;
		end if;
		
	when compare_x =>
	
		clr_flag_coc <= '0';
		x_bounds <= "0000000000";
		y_bounds <= "0000000000";
		flag_g <= '0';
		flag_chc <= '0';
	
		if corner1 (4 downto 0) = corner2 (4 downto 0) then
			y_bounds <= corner1 (4 downto 0) & corner2 (4 downto 0);
			next_state <= create_xbounds;
		else
			x_bounds <= corner1 (9 downto 5) & corner2 (9 downto 5);
			next_state <= create_ybounds;
		end if;
	
	when create_xbounds =>
	
		clr_flag_coc <= '0';
		x_bounds <= "0000000000";
		flag_g <= '0';
		flag_chc <= '0';

		if corner1 (9 downto 5) > corner2 (9 downto 5) then
			x_bounds <= corner1 (9 downto 5) & corner2 (9 downto 5);
		else
			x_bounds <= corner2 (9 downto 5) & corner1 (9 downto 5);
		end if;		

		next_state <= set_flags;
	
	when create_ybounds =>
	
		clr_flag_coc <= '0';
		y_bounds <= "0000000000";
		flag_g <= '0';
		flag_chc <= '0';

		if corner1 (4 downto 0) > corner2 (4 downto 0) then
			y_bounds <= corner1 (4 downto 0) & corner2 (4 downto 0);
		else
			y_bounds <= corner2 (4 downto 0) & corner1 (4 downto 0);
		end if;		

		next_state <= set_flags;
	
	when set_flags =>

		clr_flag_coc <= '0';
		flag_g <= '1';
		flag_chc <= '1';
		
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

		if clr_flag_g = '1' then
			flag_g <= '0';
			next_state <= clear;
		else
			next_state <= wait_g;
		end if;
		
	when wait_chc =>

		if clr_flag_chc = '1' then
			flag_chc <= '0';
			tail_out <= '0';
			next_state <= clear;
		else
			next_state <= wait_chc;
		end if;
	
	when clear =>

		clr_flag_coc <= '1';
		flag_g <= '0';
		flag_chc <= '0';
		tail_out <= '0';
		
		next_state <= idle;
	when others =>
		next_state <= idle;		
end case;
end process;
end architecture behaviour_snake_out;
