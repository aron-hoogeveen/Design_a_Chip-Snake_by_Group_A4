library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of snake_image_tb is
   component snake_image
      port(clk        : in  std_logic;
           reset      : in  std_logic;
           video_on   : in  std_logic;
		  	  draw_flag		: in std_logic;
           loc_xL 				: in  std_logic_vector(4 downto 0);
   		  	  loc_xH 				: in  std_logic_vector(4 downto 0);
           loc_yL 				: in  std_logic_vector(4 downto 0);
   		     loc_yH 				: in  std_logic_vector(4 downto 0);
           h_count    : in  std_logic_vector(8 downto 0);
           v_count    : in  std_logic_vector(9 downto 0);
           snake      : out std_logic;
   		  	  clr_flag   : out std_logic);
   end component;
   signal clk        : std_logic;
   signal reset      : std_logic;
   signal video_on   : std_logic;
	signal draw_flag		: std_logic;
   signal loc_xL 				: std_logic_vector(4 downto 0);
   signal loc_xH 				: std_logic_vector(4 downto 0);
   signal loc_yL 				: std_logic_vector(4 downto 0);
   signal loc_yH 				: std_logic_vector(4 downto 0);
   signal h_count    : std_logic_vector(8 downto 0);
   signal v_count    : std_logic_vector(9 downto 0);
   signal snake      : std_logic;
   signal clr_flag   : std_logic;
	signal hcount, new_hcount:  unsigned(8 downto 0);
	signal vcount, new_vcount:  unsigned(9 downto 0);

begin
test: snake_image port map (clk, reset, video_on, draw_flag,loc_xL, loc_xH, loc_yL, loc_yH, h_count, v_count, snake, clr_flag);
   clk <=	'1' after 0 ns,
			 '0' after 40 ns when clk /= '0' else '1' after 40 ns;
   reset <=	'1' after 0 ns,
				'0' after 80 ns;
   video_on <= '1' after 0 ns;
	draw_flag <= '1'  after 80 ns;

   loc_xL <= "01110" after 0 ms; 
	loc_xH <= "01110" after 0 ms;
	loc_yL <= "10000" after 0 ms;
   loc_yH <= "10010" after 0 ms;

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

