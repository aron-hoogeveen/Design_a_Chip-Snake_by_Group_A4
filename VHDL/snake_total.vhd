library IEEE;
use IEEE.std_logic_1164.ALL;

entity snake_total is
   port(clk            : in  std_logic;
        reset          : in  std_logic;
        clr_flg_str_cc : in  std_logic;
        clr_flg_grp_so : in  std_logic;
		  clr_flg_str_nt : in  std_logic;
        snake_list     : in  std_logic_vector(16 downto 0);
        flg_new_tail   : out std_logic;
        flag_next_list : out std_logic;
        x_bounds       : out std_logic_vector(9 downto 0);
        y_bounds       : out std_logic_vector(9 downto 0);
        new_tail_o     : out std_logic_vector(5 downto 0);
        head           : in  std_logic_vector(11 downto 0);
        button_input   : in  std_logic_vector(3 downto 0);
        newh_clr_flag  : in  std_logic;
        crn_clr_flag   : in  std_logic;
        ig_item_loc    : in  std_logic_vector(9 downto 0);
        ig_loc_set     : in  std_logic;
        st_item_one    : in  std_logic_vector(11 downto 0);
        st_item_two    : in  std_logic_vector(11 downto 0);
        corner         : out std_logic_vector(5 downto 0);
        corner_flag    : out std_logic;
        new_head_flag  : out std_logic;
        ig_loc_clear   : out std_logic;
        ig_item_clear  : in  std_logic;
        ig_item_ok     : out std_logic;
        ig_item_set    : out std_logic;
        ig_item_type   : out std_logic;
        new_head       : out std_logic_vector(11 downto 0);
        gr_flicker_set : out std_logic;
		  st_powerup_clear : in std_logic;
		  st_powerup_set :  out std_logic;
	fps		: in std_logic);
end snake_total;


