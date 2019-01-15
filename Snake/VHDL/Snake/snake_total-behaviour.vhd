library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of snake_total is

component snake_struct is
   port(clk            : in  std_logic;
        reset          : in  std_logic;
        head           : in  std_logic_vector(11 downto 0);
        button_input   : in  std_logic_vector(3 downto 0);
        newh_clr_flag  : in  std_logic;
        crn_clr_flag   : in  std_logic;
        ig_item_loc    : in  std_logic_vector(9 downto 0);
        ig_loc_set     : in  std_logic;
        st_item_one    : in  std_logic_vector(11 downto 0);
        st_item_two    : in  std_logic_vector(11 downto 0);
        x_range        : in  std_logic_vector(9 downto 0);
        y_range        : in  std_logic_vector(9 downto 0);
        tail           : in  std_logic;
        so_range_set   : in  std_logic;
        corner         : out std_logic_vector(5 downto 0);
        corner_flag    : out std_logic;
        new_head_flag  : out std_logic;
        ig_loc_clear   : out std_logic;
        ig_item_clear   : in std_logic;
        ig_item_ok     : out std_logic;
        ig_item_set     : out std_logic;
        ig_item_type   : out std_logic;
        so_range_clear : out std_logic;
        new_head       : out std_logic_vector(11 downto 0);
	gr_flickering_set	: out std_logic;
        move_out          : out std_logic;
	new_tail_food		  : out std_logic;
	new_tail_food_clear : in std_logic);
end component snake_struct;

component cc_so_nt is
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
        flg_graphics   : out std_logic;
        flg_tail_chc   : out std_logic;
	clr_food 	     : out std_logic;
        flag_next_list : out std_logic;
        x_bounds       : out std_logic_vector(9 downto 0);
        y_bounds       : out std_logic_vector(9 downto 0);
        new_tail_o       : out std_logic_vector(5 downto 0)
        );
end component cc_so_nt;

signal x_range_s : std_logic_vector(9 downto 0);
signal y_range_s : std_logic_vector(9 downto 0);
signal flg_tail_chc_s : std_logic;
signal clr_flg_chc_so_s : std_logic;
signal move_s : std_logic;
signal collision_f_s : std_logic;
signal flg_chc_s : std_logic;
signal clr_food_s : std_logic;

begin

snake_right_strcture: snake_struct port map(clk => clk, reset => reset, head => head, 
				button_input => button_input, newh_clr_flag => newh_clr_flag, crn_clr_flag => crn_clr_flag,
				ig_item_loc => ig_item_loc, ig_loc_set => ig_loc_set, st_item_one => st_item_one, 
				st_item_two => st_item_two, x_range => x_range_s, y_range => y_range_s, 
				tail => flg_tail_chc_s, so_range_set => flg_chc_s, corner => corner,
				corner_flag => corner_flag, new_head_flag => new_head_flag,
				ig_loc_clear => ig_loc_clear, ig_item_clear => ig_item_clear, ig_item_ok => ig_item_ok, 
				ig_item_set => ig_item_set, ig_item_type => ig_item_type, 
				so_range_clear => clr_flg_chc_so_s, new_head => new_head, 
				gr_flickering_set => gr_flicker_set, move_out => move_s, new_tail_food => collision_f_s, new_tail_food_clear => clr_food_s);

cc_so_nt_combi : cc_so_nt port map(clk => clk, reset => reset, clr_flg_str_cc => clr_flg_str_cc, clr_flg_grp_so => clr_flg_grp_so, clr_flg_chc_so => clr_flg_chc_so_s, clr_flg_str_nt => clr_flg_str_nt, 
				move => move_s, collision_food => collision_f_s, snake_list => snake_list, 
				flg_new_tail => flg_new_tail, flg_check_col => flg_chc_s, flg_graphics => flg_graphics, 
				flg_tail_chc => flg_tail_chc_s, clr_food => clr_food_s, flag_next_list => flag_next_list,
				x_bounds => x_range_s, y_bounds => y_range_s, new_tail_o => new_tail_o );

y_bounds <= y_range_s;
x_bounds <= x_range_s;  

end behaviour;

