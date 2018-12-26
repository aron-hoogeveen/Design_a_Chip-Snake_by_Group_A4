library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of h_counter_tb is
   component h_counter
      port(clk     : in  std_logic;
           reset   : in  std_logic;
           h_count : out std_logic_vector(8 downto 0));
   end component;

   signal clk     : std_logic;
   signal reset   : std_logic;
   signal h_count : std_logic_vector(8 downto 0);

begin
test: h_counter port map (clk, reset, h_count);
	clk <= '1' after 0 ns,
   	      '0' after 40 ns when clk /= '0' else '1' after 40 ns;
   reset <= '1' after 0 ns,
				'0' after 160 ns,
				'1' after 800 ns,
				'0' after 880 ns,	
				'1' after 42800 ns,
				'0' after 42960 ns;
end behaviour;

