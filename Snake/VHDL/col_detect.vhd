library IEEE;
use IEEE.std_logic_1164.ALL;

entity col_detect is
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
        st_req_item_no      : out std_logic
    );
        
end col_detect;

