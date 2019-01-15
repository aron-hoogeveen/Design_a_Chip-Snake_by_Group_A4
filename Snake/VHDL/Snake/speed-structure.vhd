library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture structure of speed is
component length is
   port(reset          : in  std_logic;
        clk            : in  std_logic;
        collision_food : in  std_logic_vector(1 downto 0);
        len            : out std_logic_vector(5 downto 0));
end component;

component pulse_speed is
   port(length : in  std_logic_vector(5 downto 0);
        clk    : in  std_logic;
        speed  : out std_logic;
	reset  : in  std_logic);
end component;

--signals to connect the two blocks

signal len_sig : std_logic_vector(5 downto 0); 

begin
comp_length: length
	port map(reset 			=> reset,
		 clk   		=> clk,
		 collision_food => collision_food,
		 len 		=> len_sig);

comp_speed: pulse_speed
	port map(length 			=> len_sig,
		 clk 		=> clk,
		 speed 		=> move,
		 reset 		=> reset);
		 
length_out <= len_sig;				--signal tap to output

end structure;

