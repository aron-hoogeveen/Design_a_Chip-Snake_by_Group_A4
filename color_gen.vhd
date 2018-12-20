library IEEE;
use IEEE.std_logic_1164.ALL;

entity color_gen is
   port(clk      : in  std_logic;
        reset    : in  std_logic;
        snake    : in  std_logic;
        item     : in  std_logic;
        video_on : in  std_logic;
        red      : out std_logic;
        green    : out std_logic;
        blue     : out std_logic);
end color_gen;

