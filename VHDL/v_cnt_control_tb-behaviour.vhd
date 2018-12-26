library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of v_cnt_control_tb is
   component v_cnt_control
      port(clk           : in  std_logic;
           reset         : in  std_logic;
   			  h_count	      : in 	std_logic_vector(8 downto 0);
           v_count       : in  std_logic_vector(9 downto 0);
           v_sync        : out std_logic;
           v_count_reset : out std_logic;
           v_video_on    : out std_logic);
   end component;
   signal clk           : std_logic;
   signal reset         : std_logic;
   signal h_count	      : std_logic_vector(8 downto 0);
   signal v_count       : std_logic_vector(9 downto 0);
   signal v_sync        : std_logic;
   signal v_count_reset : std_logic;
   signal v_video_on    : std_logic;
	signal hcount, new_hcount:  unsigned(8 downto 0);
	signal vcount, new_vcount:  unsigned(9 downto 0);
begin
test: v_cnt_control port map (clk, reset, h_count, v_count, v_sync, v_count_reset, v_video_on);
   clk <=	'1' after 0 ns,
			 '0' after 40 ns when clk /= '0' else '1' after 40 ns;
   reset <=	'1' after 0 ns,
				'0' after 80 ns;

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

	process(hcount, v_count_reset)begin
		if(hcount = 399) then
			new_hcount <= (others => '0');
			if(v_count_reset = '1') then
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

