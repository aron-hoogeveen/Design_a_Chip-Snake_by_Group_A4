library IEEE; 
use IEEE.std_logic_1164.all; 

entity corner_calc IS
port (  reset, clk : in std_logic;
	clear_flag_sl : in std_logic;
	clear_flag_so : in std_logic;
	flg_ok_tail : in std_logic;
	snake_list : in std_logic_vector (16 downto 0);
	corner1 : out std_logic_vector (9 downto 0);
	corner2 : out std_logic_vector (9 downto 0);
	flag_tail : out std_logic;
	flag_tail_so : out std_logic;
	flag_snake_out : out std_logic;
	flag_next_list : out std_logic
     );
end entity corner_calc;
