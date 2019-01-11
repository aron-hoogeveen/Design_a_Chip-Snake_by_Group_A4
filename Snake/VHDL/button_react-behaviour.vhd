library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture behaviour of button_react is

type button_react_state is (idle, calc_new_head, set_flags, set_corner_flags, clr_flags, goLeft, goRight, goUp, goDown, waitChcHead, waitChcCor, waitHeadCor, waitHead, waitChc, waitCor);
signal state, next_state: button_react_state;
signal ytoInt, xtoInt: signed(4 downto 0) := (others => '0');

begin

process (clk) 
begin 	
	if (rising_edge (clk)) then
		if (reset = '1') then
			state <= idle;
		else
			if (rising_edge (move)) then
				state <= calc_new_head;
			else
				state <= next_state;
			end if;
		end if;
	end if;
end process;

--process (move) 
--begin 	
--	if (rising_edge (move)) then
--		next_state <= calc_new_head;
--	end if;
--end process;

process (state, buttons, head, new_head_clr_flag, corner_clr_flag, chc_clr_flag, ytoInt, xtoInt)

begin

case state is

	when idle =>
	
		new_head <= "000000000000";
		corner <= "000000";
		corner_flag <= '0';
		new_head_flag <= '0';
		chc_flag <= '0';
		
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
			next_state <= set_flags;
		else 
			new_head <= "000000000000";
			if buttons = "00" then
				next_state <= goRight;
			elsif buttons = "01" then
				next_state <= goUp;
			elsif buttons = "11" then
				next_state <= goLeft;
			else
				next_state <= goDown;
			end if;				
		end if;
	
	when goRight =>
	
		corner_flag <= '0';
		new_head_flag <= '0';
		chc_flag <= '0';
		new_head <= std_logic_vector(xtoInt + 1) & head(6 downto 2) & "00";
		corner <= head(11 downto 7) & '0';

		next_state <= set_corner_flags;
		
	when goUp =>
	
		corner_flag <= '0';
		new_head_flag <= '0';
		chc_flag <= '0';
		new_head <= head(11 downto 7) & std_logic_vector(ytoInt + 1) & "01";
		corner <= head(6 downto 2) & '1';

		next_state <= set_corner_flags;
	
	when goLeft =>
	
		corner_flag <= '0';
		new_head_flag <= '0';
		chc_flag <= '0';
		new_head <= std_logic_vector(xtoInt - 1) & head(6 downto 2) & "11";
		corner <= head(11 downto 7) & '0';

		next_state <= set_corner_flags;
	
	when goDown =>
	
		corner_flag <= '0';
		new_head_flag <= '0';
		chc_flag <= '0';
		new_head <= head(11 downto 7) & std_logic_vector(ytoInt - 1) & "10";
		corner <= head(6 downto 2) & '1';

		next_state <= set_corner_flags;
		
	when set_flags =>
		
		corner_flag <= '0';
		new_head_flag <= '1';
		chc_flag <= '1';
		
		if new_head_clr_flag = '1' then
			next_state <= waitChc;
		elsif chc_clr_flag = '1' then
			next_state <= waitHead;
		else
			next_state <= set_flags;
		end if;
	
	when set_corner_flags =>

		corner_flag <= '1';
		new_head_flag <= '1';
		chc_flag <= '1';
		
		if corner_clr_flag = '1' then
			next_state <= waitChcHead;
		elsif chc_clr_flag = '1' then
			next_state <= waitHeadCor;
		elsif new_head_clr_flag = '1' then
			next_state <= waitChcCor;
		else
			next_state <= set_corner_flags;
		end if;
		
	when waitHeadCor =>
		
		corner_flag <= '1';
		new_head_flag <= '1';
		chc_flag <= '0';
		
		if new_head_clr_flag = '1' then
			next_state <= waitCor;
		elsif corner_clr_flag = '1' then
			next_state <= waitHead;
		else
			next_state <= waitHeadCor;
		end if;
		
	when waitChcHead =>
		
		corner_flag <= '0';
		new_head_flag <= '1';
		chc_flag <= '1';
		
		if new_head_clr_flag = '1' then
			next_state <= waitChc;
		elsif chc_clr_flag = '1' then
			next_state <= waitHead;
		else
			next_state <= waitChcHead;
		end if;
		
	when waitChcCor =>
		
		corner_flag <= '1';
		new_head_flag <= '0';
		chc_flag <= '1';
		
		if chc_clr_flag = '1' then
			next_state <= waitCor;
		elsif corner_clr_flag = '1' then
			next_state <= waitChc;
		else
			next_state <= waitChcCor;
		end if;
		
	when waitChc =>
		
		corner_flag <= '0';
		new_head_flag <= '0';
		chc_flag <= '1';
		
		if chc_clr_flag = '1' then
			next_state <= idle;
		else
			next_state <= waitChc;
		end if;
		
	when waitCor =>
		
		corner_flag <= '1';
		new_head_flag <= '0';
		chc_flag <= '0';
		
		if corner_clr_flag = '1' then
			next_state <= idle;
		else
			next_state <= waitCor;
		end if;
		
	when waitHead =>
		
		corner_flag <= '0';
		new_head_flag <= '1';
		chc_flag <= '0';
		
		if chc_clr_flag = '1' then
			next_state <= idle;
		else
			next_state <= waitHead;
		end if;
		
	when others =>
		next_state <= idle;		
end case;
end process;

end behaviour;
