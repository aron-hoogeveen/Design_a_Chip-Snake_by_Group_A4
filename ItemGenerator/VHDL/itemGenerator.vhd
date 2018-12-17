library IEEE;
use IEEE.std_logic_1164.ALL;

entity itemgenerator is
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

        countfps_done   : in std_logic;
        countfps_start  : out std_logic;
        countfps_fps    : in std_logic;

        -- Only for test purpose:
        rng_out         : in std_logic;
        count_done      : in std_logic);
end itemgenerator;

