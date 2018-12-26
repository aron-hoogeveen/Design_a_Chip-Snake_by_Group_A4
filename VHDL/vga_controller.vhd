library IEEE;
use IEEE.std_logic_1164.ALL;

entity vga_controller is
   port(clk        : in  std_logic;
        reset      : in  std_logic;
        h_sync     : out std_logic;
        v_sync     : out std_logic;
        h_count				: out std_logic_vector(8 downto 0);
		  v_count				: out std_logic_vector(9 downto 0);
		  video_on   : out std_logic;
        pulse_60hz : out std_logic);
end vga_controller;

