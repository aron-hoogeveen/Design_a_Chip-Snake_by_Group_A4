library IEEE;
use IEEE.std_logic_1164.ALL;
USE ieee.numeric_std.ALL; 

architecture behaviour_storage_test of storage is

	type S_memory is array (0 to 24) of std_logic_vector(5 downto 0);
	signal S_S : S_memory; 
	
	type I_memory is array (0 to 1) of std_logic_vector(11 downto 0);
	signal I_S : I_memory;
	


	type storage_change_states is ( reset_state,
					idle,
					replace_head,
					clear_head_state,
					corner_counter_up,
					add_new_corner,
					clear_corner_state,
					replace_food,
					replace_power_up,
					remove_power_up,
					new_item_clear_state,
					remove_item_clear_state,
					load_tail,
					check_tail,
					replace_tail,
					remove_tail,
					clear_tail_state,
               				        state_1,
                    					state_2,
                    					state_3,
                    					state_wait,
                   					state_wait1,
                    					state_wait2,
                    					state_wait3,
					tail_check1,
					tail_check2,
					tail_check3
					);

signal state, new_state : storage_change_states;
signal new_tail_input, tail_input : std_logic_vector (5 downto 0);
signal corner_count, new_corner_count : std_logic_vector(4 downto 0);
signal tail_check, new_tail_check : std_logic_vector (5 downto 0);
signal N, new_N : std_logic_vector (4 downto 0);
signal corner_check, new_corner_check : std_logic_vector (5 downto 0);
signal H_s, new_H_s: std_logic_vector(11 downto 0);
signal new_send_tail, send_tail : std_logic;
signal new_T, T : std_logic_vector(4 downto 0);
signal new_S_S0, new_S_S1, new_S_S2, new_S_S3, new_S_S4, new_S_S5, new_S_S6, new_S_S7, new_S_S8, new_S_S9, new_S_S10, new_S_S11, new_S_S12, new_S_S13, new_S_S14, new_S_S15, new_S_S16, new_S_S17, new_S_S18, new_S_S19, new_S_S20, new_S_S21, new_S_S22, new_S_S23, new_S_S24 : std_logic_vector (5 downto 0);
signal new_I_S0, new_I_S1 : std_logic_vector (11 downto 0);


begin
process (clk, reset)
	begin
		if (rising_edge (clk)) then
			if (reset = '1') then
				state <= reset_state;
			N	<= (others => '0');
			H_S	<= (others => '0');
			corner_count <= (others => '0');
			S_S(0)	<= (others => '0');
			S_S(1)	<= (others => '0');
			S_S(2)	<= (others => '0');
			S_S(3)	<= (others => '0');
			S_S(4)	<= (others => '0');
			S_S(5)	<= (others => '0');
			S_S(6)	<= (others => '0');
			S_S(7)	<= (others => '0');
			S_S(8)	<= (others => '0');
			S_S(9)	<= (others => '0');
			S_S(10)	<= (others => '0');
			S_S(11)	<= (others => '0');
			S_S(12)	<= (others => '0');
			S_S(13)	<= (others => '0');
			S_S(14)	<= (others => '0');
			S_S(15)	<= (others => '0');
			S_S(16)	<= (others => '0');
			S_S(17)	<= (others => '0');
			S_S(18)	<= (others => '0');
			S_S(19)	<= (others => '0');
			S_S(20)	<= (others => '0');
			S_S(21)	<= (others => '0');
			S_S(22)	<= (others => '0');
			S_S(23)	<= (others => '0');
			S_S(24)	<= (others => '0');
			send_tail <= '0';
			tail_check <= (others => '0');
			I_S(0) <= (others => '0');
			I_S(1) <= (others => '0');
			corner_check <= (others => '0');
			T <= (others => '0');
			tail_input <= (others => '0');
			else
			state <= new_state;
			N	<= new_N;
			H_S	<= new_H_S;
			corner_count <= new_corner_count;
			S_S(0)	<= new_S_S0;
			S_S(1)	<= new_S_S1;
			S_S(2)	<= new_S_S2;
			S_S(3)	<= new_S_S3;
			S_S(4)	<= new_S_S4;
			S_S(5)	<= new_S_S5;
			S_S(6)	<= new_S_S6;
			S_S(7)	<= new_S_S7;
			S_S(8)	<= new_S_S8;
			S_S(9)	<= new_S_S9;
			S_S(10)	<= new_S_s10;
			S_S(11)	<= new_S_s11;
			S_S(12)	<= new_S_S12;
			S_S(13)	<= new_S_S13;
			S_S(14)	<= new_S_S14;
			S_S(15)	<= new_S_S15;
			S_S(16)	<= new_S_S16;
			S_S(17)	<= new_S_S17;
			S_S(18)	<= new_S_S18;
			S_S(19)	<= new_S_S19;
			S_S(20)	<= new_S_S20;
			S_S(21)	<= new_S_S21;
			S_S(22)	<= new_S_S22;
			S_S(23)	<= new_S_S23;
			S_S(24)	<= new_S_S24;
			send_tail <= new_send_tail;
			tail_check <= new_tail_check;
			I_S(0) <= new_I_S0;
			I_S(1) <= new_I_S1;
			corner_check <= new_corner_check;
			T <= new_T;
			tail_input <= new_tail_input;
			
			
			end if;
		end if;
end process;

