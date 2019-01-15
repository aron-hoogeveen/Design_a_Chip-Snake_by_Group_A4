library IEEE;
use IEEE.std_logic_1164.ALL;

entity input_buffer is
   port(clk     : in  std_logic;
        reset   : in  std_logic;
        direct_input   : in  std_logic_vector(3 downto 0);
	input_buf	: out std_logic_vector(3 downto 0));
end input_buffer;

