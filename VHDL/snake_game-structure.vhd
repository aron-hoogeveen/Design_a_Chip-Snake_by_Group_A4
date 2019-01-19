library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structure of snake_game is
component graphics is
   port(clk        : in  std_logic;
        reset      : in  std_logic;
        snake_x_loc  : in  std_logic_vector(9 downto 0);
        snake_y_loc  : in  std_logic_vector(9 downto 0);
        item_in     : in  std_logic_vector(11 downto 0);
        power_in    : in  std_logic_vector(11 downto 0);
        flicker_in : in 	std_logic;
		  h_sync     : out std_logic;
        v_sync     : out std_logic;
		  red        : out std_logic;
        green      : out std_logic;
        blue       : out std_logic;
        clr_flag   : out std_logic;
        pulse_60hz : out std_logic);
end component;

component storage is
	port(clk     			          	: in  std_logic;
		  reset     				        : in  std_logic;
		  new_head_flag		      	: in  std_logic;
        new_head  				        : in  std_logic_vector(11 downto 0);
		  new_corner_flag			    : in  std_logic;
        new_corner 				       : in  std_logic_vector(5 downto 0);
		  new_tail_flag			      : in  std_logic;
        new_tail   				       : in  std_logic_vector(5 downto 0);
		  new_item_set			       : in  std_logic;
		  remove_power_up_flag  : in  std_logic;
		  send_corner_flag			   : in  std_logic;
        new_item   				       : in  std_logic_vector(11 downto 0);
        snake_list 			       	: out std_logic_vector(16 downto 0);
        item_out_food   				  : out std_logic_vector(11 downto 0);
		  item_out_power_up			  : out std_logic_vector(11 downto 0);
	     head	   		            : out std_logic_vector(11 downto 0);
	     new_item_clear			     : out std_logic;
	     clear_head_flag			    : out std_logic;
	     clear_corner_flag			  : out std_logic;
	     clear_tail_flag			    : out std_logic;
	     remove_power_up_clear	: out std_logic;
	     send_new_corner_clear	: out std_logic);
end component;
component itemgenerator is
    port(
        clk                     : in std_logic;
        reset                   : in std_logic;

        countfps_fps            : in std_logic;

        snake_item_set          : in std_logic;
        snake_req_item          : in std_logic;
        snake_item_loc_clear    : in std_logic;
        snake_item_ok           : in std_logic;
        snake_item_clear        : out std_logic;
        snake_item_loc_set      : out std_logic;
        snake_item_loc          : out std_logic_vector(9 downto 0);

        storage_item_clear      : in std_logic;
        storage_item_set        : out std_logic;
        storage_item_loc        : out std_logic_vector(11 downto 0));
end component;

component snake_total is
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
end component;

signal snake_x_loc : std_logic_vector(9 downto 0);
signal snake_y_loc : std_logic_vector(9 downto 0);
signal food_data : std_logic_vector(11 downto 0); 
signal powerup_data : std_logic_vector(11 downto 0);
signal pulse_60_hz : std_logic;
signal new_head_flag_link : std_logic;
signal new_head_link : std_logic_vector (11 downto 0);
signal flag_next_list_link : std_logic;
signal corner_flag_link : std_logic;
signal corner_link : std_logic_vector (5 downto 0);
signal flg_new_tail_link : std_logic;
signal new_tail_link : std_logic_vector(5 downto 0);
signal storage_item_set_link : std_logic;
signal storage_item_loc_link : std_logic_vector (11 downto 0);
signal head_link : std_logic_vector (11 downto 0);
signal storage_item_clear_link : std_logic;
signal newh_clr_flag_link : std_logic;
signal crn_clr_flag_link : std_logic;
signal clr_flg_str_nt_link : std_logic;
signal clr_flg_str_cc_link : std_logic;
signal snake_list_link : std_logic_vector (16 downto 0);
signal clr_flg_grp_so_link : std_logic;
signal snake_item_loc_link : std_logic_vector (9 downto 0);
signal snake_item_loc_set_link : std_logic;
signal snake_item_clear_link : std_logic;
signal snake_item_ok_link : std_logic;
signal snake_item_loc_clear_link : std_logic;
signal snake_req_item_link : std_logic;
signal snake_item_set_link : std_logic;
signal gr_flicker_set_link : std_logic;
signal button_input_link : std_logic_vector (3 downto 0);
signal powerup_clear_link : std_logic;
signal st_powerup_set_link     : std_logic;
--signal remove_power_up_value :
begin
GRAPHICS_LABEL : graphics
   port map(clk        => clk,
        				reset      => reset,
        				snake_x_loc => snake_x_loc,
        				snake_y_loc => snake_y_loc,
        				item_in     => food_data,
        				power_in    => powerup_data,
        				flicker_in => gr_flicker_set_link,
		  		h_sync     => h_sync,
        				v_sync     => v_sync,
		  		red        => red,
        				green      => green,
        				blue       => blue,
        				clr_flag   => clr_flg_grp_so_link, ----
        				pulse_60hz => pulse_60_hz); ----

