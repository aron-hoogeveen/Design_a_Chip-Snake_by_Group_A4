library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of snake_total_tb is
   component snake_total
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
   		  st_powerup_set :  out std_logic);
   end component;
   signal clk            : std_logic;
   signal reset          : std_logic;
   signal clr_flg_str_cc : std_logic;
   signal clr_flg_grp_so : std_logic;
   signal clr_flg_str_nt : std_logic;
   signal snake_list     : std_logic_vector(16 downto 0);
   signal flg_new_tail   : std_logic;
   signal flag_next_list : std_logic;
   signal x_bounds       : std_logic_vector(9 downto 0);
   signal y_bounds       : std_logic_vector(9 downto 0);
   signal new_tail_o     : std_logic_vector(5 downto 0);
   signal head           : std_logic_vector(11 downto 0);
   signal button_input   : std_logic_vector(3 downto 0);
   signal newh_clr_flag  : std_logic;
   signal crn_clr_flag   : std_logic;
   signal ig_item_loc    : std_logic_vector(9 downto 0);
   signal ig_loc_set     : std_logic;
   signal st_item_one    : std_logic_vector(11 downto 0);
   signal st_item_two    : std_logic_vector(11 downto 0);
   signal corner         : std_logic_vector(5 downto 0);
   signal corner_flag    : std_logic;
   signal new_head_flag  : std_logic;
   signal ig_loc_clear   : std_logic;
   signal ig_item_clear  : std_logic;
   signal ig_item_ok     : std_logic;
   signal ig_item_set    : std_logic;
   signal ig_item_type   : std_logic;
   signal new_head       : std_logic_vector(11 downto 0);
   signal gr_flicker_set : std_logic;
   signal st_powerup_clear : std_logic;
   signal st_powerup_set : std_logic;
begin
test: snake_total port map (clk, reset, clr_flg_str_cc, clr_flg_grp_so, clr_flg_str_nt, snake_list, flg_new_tail, flag_next_list, x_bounds, y_bounds, new_tail_o, head, button_input, newh_clr_flag, crn_clr_flag, ig_item_loc, ig_loc_set, st_item_one, st_item_two, corner, corner_flag, new_head_flag, ig_loc_clear, ig_item_clear, ig_item_ok, ig_item_set, ig_item_type, new_head, gr_flicker_set, st_powerup_clear, st_powerup_set);
   
clk <= '1' after 0 ns,
       '0' after 40 ns when clk /= '0' else '1' after 40 ns;
reset <= '1' after 0 ns, '0' after 100 ns;

clr_flg_grp_so <= '0' after 0 ns,    '1' after 640 ns,  '0' after 720 ns,  '1' after 1540 ns,  '0' after 1600 ns,  '1' after 2160 ns, '0' after 2240 ns, '1' after 3040 ns, '0' after 3120 ns,
		  '1' after 3760 ns, '0' after 3840 ns, '1' after 4720 ns, '0' after 4800 ns;
clr_flg_str_nt <= '0' after 0 ns,    '1' after 560 ns,  '0' after 640 ns,  '1' after 2800 ns,  '0' after 2880 ns,  '1' after 5000 ns,   '0' after 5080 ns;   

clr_flg_str_cc <= '0' after 0 ns,    '1' after 880 ns,  '0' after 960 ns,  '1' after 1680 ns,  '0' after 1760 ns,  '1' after 2480 ns, '0' after 2560 ns, '1' after 3280 ns, '0' after 3360 ns,
		  '1' after 4080 ns, '0' after 4160 ns, '1' after 4880 ns, '0' after 4960 ns;

snake_list(16 downto 12) <= "10100" after 0 ns,    "10100" after 800 ns,  "01111" after 1600 ns, "01111" after 2400 ns, "01010" after 3200 ns, "00011" after 4000 ns, "01000" after 4800 ns;

snake_list(11 downto 7)  <= "01010" after 0 ns,    "00111" after 800 ns,  "00111" after 1600 ns, "00101" after 2400 ns, "00101" after 3200 ns, "01010" after 4000 ns, "00001" after 4800 ns; 

snake_list(6 downto 2)   <= "00111" after 0 ns,    "01111" after 800 ns,  "00101" after 1600 ns, "01010" after 2400 ns, "00111" after 3200 ns, "00110" after 4000 ns, "00010" after 4800 ns;

snake_list(1 downto 0)   <= "11"    after 0 ns,    "00"    after 800 ns,  "10"    after 1600 ns, "01"    after 2400 ns, "10"    after 3200 ns, "00"    after 4000 ns, "11"    after 4800 ns; 

head (11 downto 7) <= "10100" after 0 ns, "00101" after 700 ns, "01100" after 1900 ns, "10100" after 3000 ns, "00011" after 4000 ns;
head( 6 downto 2)  <= "01010" after 0 ns, "01010" after 700 ns, "01001" after 1900 ns, "10100" after 3000 ns, "01111" after 4000 ns;
head (1 downto 0)  <= "00"    after 0 ns, "11"    after 700 ns, "01"    after 1900 ns, "10"    after 3000 ns, "11"				after 4000 ns;
   
button_input(3 downto 0) <= "0001" after 0 ns, "0010" after 800 ns, "1000" after 2000 ns, "0100" after 3000 ns, "0110" after 4000 ns;
   
   newh_clr_flag <= '0' after 0 ns;
   crn_clr_flag <= '0' after 0 ns;
   

   ig_item_loc(0) <= '0' after 0 ns;
   ig_item_loc(1) <= '0' after 0 ns;
   ig_item_loc(2) <= '0' after 0 ns;
   ig_item_loc(3) <= '0' after 0 ns;
   ig_item_loc(4) <= '0' after 0 ns;
   ig_item_loc(5) <= '0' after 0 ns;
   ig_item_loc(6) <= '0' after 0 ns;
   ig_item_loc(7) <= '0' after 0 ns;
   ig_item_loc(8) <= '0' after 0 ns;
   ig_item_loc(9) <= '0' after 0 ns;
   
   ig_loc_set <= '0' after 0 ns;
   
   st_item_one(0) <= '0' after 0 ns;
   st_item_one(1) <= '0' after 0 ns;
   st_item_one(2) <= '0' after 0 ns;
   st_item_one(3) <= '0' after 0 ns;
   st_item_one(4) <= '0' after 0 ns;
   st_item_one(5) <= '0' after 0 ns;
   st_item_one(6) <= '0' after 0 ns;
   st_item_one(7) <= '0' after 0 ns;
   st_item_one(8) <= '0' after 0 ns;
   st_item_one(9) <= '0' after 0 ns;
   st_item_one(10) <= '0' after 0 ns;
   st_item_one(11) <= '0' after 0 ns;
   
   st_item_two(0) <= '0' after 0 ns;
   st_item_two(1) <= '0' after 0 ns;
   st_item_two(2) <= '0' after 0 ns;
   st_item_two(3) <= '0' after 0 ns;
   st_item_two(4) <= '0' after 0 ns;
   st_item_two(5) <= '0' after 0 ns;
   st_item_two(6) <= '0' after 0 ns;
   st_item_two(7) <= '0' after 0 ns;
   st_item_two(8) <= '0' after 0 ns;
   st_item_two(9) <= '0' after 0 ns;
   st_item_two(10) <= '0' after 0 ns;
   st_item_two(11) <= '0' after 0 ns;
   
   ig_item_clear <= '0' after 0 ns;
   st_powerup_clear <= '0' after 0 ns;
end behaviour;

