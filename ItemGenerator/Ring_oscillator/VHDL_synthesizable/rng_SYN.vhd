
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of rng is

  component ND2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component INVD4BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component CKND4BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component DFD1BWP7T
    port(CP, D : in std_logic; Q, QN : out std_logic);
  end component;

  signal UNCONNECTED, enable, n_1, ringout, s1 : std_logic;
  signal s2, s3, s4 : std_logic;

begin

  i1 : ND2D1BWP7T port map(A1 => ringout, A2 => enable, ZN => s1);
  i2 : INVD4BWP7T port map(I => s1, ZN => s2);
  i3 : INVD4BWP7T port map(I => s2, ZN => s3);
  i4 : INVD4BWP7T port map(I => s3, ZN => s4);
  i5 : INVD4BWP7T port map(I => s4, ZN => ringout);
  ireset : INVD4BWP7T port map(I => reset, ZN => enable);
  g3 : CKND4BWP7T port map(I => n_1, ZN => z);
  z_reg : DFD1BWP7T port map(CP => clk, D => ringout, Q => UNCONNECTED, QN => n_1);

end synthesised;
