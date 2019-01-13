library IEEE;
use IEEE.std_logic_1164.ALL;

entity snake_struct is
   port(clk            : in  std_logic;
        reset          : in  std_logic;
        head           : in  std_logic_vector(11 downto 0);
        buttons        : in  std_logic_vector(1 downto 0);
        newh_clr_flag  : in  std_logic;
        crn_clr_flag   : in  std_logic;
        ig_item_loc    : in  std_logic_vector(9 downto 0);
        ig_loc_set     : in  std_logic;
        st_item_loc    : in  std_logic_vector(9 downto 0);
        st_item_clear  : in  std_logic;
        st_item_exists : in  std_logic;
        st_item_type   : in  std_logic_vector(1 downto 0);
        x_range        : in  std_logic_vector(9 downto 0);
        y_range        : in  std_logic_vector(9 downto 0);
        tail           : in  std_logic;
        so_range_set   : in  std_logic;
        corner         : out std_logic_vector(5 downto 0);
        corner_flag    : out std_logic;
        new_head_flag  : out std_logic;
        length         : out std_logic_vector(5 downto 0);
        ig_loc_clear   : out std_logic;
        ig_item_ok     : out std_logic;
        st_item_set    : out std_logic;
        st_item_no     : out std_logic;
        so_range_clear : out std_logic;
        so_reset       : out std_logic;
        new_head       : out std_logic_vector(11 downto 0);
	gr_flickering_clear	: in std_logic;
	gr_flickering_set		 : out std_logic);
end snake_struct;

