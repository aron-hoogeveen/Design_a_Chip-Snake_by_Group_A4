library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of v_cnt_control is
-- declaration of the FSM' states
type v_control_state is (reset_state, display_state, porch_state, sync_state, counter_reset_state);

signal state, next_state: v_control_state;
signal TV : unsigned(9 downto 0); 
signal TH : unsigned(8 downto 0); 
-- T : converts the count value to an unsigned std_logic vector
-- TH: converts the h_count value to an unsigned std_logic vector

constant VD		: unsigned(9 downto 0):= to_unsigned(479, 10); 
constant VBP : unsigned(9 downto 0):= to_unsigned(508, 10); 
constant VS		: unsigned(9 downto 0):= to_unsigned(510, 10); 
constant VFP	: unsigned(9 downto 0):= to_unsigned(520, 10); 
constant HS1	: unsigned(8 downto 0):= to_unsigned(362, 9); 
constant HS2	: unsigned(8 downto 0):= to_unsigned(398, 9); 
-- VD : dispaly time
-- VBP: vertical back porch
-- VS : vertical sync pulse
-- VFP: vertical front porch
-- HS1: 40 clock cycles after h_sync went law - 1 clock cycle (to eliminate the delay)
-- HS2: 40 clock cycles after h_sync went law - 2 clock cycles (to eliminate the delay)


begin

	TH <= unsigned(h_count);
	TV  <= unsigned(v_count);

	-- process that defines the FSM
	process(state, TV, TH)
	begin
		case state is
			when reset_state => 
				v_sync	<= '0';
				v_count_reset	<= '1';
				v_video_on	<= '0';
					next_state <= display_state;
 
			when display_state => 
				v_sync	<= '1';
				v_count_reset	<= '0';
				v_video_on	<= '1';
				if((TV = VD) and (TH = HS1)) then
					next_state <= porch_state;
				else
					next_state <= display_state;
				end if;

			when porch_state => 
				v_sync	<= '1';
				v_count_reset	<= '0';
				v_video_on	<= '0';
				if((TV = VBP) and (TH = HS1)) then
					next_state <= sync_state;
				elsif((TV = VFP) and (TH = HS2)) then
				--elsif(TV = VFP) then
					next_state <= counter_reset_state; 
				else 
					next_state <= porch_state;
				end if;			

			when sync_state => 
				v_sync	<= '0';
				v_count_reset	<= '0';
				v_video_on	<= '0';
				if((TV = VS) and (TH = HS1)) then
					next_state <= porch_state;
				else
					next_state <= sync_state;
				end if;

			when counter_reset_state => 
				v_sync	<= '1';
				v_count_reset <= '1';
				v_video_on	<= '0';
				next_state <= display_state;

			when others =>
				v_sync	<= '0';
				v_count_reset	<= '1';
				v_video_on	<= '0';
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
