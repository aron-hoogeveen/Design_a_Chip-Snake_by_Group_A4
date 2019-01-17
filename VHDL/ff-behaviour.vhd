library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of ff is
begin
	ff_behavior : process(clk) is
	begin
		if (clk'event and clk='1') then
			if (reset = '1') then
				q <= '0';
			else
				q <= d;
			end if;
		end if;
	end process;
end behaviour;
