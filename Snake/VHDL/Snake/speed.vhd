library IEEE;
use IEEE.std_logic_1164.ALL;

entity speed is
   port(clk            : in  std_logic;
        reset          : in  std_logic;
        collision_food : in  std_logic_vector(1 downto 0);
        move           : out std_logic;                                 --clock signal to buttonreact
	length_out	    : out std_logic_vector(5 downto 0));
end speed;

