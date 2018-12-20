library IEEE;
use IEEE.std_logic_1164.ALL;

entity item_image is
   port(clk   					: in  std_logic;
        reset 					: in  std_logic;
		  video_on   : in  std_logic;
        location_x : in  std_logic_vector(4 downto 0);
        location_y : in  std_logic_vector(4 downto 0);
        h_count    : in  std_logic_vector(8 downto 0);
        v_count    : in  std_logic_vector(9 downto 0);
        item      	: out std_logic);
end item_image;

