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
   signal new_head			: std_logic_vector(11 downto 0);
   signal corner 				: std_logic_vector(5 downto 0);
   signal corner_flag			: std_logic;
   signal new_head_flag		: std_logic;
   signal chc_flag			: std_logic;
begin
test: button_react port map (reset, clk, head, move, buttons, new_head_clr_flag, corner_clr_flag, chc_clr_flag, new_head, corner, corner_flag, new_head_flag, chc_flag);
   clk <= '1' after 0 ns,
          '0' after 40 ns when clk /= '0' else '1' after 40 ns;
   reset <= '1' after 0 ns,
		'0' after 200 ns;
   head(0) <= '0' after 0 ns,
		'1' after 5500 ns;
   head(1) <= '0' after 0 ns;
   head(2) <= '0' after 0 ns,
		'1' after 5500 ns,
		'0' after 7500 ns,
		'1' after 9500 ns;
   head(3) <= '0' after 0 ns,
		'1' after 7500 ns;
   head(4) <= '0' after 0 ns;
   head(5) <= '0' after 0 ns;
   head(6) <= '0' after 0 ns;
   head(7) <= '0' after 0 ns,
		'1' after 3500 ns;
   head(8) <= '0' after 0 ns;
   head(9) <= '0' after 0 ns;
   head(10) <= '0' after 0 ns;
   head(11) <= '0' after 0 ns;
   move <= '1' after 0 ns,
          '0' after 1000 ns when move /= '0' else '1' after 1000 ns;
   buttons(0) <= '0' after 0 ns,
		 '1' after 3500 ns;
   buttons(1) <= '0' after 0 ns,
		'1' after 9500 ns;
   new_head_clr_flag <= '0' after 0 ns,
			'1' after 5500 ns,
			'0' after 5750 ns;
   corner_clr_flag <= '0' after 0 ns,
			'1' after 5500 ns,
			'0' after 5750 ns;
   chc_clr_flag <= '0' after 0 ns,
			'1' after 5500 ns,
			'0' after 5750 ns;
end behaviour;

