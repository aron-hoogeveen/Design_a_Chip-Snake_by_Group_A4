library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of speed_tb is
   component speed
      port(clk            : in  std_logic;
           reset          : in  std_logic;
           collision_food : in  std_logic_vector(1 downto 0);
           move           : out std_logic;
   	length_out	    : out std_logic_vector(5 downto 0));
   end component;
   signal clk            : std_logic;
   signal reset          : std_logic;
   signal collision_food : std_logic_vector(1 downto 0);
   signal move           : std_logic;
   signal length_out	    : std_logic_vector(5 downto 0);
begin
test: speed port map (clk, reset, collision_food, move, length_out);

clk <= '0' after 0 ns,
       '1' after 40 ns when clk /= '1' else '0' after 40 ns;
reset <= '1' after 0 ns,
	 '0' after 100 ns,
	 '1' after 1000000000 ns;
collision_food <= "00" after 0 ns,
                  "01" after 180 ns,
		  "00" after 230 ns,
		  "01" after 330 ns,
		  "00" after 380 ns,
		  "01" after 550 ns,
		  "00" after 750 ns,
		  "11" after 850 ns,
	          "00" after 900 ns,
		  "01" after 1000 ns,
		  "00" after 1100 ns;
end behaviour;
