
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of counter4 is

  component IND2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component CKXOR2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component NR2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component ND2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component XNR2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component INVD4BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component DFKCND0BWP7T
    port(CP, CN, D : in std_logic; Q, QN : out std_logic);
  end component;

  signal n_0, n_1, n_3, n_5, n_7 : std_logic;
  signal n_12, n_13, n_14, n_17, n_23 : std_logic;
  signal n_29, n_35, tmp_0_35, tmp_1_36, tmp_2_37 : std_logic;
  signal tmp_3_38 : std_logic;

begin

  g370 : IND2D1BWP7T port map(A1 => n_3, B1 => z_out(2), ZN => n_5);
  g373 : IND2D1BWP7T port map(A1 => n_1, B1 => z_out(1), ZN => n_3);
  g374 : CKXOR2D1BWP7T port map(A1 => enable, A2 => z_out(0), Z => n_0);
  g375 : NR2D1BWP7T port map(A1 => manual_reset, A2 => reset, ZN => n_7);
  g376 : ND2D1BWP7T port map(A1 => tmp_0_35, A2 => enable, ZN => n_1);
  g2 : XNR2D1BWP7T port map(A1 => n_5, A2 => tmp_3_38, ZN => n_12);
  g381 : XNR2D1BWP7T port map(A1 => n_3, A2 => tmp_2_37, ZN => n_13);
  g382 : XNR2D1BWP7T port map(A1 => n_1, A2 => tmp_1_36, ZN => n_14);
  drc_bufs383 : INVD4BWP7T port map(I => n_17, ZN => z_out(1));
  drc_bufs389 : INVD4BWP7T port map(I => n_23, ZN => z_out(2));
  drc_bufs395 : INVD4BWP7T port map(I => n_29, ZN => z_out(0));
  drc_bufs401 : INVD4BWP7T port map(I => n_35, ZN => z_out(3));
  tmp_reg_1 : DFKCND0BWP7T port map(CP => clk, CN => n_7, D => n_14, Q => tmp_1_36, QN => n_17);
  tmp_reg_2 : DFKCND0BWP7T port map(CP => clk, CN => n_7, D => n_13, Q => tmp_2_37, QN => n_23);
  tmp_reg_0 : DFKCND0BWP7T port map(CP => clk, CN => n_7, D => n_0, Q => tmp_0_35, QN => n_29);
  tmp_reg_3 : DFKCND0BWP7T port map(CP => clk, CN => n_7, D => n_12, Q => tmp_3_38, QN => n_35);

end synthesised;
