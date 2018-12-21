library IEEE;
use IEEE.std_logic_1164.ALL;

entity image_gen is
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
		  draw_flag : in std_logic;
        red       : out std_logic;
        green     : out std_logic;
        blue      : out std_logic;
		  clr_flag		: out	std_logic);
end image_gen;

