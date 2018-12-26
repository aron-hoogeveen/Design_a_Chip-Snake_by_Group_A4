library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of graphics_tb is
   component graphics
      port(clk        : in  std_logic;
           reset      : in  std_logic;
           snake_x_l  : in  std_logic_vector(4 downto 0);
           snake_x_h  : in  std_logic_vector(4 downto 0);
           snake_y_l  : in  std_logic_vector(4 downto 0);
           snake_y_h  : in  std_logic_vector(4 downto 0);
           item_x     : in  std_logic_vector(4 downto 0);
           item_y     : in  std_logic_vector(4 downto 0);
			  draw_flag		: in std_logic;
           h_sync     : out std_logic;
           v_sync     : out std_logic;
           red        : out std_logic;
           green      : out std_logic;
           blue       : out std_logic;
           clr_flag   : out std_logic;
           pulse_60hz : out std_logic);
   end component;
   signal clk        : std_logic;
   signal reset      : std_logic;
   signal snake_x_l  : std_logic_vector(4 downto 0);
   signal snake_x_h  : std_logic_vector(4 downto 0);
   signal snake_y_l  : std_logic_vector(4 downto 0);
   signal snake_y_h  : std_logic_vector(4 downto 0);
   signal item_x     : std_logic_vector(4 downto 0);
   signal item_y     : std_logic_vector(4 downto 0);
	signal draw_flag		: std_logic;
   signal h_sync     : std_logic;
   signal v_sync     : std_logic;
   signal red        : std_logic;
   signal green      : std_logic;
   signal blue       : std_logic;
   signal clr_flag   : std_logic;
   signal pulse_60hz : std_logic;
begin
test: graphics port map (clk, reset, snake_x_l, snake_x_h, snake_y_l, snake_y_h, item_x, item_y, draw_flag,h_sync, v_sync, red, green, blue, clr_flag, pulse_60hz);

	clk <=	'1' after 0 ns,
			 '0' after 40 ns when clk /= '0' else '1' after 40 ns;
   reset <= '1' after 0 ns,
				'0' after 160 ns;

   snake_x_l <= "01110" after 0 ms,
				 	 "00111" after 10 ms; 
	snake_x_h <= "01110" after 0 ms,
				 	 "01111" after 10 ms;
	snake_y_l <= "10000" after 0 ms,
				 	 "00011" after 10 ms;
   snake_y_h <= "10010" after 0 ms,
				 	 "00110" after 10 ms;
	item_x <= "00100" after 0 ns,
				 "10111" after 9 ms,
 				 "00111" after 10 ms,
				 "10100" after 20 ms,
				 "01111" after 30 ms;
	
	item_y <= "00011" after 0 ns,
				 "00110" after 9 ms,
				 "00011" after 10 ms,
				 "00101" after 20 ms,
				 "10100" after 30 ms;
	draw_flag	<= '0' after 0 ns, '1' after 160 ns;
end behaviour;

