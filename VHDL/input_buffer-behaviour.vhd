library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of input_buffer is
signal s0, s1, s2, s3 : std_logic;
begin

process(clk)
begin
	if rising_edge(clk) then
		s3 <= direct_input(3);
		s2 <= direct_input(2);
		s1 <= direct_input(1);
		s0 <= direct_input(0);
	end if;
end process;

process(clk)
begin
	if rising_edge(clk) then
		input_buf(3) <= s3;
		input_buf(2) <= s2;
		input_buf(1) <= s1;
		input_buf(0) <= s0;
	end if;
end process;

end behaviour;

