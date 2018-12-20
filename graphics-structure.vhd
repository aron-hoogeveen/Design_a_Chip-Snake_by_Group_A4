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
   		port(clk       : in  std_logic;
        		 reset     : in  std_logic;
        			h_count   : in  std_logic_vector(8 downto 0);
        		 v_count   : in  std_logic_vector(9 downto 0);
        		 snake_x_l : in  std_logic_vector(4 downto 0);
        		 snake_x_h : in  std_logic_vector(4 downto 0);
        		 snake_y_l : in  std_logic_vector(4 downto 0);
        		 snake_y_h : in  std_logic_vector(4 downto 0);
        		 item_x    : in  std_logic_vector(4 downto 0);
        		 item_y    : in  std_logic_vector(4 downto 0);
        		 video_on  : in  std_logic;
        		 red       : out std_logic;
        		 green     : out std_logic;
        		 blue      : out std_logic;
		  	  flag				: out	std_logic);
	end component;
	
	signal h_count    : std_logic_vector(8 downto 0);
	signal v_count    : std_logic_vector(9 downto 0);
	signal video_on   : std_logic;

begin
vga_ctrl: vga_controller
	port map(clk        => clk,
        			 reset      => reset,
       			  h_sync     => h_sync,
       			  v_sync     => v_sync,
       			  h_count    => h_count,
       			  v_count    => v_count,
        			 video_on   => video_on,
        			 pulse_60hz => pulse_60hz);

image: image_gen
	port map(clk       => clk,
        		  reset     => reset,
        			 h_count   => h_count,
        		  v_count   => v_count,
        		  snake_x_l => snake_x_l,
        		  snake_x_h => snake_x_h,
        		  snake_y_l => snake_y_l,
        		  snake_y_h => snake_y_h,
        		  item_x    => item_x,
        		  item_y    => item_y, 
        		  video_on  => video_on,
        		  red       => red,
        		  green     => green,
        		  blue      => blue,
		  	   flag				 => flag);
end structure;

