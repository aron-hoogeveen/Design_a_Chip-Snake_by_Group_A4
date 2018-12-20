library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of h_cnt_control is
-- declaration of the FSM' states
type h_control_state is (reset_state, display_state, porch_state, sync_state, counter_reset_state);

signal state, next_state: h_control_state;
signal TH: unsigned(8 downto 0);
-- T converts the count value to an unsigned std_logic vector

constant HD  : unsigned(8 downto 0):= to_unsigned(318, 9);
constant HBP : unsigned(8 downto 0):= to_unsigned(342, 9); 
constant HS  :	unsigned(8 downto 0):= to_unsigned(390, 9); 
constant HFP : unsigned(8 downto 0):= to_unsigned(398, 9); 
constant VEN : unsigned(8 downto 0):= to_unsigned(362, 9); 

-- HD : dispaly time
-- HBP: horizontal back porch
-- HS : horizontal sync pulse
-- HBP: horizontal back porch
-- VEN: enables the vertical counter to be incremented by 1
--		  20 clock cyles after one horizontal line is completed
begin

   TH <= unsigned(h_count);
	
	-- process that defines the FSM
	process(state, TH)
	begin
		case state is
			when reset_state => 
				h_sync	<= '0';
				h_count_reset	<= '1';
				h_video_on	<= '0';
					next_state <= display_state;
 
			when display_state => 
				h_sync	<= '1';
				h_count_reset	<= '0';
				h_video_on	<= '1';
				if(TH = HD) then
					next_state <= porch_state;
				else
					next_state <= display_state;
				end if;

			when porch_state => 
				h_sync	<= '1';
				h_count_reset	<= '0';
				h_video_on	<= '0';
							if(TH = HBP) then
					next_state <= sync_state;
				elsif(TH = HFP) then
					next_state <= counter_reset_state; 
				else 
					next_state <= porch_state;
				end if;			

			when sync_state => 
				h_sync	<= '0';
				h_count_reset	<= '0';
				h_video_on	<= '0';
				if(TH = HS) then
					next_state <= porch_state;
				else
					next_state <= sync_state;
				end if;

			when counter_reset_state => 
				h_sync	<= '1';
				h_count_reset	<= '1';
				h_video_on	<= '0';
					next_state <= display_state;

			when others =>				
				h_sync	<= '0';
				h_count_reset	<= '1';
				h_video_on	<= '0';
					next_state <= display_state;
		end case;
	end process;

	-- process that switches between states
	process(clk)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				state <= reset_state;
			else 
				state <= next_state;
			end if;
		end if;
	end process;
end behaviour;
