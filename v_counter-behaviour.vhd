library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of v_counter is
signal count, new_count: unsigned(9 downto 0);
begin
   process(count, enable)
   begin
      if(enable = '1') then
			new_count <= count + 1;
      else 
			new_count <= count;
      end if;
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
v_count <= std_logic_vector(count);
end behaviour;

