library IEEE;
use IEEE.std_logic_1164.ALL;

entity graphics is
   port(clk        : in  std_logic;
        reset      : in  std_logic;
        snake_x_l  : in  std_logic_vector(4 downto 0);
        snake_x_h  : in  std_logic_vector(4 downto 0);
        snake_y_l  : in  std_logic_vector(4 downto 0);
        snake_y_h  : in  std_logic_vector(4 downto 0);
        item_x     : in  std_logic_vector(4 downto 0);
        item_y     : in  std_logic_vector(4 downto 0);
        h_sync     : out std_logic;
        v_sync     : out std_logic;
        red        : out std_logic;
        green      : out std_logic;
        blue       : out std_logic;
        flag       : out std_logic;
        pulse_60hz : out std_logic);
end graphics;

