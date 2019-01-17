library IEEE;
use IEEE.std_logic_1164.ALL;

entity snake_game is
   port(clk          : in  std_logic;
        reset        : in  std_logic;
		  button_input : in std_logic_vector (3 downto 0);
        h_sync       : out std_logic;
        v_sync       : out std_logic;
        red          : out std_logic;
        green        : out std_logic;
        blue         : out std_logic);
end snake_game;

