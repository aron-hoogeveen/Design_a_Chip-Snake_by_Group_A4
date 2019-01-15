library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of cc_so_nt_tb is
   component cc_so_nt
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
   end component;
   signal clk		       : std_logic;
   signal reset  	       : std_logic;
   signal clr_flg_str_cc : std_logic;
   signal clr_flg_grp_so : std_logic;
   signal clr_flg_chc_so : std_logic;
   signal clr_flg_str_nt : std_logic;
   signal move           : std_logic;
   signal collision_food : std_logic;
   signal snake_list     : std_logic_vector(16 downto 0);
   signal flg_new_tail   : std_logic;
   signal flg_check_col  : std_logic;
   signal flg_graphics   : std_logic;
   signal flg_tail_chc   : std_logic;
   signal clr_food 	     : std_logic;
   signal flag_next_list : std_logic;
   signal x_bounds       : std_logic_vector(9 downto 0);
   signal y_bounds       : std_logic_vector(9 downto 0);
   signal new_tail_o       : std_logic_vector(5 downto 0);
begin
test: cc_so_nt port map (clk, reset, clr_flg_str_cc, clr_flg_grp_so, clr_flg_chc_so, clr_flg_str_nt, move, collision_food, snake_list, flg_new_tail, flg_check_col, flg_graphics, flg_tail_chc, clr_food, flag_next_list, x_bounds, y_bounds, new_tail_o);

reset <= '1' after 0 ns, '0' after 50 ns;
clk <= '1' after 0 ns, '0' after 20 ns when clk /= '0' else '1' after 20 ns;
move <= '1' after 0 ns, '0' after 800 ns when move /= '0' else '1' after 800 ns;

clr_flg_grp_so <= '0' after 0 ns,    '1' after 280 ns,  '0' after 320 ns,  '1' after 800 ns,  '0' after 840 ns,  '1' after 1240 ns, '0' after 1280 ns, '1' after 1880 ns, '0' after 1920 ns,
		  '1' after 2320 ns, '0' after 2360 ns, '1' after 2800 ns, '0' after 2840 ns, '1' after 3320 ns, '0' after 3360 ns, '1' after 3760 ns, '0' after 3800 ns, '1' after 4360 ns, '0' after 4400 ns;
clr_flg_chc_so <= '0' after 0 ns,    '1' after 280 ns,  '0' after 320 ns,  '1' after 760 ns,  '0' after 800 ns,  '1' after 1200 ns, '0' after 1240 ns, '1' after 1840 ns, '0' after 1880 ns,
		  '1' after 2320 ns, '0' after 2360 ns, '1' after 2800 ns, '0' after 2840 ns, '1' after 3280 ns, '0' after 3320 ns, '1' after 3800 ns, '0' after 3840 ns, '1' after 4280 ns, '0' after 4320 ns; 
clr_flg_str_nt <= '0' after 0 ns,    '1' after 360 ns,  '0' after 400 ns,  '1' after 3720 ns, '0' after 3760 ns;   

clr_flg_str_cc <= '0' after 0 ns,    '1' after 480 ns,  '0' after 520 ns,  '1' after 920 ns,  '0' after 960 ns,  '1' after 1560 ns, '0' after 1600 ns, '1' after 2000 ns, '0' after 2040 ns,
		  '1' after 2480 ns, '0' after 2520 ns, '1' after 3000 ns, '0' after 3040 ns, '1' after 3440 ns, '0' after 3480 ns, '1' after 4000 ns, '0' after 4040 ns; 

collision_food <= '0' after 0 ns, '1' after 1440 ns, '0' after 1520 ns;

snake_list(16 downto 12) <= "10100" after 0 ns,    "10100" after 400 ns,  "01111" after 880 ns, "01111" after 1520 ns, "01010" after 1960 ns, "00011" after 2400 ns,
			    "01000" after 2960 ns, "10000" after 3480 ns, "01001" after 3920 ns;

snake_list(11 downto 7)  <= "01010" after 0 ns,    "00111" after 400 ns,  "00111" after 880 ns, "00101" after 1520 ns, "00101" after 1960 ns, "01010" after 2400 ns, 
			    "00001" after 2960 ns, "01110" after 3480 ns, "00111" after 3920 ns;

snake_list(6 downto 2)   <= "00111" after 0 ns,    "01111" after 400 ns,  "00101" after 880 ns, "01010" after 1520 ns, "00111" after 1960 ns, "00110" after 2400 ns,
			    "00010" after 2960 ns, "01100" after 3480 ns, "00100" after 3920 ns; 

snake_list(1 downto 0)   <= "11"    after 0 ns, "00"       after 400 ns, "10"     after 880 ns, "00"    after 1520 ns, "11"    after 1960 ns, "00"    after 2400 ns, 
			    "10"    after 2960 ns, "01"    after 3480 ns, "10"    after 3920 ns;


end behaviour;

