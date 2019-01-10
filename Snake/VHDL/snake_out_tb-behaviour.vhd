library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of snake_out_tb is
   component snake_out
      port(reset, clk		 : in	 std_logic;
   	flag_coc     : in  std_logic;
           corner1      : in  std_logic_vector(9 downto 0);
           corner2      : in  std_logic_vector(9 downto 0);
           clr_flag_g   : in  std_logic;
           clr_flag_chc : in  std_logic;
		   tail			: in  std_logic;
   
           clr_flag_coc : out std_logic;
           x_bounds     : out std_logic_vector(9 downto 0);
           y_bounds     : out std_logic_vector(9 downto 0);
           flag_g       : out std_logic;
           flag_chc     : out std_logic;
		   tail_out		: out std_logic);
   end component;
   signal reset, clk		 : std_logic;
   signal flag_coc     : std_logic;
   signal corner1      : std_logic_vector(9 downto 0);
   signal corner2      : std_logic_vector(9 downto 0);
   signal clr_flag_g   : std_logic;
   signal clr_flag_chc : std_logic;
   signal clr_flag_coc : std_logic;
   signal x_bounds     : std_logic_vector(9 downto 0);
   signal y_bounds     : std_logic_vector(9 downto 0);
   signal flag_g       : std_logic;
   signal flag_chc     : std_logic;
   signal tail		   : std_logic;
   signal tail_out	   : std_logic;
begin
test: snake_out port map (reset, clk, flag_coc, corner1, corner2, clr_flag_g, clr_flag_chc, tail, clr_flag_coc, x_bounds, y_bounds, flag_g, flag_chc, tail_out);
   clk <= '1' after 0 ns,
        '0' after 40 ns when clk /= '0' else '1' after 40 ns;
   reset <= 			'1' after 0 ns,
	    		'0' after 100 ns;
   flag_coc <= 			'0' after 0 ns,
			'1' after 300 ns,
			'0' after 500 ns,
			'1' after 1280 ns,
			'0' after 1400 ns;
------------------------------------------
	tail <=			'0' after 0 ns,
					'1' after 1280 ns,
					'0' after 1400 ns;
------------------------------------------
   corner1(0) <= '0' after 0 ns;
   corner1(1) <= '0' after 0 ns;
   corner1(2) <= 			'0' after 0 ns,
			'1' after 300 ns,
			'0' after 1200 ns;
   corner1(3) <= '0' after 0 ns,
			'1' after 1200 ns;
   corner1(4) <= '1' after 0 ns;
------------------------------------------
   corner1(5) <= '0' after 0 ns,
			'1' after 1200 ns;
   corner1(6) <= '1' after 0 ns,
			'0' after 1200 ns;
   corner1(7) <= '1' after 0 ns,
			'0' after 1200 ns;
   corner1(8) <= '0' after 0 ns,
			'1' after 1200 ns;
   corner1(9) <= '0' after 0 ns;
------------------------------------------
------------------------------------------
   corner2(0) <= '0' after 0 ns;
   corner2(1) <= '0' after 0 ns,
			'1' after 1200 ns;
   corner2(2) <= '1' after 0 ns,
			'0' after 1200 ns;
   corner2(3) <= '0' after 0 ns;
   corner2(4) <= '1' after 0 ns,
			'0' after 1200 ns;
------------------------------------------
   corner2(5) <= '0' after 0 ns,
			'1' after 1200 ns;
   corner2(6) <= '0' after 0 ns;
   corner2(7) <= '0' after 0 ns;
   corner2(8) <= '1' after 0 ns;
   corner2(9) <= '1' after 0 ns,
			'0' after 1200 ns;
------------------------------------------
   clr_flag_g <= 			'0' after 0 ns,
			'1' after 1000 ns,
			'0' after 1080 ns,
			'1' after 1580 ns,
			'0' after 1660 ns;
   clr_flag_chc <= 			'0' after 0 ns,
			'1' after 700 ns,
			'0' after 780 ns,
			'1' after 1600 ns,
			'0' after 1800 ns;
end behaviour;

