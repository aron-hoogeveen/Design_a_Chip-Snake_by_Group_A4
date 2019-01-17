library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structure of graphics is
-- component declaration
	component vga_controller is
  		 port(clk        : in  std_logic;
        			 reset      : in  std_logic;
       			  h_sync     : out std_logic;
       			  v_sync     : out std_logic;
				h_count			 : out std_logic_vector(8 downto 0);
		  		v_count			 : out std_logic_vector(9 downto 0);
        			 video_on   : out std_logic;
        			 pulse_60hz : out std_logic);
	end component;

	component image_gen is
   		port(clk        : in  std_logic;
        		 reset      : in  std_logic;
        			h_count    : in  std_logic_vector(8 downto 0);
        		 v_count    : in  std_logic_vector(9 downto 0);
        		 snake_x_loc  : in  std_logic_vector(9 downto 0);
        		 snake_y_loc  : in  std_logic_vector(9 downto 0);
        		 item_in     : in  std_logic_vector(11 downto 0);
        			power_in    : in  std_logic_vector(11 downto 0);
        		 video_on   : in  std_logic;
   			  pulse_60hz : in 	std_logic;
			  flicker_in : in 	std_logic;
        		 red        : out std_logic;
        		 green      : out std_logic;
        		 blue       : out std_logic;
		  	  clr_flag		 : out	std_logic);
	end component;
	
	signal h_count    : std_logic_vector(8 downto 0);
	signal v_count    : std_logic_vector(9 downto 0);
	signal video_on   : std_logic;
	signal clk_60hz 		: std_logic;

begin
vga_ctrl: vga_controller
	port map(clk        => clk,
        			 reset      => reset,
       			  h_sync     => h_sync,
       			  v_sync     => v_sync,
       			  h_count    => h_count,
       			  v_count    => v_count,
        			 video_on   => video_on,
        			 pulse_60hz => clk_60hz);

image: image_gen
	port map(clk        => clk,
        		  reset      => reset,
        			 h_count    => h_count,
        		  v_count    => v_count,
        		  snake_x_loc => snake_x_loc,
        		  snake_y_loc  => snake_y_loc,
        		  item_in   => item_in,
				power_in => power_in,
        		  video_on   => video_on,
				pulse_60hz => clk_60hz,
				flicker_in => flicker_in,
        		  red        => red,
        		  green      => green,
        		  blue       => blue,
		  	   clr_flag		 => clr_flag);
pulse_60hz <= clk_60hz;
end structure;

