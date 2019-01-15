-- FYI I am a structural

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of cc_so_nt is

component corner_calc is
   port(reset          : in  std_logic;
        clk            : in  std_logic;
        clear_flag_sl  : in  std_logic;
        clear_flag_so  : in  std_logic;
	flg_ok_tail	   : in  std_logic;
        snake_list     : in  std_logic_vector(16 downto 0);
        corner1        : out std_logic_vector(9 downto 0);
        corner2        : out std_logic_vector(9 downto 0);
        flag_tail      : out std_logic;
	flag_tail_so	  : out std_logic;
        flag_snake_out : out std_logic;
        flag_next_list : out std_logic);
end component corner_calc;

component new_tail is
   port(reset          : in  std_logic;
        clk            : in  std_logic;
        flag_tail      : in  std_logic;
        clr_flg_stor   : in  std_logic;
        collision_food : in  std_logic;
        move           : in  std_logic; 
        last_corner    : in  std_logic_vector(9 downto 0);
        tail           : in  std_logic_vector(9 downto 0);
        flag_new_tail  : out std_logic;
        flg_ok_tail    : out std_logic;
	clr_food	      : out std_logic;
        new_tail_out   : out std_logic_vector(5 downto 0));
end component new_tail;

component snake_out is
   port(reset, clk		 : in	 std_logic;                    
	flag_coc     : in  std_logic;                    
        corner1      : in  std_logic_vector(9 downto 0); 
        corner2      : in  std_logic_vector(9 downto 0);	
        clr_flag_g   : in  std_logic;						        
        clr_flag_chc : in  std_logic;
	tail	     : in  std_logic;	 
        clr_flag_coc : out std_logic;
        x_bounds     : out std_logic_vector(9 downto 0);       
        y_bounds     : out std_logic_vector(9 downto 0);	
        flag_chc     : out std_logic;
	tail_out	    : out std_logic); 
end component snake_out;

signal corner_1 : std_logic_vector (9 downto 0);
signal corner_2 : std_logic_vector (9 downto 0);
signal clr_flg_snake_out : std_logic;
signal flg_tail_to_new_tail : std_logic;
signal flg_tail_to_snake_out : std_logic;
signal flg_snake_out : std_logic;
signal flg_ok_tail : std_logic;

begin

corner_calculation : corner_calc port map(reset => reset, clk => clk, clear_flag_sl => clr_flg_str_cc, clear_flag_so => clr_flg_snake_out,
					  flg_ok_tail => flg_ok_tail, snake_list => snake_list, corner1 => corner_1, corner2 => corner_2,
					  flag_tail => flg_tail_to_new_tail, flag_tail_so => flg_tail_to_snake_out, flag_snake_out => flg_snake_out,
					  flag_next_list => flag_next_list);

snake_o : snake_out port map(reset => reset, clk => clk, flag_coc => flg_snake_out, corner1 => corner_1, corner2 => corner_2, clr_flag_g => clr_flg_grp_so,
			     clr_flag_chc => clr_flg_chc_so, tail => flg_tail_to_snake_out, clr_flag_coc => clr_flg_snake_out, x_bounds => x_bounds,
			     y_bounds => y_bounds,  flag_chc => flg_check_col, tail_out => flg_tail_chc);

nt : new_tail port map(reset => reset, clk => clk, flag_tail => flg_tail_to_new_tail, clr_flg_stor => clr_flg_str_nt, collision_food => collision_food,
	    	       move => move, last_corner => corner_1, tail => corner_2, flag_new_tail => flg_new_tail, flg_ok_tail => flg_ok_tail, clr_food => clr_food,
		       new_tail_out => new_tail_o); 	

end behaviour;

