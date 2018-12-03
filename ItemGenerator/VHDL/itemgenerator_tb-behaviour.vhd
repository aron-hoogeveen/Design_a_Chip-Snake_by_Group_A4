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
   
           rng_out         : in std_logic;
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
   signal rng_out         : std_logic;
   signal count_done      : std_logic;
begin
test: itemgenerator port map (clk, reset, item_set, item_clear, req_item, item_loc_set, item_loc_clear, item_loc, item_ok, new_item_set, new_item_clear, new_item, rng_out, count_done);
clk <= '1' after 0 ns,
       '0' after 40 ns when clk /= '0' else '1' after 40 ns;
   reset <= '1' after 0 ns,
            '0' after 120 ns;
   item_set <= '0' after 0 ns,
               '1' after 160 ns,
               '0' after 240 ns;
   req_item <= '0' after 0 ns;
   item_loc_clear <= '0' after 0 ns;
   item_ok <= '0' after 0 ns;
   new_item_clear <= '0' after 0 ns;
   rng_out <= '1' after 0 ns;
   count_done <= '0' after 0 ns;
end behaviour;

