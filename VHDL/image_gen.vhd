library IEEE;
use IEEE.std_logic_1164.ALL;

entity image_gen is
   port(clk        : in  std_logic;
        reset      : in  std_logic;
        h_count    : in  std_logic_vector(8 downto 0);
        v_count    : in  std_logic_vector(9 downto 0);
        snake_x_loc  : in  std_logic_vector(9 downto 0);
        snake_y_loc  : in  std_logic_vector(9 downto 0);
        item_in    : in  std_logic_vector(11 downto 0);
        power_in   : in  std_logic_vector(11 downto 0);
        video_on   : in  std_logic;
		  pulse_60hz	: in 	std_logic;
		  flicker_in : in 	std_logic;
        red        : out std_logic;
        green      : out std_logic;
        blue       : out std_logic;
		  clr_flag		 : out	std_logic);
end image_gen;

