library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of color_gen_tb is
   component color_gen
      port(clk      : in  std_logic;
           reset    : in  std_logic;
           snake    : in  std_logic;
           item     : in  std_logic;
           video_on : in  std_logic;
           red      : out std_logic;
           green    : out std_logic;
           blue     : out std_logic);
   end component;
   signal clk      : std_logic;
   signal reset    : std_logic;
   signal snake    : std_logic;
   signal item     : std_logic;
   signal video_on : std_logic;
   signal red      : std_logic;
   signal green    : std_logic;
   signal blue     : std_logic;
begin
test: color_gen port map (clk, reset, snake, item, video_on, red, green, blue);
	clk <= '1' after 0 ns,
	    '0' after 40 ns when clk /= '0' else '1' after 40 ns;
   reset <= '1' after 0 ns, '0' after 80 ns;
   snake <= '1' after 100 ns, '0' after 200 ns, '1' after 450 ns, '0' after 1300 ns;
   item <= '0' after 0 ns, '1' after 300 ns, '0' after 500 ns, '1' after 950 ns;
   video_on <= '0' after 0 ns, '1' after 2000 ns;
end behaviour;

