library IEEE;
use IEEE.std_logic_1164.ALL;

entity itemGenerator is
   port(clk           : in  std_logic;
        res           : in  std_logic;
        req_item      : in  std_logic_vector(1 downto 0);
        item_ok       : in  std_logic;
        rng_in        : in  std_logic;
        count_done    : in  std_logic;
        new_head_loc  : in  std_logic_vector(9 downto 0);   -- These 10 bits are the first 10 bits from the 12 bits of new_head output from the snake
        count_start   : out std_logic;
        storage_enable: out std_logic;
        ack_req       : out std_logic;
        item_location : out std_logic_vector(9 downto 0);
        new_item      : out std_logic_vector(12 downto 0));
end itemGenerator;

