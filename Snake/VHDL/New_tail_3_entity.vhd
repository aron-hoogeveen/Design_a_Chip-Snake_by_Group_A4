library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all; 

entity new_tail is
port (  reset, clk : in std_logic;
	flag_tail : in std_logic;
	clr_flg_stor : in std_logic;
	collision_food : in std_logic;
	move : in std_logic;
	last_corner : in std_logic_vector (9 downto 0);
	tail : in std_logic_vector (9 downto 0);
	flag_new_tail : out std_logic;
	flg_ok_tail : out std_logic;
	clr_food : out std_logic;
	new_tail_out : out std_logic_vector (5 downto 0)
     );
end entity new_tail;
		

		

