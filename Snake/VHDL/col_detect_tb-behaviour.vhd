library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of col_detect_tb is
   component col_detect
      port(clk                 : in  std_logic;
           reset               : in  std_logic;
   
           ig_item_loc         : in std_logic_vector(9 downto 0);
           ig_item_loc_set     : in std_logic;
           ig_item_loc_clear   : out std_logic;
           ig_item_ok          : out std_logic;
   
           st_item_loc         : in std_logic_vector(9 downto 0);
           st_req_item_clear   : in std_logic;
           st_req_item_exists  : in std_logic;
           st_req_item_set     : out std_logic;
           st_req_item_no      : out std_logic;
   
           x_range             : in std_logic_vector(9 downto 0);
           y_range             : in std_logic_vector(9 downto 0);
           tail                : in std_logic;
           so_range_set        : in std_logic;
           so_range_clear      : out std_logic;
           so_reset            : out std_logic
       );
           
   end component;
   signal clk                 : std_logic;
   signal reset               : std_logic;
   signal ig_item_loc         : std_logic_vector(9 downto 0);
   signal ig_item_loc_set     : std_logic;
   signal ig_item_loc_clear   : std_logic;
   signal ig_item_ok          : std_logic;
   signal st_item_loc         : std_logic_vector(9 downto 0);
   signal st_req_item_clear   : std_logic;
   signal st_req_item_exists  : std_logic;
   signal st_req_item_set     : std_logic;
   signal st_req_item_no      : std_logic;
   signal x_range             : std_logic_vector(9 downto 0);
   signal y_range             : std_logic_vector(9 downto 0);
   signal tail                : std_logic;
   signal so_range_set        : std_logic;
   signal so_range_clear      : std_logic;
   signal so_reset            : std_logic;
begin
test: col_detect port map (clk, reset, ig_item_loc, ig_item_loc_set, ig_item_loc_clear, ig_item_ok, st_item_loc, st_req_item_clear, st_req_item_exists, st_req_item_set, st_req_item_no, x_range, y_range, tail, so_range_set, so_range_clear, so_reset);
   clk <= '1' after 0 ns,
          '0' after 40 ns when clk /= '0' else '1' after 40 ns;
          
   reset <= '1' after 0 ns,
            '0' after 160 ns;
   
   ig_item_loc <= "0000010101" after 0 ns, -- 160 ns
                  "1010100000" after 400 ns,
                  "1010110101" after 640 ns;

   ig_item_loc_set <= '0' after 0 ns,
                      '1' after 160 ns,
                      '0' after 320 ns,
                      '1' after 400 ns,
                      '0' after 560 ns,
                      '1' after 640 ns,
                      '0' after 800 ns,
                      '1' after 1120 ns,
                      '0' after 1280 ns;
   
   st_item_loc <= "0000000000" after 0 ns,
                  "1010110101" after 880 ns,
                  "0001100101" after 1120 ns; -- (3,5)

   st_req_item_clear <= '0' after 0 ns,
                        '1' after 800 ns,
                        '0' after 880 ns,
                        '1' after 960 ns,
                        '0' after 1040 ns,
                        '1' after 1360 ns,
                        '0' after 1440 ns,
                        '1' after 1520 ns,
                        '0' after 1600 ns;
   
   st_req_item_exists <= '0' after 0 ns,
                         '1' after 800 ns,
                         '0' after 880 ns,
                         '1' after 960 ns,
                         '0' after 1040 ns,
                         '1' after 1360 ns,
                         '0' after 1440 ns,
                         '1' after 1520 ns,
                         '0' after 1600 ns;
   
   x_range <= "0000100100" after 0 ns;

   y_range <= "0000100001" after 0 ns;

   tail <= '0' after 0 ns,
           '1' after 1760 ns,
           '0' after 1920 ns;
   
   so_range_set <= '0' after 0 ns,
                   '1' after 160 ns,
                   '0' after 1680 ns,
                   '1' after 1840 ns;
end behaviour;