STORAGE_LABEL : storage
	port map(clk     			          	=> clk, 
		  reset     				        => reset,
		  new_head_flag		      	=> new_head_flag_link,
        new_head  				        => new_head_link,
		  new_corner_flag			    => corner_flag_link,
        new_corner 				       => corner_link,
		  new_tail_flag			      => flg_new_tail_link,
        new_tail   				       => new_tail_link,
		  new_item_set			       => storage_item_set_link,
		  remove_power_up_flag		=> st_powerup_set_link,
		  send_corner_flag			   => flag_next_list_link,
        new_item   				       => storage_item_loc_link,
        snake_list 			       	=> snake_list_link,
        item_out_food   				  => food_data,
		  item_out_power_up			  => powerup_data,
	     head	   		            => head_link,
	     new_item_clear			     => storage_item_clear_link,
	     clear_head_flag			    => newh_clr_flag_link,
	     clear_corner_flag			  => crn_clr_flag_link,
	     clear_tail_flag			    => clr_flg_str_nt_link,
	     remove_power_up_clear	=> powerup_clear_link,
	     send_new_corner_clear	=> clr_flg_str_cc_link);

ITEM_GENERATOR_LABEL : itemgenerator
    port map(clk                     => clk,
        				 reset                   => reset,
        				 countfps_fps            => pulse_60_hz,
		       snake_item_set          => snake_item_set_link,
       				 snake_req_item          => snake_req_item_link,
       				 snake_item_loc_clear    => snake_item_loc_clear_link,
       				 snake_item_ok           => snake_item_ok_link,
       				 snake_item_clear        => snake_item_clear_link,
       				 snake_item_loc_set      => snake_item_loc_set_link,
       				 snake_item_loc          => snake_item_loc_link,
		       storage_item_clear      => storage_item_clear_link,
      				 storage_item_set        => storage_item_set_link,
        				 storage_item_loc        => storage_item_loc_link);

SNAKE_TOTAL_LABEL :snake_total
   port map(clk        => clk,
        reset          => reset,
        clr_flg_str_cc => clr_flg_str_cc_link,
        clr_flg_grp_so => clr_flg_grp_so_link,
		  clr_flg_str_nt => clr_flg_str_nt_link,
        snake_list     => snake_list_link,
        flg_new_tail   => flg_new_tail_link,
        flag_next_list => flag_next_list_link,
        x_bounds       => snake_x_loc,
        y_bounds       => snake_y_loc,
        new_tail_o     => new_tail_link,
        head           => head_link,
        button_input   => button_input,
        newh_clr_flag  => newh_clr_flag_link,
        crn_clr_flag   => crn_clr_flag_link,
        ig_item_loc    => snake_item_loc_link,
        ig_loc_set     => snake_item_loc_set_link,
        st_item_one    => food_data,
        st_item_two    => powerup_data,
        corner         => corner_link,
        corner_flag    => corner_flag_link,
        new_head_flag  => new_head_flag_link,
        ig_loc_clear   => snake_item_loc_clear_link,
        ig_item_clear  => snake_item_clear_link,
        ig_item_ok     => snake_item_ok_link,
        ig_item_set    => snake_item_set_link,
        ig_item_type   => snake_req_item_link,
        new_head       => new_head_link,
        gr_flicker_set => gr_flicker_set_link,
		  st_powerup_clear => powerup_clear_link,
		  st_powerup_set   => st_powerup_set_link,
	fps		=> pulse_60_hz);
end structure;

