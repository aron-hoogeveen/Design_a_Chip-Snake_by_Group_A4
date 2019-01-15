library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of length_tb is
   component length
      port(reset          : in  std_logic;
           clk            : in  std_logic;
           collision_food : in  std_logic;
           len             : out std_logic_vector(5 downto 0));
   end component;
   signal reset          : std_logic;
   signal clk            : std_logic;
   signal collision_food : std_logic;
   signal len             : std_logic_vector(5 downto 0);
begin
test: length port map (reset, clk, collision_food, len);
   reset <= '1' after 0 ns,
	    '0' after 80 ns,
	    '1' after 1400 ns,
	    '0' after 1480 ns;
   clk <= '0' after 0 ns,
	  '1' after 40 ns when clk /= '1' else '0' after 40 ns;

   collision_food <= '0' after 0 ns,
		     '1' after 200 ns,
		     '0' after 280 ns,
		     '1' after 400 ns,
		     '0' after 580 ns,
		     '1' after 650 ns,
		     '1' after 750 ns,
		     '0' after 830 ns,
		     '1' after 910 ns,
		     '0' after 1000 ns;
end behaviour;

