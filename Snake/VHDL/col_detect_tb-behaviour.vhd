library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of col_detect_tb is
   component col_detect
      port(clk                     : in  std_logic;
           reset                   : in  std_logic;
           
           br_new_head_set         : in std_logic;
           br_new_head_loc         : in std_logic_vector(9 downto 0);
           br_new_head_clear       : out std_logic;
           br_new_head_ok          : out std_logic;
           br_inverse_controls_set : out std_logic;
   
           food_collision          : out std_logic;
   
           gr_flickering_clear     : in std_logic;
           gr_flickering_set       : out std_logic;
   
           ig_item_loc_set         : in std_logic;
           ig_item_loc             : in std_logic_vector(9 downto 0);
           ig_item_clear           : in std_logic;
           ig_item_loc_clear       : out std_logic;
           ig_item_ok              : out std_logic;
           ig_item_set             : out std_logic;
           ig_item_type            : out std_logic;
   
           x_range                 : in std_logic_vector(9 downto 0);
           y_range                 : in std_logic_vector(9 downto 0);
           so_tail                 : in std_logic;
           so_range_set            : in std_logic;
           so_range_clear          : out std_logic;
   
           sp_increase_speed_set   : out std_logic;
   
           st_item_clear           : in std_logic;
           st_item_exists          : in std_logic;
           st_item_type            : in std_logic_vector(1 downto 0);
           st_item_loc             : in std_logic_vector(9 downto 0);
           st_item_set             : in std_logic;
           st_item_req             : out std_logic;
           st_item_no              : out std_logic);
   end component;
   signal clk                     : std_logic;
   signal reset                   : std_logic;
   signal br_new_head_set         : std_logic;
   signal br_new_head_loc         : std_logic_vector(9 downto 0);
   signal br_new_head_clear       : std_logic;
   signal br_new_head_ok          : std_logic;
   signal br_inverse_controls_set : std_logic;
   signal food_collision          : std_logic;
   signal gr_flickering_clear     : std_logic;
   signal gr_flickering_set       : std_logic;
   signal ig_item_loc_set         : std_logic;
   signal ig_item_loc             : std_logic_vector(9 downto 0);
   signal ig_item_clear           : std_logic;
   signal ig_item_loc_clear       : std_logic;
   signal ig_item_ok              : std_logic;
   signal ig_item_set             : std_logic;
   signal ig_item_type            : std_logic;
   signal x_range                 : std_logic_vector(9 downto 0);
   signal y_range                 : std_logic_vector(9 downto 0);
   signal so_tail                 : std_logic;
   signal so_range_set            : std_logic;
   signal so_range_clear          : std_logic;
   signal sp_increase_speed_set   : std_logic;
   signal st_item_clear           : std_logic;
   signal st_item_exists          : std_logic;
   signal st_item_type            : std_logic_vector(1 downto 0);
   signal st_item_loc             : std_logic_vector(9 downto 0);
   signal st_item_set             : std_logic;
   signal st_item_req             : std_logic;
   signal st_item_no              : std_logic;
