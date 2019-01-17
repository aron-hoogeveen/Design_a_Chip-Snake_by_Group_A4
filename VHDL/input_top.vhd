library IEEE;
use IEEE.std_logic_1164.ALL;

entity input_top is
   port(clk          : in  std_logic;
        reset        : in  std_logic;
        direct_input : in  std_logic_vector(3 downto 0);
        buttons      : out std_logic_vector(1 downto 0));
end input_top;

