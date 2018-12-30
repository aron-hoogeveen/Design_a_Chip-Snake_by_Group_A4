library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of pulse_speed_tb is
   component pulse_speed
      port(length : in  std_logic_vector(5 downto 0);
           clk    : in  std_logic;
           speed  : out std_logic;
   	reset  : in  std_logic);
   end component;
   signal length : std_logic_vector(5 downto 0);
   signal clk    : std_logic;
   signal speed  : std_logic;
   signal reset  : std_logic;
begin
test: pulse_speed port map (length, clk, speed, reset);

length <= "000011" after 0 ns,				--l:3		--testing freq for length values

	  "010010" after 200000000 ns, --l:18 200ms

	  "101100" after 500000000 ns, --l:44 500ms
	  "111100" after 2000000000 ns; --l:60 2s 

clk <= '0' after 0 ns,
       '1' after 40 ns when clk /= '1' else '0' after 40 ns;
reset <= '1' after 0 ns,
	 '0' after 100 ns;

end behaviour;
