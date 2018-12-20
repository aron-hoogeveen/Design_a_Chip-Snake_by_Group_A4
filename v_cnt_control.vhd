library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity v_cnt_control is
   port(clk           : in  std_logic;
        reset         : in  std_logic;
		  h_count	      : in 	std_logic_vector(8 downto 0);
        v_count       : in  std_logic_vector(9 downto 0);
        v_sync        : out std_logic;
        v_count_reset : out std_logic;
        v_video_on    : out std_logic);
end v_cnt_control;
-- clk		 : clock signal
-- reset 		 : main reset
-- h_count       : horizontal count
-- v_count       : vertical count
-- v_sync        : vertical synchronization signal
-- v_count_reset :	resets the vertical counter
-- v_video_on    : switches the vertical lines on/off

