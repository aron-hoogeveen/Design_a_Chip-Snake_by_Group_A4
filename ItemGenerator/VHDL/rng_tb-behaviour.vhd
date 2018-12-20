library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of rng_tb is
   component rng
      port(clk : in  std_logic;
           reset : in std_logic;
           z   : out std_logic);
   end component;
   signal clk : std_logic;
   signal reset : std_logic;
   signal z   : std_logic;
begin
test: rng port map (clk, reset, z);
 clk <= '1' after 0 ns,
      '0' after 40 ns when clk /= '0' else '1' after 40 ns;
   reset <= '1' after 0 ns,
	'0' after 100 ns;
end behaviour;

