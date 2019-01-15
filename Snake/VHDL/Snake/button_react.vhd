library IEEE;
use IEEE.std_logic_1164.ALL;

entity button_react is
   port(clk   					: in  std_logic;
        reset 					: in  std_logic;
	head     				: in std_logic_vector(11 downto 0);
	move				: in std_logic;
	buttons				: in std_logic_vector(1 downto 0);
	new_head_clr_flag				: in std_logic;
	corner_clr_flag				: in std_logic;

	chc_clr_flag				: in std_logic;
	inversion				: in std_logic;
	head_ok				: in std_logic;
	
	new_head				: out std_logic_vector(11 downto 0);
	corner 				: out std_logic_vector(5 downto 0);
	corner_flag				: out std_logic;
	new_head_flag				: out std_logic;
	chc_flag				: out std_logic);

end button_react;

