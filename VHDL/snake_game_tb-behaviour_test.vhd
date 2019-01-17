library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour_test of snake_game_tb is
   component snake_game
      port(clk          : in  std_logic;
           reset        : in  std_logic;
   		  button_input : in std_logic_vector (3 downto 0);
           h_sync       : out std_logic;
           v_sync       : out std_logic;
           red          : out std_logic;
           green        : out std_logic;
           blue         : out std_logic);
   end component;
   signal clk          : std_logic;
   signal reset        : std_logic;
   signal button_input : std_logic_vector (3 downto 0);
   signal h_sync       : std_logic;
   signal v_sync       : std_logic;
   signal red          : std_logic;
   signal green        : std_logic;
   signal blue         : std_logic;
begin
test: snake_game port map (clk, reset, button_input, h_sync, v_sync, red, green, blue);
 clk <= '1' after 0 ns,
      '0' after 80 ns when clk /= '0' else '1' after 80 ns;
   reset <= '1' after 0 ns,
	    '0' after 160 ns;
   button_input(0) <= '0' after 0 ns;
   button_input(1) <= '0' after 0 ns;
   button_input(2) <= '0' after 0 ns;
   button_input(3) <= '0' after 0 ns,
			'1' after 400 ns,
			'0' after 500 ms;
end behaviour_test;

