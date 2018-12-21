library IEEE;
use IEEE.std_logic_1164.ALL;

entity snake_out is
   port(reset, clk		 : in	 std_logic;
	flag_coc     : in  std_logic;
        corner1      : in  std_logic_vector(9 downto 0);
        corner2      : in  std_logic_vector(9 downto 0);
        clr_flag_g   : in  std_logic;
        clr_flag_chc : in  std_logic;

        clr_flag_coc : out std_logic;
        x_bounds     : out std_logic_vector(9 downto 0);
        y_bounds     : out std_logic_vector(9 downto 0);
        flag_g       : out std_logic;
        flag_chc     : out std_logic);
end snake_out;

