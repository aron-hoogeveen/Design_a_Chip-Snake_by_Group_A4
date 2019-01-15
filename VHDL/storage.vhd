library IEEE;
use IEEE.std_logic_1164.ALL;

entity storage is
port(clk     				: in  std_logic;
        reset     				: in  std_logic;
	new_head_flag			: in  std_logic;
        new_head  				: in  std_logic_vector(11 downto 0);
	new_corner_flag			: in  std_logic;
        new_corner 				: in  std_logic_vector(5 downto 0);
	new_tail_flag			: in  std_logic;
        new_tail   				: in  std_logic_vector(5 downto 0);
	new_item_set			: in  std_logic;
	remove_power_up_flag			: in  std_logic;
	send_corner_flag			: in  std_logic;
        new_item   				: in  std_logic_vector(11 downto 0);
        snake_list 				: out std_logic_vector(16 downto 0);
        item_out_food   				: out std_logic_vector(11 downto 0);
	item_out_power_up			: out std_logic_vector(11 downto 0);
	head	   		: out std_logic_vector(11 downto 0);
	new_item_clear			: out std_logic;
	clear_head_flag			: out std_logic;
	clear_corner_flag			: out std_logic;
	clear_tail_flag			: out std_logic;
	remove_power_up_clear			: out std_logic;
	send_new_corner_clear			: out std_logic);
	
end storage;

