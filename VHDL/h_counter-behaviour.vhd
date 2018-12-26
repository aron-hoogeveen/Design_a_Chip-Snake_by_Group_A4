library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of h_counter is
signal count, new_count:  unsigned(8 downto 0):= to_unsigned(0, 9);

begin
   process(count)
	begin
	   new_count <= count + 1;
   end process;

   process(clk)
	begin
	   if(clk'event and clk = '1') then 
	      if(reset = '1') then
		count <= (others => '0');
	      else 
		count <= new_count;
	      end if;
	   end if;	
   end process;

h_count <= std_logic_vector(count);
end behaviour;

