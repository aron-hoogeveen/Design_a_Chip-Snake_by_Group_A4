library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of itemgenerator_tb is
   component itemgenerator
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
   signal clk                     : std_logic;
   signal reset                   : std_logic;
   signal countfps_fps            : std_logic;
   signal snake_item_set          : std_logic;
   signal snake_req_item          : std_logic;
   signal snake_item_loc_clear    : std_logic;
   signal snake_item_ok           : std_logic;
   signal snake_item_clear        : std_logic;
   signal snake_item_loc_set      : std_logic;
   signal snake_item_loc          : std_logic_vector(9 downto 0);
   signal storage_item_clear      : std_logic;
   signal storage_item_set        : std_logic;
   signal storage_item_loc        : std_logic_vector(11 downto 0);
begin
test: itemgenerator port map (clk, reset, countfps_fps, snake_item_set, snake_req_item, snake_item_loc_clear, snake_item_ok, snake_item_clear, snake_item_loc_set, snake_item_loc, storage_item_clear, storage_item_set, storage_item_loc);
   clk <= '1' after 13 ns,
          '0' after 40 ns when clk /= '0' else '1' after 40 ns;
    
   reset <= '1' after 0 ns,
            '0' after 160 ns;

   snake_item_set <= '0' after 5 ns,
               '1' after 160 ns,
               '0' after 240 ns,
               '1' after 2960 ns,
               '0' after 3040 ns;

   snake_req_item <= '0' after 0 ns,
               '1' after 2960 ns;

   snake_item_loc_clear <= '0' after 7 ns,
                     '1' after 1360 ns,
                     '0' after 1440 ns,
                     '1' after 2560 ns,
                     '0' after 2640 ns;

   snake_item_ok <= '0' after 8 ns,
              '1' after 2560 ns,
              '0' after 2640 ns;

   storage_item_clear <= '0' after 9 ns,
                     '1' after 2800 ns,
                     '0' after 2880 ns;

   countfps_fps <= '1' after 7 ns,
                   '0' after 80 ns when countfps_fps /= '0' else '1' after 80 ns;
end behaviour;

