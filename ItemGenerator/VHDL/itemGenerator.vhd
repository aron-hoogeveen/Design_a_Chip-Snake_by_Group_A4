library IEEE;
use IEEE.std_logic_1164.ALL;

entity itemgenerator is
   port(clk             : in std_logic;                         -- global clock signal
        reset           : in std_logic;                         -- global reset signal

        snake_item_set        : in std_logic;                         -- set flag from Snake module that requests us to generate a new item
        snake_item_clear      : out std_logic;                        -- clear flag to Snake module (see signal above)
        snake_req_item        : in std_logic;                         -- signal from Snake module that tells us if we need to generate a food ('0') or a power-up item ('1')
        snake_item_loc_set    : out std_logic;                        -- set flag signal to Snake module to tell them we need them to check our generated location 
        snake_item_loc_clear  : in std_logic;                         -- clear flag from Snake module to signal us that they processed the location check
        snake_item_loc        : out std_logic_vector(9 downto 0);     -- the signal which contains the item that needs to be checked
        snake_item_ok         : in std_logic;                         -- signal from Snake module that tells us if the location is OK or not

        storage_item_set    : out std_logic;                        -- set flag signal to Storage to tell them we want them to store the item on signal new_item
        storage_item_clear  : in std_logic;                         -- clear flag from Storage to tell us they processed the new item
        storage_item        : out std_logic_vector(11 downto 0);    -- the new_item that storage needs to store

        countfps_fps    : in std_logic;                         -- a clock signal with frequency 30, comming from the graphics module

        -- Only for test purpose:
        --rng_out         : in std_logic;
        --count_done      : in std_logic);                        
end itemgenerator;

