library IEEE;
use IEEE.std_logic_1164.ALL;

entity itemgenerator is
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
end itemgenerator;

