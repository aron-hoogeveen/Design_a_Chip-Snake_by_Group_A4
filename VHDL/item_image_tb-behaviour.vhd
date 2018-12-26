library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of item_image_tb is
   component item_image
      port(clk   					: in  std_logic;
           reset 					: in  std_logic;
   		     video_on   : in  std_logic;
           location_x : in  std_logic_vector(4 downto 0);
           location_y : in  std_logic_vector(4 downto 0);
           h_count    : in  std_logic_vector(8 downto 0);
           v_count    : in  std_logic_vector(9 downto 0);
           item      	: out std_logic);
   end component;
   signal clk   					: std_logic;
   signal reset 					: std_logic;
   signal video_on   : std_logic;
   signal location_x : std_logic_vector(4 downto 0);
   signal location_y : std_logic_vector(4 downto 0);
   signal h_count    : std_logic_vector(8 downto 0);
   signal v_count    : std_logic_vector(9 downto 0);
   signal item      	: std_logic;
begin
test: item_image port map (clk, reset, video_on, location_x, location_y, h_count, v_count, item);
   clk <=	'1' after 0 ns,
			 '0' after 40 ns when clk /= '0' else '1' after 40 ns;
   reset <=	'1' after 0 ns,
				'0' after 80 ns;
   video_on <= '1' after 0 ns,
					'0' after 16 ms;
	location_x <= "00100" after 0 ns,
						"10100" after 20 ms,
						"01111" after 30 ms;
	
	location_y <= "00011" after 0 ns,
						"00101" after 20 ms,
						"10100" after 30 ms;

   h_count(0) <= '0' after 0 ns,
					  '1' after 80 ns when h_count(0) /= '1' else '0' after 80 ns;
   h_count(1) <= '0' after 0 ns, 
				  	  '1' after 160 ns when h_count(1) /= '1' else '0' after 160 ns;
   h_count(2) <= '0' after 0 ns,
					  '1' after 320 ns when h_count(2) /= '1' else '0' after 320 ns;
   h_count(3) <= '0' after 0 ns,
				  	  '1' after 640 ns when h_count(3) /= '1' else '0' after 640 ns;
   h_count(4) <= '0' after 0 ns,
					  '1' after 1280 ns when h_count(4) /= '1' else '0' after 1280 ns;
   h_count(5) <= '0' after 0 ns,
					  '1' after 2560 ns when h_count(5) /= '1' else '0' after 2560 ns;
   h_count(6) <= '0' after 0 ns,
					  '1' after 5120 ns when h_count(6) /= '1' else '0' after 5120 ns;
   h_count(7) <= '0' after 0 ns,
					  '1' after 10240 ns when h_count(7) /= '1' else '0' after 10240 ns;
   h_count(8) <= '0' after 0 ns,
			  		  '1' after 40960 ns when h_count(8) /= '1' else '0' after 40960 ns;

   v_count(0) <= '0' after 0 ns,
					  '1' after 81920 ns when v_count(0) /= '1' else '0' after 81920 ns;
   v_count(1) <= '0' after 0 ns, 
				  	  '1' after 163840 ns when v_count(1) /= '1' else '0' after 163840 ns;
   v_count(2) <= '0' after 0 ns,
					  '1' after 327680 ns when v_count(2) /= '1' else '0' after 327680 ns;
   v_count(3) <= '0' after 0 ns,
				  	  '1' after 655360 ns when v_count(3) /= '1' else '0' after 655360 ns;
   v_count(4) <= '0' after 0 ns,
					  '1' after 1310720 ns when v_count(4) /= '1' else '0' after 1310720 ns;
   v_count(5) <= '0' after 0 ns,
					  '1' after 2621440 ns when v_count(5) /= '1' else '0' after 2621440 ns;
   v_count(6) <= '0' after 0 ns,
					  '1' after 5242880 ns when v_count(6) /= '1' else '0' after 5242880 ns;
   v_count(7) <= '0' after 0 ns,
					  '1' after 10485760 ns when v_count(7) /= '1' else '0' after 10485760 ns;
   v_count(8) <= '0' after 0 ns,
			  		  '1' after 20971520 ns when v_count(8) /= '1' else '0' after 20971520 ns;
	v_count(9) <= '0' after 0 ns,
			  		  '1' after 41943040 ns when v_count(9) /= '1' else '0' after 41943040 ns;
end behaviour;

