library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structural of input_top is

component input_buffer is
	port(clk     : in  std_logic;
        reset   : in  std_logic;
        direct_input   : in  std_logic_vector(3 downto 0);
        input_buf : out std_logic_vector(3 downto 0));
end component input_buffer;

component processed_in is
	port(clk          : in  std_logic;
        reset        : in  std_logic;
        buffed_input : in  std_logic_vector(3 downto 0);
        buttons      : out std_logic_vector(1 downto 0));
end component;

signal s : std_logic_vector(3 downto 0);

begin

buffer1: input_buffer port map(clk => clk,
				reset => reset,
				direct_input => direct_input,
				input_buf => s);

processor1: processed_in port map(clk => clk,
				reset => reset,
				buffed_input => s,
				buttons => buttons);

end structural;

