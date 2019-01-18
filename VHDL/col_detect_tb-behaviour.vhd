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
           new_tail_food           : out std_logic;
           new_tail_food_clear     : in std_logic;
   
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
           
           st_item_one             : in std_logic_vector(11 downto 0);
           st_item_two             : in std_logic_vector(11 downto 0);
           st_powerup_set          : out std_logic;
           st_powerup_clear        : in std_logic);
   end component;
   signal clk                     : std_logic;
   signal reset                   : std_logic;
   signal br_new_head_set         : std_logic;
   signal br_new_head_loc         : std_logic_vector(9 downto 0);
   signal br_new_head_clear       : std_logic;
   signal br_new_head_ok          : std_logic;
   signal br_inverse_controls_set : std_logic;
   signal food_collision          : std_logic;
   signal new_tail_food           : std_logic;
   signal new_tail_food_clear     : std_logic;
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
   signal st_item_one             : std_logic_vector(11 downto 0);
   signal st_item_two             : std_logic_vector(11 downto 0);
   signal st_powerup_set          : std_logic;
   signal st_powerup_clear        : std_logic;
begin
test: col_detect port map (clk, reset, br_new_head_set, br_new_head_loc, br_new_head_clear, br_new_head_ok, br_inverse_controls_set, food_collision, new_tail_food, new_tail_food_clear, gr_flickering_set, ig_item_loc_set, ig_item_loc, ig_item_clear, ig_item_loc_clear, ig_item_ok, ig_item_set, ig_item_type, x_range, y_range, so_tail, so_range_set, so_range_clear, sp_increase_speed_set, st_item_one, st_item_two, st_powerup_set, st_powerup_clear);
   clk <= '1' after 0 ns,
          '0' after 40 ns when clk /= '0' else '1' after 40 ns;

   reset <= '1' after 0 ns,
            '0' after 160 ns;

   br_new_head_set <= '0' after 0 ns;
 
   br_new_head_loc <= "0000000000" after 0 ns;

   new_tail_food_clear <= '0' after 0 ns;

   ig_item_loc_set <= '0' after 0 ns,
                      '1' after 160 ns,
                      '0' after 400 ns,
                      '1' after 480 ns,
                      '0' after 560 ns,
                      '1' after 800 ns,
                      '0' after 1200 ns,
                      '1' after 1280 ns,
                      '0' after 1480 ns;

   ig_item_loc <= "0000000000" after 0 ns,
                  "0010000100" after 480 ns;

   ig_item_clear <= '0' after 0 ns;

   x_range <= "0011001000" after 0 ns;

   y_range <= "1000010000" after 0 ns;

   so_tail <= '0' after 0 ns,
              '1' after 2960 ns;

   so_range_set <= '0' after 0 ns,
                   '1' after 160 ns;

   st_item_one <= "110111101100" after 0 ns;

   st_item_two <= "001000010001" after 0 ns,
                  "000100010001" after 1280 ns;

   st_powerup_clear <= '0' after 0 ns;
end behaviour;

