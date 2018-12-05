library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of ff is
begin
	ff_behavior : process is
	begin
		wait until (clk'event and clk='1');
		if (reset = '1') then
			q <= '0';
		else
			q <= d;
		end if;
	end process;
end behaviour;

