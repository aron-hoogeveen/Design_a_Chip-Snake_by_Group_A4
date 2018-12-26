library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of image_gen_tb is
   component image_gen
      port(clk       : in  std_logic;
           reset     : in  std_logic;
           h_count   : in  std_logic_vector(8 downto 0);
           v_count   : in  std_logic_vector(9 downto 0);
           snake_x_l : in  std_logic_vector(4 downto 0);
           snake_x_h : in  std_logic_vector(4 downto 0);
           snake_y_l : in  std_logic_vector(4 downto 0);
           snake_y_h : in  std_logic_vector(4 downto 0);
           item_x    : in  std_logic_vector(4 downto 0);
           item_y    : in  std_logic_vector(4 downto 0);
           video_on  : in  std_logic;
           red       : out std_logic;
           green     : out std_logic;
           blue      : out std_logic;
   		  	  flag				: out	std_logic);
   end component;
   signal clk       : std_logic;
   signal reset     : std_logic;
   signal h_count   : std_logic_vector(8 downto 0);
   signal v_count   : std_logic_vector(9 downto 0);
   signal snake_x_l : std_logic_vector(4 downto 0);
   signal snake_x_h : std_logic_vector(4 downto 0);
   signal snake_y_l : std_logic_vector(4 downto 0);
   signal snake_y_h : std_logic_vector(4 downto 0);
   signal item_x    : std_logic_vector(4 downto 0);
   signal item_y    : std_logic_vector(4 downto 0);
   signal video_on  : std_logic;
   signal red       : std_logic;
   signal green     : std_logic;
   signal blue      : std_logic;
   signal flag				: std_logic;
	signal hcount, new_hcount:  unsigned(8 downto 0);
	signal vcount, new_vcount:  unsigned(9 downto 0);
begin
test: image_gen port map (clk, reset, h_count, v_count, snake_x_l, snake_x_h, snake_y_l, snake_y_h, item_x, item_y, video_on, red, green, blue, flag);

	clk <=	'1' after 0 ns,
			 '0' after 40 ns when clk /= '0' else '1' after 40 ns;
   reset <= '1' after 0 ns,
				'0' after 160 ns;
   video_on <= '1' after 0 ns,
					'0' after 15 ms,
					'1' after 17 ms;
   snake_x_l <= "01110" after 0 ms,
				 	 "00111" after 10 ms; 
	snake_x_h <= "01110" after 0 ms,
				 	 "01111" after 10 ms;
	snake_y_l <= "10000" after 0 ms,
				 	 "00011" after 10 ms;
   snake_y_h <= "10010" after 0 ms,
				 	 "00110" after 10 ms;
	item_x <= "00100" after 0 ns,
				 "10111" after 9 ms,
 				 "00111" after 10 ms,
				 "10100" after 20 ms,
				 "01111" after 30 ms;
	
	item_y <= "00011" after 0 ns,
				 "00110" after 9 ms,
				 "00011" after 10 ms,
				 "00101" after 20 ms,
				 "10100" after 30 ms;

	process(clk) begin
		if(clk = '1' and clk'event) then
			if(reset = '1') then
				hcount <= (others => '0');
				vcount <= (others => '0');
			else
				hcount <= new_hcount;
				vcount <= new_vcount;
			end if;
		end if;	
	end process;

	process(hcount,vcount)begin
		if(hcount = 399) then
			new_hcount <= (others => '0');
			if(vcount = 524) then
				new_vcount <= (others => '0');
			else
				new_vcount <= vcount + 1;
			end if;
		else
			new_hcount <= hcount + 1;
			new_vcount <= vcount;
		end if;
	end process;
	
	h_count <= std_logic_vector(hcount);
	v_count <= std_logic_vector(vcount);

end behaviour;

