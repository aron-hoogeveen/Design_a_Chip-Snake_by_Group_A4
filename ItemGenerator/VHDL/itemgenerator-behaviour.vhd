library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of itemgenerator is
component shift_register is
    port (clk, reset, enable, D : in std_logic; Q : out std_logic_vector(11 downto 0));
end component;

    type itemGenerator_state is (IDLE, GEN_TYPE, GEN_LOC, SEND_LOC);
    signal state, new_state: itemGenerator_state;
begin
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
                -- Initialize outputs
                item_location <= (others => '0');
                new_item <= (others => '0');
                ack_req <= '0';
                count_start <= '0';
                storage_enable <= '0';
                D <= '0';

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
                    -- Start the counter. After the counter finishes generate
                    -- the power-up
                    count_start <= '1';
                    ack_req <= '1';
                    new_state <= IDLE;
                elsif (req_item(0) = '0') and (count_done = '1') then
                    -- Reset the counter by sending a new start (that actually
                    -- will not start it, but reset it)

                    -- Generate the power-up
                    new_state <= GEN_TYPE;
                else
                    new_state <= IDLE;
                end if;

            when GEN_TYPE =>
                item_location <= (others => '0');
                new_item <= (others => '0');
                ack_req <= '0';
                count_start <= '0';

                -- read out the random bits from rng_in and store them for use
                -- in the location that will be send to the Storage

                -- insert code for the above mentioned process.

                new_state <= GEN_LOC;

            when SHIFT_FOOD_ONE =>
                -- Initialize outputs
                item_location <= (others => '0');
                new_item <= (others => '0');
                ack_req <= '0';
                count_start <= '0';

                -- Shift the LSB of food ("00") into the SR 
                storage_enable <= '1';
                D <= '0';

                new_state <= SHIFT_FOOD_TWO;

            when SHIFT_FOOD_TWO =>
                -- Initialize outputs
                item_location <= (others => '0');
                new_item <= (others => '0');
                ack_req <= '0';
                count_start <= '0';

                -- Shift the second bit of food ("00") into the SR 
                storage_enable <= '1';
                D <= '0';

                new_state <= GEN_LOC;

            when GEN_LOC =>
                new_item <= (others => '0');
                ack_req <= '0';
                count_start <= '0';

                -- Read out random bits from the rng and store them in the new
                -- location. Then check the new locations availability with 
                -- Snake.

                -- For the above mentioned process a few new states are possibly
                -- needed.

                -- If the new location is available, send it to the Storage
                new_state <= SEND_LOC;

            when SEND_LOC =>
                item_location <= (others => '0');
                ack_req <= '0';
                count_start <= '0';

                -- The item type (3 bits) and location (# bits) need to be con-
                -- catenated and send to the Storage.
                
                new_state <= IDLE;
        end case;
    end process;
end behaviour;

