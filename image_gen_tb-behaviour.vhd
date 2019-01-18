library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of image_gen_tb is
   component image_gen
      port(clk        : in  std_logic;
           reset      : in  std_logic;
           h_count    : in  std_logic_vector(8 downto 0);
           v_count    : in  std_logic_vector(9 downto 0);
           snake_x_loc  : in  std_logic_vector(9 downto 0);
           snake_y_loc  : in  std_logic_vector(9 downto 0);
           item_in    : in  std_logic_vector(11 downto 0);
           power_in   : in  std_logic_vector(11 downto 0);
           video_on   : in  std_logic;
   	pulse_60hz	: in 	std_logic;
   	flicker_in : in 	std_logic;
           red        : out std_logic;
           green      : out std_logic;
           blue       : out std_logic;
   	clr_flag		: out	std_logic);
   end component;
   signal clk        : std_logic;
   signal reset      : std_logic;
   signal h_count    : std_logic_vector(8 downto 0);
   signal v_count    : std_logic_vector(9 downto 0);
   signal snake_x_loc  : std_logic_vector(9 downto 0);
   signal snake_y_loc  : std_logic_vector(9 downto 0);
   signal item_in    : std_logic_vector(11 downto 0);
   signal power_in   : std_logic_vector(11 downto 0);
   signal video_on   : std_logic;
   signal pulse_60hz	: std_logic;
   signal flicker_in : std_logic;
   signal red        : std_logic;
   signal green      : std_logic;
   signal blue       : std_logic;
   signal clr_flag		: std_logic;
signal new_vcount, vcount : unsigned(9 downto 0);
signal new_hcount, hcount : unsigned(8 downto 0);
begin
test: image_gen port map (clk, reset, h_count, v_count, snake_x_loc, snake_y_loc, item_in, power_in, video_on, pulse_60hz, flicker_in, red, green, blue, clr_flag);
clk <= '1' after 0 ns,
    '0' after 40 ns when clk /= '0' else '1' after 40 ns;
   reset <= '1' after 0 ns, '0' after 80 ns;
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

	process(hcount, vcount)
	begin
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


   snake_x_loc <= "0011000001" after 300 ns, "0000000000";
   snake_y_loc <= "0000100001" after 300 ns;
	item_in <= "011100111000" after 120 ns, "000000000000" after 180 ns;
   power_in <= "000010000111" after 200 ns;
   video_on <= '0' after 0 ns, '1' after 100 ns;
   pulse_60hz <= '1' after 0 ns,
    '0' after 40 ns when clk /= '0' else '1' after 16.7 ms;
   flicker_in <= '1' after 200 ns;
end behaviour;

