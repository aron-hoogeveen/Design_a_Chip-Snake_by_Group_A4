library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of itemgenerator is
component shift_register is
    port (clk, reset, enable, D : in std_logic; Q : out std_logic_vector(11 downto 0));
end component;

component counter4 is
    port (clk, reset, manual_reset enable : in std_logic; z_out: out std_logic_vector(3 downto 0));
end component;

    type itemGenerator_state is (IDLE, GEN_TYPE, GEN_LOC, CHECK_LOC, SEND_LOC);
    signal state, new_state: itemGenerator_state;
    signal counter_out: std_logic_vector(3 downto 0);
    singal counter_enable, counter_reset, register_enable, register_D, rng_out: std_logic;
    signal register_Q: std_logic_vector(11 downto 0);

begin
    
    count4: counter4 port map (clk=>clk, reset=>reset, manual_reset=>counter_reset, enable=>counter_enable, z_out=>counter_out);
    shift_reg: shift_register port map (clk=>clk, reset=>reset, enable=>register_enable, D=>register_D, Q=>register_Q);

    lbl1: process (clk)
    begin
        if (rising_edge(clk)) then
            if (res = '1') then
                state <= IDLE;
            else
                state <= new_state;
            end if;
        end if;
    end process;

    lbl2: process(state, req_item, item_ok, rng_in)
    begin
        case state is
            when IDLE =>
                --------------------
                -- Initial values --
                --------------------
                item_location <= (others => '0');
                new_item <= (others => '0');
                ack_req <= '0';
                counter_reset <= '0';
                counter_enable <= '0';
                register_enable <= '0';
                register_D <= '0';


                -- Now check if snake wants us to generate a new item (and what
                -- for type of item)
                if (req_item = "10") then
                    -- Generate a food item ("00")

                    -- Let Snake know that we proccessed the request
                    ack_req <= '1';
                    
                    -- Now loop through the states that put the item type bits 
                    -- into the shift register
                    new_state <= SHIFT_FOOD_ONE;
                elsif (req_item = "11") then
                    -- Wait between 8 and 16 seconds by listening to two reset signals from the global counter of our final system

                    ack_req <= '1';
                    new_state <= IDLE;
                elsif (req_item(0) = '0') and (count_done = '1') then

                    -- Generate the power-up
                    new_state <= GEN_TYPE;
                else
                    new_state <= IDLE;
                end if;

            when GEN_TYPE =>
                --------------------
                -- Initial values --
                --------------------
                item_location <= (others => '0');
                new_item <= (others => '0');
                ack_req <= '0';
                counter_reset <= '0';
                counter_enable <= '0';
                register_enable <= '0';
                register_D <= '0';

                if (rng_out = '0') then
                    -- The only possible outcome of the second bit is now 1, as 0 means 'food'
                    register_enable <= '1';
                    register_D <= rng_out;

                    new_state <= GEN_TYPE_PU_ONE;
                else
                    register_enable <= '1';
                    register_D <= rng_out;

                    new_state <= GEN_TYPE_TWO;
                end if;

                --new_state <= GEN_LOC;

            when GEN_TYPE_PU_ONE =>
                --------------------
                -- Initial values --
                --------------------
                item_location <= (others => '0');
                new_item <= (others => '0');
                ack_req <= '0';
                counter_reset <= '0';
                counter_enable <= '0';
                register_enable <= '0';
                register_D <= '0';

                register_enable <= '1';
                register_D <= '1';

                new_state <= GEN_LOC;

            when GEN_TYPE_TWO =>
                --------------------
                -- Initial values --
                --------------------
                item_location <= (others => '0');
                new_item <= (others => '0');
                ack_req <= '0';
                counter_reset <= '0';
                counter_enable <= '0';
                register_enable <= '0';
                register_D <= '0';

                register_enable <= '1';
                register_D <= rng_out;

                new_state <= GEN_LOC;

            when SHIFT_FOOD_ONE =>
                --------------------
                -- Initial values --
                --------------------
                item_location <= (others => '0');
                new_item <= (others => '0');
                ack_req <= '0';
                counter_reset <= '0';
                counter_enable <= '0';
                register_enable <= '0';
                register_D <= '0';


                -- Shift the LSB of food ("00") into the Shift Register
                register_enable <= '1';
                register_D <= '0';

                new_state <= SHIFT_FOOD_TWO;

            when SHIFT_FOOD_TWO =>
                --------------------
                -- Initial values --
                --------------------
                item_location <= (others => '0');
                new_item <= (others => '0');
                ack_req <= '0';
                counter_reset <= '0';
                counter_enable <= '0';
                register_enable <= '0';
                register_D <= '0';

                -- Shift the second bit of food ("00") into the SR 
                register_enable <= '1';
                register_D <= '0';

                new_state <= GEN_LOC;

            when GEN_LOC =>
                --------------------
                -- Initial values --
                --------------------
                item_location <= (others => '0');
                new_item <= (others => '0');
                ack_req <= '0';
                counter_reset <= '0';
                counter_enable <= '0';
                register_enable <= '0';
                register_D <= '0';
                
                -------------------------------
                -- Tijdelijk unpolished code --
                -------------------------------
                -- Start the internal counter
                counter_enable <= '1';

                if (counter_Q > 11) then
                    new_state <= CHECK_LOC;
                else
                    -- Add new random bit to the shift register
                    register_enable <= '1';
                    register_D <= rng_out;

                    new_state <= GEN_LOC;
                end if;

            when CHECK_LOC_SEND =>
                --------------------
                -- Initial values --
                --------------------
                item_location <= (others => '0');
                new_item <= (others => '0');
                ack_req <= '0';
                counter_reset <= '0';
                counter_enable <= '0';
                register_enable <= '0';
                register_D <= '0';

                -- Send the location to the Snake module for availability checking
                new_location <= '1';            -- DIT MOET NOG EVEN ERGENS VERWERKT WORDEN. ER MOET AFGESPROKEN WORDEN MET DE SNAKE MODULE HOE DEZE FLAG VERSTUURD MOET WORDEN.
                item_location <= register_Q(11 downto 2); -- Donnot send the first two bits as they only represent the type of item

                new_state <= CHECK_LOC_CHECK;

            when CHECK_LOC_CHECK =>
                --------------------
                -- Initial values --
                --------------------
                item_location <= (others => '0');
                new_item <= (others => '0');
                ack_req <= '0';
                counter_reset <= '0';
                counter_enable <= '0';
                register_enable <= '0';
                register_D <= '0';

                if (location_checked = '1') and (item_ok = '1') then 
                    new_state <= SEND_LOC;
                elsif (location_checked = '1') and (item_ok = '0') then
                    new_state <= GEN_LOC;       -- OPMERKING: DE 2 BITS VOOR HET TYPE ITEM MOETEN EERST WEER IN HET SHIFT REGISTER WORDEN GESTOPT ANDERS GAAN DEZE VERLOREN EN RAAKT HET TYPE ITEM CORRUPT
                else 
                    -- The location has not yet been checked so wait
                    new_state <= CHECK_LOC_CHECK;
                end if;

            when SEND_LOC =>
                --------------------
                -- Initial values --
                --------------------
                item_location <= (others => '0');
                new_item <= (others => '0');
                ack_req <= '0';
                counter_reset <= '0';
                counter_enable <= '0';
                register_enable <= '0';
                register_D <= '0';

                if (send_storage_succes = '0') then
                    new_item <= register_out;
                    new_location_request_to_storage_flag_that_still_needs_to_be_implemented <= '1';

                    new_state <= SEND_LOC;
                else 
                    new_state <= IDLE;
                end if;
                
                -- If the storage fails to respond with an send_storage_succes, then this will hang forever: IG = kapot
        end case;
    end process;
end behaviour;

