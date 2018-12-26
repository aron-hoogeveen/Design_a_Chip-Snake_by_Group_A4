library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity h_cnt_control is
   port(clk           : in  std_logic;
        reset         : in  std_logic;
        h_count       : in  std_logic_vector(8 downto 0);
        h_sync        : out std_logic;
        h_count_reset : out std_logic;
        h_video_on    : out std_logic);
end h_cnt_control;
-- clk		         : clock signal
-- reset 		 			  : main reset
-- h_count       : horizontal count
-- h_sync        : horizontal synchronization signal
-- h_count_reset :	resets the horizonal counter
-- h_video_on    : switches the horizontal lines on/off

