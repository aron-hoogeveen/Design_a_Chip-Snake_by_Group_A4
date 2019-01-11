library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of counter_fps_tb is
   component counter_fps
      port(clk   : in  std_logic;
           reset : in  std_logic;
           start : in  std_logic;
           fps   : in  std_logic;
           z_out : out std_logic);
   end component;
   signal clk   : std_logic;
   signal reset : std_logic;
   signal start : std_logic;
   signal fps   : std_logic;
   signal z_out : std_logic;
begin
test: counter_fps port map (clk, reset, start, fps, z_out);
-- clk <= '1' after 0 ns,
--      '0' after 100 ns when clk /= '0' else '1' after 100 ns;
   clk <= '1' after 0 ns,
          '0' after 40 ns when clk /= '0' else '1' after 40 ns;
   reset <= '1' after 0 ns,
            '0' after 80 ns;
   start <= '1' after 0 ns,
            '0' after 160 ns,
            '1' after 38640 ns,
            '0' after 38800 ns,
            '1' after 76780 ns,
            '0' after 76860 ns;
   fps <= '1' after 0 ns,
          '0' after 40 ns when fps /= '0' else '1' after 40 ns;
end behaviour;

