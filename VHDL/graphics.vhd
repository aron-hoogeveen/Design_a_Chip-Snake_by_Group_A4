library IEEE;
use IEEE.std_logic_1164.ALL;

entity graphics is
   port(clk        : in  std_logic;
        reset      : in  std_logic;
        snake_x_loc  : in  std_logic_vector(9 downto 0);
        snake_y_loc  : in  std_logic_vector(9 downto 0);
        item_in    : in  std_logic_vector(11 downto 0);
        power_in    : in  std_logic_vector(11 downto 0);
        flicker_in : in 	std_logic;
		  h_sync     : out std_logic;
        v_sync     : out std_logic;
		  red        : out std_logic;
        green      : out std_logic;
        blue       : out std_logic;
        clr_flag   : out std_logic;
        pulse_60hz : out std_logic);
end graphics;

