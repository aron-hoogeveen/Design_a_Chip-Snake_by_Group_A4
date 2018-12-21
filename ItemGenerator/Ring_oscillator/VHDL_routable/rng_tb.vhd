library IEEE;
use IEEE.std_logic_1164.ALL;

entity rng_tb is
end rng_tb;

architecture structural of rng_tb is
 
	component rng is
		port (clk, reset : in std_logic;
			z : out std_logic);
	end component;

	signal z : std_logic;
	signal reset : std_logic;
	signal clk : std_logic;

begin
	lbl0:	rng port map (clk => clk, reset => reset,	z => z);

	clk <= 	'0' after 0 ns,
		'1' after 40 ns when clk /= '1' else '0' after 40 ns;

	reset <= '1' after 0 ns,
		'0' after 100 ns;
	
end structural;
