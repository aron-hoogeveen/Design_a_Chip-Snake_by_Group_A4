library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of itemgenerator_tb is
   component itemgenerator
      port(clk             : in std_logic;
           reset           : in std_logic;
           item_set        : in std_logic;
           item_clear      : out std_logic;
           req_item        : in std_logic;
           item_loc_set    : out std_logic;
           item_loc_clear  : in std_logic;
           item_loc        : out std_logic_vector(9 downto 0);
           item_ok         : in std_logic;
   
           new_item_set    : out std_logic;
           new_item_clear  : in std_logic;
           new_item        : out std_logic_vector(11 downto 0);
   
           countfps_fps    : in std_logic;
   
           count_done      : in std_logic);
   end component;
   signal clk             : std_logic;
   signal reset           : std_logic;
   signal item_set        : std_logic;
   signal item_clear      : std_logic;
   signal req_item        : std_logic;
   signal item_loc_set    : std_logic;
   signal item_loc_clear  : std_logic;
   signal item_loc        : std_logic_vector(9 downto 0);
   signal item_ok         : std_logic;
   signal new_item_set    : std_logic;
   signal new_item_clear  : std_logic;
   signal new_item        : std_logic_vector(11 downto 0);
   signal countfps_fps    : std_logic;
   signal count_done      : std_logic;
begin
test: itemgenerator port map (clk, reset, item_set, item_clear, req_item, item_loc_set, item_loc_clear, item_loc, item_ok, new_item_set, new_item_clear, new_item, countfps_fps, count_done);
   clk <= '1' after 0 ns,
          '0' after 40 ns when clk /= '0' else '1' after 40 ns;

   reset <= '1' after 0 ns,
            '0' after 160 ns;

   item_set <= '0' after 0 ns,
               '1' after 160 ns,
               '0' after 240 ns,
               '1' after 2960 ns,
               '0' after 3040 ns;

   req_item <= '0' after 0 ns,
               '1' after 2960 ns;

   item_loc_clear <= '0' after 0 ns,
                     '1' after 1360 ns,
                     '0' after 1440 ns,
                     '1' after 2560 ns,
                     '0' after 2640 ns;

   item_ok <= '0' after 0 ns,
              '1' after 2560 ns,
              '0' after 2640 ns;

   new_item_clear <= '0' after 0 ns,
                     '1' after 2800 ns,
                     '0' after 2880 ns;

   countfps_fps <= '1' after 0 ns,
                   '0' after 80 ns when countfps_fps /= '0' else '1' after 80 ns;

   count_done <= '0' after 0 ns;
end behaviour;

