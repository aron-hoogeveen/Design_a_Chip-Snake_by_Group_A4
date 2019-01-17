library IEEE;
use IEEE.std_logic_1164.ALL;

entity speed is
   port(clk            : in  std_logic;
        reset          : in  std_logic;
        collision_food : in  std_logic;
        move           : out std_logic                                 --clock signal to buttonreact
        );
end speed;

