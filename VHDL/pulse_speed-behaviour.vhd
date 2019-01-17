library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

architecture behaviour of pulse_speed is
	signal fullcount : std_logic_vector(21 downto 0);--change to (21 -> 0)			--to count up to 4M+.								
	signal temporal : std_logic;
	signal fullcount_most : std_logic_vector(5 downto 0);
	signal length_least : std_logic_vector(5 downto 0);
begin
  gen_clk: process (clk, reset)
    begin
      if (rising_edge(clk)) then
      	if (reset = '1') then
          fullcount <= (others => '0');
	  temporal <= '0';
	else
	  if(fullcount_most = NOT(length_least)) then 								--decreasing nr of cycles counted to before switch when length increases
	     temporal <= NOT(temporal); 								--switch 
	     fullcount <= (others => '0');
          else 
	     fullcount <= std_logic_vector(unsigned(fullcount) + 1);
	  end if;
	end if;
      end if;
  end process;

speed <= temporal;
fullcount_most <= fullcount(21 downto 16); 									--6 most-sig bits of counter
length_least <= length(5 downto 0);									--length bits to compare with counter
 
end behaviour;

