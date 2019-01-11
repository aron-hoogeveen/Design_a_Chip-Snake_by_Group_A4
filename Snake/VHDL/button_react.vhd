library IEEE;
use IEEE.std_logic_1164.ALL;

entity button_react is
   port(reset, clk			: in std_logic;
		head     			: in std_logic_vector(11 downto 0);	--Receives the old head coordinate from storage
		move				: in std_logic;						--Receives the move "clock" from speed submodule
		buttons				: in std_logic_vector(1 downto 0);	--Receives a 2 bit input from the player
		new_head_clr_flag	: in std_logic;						--Receives a clr_flag signal when the new_head has been processed
		corner_clr_flag		: in std_logic;						--Receives a clr_flag signal when the corner has been processed
		chc_clr_flag		: in std_logic;						--Receives a clr_flag signal when the new_head has been processed by the check collision component
		
		new_head			: out std_logic_vector(11 downto 0);--Sends the new coordinate of the head to the check collision module module and the storage module
		corner 				: out std_logic_vector(5 downto 0);	--Sends the new corner coordinate to the storage module
		corner_flag			: out std_logic;					--Sends a flag to the storage module so the module knows a new corner coordinate is ready
		new_head_flag		: out std_logic;					--Sends a flag to the storage module so the module knows a new head coordinate is ready
		chc_flag			: out std_logic);					--Sends a flag to the check collision module so the module knows a new head coordinate is ready
end button_react;
