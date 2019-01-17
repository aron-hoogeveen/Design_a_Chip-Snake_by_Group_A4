library IEEE;
use IEEE.std_logic_1164.ALL;

entity color_counter is
   port(clk        : in  std_logic;
        reset      : in  std_logic;
        pulse_60hz : in  std_logic;
        flicker    : in  std_logic;
        color_cnt  : out std_logic_vector(6 downto 0);
		enable_flick : out std_logic);
end color_counter;

