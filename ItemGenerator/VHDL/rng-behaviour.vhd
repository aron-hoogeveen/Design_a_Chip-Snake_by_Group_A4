library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of rng is
	component xor2 is
		port(a, b: in std_logic; z: out std_logic);
	end component;
	component inverter is
		port(a: in std_logic; z: out std_logic);
	end component;
	component mux is
		port(a, b, x: in std_logic; z: out std_logic);
	end component;
signal s1 : std_logic := '1';
signal s2 : std_logic := '1';
signal s3, s4, i1, i2, i3, i4, i5, i6, i7, i8, ring_out, init: std_logic;
begin
	inv9: inverter port map (reset, init);

	inv1: inverter port map (s3, i1);
	inv2: inverter port map (i1, i2);
	inv3: inverter port map (i2, s1);

	inv4: inverter port map (s4, i4);
	inv5: inverter port map (i4, i5);
	inv6: inverter port map (i5, i6);
	inv7: inverter port map (i6, i7);
	inv8: inverter port map (i7, s2);

	mux1: mux port map (init, s1, init, s3);

	mux2: mux port map (init, s2, init, s4);

	lblxor: xor2 port map (s3, s4, ring_out);

	process(clk)
	begin
		if(clk = '1') then
			z <= ring_out;
		end if;
	end process;
end behaviour;

