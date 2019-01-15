library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of button_react_tb is
   component button_react
      port(reset, clk			: in std_logic;
   		head     			: in std_logic_vector(11 downto 0);
   		move				: in std_logic;
   		buttons				: in std_logic_vector(1 downto 0);
   		new_head_clr_flag	: in std_logic;
   		corner_clr_flag		: in std_logic;
   
   		chc_clr_flag		: in std_logic;
   		inversion		: in std_logic;
   		head_ok		: in std_logic;
   		
   		new_head			: out std_logic_vector(11 downto 0);
   		corner 				: out std_logic_vector(5 downto 0);
   		corner_flag			: out std_logic;
   		new_head_flag		: out std_logic;
   		chc_flag			: out std_logic);
   end component;
   signal reset, clk			: std_logic;
   signal head     			: std_logic_vector(11 downto 0);
   signal move				: std_logic;
   signal buttons				: std_logic_vector(1 downto 0);
   signal new_head_clr_flag	: std_logic;
   signal corner_clr_flag		: std_logic;
   signal chc_clr_flag		: std_logic;
   signal inversion		: std_logic;
   signal head_ok		: std_logic;
   signal new_head			: std_logic_vector(11 downto 0);
   signal corner 				: std_logic_vector(5 downto 0);
   signal corner_flag			: std_logic;
   signal new_head_flag		: std_logic;
   signal chc_flag			: std_logic;
begin
test: button_react port map (reset, clk, head, move, buttons, new_head_clr_flag, corner_clr_flag, chc_clr_flag, inversion, head_ok, new_head, corner, corner_flag, new_head_flag, chc_flag);
 clk <= '1' after 0 ns,
      '0' after 40 ns when clk /= '0' else '1' after 40 ns;
   reset <= '1' after 0 ns,
	    '0' after 100 ns;
   move <= '1' after 0 ns,
          '0' after 1000 ns when move /= '0' else '1' after 1000 ns;
   head(0) <= '0' after 0 ns;
   head(1) <= '0' after 0 ns;
   head(2) <= '0' after 0 ns;
   head(3) <= '0' after 0 ns;
   head(4) <= '0' after 0 ns;
   head(5) <= '0' after 0 ns;
   head(6) <= '0' after 0 ns;
   head(7) <= '0' after 0 ns,
		'1' after 3900 ns,
		'0' after 5900 ns;
   head(8) <= '0' after 0 ns,
		'1' after 5900 ns;
   head(9) <= '0' after 0 ns;
   head(10) <= '0' after 0 ns;
   head(11) <= '0' after 0 ns;
   buttons(0) <= '0' after 0 ns;
   buttons(1) <= '0' after 0 ns;
   new_head_clr_flag <= '0' after 0 ns,
			'1' after 2500 ns,
			'0' after 2600 ns;
   corner_clr_flag <= '0' after 0 ns;
   chc_clr_flag <= '0' after 0 ns,
		'1' after 2250 ns,
		'0' after 2350 ns,
		'1' after 4250 ns,
		'0' after 4350 ns;
   inversion <= '0' after 0 ns;
   head_ok <= '0' after 0 ns,
		'1' after 2250 ns,
		'0' after 2350 ns;
end behaviour;