process (new_head_flag, new_corner_flag, new_tail_flag, new_item_set, send_corner_flag, remove_power_up_flag, new_head, new_corner, new_tail, new_item, state, S_S(0), S_S(1), S_S(2), S_S(3), S_S(4), S_S(5), S_S(6), S_S(7), S_S(8), S_S(9), S_S(10), S_S(11), S_S(12), S_S(13), S_S(14), S_S(15), S_S(16), S_S(17), S_S(18), S_S(19), S_S(20), S_S(21), S_S(22), S_S(23), S_S(24), corner_check, tail_check, N, corner_count, H_S, I_S(1), I_S(0), send_tail, T)
	begin
		case state is
			when reset_state =>
				new_H_S 	<= "100100110001";
				new_I_S0 	<= "000000000000";
				new_I_S1 	<= "000000000000";
				
				
				
				head <= H_S;
				snake_list <= "00000000000000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				new_corner_count <= "00001";
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_power_up_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				new_n				<= "00001";
				new_send_tail				<= '0';
				new_tail_check				<= "000000";
				new_corner_check				<= "000000";
				new_T				<= (others => '0');
				new_tail_input				<= (others => '0');

				new_S_S0				<= "011110";
				new_S_S1				<= "000000";
				new_S_S2				<= "000000";
				new_S_S3				<= "000000";
				new_S_S4				<= "000000";
				new_S_S5				<= "000000";
				new_S_S6				<= "000000";
				new_S_S7				<= "000000";
				new_S_S8				<= "000000";
				new_S_S9				<= "000000";
				new_S_S10				<= "000000";
				new_S_S11				<= "000000";
				new_S_S12				<= "000000";
				new_S_S13				<= "000000";
				new_S_S14				<= "000000";
				new_S_S15				<= "000000";
				new_S_S16				<= "000000";
				new_S_S17				<= "000000";
				new_S_S18				<= "000000";
				new_S_S19				<= "000000";
				new_S_S20				<= "000000";
				new_S_S21				<= "000000";
				new_S_S22				<= "000000";
				new_S_S23				<= "000000";
				new_S_S24				<= "000000";
				
				
		

				new_state <= idle;

			when idle =>
				
				
				
				head <= H_S;
				new_H_s	<= H_s;
				snake_list <= "00000000000000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				new_I_S0 <= I_S(0);
				new_I_S1 <= I_S(1);
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_power_up_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				new_corner_count				<= corner_count;
				new_n				<= "00001";
				new_send_tail				<= '0';
				new_tail_check				<= "000000";
				new_corner_check				<= "000000";
				new_T				<= T;
				new_tail_input				<= (others => '0');


				
				
				new_S_S0				<= S_S(0);
				new_S_S1				<= S_S(1);
				new_S_S2				<= S_S(2);
				new_S_S3				<= S_S(3);
				new_S_S4				<= S_S(4);
				new_S_S5				<= S_S(5);
				new_S_S6				<= S_S(6);
				new_S_S7				<= S_S(7);
				new_S_S8				<= S_S(8);
				new_S_S9				<= S_S(9);
				new_S_S10				<= S_S(10);
				new_S_S11				<= S_S(11);
				new_S_S12				<= S_S(12);
				new_S_S13				<= S_S(13);
				new_S_S14				<= S_S(14);
				new_S_S15				<= S_S(15);
				new_S_S16				<= S_S(16);
				new_S_S17				<= S_S(17);
				new_S_S18				<= S_S(18);
				new_S_S19				<= S_S(19);
				new_S_S20				<= S_S(20);
				new_S_S21				<= S_S(21);
				new_S_S22				<= S_S(22);
				new_S_S23				<= S_S(23);
				new_S_S24				<= S_S(24);


			

		

				if (new_head_flag = '1') then
					new_state <= replace_head;
				elsif (new_corner_flag = '1') then
					new_state <= corner_counter_up;
				elsif (new_tail_flag = '1') then
					new_state <= load_tail;
				elsif (new_item_set = '1' AND new_item(1 downto 0) = "00") then
					new_state <= replace_food;
				elsif (new_item_set = '1' AND new_item(1 downto 0) /= "00") then
					new_state <= replace_power_up;
				elsif (new_item_set = '0' AND remove_power_up_flag = '1') then
					new_state <= remove_power_up;
				elsif	(send_corner_flag = '1') then
					new_state <= tail_check1;
				else
					new_state <= idle;
				end if;
			when replace_head =>
				
				
				
				new_H_S <= new_head;
				head <= H_S;
				snake_list <= "00000000000000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				new_I_S0 <= I_S(0);
				new_I_S1 <= I_S(1);
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_power_up_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				new_corner_count				<= corner_count;
				new_n				<= n;
				new_send_tail				<= '0';
				new_tail_check				<= "000000";
				new_corner_check				<= "000000";
				new_T				<= T;
				new_tail_input				<= (others => '0');


				
				new_S_S0				<= S_S(0);
				new_S_S1				<= S_S(1);
				new_S_S2				<= S_S(2);
				new_S_S3				<= S_S(3);
				new_S_S4				<= S_S(4);
				new_S_S5				<= S_S(5);
				new_S_S6				<= S_S(6);
				new_S_S7				<= S_S(7);
				new_S_S8				<= S_S(8);
				new_S_S9				<= S_S(9);
				new_S_S10				<= S_S(10);
				new_S_S11				<= S_S(11);
				new_S_S12				<= S_S(12);
				new_S_S13				<= S_S(13);
				new_S_S14				<= S_S(14);
				new_S_S15				<= S_S(15);
				new_S_S16				<= S_S(16);
				new_S_S17				<= S_S(17);
				new_S_S18				<= S_S(18);
				new_S_S19				<= S_S(19);
				new_S_S20				<= S_S(20);
				new_S_S21				<= S_S(21);
				new_S_S22				<= S_S(22);
				new_S_S23				<= S_S(23);
				new_S_S24				<= S_S(24);
		
		
				
				new_state <= clear_head_state;

			when clear_head_state =>
				
				
				
				head <= H_S;
				new_H_s	<= H_s;
				snake_list <= "00000000000000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				new_I_S0 <= I_S(0);
				new_I_S1 <= I_S(1);
				clear_head_flag 				<= '1';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_power_up_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				new_corner_count				<= corner_count;
				new_n				<= n;
				new_send_tail				<= '0';
				new_tail_check				<= "000000";
				new_corner_check				<= "000000";
				new_T				<= T;
				new_tail_input				<= (others => '0');


				
				new_S_S0				<= S_S(0);
				new_S_S1				<= S_S(1);
				new_S_S2				<= S_S(2);
				new_S_S3				<= S_S(3);
				new_S_S4				<= S_S(4);
				new_S_S5				<= S_S(5);
				new_S_S6				<= S_S(6);
				new_S_S7				<= S_S(7);
				new_S_S8				<= S_S(8);
				new_S_S9				<= S_S(9);
				new_S_S10				<= S_S(10);
				new_S_S11				<= S_S(11);
				new_S_S12				<= S_S(12);
				new_S_S13				<= S_S(13);
				new_S_S14				<= S_S(14);
				new_S_S15				<= S_S(15);
				new_S_S16				<= S_S(16);
				new_S_S17				<= S_S(17);
				new_S_S18				<= S_S(18);
				new_S_S19				<= S_S(19);
				new_S_S20				<= S_S(20);
				new_S_S21				<= S_S(21);
				new_S_S22				<= S_S(22);
				new_S_S23				<= S_S(23);
				new_S_S24				<= S_S(24);


				new_state <= idle;

			when corner_counter_up =>
				new_corner_count <= std_logic_vector( unsigned(corner_count) + 1 );
				
				
				
				head <= H_S;
				new_H_s	<= H_s;
				snake_list <= "00000000000000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				new_I_S0 <= I_S(0);
				new_I_S1 <= I_S(1);
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_power_up_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				new_n				<= n;
				new_send_tail				<= '0';
				new_tail_check				<= "000000";
				new_corner_check				<= "000000";
				new_T				<= T;
				new_tail_input				<= (others => '0');


				
				new_S_S0	<= "000000";
				new_S_S1	<= S_S(0);
				new_S_S2 <= S_S(1);
				new_S_S3 <= S_S(2);
				new_S_S4	<= S_S(3);
				new_S_S5 <= S_S(4);
				new_S_S6 <= S_S(5);
				new_S_S7	<= S_S(6);
				new_S_S8 <= S_S(7);
				new_S_S9 <= S_S(8);
				new_S_S10	<= S_S(9);
				new_S_S11 <= S_S(10);
				new_S_S12 <= S_S(11);
				new_S_S13	<= S_S(12);
				new_S_S14 <= S_S(13);
				new_S_S15 <= S_S(14);
				new_S_S16	<= S_S(15);
				new_S_S17 <= S_S(16);
				new_S_S18 <= S_S(17);
				new_S_S19	<= S_S(18);
				new_S_S20 <= S_S(19);
				new_S_S21 <= S_S(20);
				new_S_S22	<= S_S(21);
				new_S_S23 <= S_S(22);
				new_S_S24 <= S_S(23);

		


				

				new_state <= add_new_corner;

			when add_new_corner =>
				new_S_S0 <= new_corner;
				
				
				
				head <= H_S;
				new_H_s	<= H_s;
				snake_list <= "00000000000000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				new_I_S0 <= I_S(0);
				new_I_S1 <= I_S(1);
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_power_up_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				new_corner_count				<= corner_count;
				new_n				<= n;
				new_send_tail				<= '0';
				new_tail_check				<= "000000";
				new_corner_check				<= "000000";
				new_T				<= T;
				new_tail_input				<= (others => '0');


				
				new_S_S1				<= S_S(1);
				new_S_S2				<= S_S(2);
				new_S_S3				<= S_S(3);
				new_S_S4				<= S_S(4);
				new_S_S5				<= S_S(5);
				new_S_S6				<= S_S(6);
				new_S_S7				<= S_S(7);
				new_S_S8				<= S_S(8);
				new_S_S9				<= S_S(9);
				new_S_S10				<= S_S(10);
				new_S_S11				<= S_S(11);
				new_S_S12				<= S_S(12);
				new_S_S13				<= S_S(13);
				new_S_S14				<= S_S(14);
				new_S_S15				<= S_S(15);
				new_S_S16				<= S_S(16);
				new_S_S17				<= S_S(17);
				new_S_S18				<= S_S(18);
				new_S_S19				<= S_S(19);
				new_S_S20				<= S_S(20);
				new_S_S21				<= S_S(21);
				new_S_S22				<= S_S(22);
				new_S_S23				<= S_S(23);
				new_S_S24				<= S_S(24);

				new_state <= clear_corner_state;

			when clear_corner_state =>
				
				
				
				head <= H_S;
				new_H_s	<= H_s;
				snake_list <= "00000000000000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				new_I_S0 <= I_S(0);
				new_I_S1 <= I_S(1);
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '1'; 		
				clear_tail_flag				<= '0';		
				remove_power_up_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				new_corner_count				<= corner_count;
				new_n				<= n;
				new_send_tail				<= '0';
				new_tail_check				<= "000000";
				new_corner_check				<= "000000";
				new_T				<= T;
				new_tail_input				<= (others => '0');



				new_S_S0				<= S_S(0);
				new_S_S1				<= S_S(1);
				new_S_S2				<= S_S(2);
				new_S_S3				<= S_S(3);
				new_S_S4				<= S_S(4);
				new_S_S5				<= S_S(5);
				new_S_S6				<= S_S(6);
				new_S_S7				<= S_S(7);
				new_S_S8				<= S_S(8);
				new_S_S9				<= S_S(9);
				new_S_S10				<= S_S(10);
				new_S_S11				<= S_S(11);
				new_S_S12				<= S_S(12);
				new_S_S13				<= S_S(13);
				new_S_S14				<= S_S(14);
				new_S_S15				<= S_S(15);
				new_S_S16				<= S_S(16);
				new_S_S17				<= S_S(17);
				new_S_S18				<= S_S(18);
				new_S_S19				<= S_S(19);
				new_S_S20				<= S_S(20);
				new_S_S21				<= S_S(21);
				new_S_S22				<= S_S(22);
				new_S_S23				<= S_S(23);
				new_S_S24				<= S_S(24);

			


				new_state <= idle;
								
			when replace_food =>
				new_I_S0 <= new_item;
				
				
				
				head <= H_s;
				new_H_s	<= H_s;
				snake_list <= "00000000000000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				new_I_S1 <= I_S(1);
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_power_up_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				new_corner_count				<= corner_count;
				new_n				<= n;
				new_send_tail				<= '0';
				new_tail_check				<= "000000";
				new_corner_check				<= "000000";
				new_T				<= T;
				new_tail_input				<= (others => '0');


				
				new_S_S0				<= S_S(0);
				new_S_S1				<= S_S(1);
				new_S_S2				<= S_S(2);
				new_S_S3				<= S_S(3);
				new_S_S4				<= S_S(4);
				new_S_S5				<= S_S(5);
				new_S_S6				<= S_S(6);
				new_S_S7				<= S_S(7);
				new_S_S8				<= S_S(8);
				new_S_S9				<= S_S(9);
				new_S_S10				<= S_S(10);
				new_S_S11				<= S_S(11);
				new_S_S12				<= S_S(12);
				new_S_S13				<= S_S(13);
				new_S_S14				<= S_S(14);
				new_S_S15				<= S_S(15);
				new_S_S16				<= S_S(16);
				new_S_S17				<= S_S(17);
				new_S_S18				<= S_S(18);
				new_S_S19				<= S_S(19);
				new_S_S20				<= S_S(20);
				new_S_S21				<= S_S(21);
				new_S_S22				<= S_S(22);
				new_S_S23				<= S_S(23);
				new_S_S24				<= S_S(24);

			
				new_state <= new_item_clear_state;

			when replace_power_up =>
				new_I_S1 <= new_item;
				
				
				
				head <= H_S;
				new_H_s	<= H_s;
				snake_list <= "00000000000000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				new_I_S0 <= I_S(0);
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_power_up_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				new_corner_count				<= corner_count;
				new_n				<= n;
				new_send_tail				<= '0';
				new_tail_check				<= "000000";
				new_corner_check				<= "000000";
				new_T				<= T;
				new_tail_input				<= (others => '0');


				
				new_S_S0				<= S_S(0);
				new_S_S1				<= S_S(1);
				new_S_S2				<= S_S(2);
				new_S_S3				<= S_S(3);
				new_S_S4				<= S_S(4);
				new_S_S5				<= S_S(5);
				new_S_S6				<= S_S(6);
				new_S_S7				<= S_S(7);
				new_S_S8				<= S_S(8);
				new_S_S9				<= S_S(9);
				new_S_S10				<= S_S(10);
				new_S_S11				<= S_S(11);
				new_S_S12				<= S_S(12);
				new_S_S13				<= S_S(13);
				new_S_S14				<= S_S(14);
				new_S_S15				<= S_S(15);
				new_S_S16				<= S_S(16);
				new_S_S17				<= S_S(17);
				new_S_S18				<= S_S(18);
				new_S_S19				<= S_S(19);
				new_S_S20				<= S_S(20);
				new_S_S21				<= S_S(21);
				new_S_S22				<= S_S(22);
				new_S_S23				<= S_S(23);
				new_S_S24				<= S_S(24);

		

				new_state <= new_item_clear_state;



			when remove_power_up =>
				new_I_S1 <= "000000000000";
				
				
				
				head <= H_S;
				new_H_s	<= H_s;
				snake_list <= "00000000000000000";
				item_out_food <= I_S(0);
				item_out_power_up <= "000000000000";
				new_I_S0 <= I_S(0);
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_power_up_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				new_corner_count				<= corner_count;
				new_n				<= n;
				new_send_tail				<= '0';
				new_tail_check				<= "000000";
				new_corner_check				<= "000000";
				new_T				<= T;
				new_tail_input				<= (others => '0');


				
				new_S_S0				<= S_S(0);
				new_S_S1				<= S_S(1);
				new_S_S2				<= S_S(2);
				new_S_S3				<= S_S(3);
				new_S_S4				<= S_S(4);
				new_S_S5				<= S_S(5);
				new_S_S6				<= S_S(6);
				new_S_S7				<= S_S(7);
				new_S_S8				<= S_S(8);
				new_S_S9				<= S_S(9);
				new_S_S10				<= S_S(10);
				new_S_S11				<= S_S(11);
				new_S_S12				<= S_S(12);
				new_S_S13				<= S_S(13);
				new_S_S14				<= S_S(14);
				new_S_S15				<= S_S(15);
				new_S_S16				<= S_S(16);
				new_S_S17				<= S_S(17);
				new_S_S18				<= S_S(18);
				new_S_S19				<= S_S(19);
				new_S_S20				<= S_S(20);
				new_S_S21				<= S_S(21);
				new_S_S22				<= S_S(22);
				new_S_S23				<= S_S(23);
				new_S_S24				<= S_S(24);

						
				new_state <= remove_item_clear_state;

			when new_item_clear_state =>
				
				
				
				head <= H_S;
				new_H_s	<= H_s;
				snake_list <= "00000000000000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				new_I_S0 <= I_S(0);
				new_I_S1 <= I_S(1);
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_power_up_clear	 			<= '1';	
				new_item_clear				<= '1';
				send_new_corner_clear				<= '0';
				new_corner_count				<= corner_count;
				new_n				<= n;
				new_send_tail				<= '0';
				new_tail_check				<= "000000";
				new_corner_check				<= "000000";
				new_T				<= T;
				new_tail_input				<= (others => '0');


				
				new_S_S0				<= S_S(0);
				new_S_S1				<= S_S(1);
				new_S_S2				<= S_S(2);
				new_S_S3				<= S_S(3);
				new_S_S4				<= S_S(4);
				new_S_S5				<= S_S(5);
				new_S_S6				<= S_S(6);
				new_S_S7				<= S_S(7);
				new_S_S8				<= S_S(8);
				new_S_S9				<= S_S(9);
				new_S_S10				<= S_S(10);
				new_S_S11				<= S_S(11);
				new_S_S12				<= S_S(12);
				new_S_S13				<= S_S(13);
				new_S_S14				<= S_S(14);
				new_S_S15				<= S_S(15);
				new_S_S16				<= S_S(16);
				new_S_S17				<= S_S(17);
				new_S_S18				<= S_S(18);
				new_S_S19				<= S_S(19);
				new_S_S20				<= S_S(20);
				new_S_S21				<= S_S(21);
				new_S_S22				<= S_S(22);
				new_S_S23				<= S_S(23);
				new_S_S24				<= S_S(24);

					


				new_state <= idle;

			when remove_item_clear_state =>
				
				
				
				head <= H_S;
				new_H_s	<= H_s;
				snake_list <= "00000000000000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				new_I_S0 <= I_S(0);
				new_I_S1 <= I_S(1);
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_power_up_clear	 			<= '1';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				new_corner_count				<= corner_count;
				new_n				<= n;
				new_send_tail				<= '0';
				new_tail_check				<= "000000";
				new_corner_check				<= "000000";
				new_T				<= T;
				new_tail_input				<= (others => '0');


				
				new_S_S0				<= S_S(0);
				new_S_S1				<= S_S(1);
				new_S_S2				<= S_S(2);
				new_S_S3				<= S_S(3);
				new_S_S4				<= S_S(4);
				new_S_S5				<= S_S(5);
				new_S_S6				<= S_S(6);
				new_S_S7				<= S_S(7);
				new_S_S8				<= S_S(8);
				new_S_S9				<= S_S(9);
				new_S_S10				<= S_S(10);
				new_S_S11				<= S_S(11);
				new_S_S12				<= S_S(12);
				new_S_S13				<= S_S(13);
				new_S_S14				<= S_S(14);
				new_S_S15				<= S_S(15);
				new_S_S16				<= S_S(16);
				new_S_S17				<= S_S(17);
				new_S_S18				<= S_S(18);
				new_S_S19				<= S_S(19);
				new_S_S20				<= S_S(20);
				new_S_S21				<= S_S(21);
				new_S_S22				<= S_S(22);
				new_S_S23				<= S_S(23);
				new_S_S24				<= S_S(24);

					


				new_state <= idle;



			when load_tail =>
				
				
				
				head <= H_S;
				new_H_s	<= H_s;
				snake_list <= "00000000000000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				new_I_S0 <= I_S(0);
				new_I_S1 <= I_S(1);
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_power_up_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				new_corner_count				<= corner_count;
				new_n				<= n;
				new_send_tail				<= '0';
				new_corner_check				<= "000000";
				new_T				<= std_logic_vector( unsigned(corner_count) - 1 );


				new_S_S0				<= S_S(0);
				new_S_S1				<= S_S(1);
				new_S_S2				<= S_S(2);
				new_S_S3				<= S_S(3);
				new_S_S4				<= S_S(4);
				new_S_S5				<= S_S(5);
				new_S_S6				<= S_S(6);
				new_S_S7				<= S_S(7);
				new_S_S8				<= S_S(8);
				new_S_S9				<= S_S(9);
				new_S_S10				<= S_S(10);
				new_S_S11				<= S_S(11);
				new_S_S12				<= S_S(12);
				new_S_S13				<= S_S(13);
				new_S_S14				<= S_S(14);
				new_S_S15				<= S_S(15);
				new_S_S16				<= S_S(16);
				new_S_S17				<= S_S(17);
				new_S_S18				<= S_S(18);
				new_S_S19				<= S_S(19);
				new_S_S20				<= S_S(20);
				new_S_S21				<= S_S(21);
				new_S_S22				<= S_S(22);
				new_S_S23				<= S_S(23);
				new_S_S24				<= S_S(24);
				
				

				new_tail_check				<= S_S((to_integer(unsigned(corner_count))) - 1);
				new_tail_input				<= new_tail;
				new_state				<= check_tail;

			when check_tail =>
				
				
				
				head <= H_S;
				new_H_s	<= H_s;
				snake_list <= "00000000000000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				new_I_S0 <= I_S(0);
				new_I_S1 <= I_S(1);
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_power_up_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				new_corner_count				<= corner_count;
				new_n				<= n;
				new_send_tail				<= '0';
				new_corner_check				<= "000000";
				new_T				<= T;
				new_tail_input				<= (others => '0');

				
				new_S_S0				<= S_S(0);
				new_S_S1				<= S_S(1);
				new_S_S2				<= S_S(2);
				new_S_S3				<= S_S(3);
				new_S_S4				<= S_S(4);
				new_S_S5				<= S_S(5);
				new_S_S6				<= S_S(6);
				new_S_S7				<= S_S(7);
				new_S_S8				<= S_S(8);
				new_S_S9				<= S_S(9);
				new_S_S10				<= S_S(10);
				new_S_S11				<= S_S(11);
				new_S_S12				<= S_S(12);
				new_S_S13				<= S_S(13);
				new_S_S14				<= S_S(14);
				new_S_S15				<= S_S(15);
				new_S_S16				<= S_S(16);
				new_S_S17				<= S_S(17);
				new_S_S18				<= S_S(18);
				new_S_S19				<= S_S(19);
				new_S_S20				<= S_S(20);
				new_S_S21				<= S_S(21);
				new_S_S22				<= S_S(22);
				new_S_S23				<= S_S(23);
				new_S_S24				<= S_S(24);

						

				
				if ((to_integer(unsigned(corner_count)))= 2) then
					if (tail_check(5) = '1') then
						if ( H_S(9 downto 5) = tail_input(4 downto 0)) then
							new_state <= remove_tail;
						else
							new_state <= replace_tail;
						end if;
					elsif (tail_check(5) = '0') then
						if ( H_S(4 downto 0) = tail_input(4 downto 0)) then
							new_state <= remove_tail;
						else 
							new_state <= replace_tail;
						end if;
					else
						new_state <= replace_tail;
					end if;
				elsif ((to_integer(unsigned(corner_count))) = 1) then
					new_state <= replace_tail;
				elsif ((to_integer(unsigned(corner_count))) > 2) then
					if (tail_input = S_S((to_integer(unsigned(corner_count))) - 2)) then
						new_state <= remove_tail;
					else 
						new_state <= replace_tail;
					end if;
				else 
					new_state <= remove_tail;
				end if;

			
			when replace_tail =>
				
				
				
				head <= H_S;
				new_H_s	<= H_s;
				snake_list <= "00000000000000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				new_I_S0 <= I_S(0);
				new_I_S1 <= I_S(1);
				new_send_tail <= '0';
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_power_up_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				new_corner_count				<= corner_count;
				new_n				<= n;
				new_send_tail				<= '0';
				new_tail_check				<= "000000";
				new_corner_check				<= "000000";
				new_T				<= T;
				new_tail_input				<= (others => '0');

				
				if ( T = "00000") then
					new_S_S0	<= new_tail;
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "00001") then
					new_S_S1 <= new_tail;
					new_S_S0				<= S_S(0);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "00010") then
					new_S_S2 <= new_tail;
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "00011") then
					new_S_S3 <= new_tail;
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "00100") then
					new_S_S4 <= new_tail;
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "00101") then
					new_S_S5 <= new_tail;
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "00110") then
					new_S_S6 <= new_tail;
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "00111") then
					new_S_S7 <= new_tail;
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "01000") then
					new_S_S8 <= new_tail;
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "01001") then
					new_S_S9 <= new_tail;
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "01010") then
					new_S_S10 <= new_tail;
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "01011") then
					new_S_S11 <= new_tail;
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "01100") then
					new_S_S12 <= new_tail;
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "01101") then
					new_S_S13 <= new_tail;
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "01110") then
					new_S_S14 <= new_tail;
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "01111") then
					new_S_S15 <= new_tail;
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "10000") then
					new_S_S16 <= new_tail;
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "10001") then
					new_S_S17 <= new_tail;
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "10010") then
					new_S_S18 <= new_tail;
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "10011") then
					new_S_S19 <= new_tail;
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "10100") then
					new_S_S20 <= new_tail;
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "10101") then
					new_S_S21 <= new_tail;
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "10110") then
					new_S_S22 <= new_tail;
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "10111") then
					new_S_S23 <= new_tail;
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S24				<= S_S(24);
				elsif (T = "11000") then
					new_S_S24 <= new_tail;
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
				else

				new_S_S0				<= S_S(0);
				new_S_S1				<= S_S(1);
				new_S_S2				<= S_S(2);
				new_S_S3				<= S_S(3);
				new_S_S4				<= S_S(4);
				new_S_S5				<= S_S(5);
				new_S_S6				<= S_S(6);
				new_S_S7				<= S_S(7);
				new_S_S8				<= S_S(8);
				new_S_S9				<= S_S(9);
				new_S_S10				<= S_S(10);
				new_S_S11				<= S_S(11);
				new_S_S12				<= S_S(12);
				new_S_S13				<= S_S(13);
				new_S_S14				<= S_S(14);
				new_S_S15				<= S_S(15);
				new_S_S16				<= S_S(16);
				new_S_S17				<= S_S(17);
				new_S_S18				<= S_S(18);
				new_S_S19				<= S_S(19);
				new_S_S20				<= S_S(20);
				new_S_S21				<= S_S(21);
				new_S_S22				<= S_S(22);
				new_S_S23				<= S_S(23);
				new_S_S24				<= S_S(24);
				
				end if;

				new_state <= clear_tail_state;

			when remove_tail =>
				new_corner_count <= std_logic_vector( unsigned(corner_count) -1 );
				
				
				
				head <= H_S;
				new_H_s	<= H_s;
				snake_list <= "00000000000000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				new_I_S0 <= I_S(0);
				new_I_S1 <= I_S(1);
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_power_up_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				new_n				<= n;
				new_send_tail				<= '0';
				new_tail_check				<= "000000";
				new_corner_check				<= "000000";
				new_T				<= T;
				new_tail_input				<= (others => '0');

				
				if ( T = "00000" ) then
					new_S_S0	<= "000000";
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "00001") then
					new_S_S1 <= "000000";
					new_S_S0				<= S_S(0);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "00010") then
					new_S_S2 <= "000000";
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "00011") then
					new_S_S3 <= "000000";
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "00100") then
					new_S_S4 <= "000000";
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "00101") then
					new_S_S5 <= "000000";
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "00110") then
					new_S_S6 <= "000000";
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "00111") then
					new_S_S7 <= "000000";
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "01000") then
					new_S_S8 <= "000000";
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "01001") then
					new_S_S9 <= "000000";
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "01010") then
					new_S_S10 <= "000000";
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "01011") then
					new_S_S11 <= "000000";
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "01100") then
					new_S_S12 <= "000000";
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "01101") then
					new_S_S13 <= "000000";
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "01110") then
					new_S_S14 <= "000000";
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "01111") then
					new_S_S15 <= "000000";
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "10000") then
					new_S_S16 <= "000000";
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "10001") then
					new_S_S17 <= "000000";
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "10010") then
					new_S_S18 <= "000000";
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "10011") then
					new_S_S19 <= "000000";
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "10100") then
					new_S_S20 <= "000000";
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "10101") then
					new_S_S21 <= "000000";
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "10110") then
					new_S_S22 <= "000000";
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				elsif (T = "10111") then
					new_S_S23 <= "000000";
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S24				<= S_S(24);
				elsif (T = "11000") then
					new_S_S24 <= "000000";
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);

				else		
					new_S_S0				<= S_S(0);
					new_S_S1				<= S_S(1);
					new_S_S2				<= S_S(2);
					new_S_S3				<= S_S(3);
					new_S_S4				<= S_S(4);
					new_S_S5				<= S_S(5);
					new_S_S6				<= S_S(6);
					new_S_S7				<= S_S(7);
					new_S_S8				<= S_S(8);
					new_S_S9				<= S_S(9);
					new_S_S10				<= S_S(10);
					new_S_S11				<= S_S(11);
					new_S_S12				<= S_S(12);
					new_S_S13				<= S_S(13);
					new_S_S14				<= S_S(14);
					new_S_S15				<= S_S(15);
					new_S_S16				<= S_S(16);
					new_S_S17				<= S_S(17);
					new_S_S18				<= S_S(18);
					new_S_S19				<= S_S(19);
					new_S_S20				<= S_S(20);
					new_S_S21				<= S_S(21);
					new_S_S22				<= S_S(22);
					new_S_S23				<= S_S(23);
					new_S_S24				<= S_S(24);
				end if;
				new_state <= clear_tail_state;


			when clear_tail_state =>
				
				
				
				head <= H_S;
				new_H_s	<= H_s;
				snake_list <= "00000000000000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				new_I_S0 <= I_S(0);
				new_I_S1 <= I_S(1);
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '1';		
				remove_power_up_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				new_corner_count				<= corner_count;
				new_n				<= n;
				new_send_tail				<= '0';
				new_tail_check				<= "000000";
				new_corner_check				<= "000000";
				new_T				<= T;
				new_tail_input				<= (others => '0');


				
				new_S_S0				<= S_S(0);
				new_S_S1				<= S_S(1);
				new_S_S2				<= S_S(2);
				new_S_S3				<= S_S(3);
				new_S_S4				<= S_S(4);
				new_S_S5				<= S_S(5);
				new_S_S6				<= S_S(6);
				new_S_S7				<= S_S(7);
				new_S_S8				<= S_S(8);
				new_S_S9				<= S_S(9);
				new_S_S10				<= S_S(10);
				new_S_S11				<= S_S(11);
				new_S_S12				<= S_S(12);
				new_S_S13				<= S_S(13);
				new_S_S14				<= S_S(14);
				new_S_S15				<= S_S(15);
				new_S_S16				<= S_S(16);
				new_S_S17				<= S_S(17);
				new_S_S18				<= S_S(18);
				new_S_S19				<= S_S(19);
				new_S_S20				<= S_S(20);
				new_S_S21				<= S_S(21);
				new_S_S22				<= S_S(22);
				new_S_S23				<= S_S(23);
				new_S_S24				<= S_S(24);

					

				new_state <= idle;

	    when tail_check1 =>
                
                
                
                head <= H_S;
		snake_list <= "00000000000000000";
		new_H_s	<= H_s;
                item_out_food <= I_S(0);
		item_out_power_up <= I_S(1);
		new_I_S0 <= I_S(0);
		new_I_S1 <= I_S(1);
                clear_head_flag                 <= '0';   
                clear_corner_flag                <= '0';        
                clear_tail_flag                <= '0';       
                new_item_clear	                <= '0';   
                remove_power_up_clear	 		                <= '0';
		new_corner_count				<= corner_count;
		new_n				<= n;
				new_tail_check				<= "000000";
				new_corner_check				<= "000000";
				new_T				<= T;
				send_new_corner_clear				<= '0';
				new_tail_input				<= (others => '0');

				
				
				new_S_S0				<= S_S(0);
				new_S_S1				<= S_S(1);
				new_S_S2				<= S_S(2);
				new_S_S3				<= S_S(3);
				new_S_S4				<= S_S(4);
				new_S_S5				<= S_S(5);
				new_S_S6				<= S_S(6);
				new_S_S7				<= S_S(7);
				new_S_S8				<= S_S(8);
				new_S_S9				<= S_S(9);
				new_S_S10				<= S_S(10);
				new_S_S11				<= S_S(11);
				new_S_S12				<= S_S(12);
				new_S_S13				<= S_S(13);
				new_S_S14				<= S_S(14);
				new_S_S15				<= S_S(15);
				new_S_S16				<= S_S(16);
				new_S_S17				<= S_S(17);
				new_S_S18				<= S_S(18);
				new_S_S19				<= S_S(19);
				new_S_S20				<= S_S(20);
				new_S_S21				<= S_S(21);
				new_S_S22				<= S_S(22);
				new_S_S23				<= S_S(23);
				new_S_S24				<= S_S(24);
							
		if (N = corner_count) then
			new_send_tail <= '1';
		else 
			new_send_tail <= '0';
		end if;
		
		new_state <= state_1;


            when state_1 =>
                
                
                
                head <= H_S;
		new_H_s	<= H_s;
                item_out_food <= I_S(0);
		item_out_power_up <= I_S(1);
		new_I_S0 <= I_S(0);
		new_I_S1 <= I_S(1);
                clear_head_flag                 <= '0';   
                clear_corner_flag                <= '0';        
                clear_tail_flag                <= '0';       
                new_item_clear	                <= '0';   
                remove_power_up_clear	 		                <= '0';
		new_N				<= std_logic_vector(unsigned(N) + 1 );
		new_corner_count				<= corner_count;
				new_send_tail				<= '0';
				new_tail_check				<= "000000";
				new_corner_check				<= "000000";
				new_T				<= T;
				send_new_corner_clear				<= '1';
				new_tail_input				<= (others => '0');


	
				
				new_S_S0				<= S_S(0);
				new_S_S1				<= S_S(1);
				new_S_S2				<= S_S(2);
				new_S_S3				<= S_S(3);
				new_S_S4				<= S_S(4);
				new_S_S5				<= S_S(5);
				new_S_S6				<= S_S(6);
				new_S_S7				<= S_S(7);
				new_S_S8				<= S_S(8);
				new_S_S9				<= S_S(9);
				new_S_S10				<= S_S(10);
				new_S_S11				<= S_S(11);
				new_S_S12				<= S_S(12);
				new_S_S13				<= S_S(13);
				new_S_S14				<= S_S(14);
				new_S_S15				<= S_S(15);
				new_S_S16				<= S_S(16);
				new_S_S17				<= S_S(17);
				new_S_S18				<= S_S(18);
				new_S_S19				<= S_S(19);
				new_S_S20				<= S_S(20);
				new_S_S21				<= S_S(21);
				new_S_S22				<= S_S(22);
				new_S_S23				<= S_S(23);
				new_S_S24				<= S_S(24);

					
                snake_list <= H_S(9 downto 0) & S_S(0) & send_tail;

                if  (N = corner_count) then     
                    new_state <= idle;
                else new_state <= state_wait2;
                end if;

            when state_wait2 =>
                
                
                
                head <= H_S;
		new_H_s	<= H_s;
		snake_list <= "00000000000000000";
                item_out_food <= I_S(0);
		item_out_power_up <= I_S(1);
		new_I_S0 <= I_S(0);
		new_I_S1 <= I_S(1);
                clear_head_flag                 <= '0';   
                clear_corner_flag                <= '0';        
                clear_tail_flag                <= '0';       
                new_item_clear	                 <= '0';   
                remove_power_up_clear               <= '0';
		new_corner_count				<= corner_count;
		new_n				<= n;
				new_send_tail				<= '0';
				new_tail_check				<= "000000";
				new_corner_check				<= "000000";
				new_T				<= T;
				send_new_corner_clear				<= '0';
				new_tail_input				<= (others => '0');

				
				new_S_S0				<= S_S(0);
				new_S_S1				<= S_S(1);
				new_S_S2				<= S_S(2);
				new_S_S3				<= S_S(3);
				new_S_S4				<= S_S(4);
				new_S_S5				<= S_S(5);
				new_S_S6				<= S_S(6);
				new_S_S7				<= S_S(7);
				new_S_S8				<= S_S(8);
				new_S_S9				<= S_S(9);
				new_S_S10				<= S_S(10);
				new_S_S11				<= S_S(11);
				new_S_S12				<= S_S(12);
				new_S_S13				<= S_S(13);
				new_S_S14				<= S_S(14);
				new_S_S15				<= S_S(15);
				new_S_S16				<= S_S(16);
				new_S_S17				<= S_S(17);
				new_S_S18				<= S_S(18);
				new_S_S19				<= S_S(19);
				new_S_S20				<= S_S(20);
				new_S_S21				<= S_S(21);
				new_S_S22				<= S_S(22);
				new_S_S23				<= S_S(23);
				new_S_S24				<= S_S(24);

						

                if    (send_corner_flag = '1') then
                        new_state <= tail_check2;
                else new_state <= state_wait2;
                end if;

	    when tail_check2 =>
                
                
                
                head <= H_S;
		new_H_s	<= H_s;
		snake_list <= "00000000000000000";
                item_out_food <= I_S(0);
		item_out_power_up <= I_S(1);
		new_I_S0 <= I_S(0);
		new_I_S1 <= I_S(1);
                clear_head_flag                 <= '0';   
                clear_corner_flag                <= '0';        
                clear_tail_flag                <= '0';       
                new_item_clear	                <= '0';   
                remove_power_up_clear	 		               <= '0';
		new_corner_count				<= corner_count;
		new_n				<= n;
				new_tail_check				<= "000000";
				new_corner_check				<= S_S(1);
				new_T				<= T;
				send_new_corner_clear				<= '0';
				new_tail_input				<= (others => '0');

			
				new_S_S0				<= S_S(0);
				new_S_S1				<= S_S(1);
				new_S_S2				<= S_S(2);
				new_S_S3				<= S_S(3);
				new_S_S4				<= S_S(4);
				new_S_S5				<= S_S(5);
				new_S_S6				<= S_S(6);
				new_S_S7				<= S_S(7);
				new_S_S8				<= S_S(8);
				new_S_S9				<= S_S(9);
				new_S_S10				<= S_S(10);
				new_S_S11				<= S_S(11);
				new_S_S12				<= S_S(12);
				new_S_S13				<= S_S(13);
				new_S_S14				<= S_S(14);
				new_S_S15				<= S_S(15);
				new_S_S16				<= S_S(16);
				new_S_S17				<= S_S(17);
				new_S_S18				<= S_S(18);
				new_S_S19				<= S_S(19);
				new_S_S20				<= S_S(20);
				new_S_S21				<= S_S(21);
				new_S_S22				<= S_S(22);
				new_S_S23				<= S_S(23);
				new_S_S24				<= S_S(24);
				
		if (N = corner_count) then
			new_send_tail <= '1';
		else 
			new_send_tail <= '0';
		end if;

		new_state <= state_2;

            when state_2 =>
                
                
                
                head <= H_S;
		new_H_s	<= H_s;
                item_out_food <= I_S(0);
		item_out_power_up <= I_S(1);
		new_I_S0 <= I_S(0);
		new_I_S1 <= I_S(1);
                clear_head_flag                 <= '0';   
                clear_corner_flag                <= '0';        
                clear_tail_flag                <= '0';       
                new_item_clear	                 <= '0';   
                remove_power_up_clear                <= '0';
		new_N				<= std_logic_vector(unsigned(N) + 1 );
		new_corner_count				<= corner_count;
				new_tail_check				<= "000000";
				new_corner_check				<= "000000";
				send_new_corner_clear				<= '1';
				new_T				<= T;
				new_tail_input				<= (others => '0');

				
				new_S_S0				<= S_S(0);
				new_S_S1				<= S_S(1);
				new_S_S2				<= S_S(2);
				new_S_S3				<= S_S(3);
				new_S_S4				<= S_S(4);
				new_S_S5				<= S_S(5);
				new_S_S6				<= S_S(6);
				new_S_S7				<= S_S(7);
				new_S_S8				<= S_S(8);
				new_S_S9				<= S_S(9);
				new_S_S10				<= S_S(10);
				new_S_S11				<= S_S(11);
				new_S_S12				<= S_S(12);
				new_S_S13				<= S_S(13);
				new_S_S14				<= S_S(14);
				new_S_S15				<= S_S(15);
				new_S_S16				<= S_S(16);
				new_S_S17				<= S_S(17);
				new_S_S18				<= S_S(18);
				new_S_S19				<= S_S(19);
				new_S_S20				<= S_S(20);
				new_S_S21				<= S_S(21);
				new_S_S22				<= S_S(22);
				new_S_S23				<= S_S(23);
				new_S_S24				<= S_S(24);
						
           
                if (corner_check(5) = '1') then
                    snake_list <= S_S(0)(4 downto 0) & H_S(9 downto 5) & S_S(1) & send_tail;
                elsif (corner_check(5) = '0') then
                    snake_list <=  H_S(4 downto 0) & S_S(0)(4 downto 0) & S_S(1) & send_tail;
		else
		    snake_list <= (others => '0')  ;              
		end if;
                 

   		if  (N = corner_count) then     
                    new_state <= idle;
                else new_state <= state_wait3;

                end if;


            when state_wait3 =>
                
                
                
                head <= H_S;
		new_H_s	<= H_s;
                item_out_food <= I_S(0);
		snake_list <= "00000000000000000";
		item_out_power_up <= I_S(1);
		new_I_S0 <= I_S(0);
		new_I_S1 <= I_S(1);
                clear_head_flag                 <= '0';   
                clear_corner_flag                <= '0';        
                clear_tail_flag                <= '0';       
                new_item_clear	                 <= '0';   
                remove_power_up_clear                <= '0';
                new_n				<= n;
		new_corner_count				<= corner_count;
				new_send_tail				<= '0';
				new_tail_check				<= "000000";
				new_corner_check				<= "000000";
				send_new_corner_clear				<= '0';
				new_T				<= T;
				new_tail_input				<= (others => '0');

				
				new_S_S0				<= S_S(0);
				new_S_S1				<= S_S(1);
				new_S_S2				<= S_S(2);
				new_S_S3				<= S_S(3);
				new_S_S4				<= S_S(4);
				new_S_S5				<= S_S(5);
				new_S_S6				<= S_S(6);
				new_S_S7				<= S_S(7);
				new_S_S8				<= S_S(8);
				new_S_S9				<= S_S(9);
				new_S_S10				<= S_S(10);
				new_S_S11				<= S_S(11);
				new_S_S12				<= S_S(12);
				new_S_S13				<= S_S(13);
				new_S_S14				<= S_S(14);
				new_S_S15				<= S_S(15);
				new_S_S16				<= S_S(16);
				new_S_S17				<= S_S(17);
				new_S_S18				<= S_S(18);
				new_S_S19				<= S_S(19);
				new_S_S20				<= S_S(20);
				new_S_S21				<= S_S(21);
				new_S_S22				<= S_S(22);
				new_S_S23				<= S_S(23);
				new_S_S24				<= S_S(24);
							

                if    send_corner_flag = '1' then
                        new_state <= tail_check3;
                else new_state <= state_wait3;
                end if;

	    when tail_check3 =>
                
                
                
                head <= H_S;
		new_H_s	<= H_s;
		snake_list <= "00000000000000000";
                item_out_food <= I_S(0);
		item_out_power_up <= I_S(1);
		new_I_S0 <= I_S(0);
		new_I_S1 <= I_S(1);
                clear_head_flag                 <= '0';   
                clear_corner_flag                <= '0';        
                clear_tail_flag                <= '0';       
                new_item_clear	                <= '0';   
                remove_power_up_clear	 		                <= '0';
		new_corner_count				<= corner_count;
		new_n				<= n;
				new_tail_check				<= "000000";
				send_new_corner_clear				<= '0';
				new_corner_check				<= S_S((to_integer(unsigned(N)))-1);
				new_T				<= T;
				new_tail_input				<= (others => '0');

				
				new_S_S0				<= S_S(0);
				new_S_S1				<= S_S(1);
				new_S_S2				<= S_S(2);
				new_S_S3				<= S_S(3);
				new_S_S4				<= S_S(4);
				new_S_S5				<= S_S(5);
				new_S_S6				<= S_S(6);
				new_S_S7				<= S_S(7);
				new_S_S8				<= S_S(8);
				new_S_S9				<= S_S(9);
				new_S_S10				<= S_S(10);
				new_S_S11				<= S_S(11);
				new_S_S12				<= S_S(12);
				new_S_S13				<= S_S(13);
				new_S_S14				<= S_S(14);
				new_S_S15				<= S_S(15);
				new_S_S16				<= S_S(16);
				new_S_S17				<= S_S(17);
				new_S_S18				<= S_S(18);
				new_S_S19				<= S_S(19);
				new_S_S20				<= S_S(20);
				new_S_S21				<= S_S(21);
				new_S_S22				<= S_S(22);
				new_S_S23				<= S_S(23);
				new_S_S24				<= S_S(24);
								

		if (N = corner_count) then
			new_send_tail <= '1';
		else 
			new_send_tail <= '0';
		end if;

		new_state <= state_3;

            when state_3 =>
                
             
                
                head <= H_S;
		new_H_s	<= H_s;
                item_out_food <= I_S(0);
		item_out_power_up <= I_S(1);
		new_I_S0 <= I_S(0);
		new_I_S1 <= I_S(1);
                clear_head_flag                 <= '0';   
                clear_corner_flag                <= '0';        
                clear_tail_flag                <= '0';       
                new_item_clear	                <= '0';   
                remove_power_up_clear                <= '0';
		new_N			<= std_logic_vector(unsigned(N) + 1 );
		new_corner_count				<= corner_count;
				new_T				<= T;

				new_send_tail				<= '0';
				new_tail_check				<= "000000";
				new_corner_check				<= "000000";
				send_new_corner_clear				<= '1';
				new_tail_input				<= (others => '0');

				
				new_S_S0				<= S_S(0);
				new_S_S1				<= S_S(1);
				new_S_S2				<= S_S(2);
				new_S_S3				<= S_S(3);
				new_S_S4				<= S_S(4);
				new_S_S5				<= S_S(5);
				new_S_S6				<= S_S(6);
				new_S_S7				<= S_S(7);
				new_S_S8				<= S_S(8);
				new_S_S9				<= S_S(9);
				new_S_S10				<= S_S(10);
				new_S_S11				<= S_S(11);
				new_S_S12				<= S_S(12);
				new_S_S13				<= S_S(13);
				new_S_S14				<= S_S(14);
				new_S_S15				<= S_S(15);
				new_S_S16				<= S_S(16);
				new_S_S17				<= S_S(17);
				new_S_S18				<= S_S(18);
				new_S_S19				<= S_S(19);
				new_S_S20				<= S_S(20);
				new_S_S21				<= S_S(21);
				new_S_S22				<= S_S(22);
				new_S_S23				<= S_S(23);
				new_S_S24				<= S_S(24);


					
                           
                       
                           
                           
               	if (corner_check(5) = '0') then
                       snake_list <= S_S((to_integer(unsigned(N)))-3)(4 downto 0) & S_S((to_integer(unsigned(N)))-2)(4 downto 0) & S_S((to_integer(unsigned(N)))-1) & send_tail;
                 

                elsif (corner_check(5) = '1') then
                         snake_list <= S_S((to_integer(unsigned(N)))-2)(4 downto 0) & S_S((to_integer(unsigned(N)))-3)(4 downto 0) & S_S((to_integer(unsigned(N)))-1) & send_tail;
		else
			snake_list <= (others => '0');
                           
                end if;                       
          
               if  (N = corner_count) then     
                    new_state <= idle;
                else new_state <= state_wait;

                end if;

            	when state_wait =>
                
               
                
                head <= H_S;
		new_H_s	<= H_s;
		snake_list <= "00000000000000000";
                item_out_food <= I_S(0);
		item_out_power_up <= I_S(1);
		new_I_S0 <= I_S(0);
		new_I_S1 <= I_S(1);
                clear_head_flag                 <= '0';   
                clear_corner_flag                <= '0';        
                clear_tail_flag                <= '0';       
                new_item_clear	                <= '0';   
                remove_power_up_clear                <= '0';
		new_corner_count				<= corner_count;
		new_n				<= n;
				new_send_tail				<= '0';
				send_new_corner_clear				<= '0';
				new_tail_check				<= "000000";
				new_corner_check				<= "000000";
				new_T				<= T;
				new_tail_input				<= (others => '0');

				
				new_S_S0				<= S_S(0);
				new_S_S1				<= S_S(1);
				new_S_S2				<= S_S(2);
				new_S_S3				<= S_S(3);
				new_S_S4				<= S_S(4);
				new_S_S5				<= S_S(5);
				new_S_S6				<= S_S(6);
				new_S_S7				<= S_S(7);
				new_S_S8				<= S_S(8);
				new_S_S9				<= S_S(9);
				new_S_S10				<= S_S(10);
				new_S_S11				<= S_S(11);
				new_S_S12				<= S_S(12);
				new_S_S13				<= S_S(13);
				new_S_S14				<= S_S(14);
				new_S_S15				<= S_S(15);
				new_S_S16				<= S_S(16);
				new_S_S17				<= S_S(17);
				new_S_S18				<= S_S(18);
				new_S_S19				<= S_S(19);
				new_S_S20				<= S_S(20);
				new_S_S21				<= S_S(21);
				new_S_S22				<= S_S(22);
				new_S_S23				<= S_S(23);
				new_S_S24				<= S_S(24);
               							

                if    (send_corner_flag = '1') then
                        new_state <= tail_check3;
                else new_state <= state_wait;
                end if;



			when others =>
				
				
				
				head <= H_S;
				new_H_s	<= H_s;
				snake_list <= "00000000000000000";
				item_out_food <= I_S(0);
				item_out_power_up <= I_S(1);
				new_I_S0 <= I_S(0);
				new_I_S1 <= I_S(1);
				clear_head_flag 				<= '0';	
				clear_corner_flag				<= '0'; 		
				clear_tail_flag				<= '0';		
				remove_power_up_clear	 			<= '0';	
				new_item_clear				<= '0';
				send_new_corner_clear				<= '0';
				new_corner_count				<= corner_count;
				new_n				<= n;
				new_send_tail				<= '0';
				new_tail_check				<= "000000";
				new_corner_check				<= "000000";
				new_T				<= T;
				new_tail_input				<= (others => '0');

				
				new_S_S0				<= S_S(0);
				new_S_S1				<= S_S(1);
				new_S_S2				<= S_S(2);
				new_S_S3				<= S_S(3);
				new_S_S4				<= S_S(4);
				new_S_S5				<= S_S(5);
				new_S_S6				<= S_S(6);
				new_S_S7				<= S_S(7);
				new_S_S8				<= S_S(8);
				new_S_S9				<= S_S(9);
				new_S_S10				<= S_S(10);
				new_S_S11				<= S_S(11);
				new_S_S12				<= S_S(12);
				new_S_S13				<= S_S(13);
				new_S_S14				<= S_S(14);
				new_S_S15				<= S_S(15);
				new_S_S16				<= S_S(16);
				new_S_S17				<= S_S(17);
				new_S_S18				<= S_S(18);
				new_S_S19				<= S_S(19);
				new_S_S20				<= S_S(20);
				new_S_S21				<= S_S(21);
				new_S_S22				<= S_S(22);
				new_S_S23				<= S_S(23);
				new_S_S24				<= S_S(24);
							
				new_state <= idle;



			end case;
		end process;	
		


end behaviour_storage_test;



