library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of itemgenerator is
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
                item_location <= (others => '0');
                new_item <= (others => '0');

                -- Now check if snake wants us to generate a new item (and what
                -- for type of item)
                if (req_item = "10") then
                    -- Generate a food item
                    -- Somehow we need to store the item_type food now in a flip
                    -- flopz
                    new_state <= GEN_LOC;
                elsif (req_item = "11") then
                    -- Generate a power-up item
                    new_state <= GEN_TYPE;
                else
                    new_state <= IDLE;
                end if;
            when GEN_TYPE =>
                item_location <= (others => '0');
                new_item <= (others => '0');

                -- read out the random bit from rng_in
                



end behaviour;

