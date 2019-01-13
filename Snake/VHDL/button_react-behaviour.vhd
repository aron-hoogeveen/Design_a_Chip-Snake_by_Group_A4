library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture behaviour of button_react is

type button_react_state is (idle, calc_new_head, set_flags, set_corner_flags, clr_flags, goLeft, goRight, goUp, goDown, waitHead, waitCor, sendChc, sendChcCorner);
signal state, next_state: button_react_state;
signal ytoInt, xtoInt: signed(4 downto 0);

begin

process (clk) 
begin 	
	if (rising_edge (clk)) then
		if (reset = '1') then
			state <= idle;
		else
			--if (rising_edge (move)) then
			--	state <= calc_new_head;
			--else
				state <= next_state;
			--end if;
		end if;
	end if;
end process;

--process (move) 
--begin 	
--	if (rising_edge (move)) then
--		next_state <= calc_new_head;
--	end if;
--end process;

process (state, move, buttons, head, new_head_clr_flag, corner_clr_flag, chc_clr_flag, ytoInt, xtoInt, inversion, head_ok)

begin

case state is

	when idle =>
	
		new_head <= "000000000000";
		corner <= "000000";
		corner_flag <= '0';
		new_head_flag <= '0';
		chc_flag <= '0';

		if move = '1' then
			next_state <= calc_new_head;
		else
			next_state <= idle;
		end if;

	when calc_new_head =>
	
		corner <= "000000";
		corner_flag <= '0';
		new_head_flag <= '0';
		chc_flag <= '0';
		xtoInt <= signed(head(11 downto 7) );
		ytoInt <= signed(head(6 downto 2) );
		
		if buttons = head(1 downto 0) or (not head(1 downto 0)) = buttons then
			if buttons = "00" then
				new_head <= std_logic_vector(xtoInt + 1) & head(6 downto 2) & buttons;
			elsif buttons = "01" then
				new_head <= head(11 downto 7) & std_logic_vector(ytoInt + 1) & buttons;
			elsif buttons = "11" then
				new_head <= std_logic_vector(xtoInt - 1) & head(6 downto 2) & buttons;
			elsif buttons = "10" then
				new_head <= head(11 downto 7) & std_logic_vector(ytoInt - 1) & buttons;
			else
				new_head <= head(11 downto 0);
			end if;
			next_state <= sendChc;
		else 
			new_head <= "000000000000";
			if(inversion = '0') then
				if buttons = "00" then
					next_state <= goRight;
				elsif buttons = "01" then
					next_state <= goUp;
				elsif buttons = "11" then
					next_state <= goLeft;
				else
					next_state <= goDown;
				end if;
			else
				if buttons = "00" then
					next_state <= goLeft;
				elsif buttons = "01" then
					next_state <= goDown;
				elsif buttons = "11" then
					next_state <= goRight;
				else
					next_state <= goUp;
				end if;
			end if;			
		end if;

	when sendChc =>

		corner_flag <= '0';
		new_head_flag <= '0';
		chc_flag <= '1';
		new_head <= new_head;
		corner <= corner;

		if(chc_clr_flag = '1') then
			if(head_ok = '1') then
				next_state <= set_flags;
			else
				next_state <= idle;
			end if;
		else
			next_state <= sendChc;
		end if;

	when sendChcCorner =>

		corner_flag <= '0';
		new_head_flag <= '0';
		chc_flag <= '1';
		new_head <= new_head;
		corner <= corner;

		if(chc_clr_flag = '1') then
			if(head_ok = '1') then
				next_state <= set_corner_flags;
			else
				next_state <= idle;
			end if;
		else
			next_state <= sendChcCorner;
		end if;

	when goRight =>
	
		corner_flag <= '0';
		new_head_flag <= '0';
		chc_flag <= '0';
		new_head <= std_logic_vector(xtoInt + 1) & head(6 downto 2) & "00";
		corner <= head(11 downto 7) & '0';

		next_state <= sendChcCorner;
		
	when goUp =>
	
		corner_flag <= '0';
		new_head_flag <= '0';
		chc_flag <= '0';
		new_head <= head(11 downto 7) & std_logic_vector(ytoInt + 1) & "01";
		corner <= head(6 downto 2) & '1';

		next_state <= sendChcCorner;
	
	when goLeft =>
	
		corner_flag <= '0';
		new_head_flag <= '0';
		chc_flag <= '0';
		new_head <= std_logic_vector(xtoInt - 1) & head(6 downto 2) & "11";
		corner <= head(11 downto 7) & '0';

		next_state <= sendChcCorner;
	
	when goDown =>
	
		corner_flag <= '0';
		new_head_flag <= '0';
		chc_flag <= '0';
		new_head <= head(11 downto 7) & std_logic_vector(ytoInt - 1) & "10";
		corner <= head(6 downto 2) & '1';

		next_state <= sendChcCorner;
		
	when set_flags =>
		
		corner_flag <= '0';
		new_head_flag <= '1';
		chc_flag <= '0';
		new_head <= new_head;
		corner <= corner;
		
		if new_head_clr_flag = '1' then
			next_state <= idle;
		else
			next_state <= waitHead;
		end if;
	
	when set_corner_flags =>

		corner_flag <= '1';
		new_head_flag <= '1';
		chc_flag <= '0';
		new_head <= new_head;
		corner <= corner;
		
		if corner_clr_flag = '1' then
			next_state <= waitHead;
		elsif new_head_clr_flag = '1' then
			next_state <= waitCor;
		else
			next_state <= set_corner_flags;
		end if;
		
	when waitCor =>
		
		corner_flag <= '1';
		new_head_flag <= '0';
		chc_flag <= '0';
		new_head <= new_head;
		corner <= corner;
		
		if corner_clr_flag = '1' then
			next_state <= idle;
		else
			next_state <= waitCor;
		end if;
		
	when waitHead =>
		
		corner_flag <= '0';
		new_head_flag <= '1';
		chc_flag <= '0';
		new_head <= new_head;
		corner <= corner;
		
		if new_head_clr_flag = '1' then
			next_state <= idle;
		else
			next_state <= waitHead;
		end if;
		
	when others =>
		corner_flag <= '0';
		new_head_flag <= '0';
		chc_flag <= '0';
		new_head <= new_head;
		corner <= corner;
		next_state <= idle;		
end case;
end process;

end behaviour;
