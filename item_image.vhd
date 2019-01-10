library IEEE;
use IEEE.std_logic_1164.ALL;

entity item_image is
   port(clk   	       : in  std_logic;
        reset          : in  std_logic;
	video_on       : in  std_logic;
        location_x     : in  std_logic_vector(4 downto 0); 
        location_y     : in  std_logic_vector(4 downto 0);
	location_x_pow : in std_logic_vector(4 downto 0);
        location_y_pow : in std_logic_vector(4 downto 0);
	pow_type       : in std_logic_vector(1 downto 0);
        h_count	       : in std_logic_vector(8 downto 0);
        v_count        : in std_logic_vector(9 downto 0);
	item_type      : out std_logic_vector(1 downto 0);
        item           : out std_logic);
end item_image;

-- location_x is the x coordinate of the food item
-- location_y is the y coordinate of the food item
-- location_x_pow is the x coordinate of the power-up item
-- location_x_pow is the y coordinate of the power-up item
-- pow_type is the type of the power-up item
-- h_count is the value of the horizontal counter
-- v_count is the value of the vertical counter
-- item_type specifice the item to be drawn (food, power-up speed, power-up invert or power-up flicker)
-- item is an enable signal 
