----------------------------------------------------------------------
-- File:        col_detect-behaviour.vhd
-- Author:      Aron Hoogeveen
-- Project:     Design a Chip - EPO3
-- Description: Wow hier kan even een coole samenvatting van alle
--              signalen enzo gegeven worden. Dan is het makkelijker
--              voor anderen om te begrijpen waar alle signalen voor
--              zijn.
-----------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

architecture behaviour of col_detect is
    type col_detect_state is (IDLE, CHECK_COL, COL_ITEM_ONE, COL_ITEM_TWO, COL_SNAKE);
    signal state, new_state: col_detect_state;

begin

    lbl1: process (clk) 
    begin
        if (rising_edge(clk)) then
            if (reset = '1') then
                state <= IDLE;
            else
                state <= new_state;
            end if;
        end if;
    end process;

    lbl2: process (state, ig_item_loc_set, ig_item_loc, st_req_item_clear, st_req_item_exists, st_req_item_type, st_item_loc, x_range, y_range, so_range_set, tail, br_new_head_set, br_new_head)
    begin
        case state is
            when IDLE =>
                --------------------
                -- Initial values --
                --------------------
                ig_item_loc_clear <= '0';
                ig_item_ok <= '0';
                --
                st_req_item_set <= '0';
                st_req_item_no <= '0';
                --
                so_range_clear <= '0';
                so_reset <= '0';
                --
                br_new_head_clear <= '0';
                br_new_head_ok <= '0';
                ----


                if (ig_item_loc_set = '1') then
                    -- Check the new item location
                    new_state <= CHECK_COL;
                else
                    new_state <= IDLE;
                end if;
                
            when CHECK_COL =>
                --------------------
                -- Initial values --
                --------------------
                ig_item_loc_clear <= '0';
                ig_item_ok <= '0';
                --
                st_req_item_set <= '0';
                st_req_item_no <= '0';
                --
                so_range_clear <= '0';
                so_reset <= '0';
                --
                br_new_head_clear <= '0';
                br_new_head_ok <= '0';
                ----


                if (ig_item_loc_set = '1') then
                    if ig_item_loc(4 downto 0) = "00000" or ig_item_loc(4 downto 0) = "11111" or ig_item_loc(9 downto 5) = "00000" or ig_item_loc(9 downto 5) = "11000" then
                        -- There is a collision with the wall. 
                        -- Signal IG to generate a new location
                        ig_item_loc_clear <= '1'; -- Signal that the location has been processed
                        ig_item_ok <= '0'; -- Location not available
                        
                        new_state <= IDLE;
                    else
                        -- check for collision with the items in the field
                        -- First check if there are items in the field (there should be at least one food item in the field, and additionally there could be a pu item also)

                        -- Retrieve the first item from the storage
                        st_req_item_set <= '1';
                        st_req_item_no <= '0';

                        new_state <= COL_ITEM_ONE;    
                    end if;
                elsif (br_new_head_set = '1') then
                    if br_new_head(4 downto 0) = "00000" or br_new_head(4 downto 0) = "11111" or br_new_head(9 downto 5) = "00000" or br_new_head(9 downto 5) = "11000" then
                        -- There is a collision with the wall. 
                        -- GAME OVER
                        br_new_head_clear <= '1';
                        br_new_head_clear <= '0'; -- GAME OVER 
                        
                        new_state <= IDLE; -- soon we will get a reset signal for as long as no new game is started
                    else
                        -- check for collision with the items in the field
                        -- First check if there are items in the field (there should be at least one food item in the field, and additionally there could be a pu item also)

                        -- Retrieve the first item from the storage
                        st_req_item_set <= '1';
                        st_req_item_no <= '0';

                        new_state <= COL_ITEM_ONE;    
                    end if;
                else
                    -- This is kinda weird. Should not happen, so let's go back to our safehaven IDLE
                    new_state <= IDLE;
                end if;

             when COL_ITEM_ONE =>
                --------------------
                -- Initial values --
                --------------------
                ig_item_loc_clear <= '0';
                ig_item_ok <= '0';
                --
                st_req_item_set <= '0';
                st_req_item_no <= '0';
                --
                so_range_clear <= '0';
                so_reset <= '0';
                --
                br_new_head_clear <= '0';
                br_new_head_ok <= '0';
                --
                food_collision <= '0';
                ----


                -- Check for a collision with the first item (if available, which it should be)
                st_req_item_set <= '1';

                if (st_req_item_clear = '1') and (st_req_item_exists = '1') then
                    st_req_item_set <= '0';
                    
                    if (ig_item_loc_set = '1') then
                        if (st_item_loc = ig_item_loc) then
                            -- This location is already occupied
                            ig_item_loc_clear <= '1';
                            ig_item_ok <= '0';

                            new_state <= IDLE;
                        else
                            -- new_item passed this check
                            new_state <= COL_ITEM_TWO;
                        end if;
                    elsif (br_new_head_set = '1') then
                        -- NEW HEAD
                        if (st_item_loc = br_new_head) then
                            if (st_req_item_type = "00") then
                                -- FOOD COLLISION WHICH IS GOOD
                                br_new_head_clear <= '1';
                                br_new_head_ok <= '1';

                                food_collision <= '1'; -- Does only need to be high for one clock period

                                new_state <= IDLE;

                            elsif (st_req_item_type = "01") then
                                -- SEND THE CORRESPONDING EFFECT TO THE CORRESPONDIG MODULE

                                new_state <= IDLE;

                            elsif (st_req_item_type = "10") then
                                -- SEND THE CORRESPONDIG BLAH BLAH BLAH

                                new_state <= IDLE;

                            elsif (st_req_item_type = "11") then
                                -- Do 

                                new_state <= IDLE;
                            else
                                -- LOLWUT I DO NOT KNOW WHAT TO DO REEEEEEEEEEEEEEEE
                                new_state <= IDLE;
                            end if;
                        else
                            -- new_head passed this check
                            new_state <= COL_ITEM_TWO;
                        end if;
                    else
                        -- ehm, we should not be here. We can either:
                        --  1. panick and go back to IDLE
                        --  2. chill back and relax and stay in COL_ITEM_ONE

                        -- PANICK
                        new_state <= IDLE;
                    end if;
                elsif (st_req_item_clear = '1') and (st_req_item_exists = '0') then
                    st_req_item_set <= '0';
                    
                    -- skip this item because it does not exist (what is actually weird, as there should always be one food item in the field)
                    new_state <= COL_ITEM_TWO;
                else 
                    new_state <= COL_ITEM_ONE;
                end if;

            when COL_ITEM_TWO =>
                --------------------
                -- Initial values --
                --------------------
                ig_item_loc_clear <= '0';
                ig_item_ok <= '0';
                --
                st_req_item_set <= '0';
                st_req_item_no <= '0';
                --
                so_range_clear <= '0';
                so_reset <= '0';
                --
                br_new_head_clear <= '0';
                br_new_head_ok <= '0';
                ----

                -- Check for a collision with the second item 
                st_req_item_set <= '1';

                if (st_req_item_clear = '1') and (st_req_item_exists = '1') then
                    st_req_item_set <= '0';
                    
                    if (ig_item_loc_set = '1') then
                        if (st_item_loc = ig_item_loc) then
                            -- This location is already occupied
                            ig_item_loc_clear <= '1';
                            ig_item_ok <= '0';

                            new_state <= IDLE;
                         else
                            -- new_item passed this check
                            new_state <= COL_SNAKE;
                         end if;
                    elsif (br_new_head_set = '1') then
                        -- NEW HEAD
                        if (st_item_loc = br_new_head) then
                            if (st_req_item_type = "00") then
                                -- FOOD COLLISION WHICH IS GOOD
                                br_new_head_clear <= '1';
                                br_new_head_ok <= '1';

                                food_collision <= '1'; -- Does only need to be high for one clock period

                                new_state <= IDLE;

                            elsif (st_req_item_type = "01") then
                                -- SEND THE CORRESPONDING EFFECT TO THE CORRESPONDIG MODULE

                                new_state <= IDLE;

                            elsif (st_req_item_type = "10") then
                                -- SEND THE CORRESPONDIG BLAH BLAH BLAH

                                new_state <= IDLE;

                            elsif (st_req_item_type = "11") then
                                -- Do 

                                new_state <= IDLE;
                            else
                                -- LOLWUT I DO NOT KNOW WHAT TO DO REEEEEEEEEEEEEEEE
                                new_state <= IDLE;
                            end if;
                        else
                            -- new_head passed this check
                            new_state <= COL_SNAKE;
                        end if;
                    else
                        -- ehm, we should not be here. We can either:
                        --  1. panick and go back to IDLE
                        --  2. chill back and relax and stay in COL_ITEM_ONE

                        -- PANICK
                        new_state <= IDLE;
                    end if;
                elsif (st_req_item_clear = '1') and (st_req_item_exists = '0') then
                    st_req_item_set <= '0';
                    
                    -- skip this item because it does not exist (what is actually weird, as there should always be one food item in the field)
                    new_state <= COL_SNAKE;
                else 
                    new_state <= COL_ITEM_TWO;
                end if;

            when COL_SNAKE =>
                --------------------
                -- Initial values --
                --------------------
                ig_item_loc_clear <= '0';
                ig_item_ok <= '0';
                --
                st_req_item_set <= '0';
                st_req_item_no <= '0';
                --
                so_range_clear <= '0';
                so_reset <= '0';
                --
                br_new_head_clear <= '0';
                br_new_head_ok <= '0';
                ----
                

                
                -- Check for a collision with the snake
                -- The first time we enter this case the two corners correspond to the head of the snake and the first next corner. 
                -- So we need to loop this case until we had the whole snake (which is indicated by the is_tail flag

                
                if (so_range_set = '1') then
                    if (tail = '1') then
                        -- This is the last check we will perform. If it succeeds the generation was succesfull
                        -- Check if the line is horizontal or vertical
                        if (x_range(9 downto 5) = x_range(4 downto 0)) then
                            -- Vertical line
                            if (ig_item_loc_set = '1') then
                                if (ig_item_loc(4 downto 0) = x_range(4 downto 0)) then
                                    -- Possible collision
                                    if (ig_item_loc(9 downto 5) < y_range(4 downto 0)) or (ig_item_loc(9 downto 5) > y_range(9 downto 5)) then
                                        -- No collision,  done.

                                        so_range_clear <= '1'; -- request new part of snake

                                        -- Item Generator should still be waiting for our answer, so we only have to signal the result during this one clock period
                                        ig_item_loc_clear <= '1';
                                        ig_item_ok <= '1';
                                        
                                        new_state <= IDLE;
                                        
                                    else
                                        -- Collision
                                        ig_item_loc_clear <= '1';
                                        ig_item_ok <= '0';

                                        -- NEED TO DECIDE WHICH SINGAL WE'LL USE BETWEEN COL_DET AND SO
                                        so_range_clear <= '1';
                                        so_reset <= '1'; -- EVEN KIJKEN HOE WE DIT GAAN IMPLEMENTEREN

                                        new_state <= IDLE;
                                    end if;
                                else
                                    -- No collision, done.

                                    so_range_clear <= '1'; -- request new part of snake

                                    ig_item_loc_clear <= '1';
                                    ig_item_ok <= '1';

                                    new_state <= IDLE;
                                end if;
                            elsif (br_new_head_set = '1') then
                                -- NEW HEAD
                                if (br_new_head(4 downto 0) = x_range(4 downto 0)) then
                                    -- Possible collision
                                    if (br_new_head(9 downto 5) < y_range(4 downto 0)) or (br_new_head(9 downto 5) > y_range(9 downto 5)) then
                                        -- No collision,  done.

                                        so_range_clear <= '1'; -- request new part of snake

                                        -- Item Generator should still be waiting for our answer, so we only have to signal the result during this one clock period
                                        br_new_head_clear <= '1';
                                        br_new_head_ok <= '1';
                                        
                                        new_state <= IDLE;
                                        
                                    else
                                        -- Collision
                                        br_new_head_clear <= '1';
                                        br_new_head_ok <= '0';

                                        -- NEED TO DECIDE WHICH SINGAL WE'LL USE BETWEEN COL_DET AND SO
                                        so_range_clear <= '1';
                                        so_reset <= '1'; -- EVEN KIJKEN HOE WE DIT GAAN IMPLEMENTEREN

                                        new_state <= IDLE;
                                    end if;
                                else
                                    -- No collision, done.

                                    so_range_clear <= '1'; -- request new part of snake

                                    br_new_head_clear <= '1';
                                    br_new_head_ok <= '1';

                                    new_state <= IDLE;
                                end if;
                            else
                                -- panick

                                new_state <= IDLE;
                            end if;
                        else
                            -- Now we assume that y_range(start) = y_range(end). If somewhere this is fucked up, this will result in unwanted behaviour
                            -- Horizontal line
                            if (ig_item_loc_set = '1') then
                                if (ig_item_loc(9 downto 5) = y_range(4 downto 0)) then
                                    -- Possible collision
                                    if (ig_item_loc(4 downto 0) < x_range(4 downto 0)) or (ig_item_loc(4 downto 0) > x_range(9 downto 0)) then
                                        -- No collision, done.

                                        so_range_clear <= '1'; -- request new part of snake

                                        -- Item Generator should still be waiting for our answer, so we only have to signal the result during this one clock period
                                        ig_item_loc_clear <= '1';
                                        ig_item_ok <= '1';
                                        
                                        new_state <= IDLE;
                                    else 
                                        -- Collision
                                        ig_item_loc_clear <= '1';
                                        ig_item_ok <= '0';
                                        
                                        so_reset <= '1';
                                        
                                        new_state <= IDLE;
                                    end if;
                                else
                                    -- No collision, done.
                                    -- Check the next line of the snake

                                    so_range_clear <= '1'; -- request new part of snake

                                    ig_item_loc_clear <= '1';
                                    ig_item_ok <= '1';

                                    new_state <= IDLE;
                                end if; 
                            elsif (br_new_head_set = '1') then
                                -- NEW HEAD
                                if (br_new_head(9 downto 5) = y_range(4 downto 0)) then
                                    -- Possible collision
                                    if (br_new_head(4 downto 0) < x_range(4 downto 0)) or (br_new_head(4 downto 0) > x_range(9 downto 0)) then
                                        -- No collision, done.

                                        so_range_clear <= '1'; -- request new part of snake

                                        -- Item Generator should still be waiting for our answer, so we only have to signal the result during this one clock period
                                        br_new_head_clear <= '1';
                                        br_new_head_ok <= '1';
                                        
                                        new_state <= IDLE;
                                    else 
                                        -- Collision
                                        br_new_head_clear <= '1';
                                        br_new_head_ok <= '0';
                                        
                                        so_reset <= '1';
                                        
                                        new_state <= IDLE;
                                    end if;
                                else
                                    -- No collision, done.
                                    -- Check the next line of the snake

                                    so_range_clear <= '1'; -- request new part of snake

                                    br_new_head_clear <= '1';
                                    br_new_head_ok <= '1';

                                    new_state <= IDLE;
                                end if; 
                            else
                                -- PANICK
                                new_state <= IDLE;
                            end if;
                        end if;
                    else
                                                -- Check if the line is horizontal or vertical
                        if (x_range(9 downto 5) = x_range(4 downto 0)) then
                            -- Vertical line
                            if (ig_item_loc_set = '1') then
                                if (ig_item_loc(4 downto 0) = x_range(4 downto 0)) then
                                    -- Possible collision
                                    if (ig_item_loc(9 downto 5) < y_range(4 downto 0)) or (ig_item_loc(9 downto 5) > y_range(9 downto 5)) then
                                        -- No collision
                                        -- Check the next line of the snake

                                        so_range_clear <= '1'; -- request new part of snake

                                        new_state <= COL_SNAKE;
                                        
                                    else
                                        -- Collision
                                        ig_item_loc_clear <= '1';
                                        ig_item_ok <= '0';

                                        
                                        so_reset <= '1'; -- EVEN KIJKEN HOE WE DIT GAAN IMPLEMENTEREN

                                        new_state <= IDLE;
                                    end if;
                                else
                                    -- No collision
                                    -- Check the next line of the snake

                                    so_range_clear <= '1'; -- request new part of snake

                                    new_state <= COL_SNAKE;
                                end if;
                            elsif (br_new_head_set = '1') then
                                if (br_new_head(4 downto 0) = x_range(4 downto 0)) then
                                    -- Possible collision
                                    if (br_new_head(9 downto 5) < y_range(4 downto 0)) or (br_new_head(9 downto 5) > y_range(9 downto 5)) then
                                        -- No collision
                                        -- Check the next line of the snake

                                        so_range_clear <= '1'; -- request new part of snake

                                        new_state <= COL_SNAKE;
                                        
                                    else
                                        -- Collision
                                        br_new_head_clear <= '1';
                                        br_new_head_ok <= '0';

                                        
                                        so_reset <= '1'; -- EVEN KIJKEN HOE WE DIT GAAN IMPLEMENTEREN

                                        new_state <= IDLE;
                                    end if;
                                else
                                    -- No collision
                                    -- Check the next line of the snake

                                    so_range_clear <= '1'; -- request new part of snake

                                    new_state <= COL_SNAKE;
                                end if;
                            else
                                -- PANICK
                                new_state <= IDLE;
                            end if;
                        else
                            -- Now we assume that y_range(start) = y_range(end). If somewhere this is fucked up, this will result in unwanted behaviour
                            -- Horizontal line
                            if (ig_item_loc_set = '1') then
                                if (ig_item_loc(9 downto 5) = y_range(4 downto 0)) then
                                    -- Possible collision
                                    if (ig_item_loc(4 downto 0) < x_range(4 downto 0)) or (ig_item_loc(4 downto 0) > x_range(9 downto 0)) then
                                        -- No collision
                                        -- Check the next line of the snake

                                        so_range_clear <= '1'; -- request new part of snake

                                        new_state <= COL_SNAKE;
                                    else 
                                        -- Collision
                                        ig_item_loc_clear <= '1';
                                        ig_item_ok <= '0';
                                        
                                        so_reset <= '1';
                                        
                                        new_state <= IDLE;
                                    end if;
                                else
                                    -- No collision
                                    -- Check the next line of the snake

                                    so_range_clear <= '1'; -- request new part of snake

                                    new_state <= COL_SNAKE;
                                end if; 
                            elsif (br_new_head_set = '1') then
                                if (br_new_head(9 downto 5) = y_range(4 downto 0)) then
                                    -- Possible collision
                                    if (br_new_head(4 downto 0) < x_range(4 downto 0)) or (br_new_head(4 downto 0) > x_range(9 downto 0)) then
                                        -- No collision
                                        -- Check the next line of the snake

                                        so_range_clear <= '1'; -- request new part of snake

                                        new_state <= COL_SNAKE;
                                    else 
                                        -- Collision
                                        br_new_head_clear <= '1';
                                        br_new_head_ok <= '0';
                                        
                                        so_reset <= '1';
                                        
                                        new_state <= IDLE;
                                    end if;
                                else
                                    -- No collision
                                    -- Check the next line of the snake

                                    so_range_clear <= '1'; -- request new part of snake

                                    new_state <= COL_SNAKE;
                                end if;
                            else
                                -- PANICK
                                new_state <= IDLE;
                            end if;
                        end if;
                    end if;
                else
                    new_state <= COL_SNAKE;
                end if;
        end case;
    end process;
end behaviour;

