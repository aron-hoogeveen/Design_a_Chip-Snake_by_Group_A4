library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of shift_register_tb is
   component shift_register
      port(clk    : in  std_logic;
           reset  : in  std_logic;
           enable : in  std_logic;
           D      : in  std_logic;
           Q      : out std_logic_vector(11 downto 0));
   end component;
   signal clk    : std_logic;
   signal reset  : std_logic;
   signal enable : std_logic;
   signal D      : std_logic;
   signal Q      : std_logic_vector(11 downto 0);
begin
test: shift_register port map (clk, reset, enable, D, Q);
   -- clock with clockperiod of 80 ns
   clk <= '1' after 0 ns,
          '0' after 40 ns when clk /= '0' else '1' after 40 ns;

   reset <= '1' after 0 ns,
            '0' after 160 ns,
            '1' after 1100 ns;

   -- disable the system for the first clock cycle to see if it works at the
   enable <= '0' after 0 ns,
             '1' after 80 ns,
             '0' after 1040 ns;

   D <= '1' after 0 ns,
        '0' after 80 ns when D /= '0' else '1' after 80 ns;
end behaviour;

