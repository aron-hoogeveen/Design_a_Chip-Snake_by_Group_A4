library IEEE;
use IEEE.std_logic_1164.ALL;

entity shift_register is
   port(clk    : in  std_logic;
        enable : in  std_logic;
        D      : in  std_logic;
        Q      : out std_logic_vector(11 downto 0));
end shift_register;

