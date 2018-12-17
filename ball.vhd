library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ball is
Port ( 
clk : in std_logic;
reset : in std_logic;
v_enable : in std_logic;
video_on : in std_logic;
pixel_row : in STD_LOGIC_VECTOR(9 downto 0);
pixel_col : in STD_LOGIC_VECTOR(8 downto 0);
red : out STD_LOGIC;
green : out STD_LOGIC;
blue : out STD_LOGIC);
end ball;
