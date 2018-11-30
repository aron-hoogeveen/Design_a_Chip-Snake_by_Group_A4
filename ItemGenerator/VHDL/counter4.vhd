library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

entity counter4 is
   port(clk    : in  std_logic;
        reset  : in  std_logic;
        enable : in  std_logic;
        z_out  : out std_logic_vector(3 downto 0));
end counter4;

