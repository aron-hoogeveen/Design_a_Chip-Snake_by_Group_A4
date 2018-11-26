library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of shift_register_tb is
   component shift_register
      port(clk    : in  std_logic;
           enable : in  std_logic;
           D      : in  std_logic;
           Q      : out std_logic_vector(11 downto 0));
   end component;
   signal clk    : std_logic;
   signal enable : std_logic;
   signal D      : std_logic;
   signal Q      : std_logic_vector(11 downto 0);
begin
test: shift_register port map (clk, enable, D, Q);
   clk <= '0' after 0 ns,
          '1' after 10 ns when clk /= '1' else '0' after 10 ns;
   enable <= '0' after 0 ns,
             '1' after 20 ns,
             '0' after 140 ns;
   D <= '0' after 0 ns,
        '1' after 20 ns when D /= '1' else '0' after 20 ns;
end behaviour;