begin
test: col_detect port map (clk, reset, br_new_head_set, br_new_head_loc, br_new_head_clear, br_new_head_ok, br_inverse_controls_set, food_collision, gr_flickering_clear, gr_flickering_set, ig_item_loc_set, ig_item_loc, ig_item_clear, ig_item_loc_clear, ig_item_ok, ig_item_set, ig_item_type, x_range, y_range, so_tail, so_range_set, so_range_clear, sp_increase_speed_set, st_item_clear, st_item_exists, st_item_type, st_item_loc, st_item_set, st_item_req, st_item_no);
   clk <= '0' after 0 ns,
          '1' after 40 ns when clk /= '1' else '0' after 40 ns;
   reset <= '1' after 0 ns,
   	  '0' after 160 ns;
   br_new_head_set <= '1' after 160 ns;
   br_new_head_loc(0) <= '0' after 0 ns,
		       '1' after 400 ns,
		       '0' after 640 ns,
		       '1' after 880 ns;
   br_new_head_loc(1) <= '0' after 0 ns,
	               '1' after 400 ns,
		       '0' after 640 ns,
		       '1' after 880 ns;
   br_new_head_loc(2) <= '0' after 0 ns,
		       '0' after 400 ns,
		       '0' after 640 ns,
		       '1' after 880 ns;
   br_new_head_loc(3) <= '0' after 0 ns,
		       '0' after 400 ns,
		       '0' after 640 ns,
		       '0' after 880 ns;
   br_new_head_loc(4) <= '0' after 0 ns,
		       '1' after 400 ns,
		       '0' after 640 ns,
		       '0' after 880 ns;
   br_new_head_loc(5) <= '0' after 0 ns,
		       '0' after 400 ns,
		       '0' after 640 ns,
                       '0' after 880 ns;
   br_new_head_loc(6) <= '0' after 0 ns,
		       '1' after 400 ns,
		       '0' after 640 ns,
                       '0' after 880 ns;
   br_new_head_loc(7) <= '0' after 0 ns,
		       '1' after 400 ns,
		       '0' after 640 ns,
		       '0' after 880 ns;
   br_new_head_loc(8) <= '0' after 0 ns,
                       '0' after 400 ns,
		       '0' after 640 ns,
                       '1' after 880 ns;
   br_new_head_loc(9) <= '0' after 0 ns,
		       '0' after 400 ns,
		       '0' after 640 ns,
		       '1' after 880 ns;
   gr_flickering_clear <= '0' after 0 ns;
   ig_item_loc_set <= '1' after 160 ns,
		    '0' after 240 ns,
		    '1' after 320 ns,
		    '0' after 640 ns;
   ig_item_loc(0) <= '0' after 160 ns,
 		   '1' after 320 ns,
		   '0' after 880 ns;
   ig_item_loc(1) <= '0' after 160 ns,
   	           '1' after 320 ns,
	           '0' after 880 ns;
   ig_item_loc(2) <= '0' after 160 ns,
                   '0' after 320 ns,
		   '0' after 880 ns;
   ig_item_loc(3) <= '0' after 160 ns,
		     '0' after 320 ns,
		     '1' after 880 ns;
   ig_item_loc(4) <= '0' after 160 ns,
		   '1' after 320 ns,
		   '0' after 880 ns;
   ig_item_loc(5) <= '0' after 160 ns,
		   '0' after 320 ns,
		   '0' after 880 ns;
   ig_item_loc(6) <= '0' after 160 ns,
		   '1' after 320 ns,
		   '0' after 880 ns;
   ig_item_loc(7) <= '0' after 160 ns,
		   '1' after 320 ns,
		   '1' after 880 ns;
   ig_item_loc(8) <= '0' after 160 ns,
		   '0' after 320 ns,
		   '1' after 880 ns;
   ig_item_loc(9) <= '0' after 160 ns,
		   '0' after 320 ns,
		   '1' after 880 ns;
   ig_item_clear <= '0' after 0 ns;
   x_range(0) <= '0' after 0 ns,
	       '1' after 880 ns;
   x_range(1) <= '0' after 0 ns,
	      '0' after 880 ns;
   x_range(2) <= '0' after 0 ns,
	       '0' after 880 ns;
   x_range(3) <= '0' after 0 ns,
	         '0' after 880 ns;
   x_range(4) <= '0' after 0 ns,
	         '1' after 880 ns;
   x_range(5) <= '0' after 0 ns,
		 '1' after 880 ns;
   x_range(6) <= '0' after 0 ns,
	       '0' after 880 ns;
   x_range(7) <= '0' after 0 ns,
	       '0' after 880 ns;
   x_range(8) <= '0' after 0 ns,
	       '0' after 880 ns;
   x_range(9) <= '0' after 0 ns,
	       '1' after 880 ns;
   y_range(0) <= '0' after 0 ns,
	       '0' after 880 ns;
   y_range(1) <= '0' after 0 ns,
	       '0' after 880 ns;
   y_range(2) <= '0' after 0 ns,
	       '1' after 880 ns;
   y_range(3) <= '0' after 0 ns,
	       '0' after 880 ns;
   y_range(4) <= '0' after 0 ns,
	       '1' after 880 ns;
   y_range(5) <= '0' after 0 ns,
	       '0' after 880 ns;
   y_range(6) <= '0' after 0 ns,
	       '0' after 880 ns;
   y_range(7) <= '0' after 0 ns,
	       '0' after 880 ns;
   y_range(8) <= '0' after 0 ns,
	       '0' after 880 ns;
   y_range(9) <= '0' after 0 ns,
	       '1' after 880 ns;
   so_tail <= '0' after 0 ns,
 	    '1' after 1040 ns;
   so_range_set <= '0' after 0 ns,
		 '1' after 1040 ns;
   st_item_clear <= '0' after 0 ns;
   st_item_exists <= '1' after 160 ns;
   st_item_type(0) <= '0' after 0 ns;
   st_item_type(1) <= '0' after 0 ns;
   st_item_loc(0) <= '0' after 0 ns;
   st_item_loc(1) <= '0' after 0 ns;
   st_item_loc(2) <= '0' after 0 ns;
   st_item_loc(3) <= '0' after 0 ns;
   st_item_loc(4) <= '0' after 0 ns;
   st_item_loc(5) <= '0' after 0 ns;
   st_item_loc(6) <= '0' after 0 ns;
   st_item_loc(7) <= '0' after 0 ns;
   st_item_loc(8) <= '0' after 0 ns;
   st_item_loc(9) <= '0' after 0 ns;
   st_item_set <= '0' after 0 ns;
end behaviour;

