library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity cc_so_nt is
   port(clk		       : in  std_logic;
	reset  	       : in  std_logic;
	clr_flg_str_cc : in  std_logic;
        clr_flg_grp_so : in  std_logic;
        clr_flg_chc_so : in  std_logic;
        clr_flg_str_nt : in  std_logic;
        move           : in  std_logic;
        collision_food : in  std_logic;
        snake_list     : in  std_logic_vector(16 downto 0);
        flg_new_tail   : out std_logic;
        flg_check_col  : out std_logic;
        flg_tail_chc   : out std_logic;
	clr_food 	     : out std_logic;
        flag_next_list : out std_logic;
        x_bounds       : out std_logic_vector(9 downto 0);
        y_bounds       : out std_logic_vector(9 downto 0);
        new_tail_o       : out std_logic_vector(5 downto 0)
        );
end cc_so_nt;


