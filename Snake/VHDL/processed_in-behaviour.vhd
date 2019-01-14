library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of processed_in is
type proc_in_state is (reset_state, check, right, up, left, down);
signal state, next_state : proc_in_state;
begin

process(clk)
begin
	if rising_edge(clk) then
		if reset = '1' then
			state <= reset_state;
		else
			state <= next_state;
		end if;
	end if;
end process;

process(state, buffed_input)
begin
	case state is
		when reset_state =>
			buttons <= "00";

			if (buffed_input = "0000") then
				next_state <= reset_state;
			else
				next_state <= check;
			end if;

		when check =>
			buttons <= "01";
			
			if buffed_input = "1000" then
				next_state <= right;
			elsif buffed_input = "0100" then
				next_state <= up;
			elsif buffed_input = "0010" then
				next_state <= left;
			elsif buffed_input = "0001" then
				next_state <= down;
			else
				next_state <= check;
			end if;
	
		when right =>
			buttons <= "00";

			if buffed_input = "1000" then
				next_state <= right;
			elsif buffed_input = "0100" then
				next_state <= up;
			elsif buffed_input = "0010" then
				next_state <= left;
			elsif buffed_input = "0001" then
				next_state <= down;
			else
				next_state <= right;
			end if;

		when up =>
			buttons <= "01";

			if buffed_input = "1000" then
				next_state <= right;
			elsif buffed_input = "0100" then
				next_state <= up;
			elsif buffed_input = "0010" then
				next_state <= left;
			elsif buffed_input = "0001" then
				next_state <= down;
			else
				next_state <= up;
			end if;

		when left =>
			buttons <= "11";

			if buffed_input = "1000" then
				next_state <= right;
			elsif buffed_input = "0100" then
				next_state <= up;
			elsif buffed_input = "0010" then
				next_state <= left;
			elsif buffed_input = "0001" then
				next_state <= down;
			else
				next_state <= left;
			end if;

		when down =>
			buttons <= "10";

			if buffed_input = "1000" then
				next_state <= right;
			elsif buffed_input = "0100" then
				next_state <= up;
			elsif buffed_input = "0010" then
				next_state <= left;
			elsif buffed_input = "0001" then
				next_state <= down;
			else
				next_state <= down;
			end if;
	end case;
end process;
end behaviour;

