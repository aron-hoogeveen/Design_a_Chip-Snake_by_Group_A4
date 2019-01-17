library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of rng is
component xor2
is
    port(a, b : in std_logic; z : out std_logic);
end component;

component ff
is
    port(d, clk, reset : in std_logic; q : out std_logic);
end component;

component or2 is
    port(a, b : in std_logic; z : out std_logic);
end component;

    signal s0, s1, s2, s3, s4, s5: std_logic;
begin
    --i1 : ff port map(d => s0, clk => clk, reset => reset, q => s1);
    process (clk) 
    begin
	if(rising_edge(clk)) then
		if(reset = '1') then
			s1 <= s0;
		else
			s1 <= s0;			
		end if;
	end if;
    end process;

    sigxor2 : xor2 port map(a => s1, b => z, z => s2);
    i2 : ff port map(d => s2, clk => clk, reset => reset, q => s3);
    i3 : ff port map(d => s3, clk => clk, reset => reset, q => z);
    i6 : or2 port map(a => reset, b => z, z => s0);
end behaviour;


