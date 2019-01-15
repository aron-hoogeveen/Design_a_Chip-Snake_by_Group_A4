library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture behaviour of button_react is

type button_react_state is (idle, set_flags, waitHead, waitCor, sendChc, waitMove);
signal state, next_state: button_react_state;
signal ytoInt, xtoInt: unsigned(4 downto 0);
signal corner_exists : std_logic;

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


process (buttons, head)

begin

	xtoInt <= unsigned(head(11 downto 7));
	ytoInt <= unsigned(head(6 downto 2) );
		
	if buttons = head(1 downto 0) or (buttons = "01" and head(1 downto 0) = "10") or (buttons = "10" and head(1 downto 0) = "01") or (buttons = "11" and head(1 downto 0) = "00") or (buttons = "00" and head(1 downto 0) = "11")then
		corner_exists <= '0';
		corner <= "000000";
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
	else
		corner_exists <= '1';
		if(inversion = '0') then
			if buttons = "00" then
				new_head <= std_logic_vector(xtoInt + 1) & head(6 downto 2) & "00";
				corner <= head(11 downto 7) & '0';
			elsif buttons = "01" then
				new_head <= head(11 downto 7) & std_logic_vector(ytoInt + 1) & "01";
				corner <= head(6 downto 2) & '1';
			elsif buttons = "11" then
				new_head <= std_logic_vector(xtoInt - 1) & head(6 downto 2) & "11";
				corner <= head(11 downto 7) & '0';
			else
				new_head <= head(11 downto 7) & std_logic_vector(ytoInt - 1) & "10";
				corner <= head(6 downto 2) & '1';
			end if;
		else
			if buttons = "00" then
				new_head <= std_logic_vector(xtoInt - 1) & head(6 downto 2) & "11";
				corner <= head(11 downto 7) & '0';
			elsif buttons = "01" then
				new_head <= head(11 downto 7) & std_logic_vector(ytoInt - 1) & "10";
				corner <= head(6 downto 2) & '1';
			elsif buttons = "11" then
				new_head <= std_logic_vector(xtoInt + 1) & head(6 downto 2) & "00";
				corner <= head(11 downto 7) & '0';
			else
				new_head <= head(11 downto 7) & std_logic_vector(ytoInt + 1) & "01";
				corner <= head(6 downto 2) & '1';
			end if;
		end if;			
	end if;
end process;

process (state, move, buttons, head, new_head_clr_flag, corner_clr_flag, chc_clr_flag, ytoInt, xtoInt, inversion, head_ok)

begin

case state is

	when idle =>
	
		corner_flag <= '0';
		new_head_flag <= '0';
		chc_flag <= '0';

		if move = '1' then
			next_state <= sendChc;
		else
			next_state <= idle;
		end if;		

	when sendChc =>

		corner_flag <= '0';
		new_head_flag <= '0';
		chc_flag <= '1';

		if(chc_clr_flag = '1') then
			if(head_ok = '1') then
				next_state <= set_flags;
			else
				next_state <= waitMove;
			end if;
		else
			next_state <= sendChc;
		end if;
		
	when set_flags =>
		
		corner_flag <= corner_exists;
		new_head_flag <= '1';
		chc_flag <= '0';

		if new_head_clr_flag = '1' then
			next_state <= waitMove;
		else
			next_state <= waitHead;
		end if;
		
	when waitCor =>
		
		corner_flag <= '1';
		new_head_flag <= '0';
		chc_flag <= '0';
		
		if corner_clr_flag = '1' then
			next_state <= waitMove;
		else
			next_state <= waitCor;
		end if;
		
	when waitHead =>
		
		corner_flag <= '0';
		new_head_flag <= '1';
		chc_flag <= '0';
		
		if new_head_clr_flag = '1' then
			next_state <= waitMove;
		else
			next_state <= waitHead;
		end if;

	when waitMove =>

		corner_flag <= '0';
		new_head_flag <= '0';
		chc_flag <= '0';

		if move = '0' then
			next_state <= idle;
		else
			next_state <= waitMove;
		end if;
		
	when others =>
		corner_flag <= '0';
		new_head_flag <= '0';
		chc_flag <= '0';
		next_state <= idle;
end case;
end process;

end behaviour;
