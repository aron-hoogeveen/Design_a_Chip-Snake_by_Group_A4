library IEEE;
use IEEE.std_logic_1164.ALL;

entity col_detect is
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
        collision_food          : out std_logic;

        sp_increase_speed_set   : out std_logic;
        
        st_item_one             : in std_logic_vector(11 downto 0);
        st_item_two             : in std_logic_vector(11 downto 0);
        st_powerup_set          : out std_logic;
        st_powerup_clear        : in std_logic);
end col_detect;


