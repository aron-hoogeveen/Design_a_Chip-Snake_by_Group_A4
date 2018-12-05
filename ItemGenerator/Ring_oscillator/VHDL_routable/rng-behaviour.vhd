library IEEE;
use IEEE.std_logic_1164.ALL;

entity rng is
   port(clk : in  std_logic;
        reset : in std_logic;
        z   : out std_logic);
end rng;

library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of rng is
  component INVD4BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;
  component ND2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;
  signal s1, s2, s3, s4, enable : std_logic;
begin
  ireset : INVD4BWP7T port map(I => reset, ZN => enable);
  i1 : ND2D1BWP7T port map(A1 => z, A2 => enable, ZN => s1);
  i2 : INVD4BWP7T port map(I => s1, ZN => s2);
  i3 : INVD4BWP7T port map(I => s2, ZN => s3);
  i4 : INVD4BWP7T port map(I => s3, ZN => s4);
  i5 : INVD4BWP7T port map(I => s4, ZN => z);
end behaviour;
