library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

architecture behaviour of length is
	signal length_out : std_logic_vector(5 downto 0);
begin
  gen_clk: process (clk, reset)
	begin
	  if(rising_edge(clk)) then
	    if (reset = '1') then
		  length_out <= "000011";
	    else
	      if (collision_food = '1') then
		      length_out <= std_logic_vector(unsigned(length_out) + 1);
	      end if;
	    end if;
      end if;
  end process;
len <= length_out;

end behaviour;

