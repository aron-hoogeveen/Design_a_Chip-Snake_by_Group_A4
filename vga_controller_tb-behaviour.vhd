library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of vga_controller_tb is
   component vga_controller
      port(clk        : in  std_logic;
        		 reset      : in  std_logic;
        			h_sync     : out std_logic;
        			v_sync     : out std_logic;
        			h_count				: out std_logic_vector(8 downto 0);
		 	  v_count				: out std_logic_vector(9 downto 0);
		  	  video_on   : out std_logic;
        		 pulse_60hz : out std_logic);           
   end component;

   signal clk        : std_logic;
   signal reset      : std_logic;
   signal h_sync     : std_logic;
   signal v_sync     : std_logic;
   signal h_count    : std_logic_vector(8 downto 0);
   signal v_count    : std_logic_vector(9 downto 0);
   signal video_on   : std_logic;
   signal pulse_60hz : std_logic;
begin
test: vga_controller port map (clk, reset, h_sync, v_sync, h_count, v_count,video_on, pulse_60hz);
	clk <=	'1' after 0 ns,
			 '0' after 40 ns when clk /= '0' else '1' after 40 ns;
   reset <= '1' after 0 ns,
				'0' after 160 ns;

end behaviour;



