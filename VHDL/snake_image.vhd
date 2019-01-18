library IEEE;
use IEEE.std_logic_1164.ALL;

entity snake_image is
   port(clk        : in  std_logic;
        reset      : in  std_logic;
        video_on   : in  std_logic;
	snake_x_loc 	: in  std_logic_vector(9 downto 0);
        snake_y_loc 	: in  std_logic_vector(9 downto 0);
        h_count    : in  std_logic_vector(8 downto 0);
        v_count    : in  std_logic_vector(9 downto 0);
        snake      : out std_logic;
	clr_flag   : out std_logic);
end snake_image;

