library IEEE;
use IEEE.std_logic_1164.ALL;

entity length is
   port(reset          : in  std_logic;
        clk            : in  std_logic;
        collision_food : in  std_logic;
        len            : out std_logic_vector(5 downto 0));
end length;

