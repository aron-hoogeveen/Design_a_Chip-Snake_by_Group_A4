----------------------------------------------------------------------
-- File:        col_detect-behaviour.vhd
-- Author:      Aron Hoogeveen
-- Project:     Design a Chip - EPO3
-- Description: This is the revisioned version of the Mealy machine 
--              version. This version should be a full Moore machine
-----------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

architecture behaviour of col_detect is
    type col_detect_state is (IDLE, CHECK_COL_WALL, COL_IG, COL_BR, COL_FOOD, CHECK_COL_ITEM_ONE, CHECK_COL_ITEM_TWO, CHECK_COL_SNAKE, REQ_NEW_PART, PU_SPEED, PU_INV_CONTROLS, PU_FLICK, WAIT_FOR_ITEMGEN, WAIT_FOR_ITEMGEN_FOOD, RESULT_SUCCES_IG, RESULT_SUCCES_BR, RESULT_COLLISION_IG, RESULT_COLLISION_BR, ERROR_FALL_BACK);
    signal state, new_state: col_detect_state;
    type col_detect_inter_t is (UNDEFINED, ITEMGEN, BUTTONREACT);
    signal inter_s, new_inter_s: col_detect_inter_t;
    signal collision, new_collision: std_logic;

begin
    
    lbl_col_detect_clk: process (clk)
    begin
        if (rising_edge(clk)) then
            if (reset = '1') then
                state <= IDLE;
                inter_s <= UNDEFINED;
                collision <= '0';
            else
                state <= new_state;
                inter_s <= new_inter_s;
                collision <= new_collision;
            end if;
        end if;
    end process;

    lbl_col_detect_state: process (state, ig_item_loc_set, ig_item_loc, ig_item_clear, st_item_one, st_item_two, x_range, y_range, so_range_set, so_tail, br_new_head_set, br_new_head_loc)
    begin
        case state is
--======================================================================
--==========                    IDLE                ====================
--======================================================================
            when IDLE =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                br_new_head_clear       <= '0';
                br_new_head_ok          <= '0';
                br_inverse_controls_set <= '0';
                --
                food_collision          <= '0';
                --
                gr_flickering_set       <= '0';
                --
                ig_item_loc_clear       <= '0';
                ig_item_ok              <= '0';
                ig_item_set             <= '0';
                ig_item_type            <= '0';
                --
                so_range_clear          <= '0';
                --
                sp_increase_speed_set   <= '0';
                --


                --------------------
                -- LOGIC
                --------------------
                if (ig_item_loc_set = '1') or (br_new_head_set = '1') then
                    new_state <= CHECK_COL_WALL;
                else
                    new_state <= IDLE;
                end if;

--======================================================================
--==========                 CHECK_COL_WALL         ====================
--======================================================================
            when CHECK_COL_WALL =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                br_new_head_clear       <= '0';
                br_new_head_ok          <= '0';
                br_inverse_controls_set <= '0';
                --
                food_collision          <= '0';
                --
                gr_flickering_set       <= '0';
                --
                ig_item_loc_clear       <= '0';
                ig_item_ok              <= '0';
                ig_item_set             <= '0';
                ig_item_type            <= '0';
                --
                so_range_clear          <= '0';
                --
                sp_increase_speed_set   <= '0';
                --

                --------------------
                -- LOGIC
                --------------------
                if (ig_item_loc_set = '1') then
                    -- ITEM GENERATOR
                    new_inter_s <= ITEMGEN;

                    if ig_item_loc(4 downto 0) = "00000" or ig_item_loc(4 downto 0) = "11111" or ig_item_loc(9 downto 5) = "00000" or ig_item_loc(9 downto 5) = "11000" then
                        -- Collision with a wall
                        new_state <= COL_IG;
                    else
                        -- Check for a collision with item one
                        new_state <= CHECK_COL_ITEM_ONE;
                    end if;
                elsif (br_new_head_set = '1') then
                    -- BUTTON REACT
                    new_inter_s <= BUTTONREACT;

                    if (br_new_head_loc(4 downto 0) = "00000") or (br_new_head_loc(4 downto 0) = "11111") or (br_new_head_loc(9 downto 5) = "00000") or (br_new_head_loc(9 downto 5) = "11000") then
                        -- Collision with wall
                        new_state <= COL_BR;
                    else
                        -- Check for a collision with item one
                        new_state <= CHECK_COL_ITEM_ONE;
                    end if;
                elsif (ig_item_loc_set = '1') and (br_new_head_set = '1') then
                    -- Prefer the check for new_head

                    new_inter_s <= BUTTONREACT;

                    if (br_new_head_loc(4 downto 0) = "00000") or (br_new_head_loc(4 downto 0) = "11111") or (br_new_head_loc(9 downto 5) = "00000") or (br_new_head_loc(9 downto 5) = "11000") then
                        -- Collision with wall
                        new_state <= COL_BR;
                    else
                        -- Check for a collision with item one
                        new_state <= CHECK_COL_ITEM_ONE;
                    end if;
                else
                    -- The communication went wrong. Let's go back to IDLE. Assume that if we had to check a new_head, it was ok. Otherwise the game will be game-over
                    -- For itemgenerator just signal that the generator was not ok

                    new_state <= ERROR_FALL_BACK;
                end if;

--======================================================================
--==========                 ERROR_FALL_BACK        ====================
--======================================================================
            when ERROR_FALL_BACK =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                br_new_head_clear       <= '1';         -- 
                br_new_head_ok          <= '1';         -- Assume the new_head is ok
                br_inverse_controls_set <= '0';
                --
                food_collision          <= '0';
                --
                gr_flickering_set       <= '0';
                --
                ig_item_loc_clear       <= '1';         -- 
                ig_item_ok              <= '0';         -- Let Itemgen generate another location
                ig_item_set             <= '0';
                ig_item_type            <= '0';
                --
                so_range_clear          <= '0';
                --
                sp_increase_speed_set   <= '0';
                --

                --------------------
                -- LOGIC
                --------------------
                new_state <= IDLE;

--======================================================================
--==========                COL_IG                  ====================
--======================================================================
            when COL_IG =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                br_new_head_clear       <= '0';
                br_new_head_ok          <= '0';
                br_inverse_controls_set <= '0';
                --
                food_collision          <= '0';
                --
                gr_flickering_set       <= '0';
                --
                ig_item_loc_clear       <= '1';     -- Check done
                ig_item_ok              <= '0';     -- Item not ok
                ig_item_set             <= '0';
                ig_item_type            <= '0';
                --
                so_range_clear          <= '0';
                --
                sp_increase_speed_set   <= '0';
                --

                --------------------
                -- LOGIC
                --------------------
                new_state <= IDLE;

--======================================================================
--==========                COL_BR                  ====================
--======================================================================
            when COL_BR =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                br_new_head_clear       <= '1';     -- Check done
                br_new_head_ok          <= '0';     -- New head not ok
                br_inverse_controls_set <= '0';
                --
                food_collision          <= '0';
                --
                gr_flickering_set       <= '0';
                --
                ig_item_loc_clear       <= '0';
                ig_item_ok              <= '0';
                ig_item_set             <= '0';
                ig_item_type            <= '0';
                --
                so_range_clear          <= '0';
                --
                sp_increase_speed_set   <= '0';
                --

                --------------------
                -- LOGIC
                --------------------
                new_state <= IDLE;

--======================================================================
--==========                COL_FOOD                ====================
--======================================================================
            when COL_FOOD =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                br_new_head_clear       <= '1';     -- Check done
                br_new_head_ok          <= '1';     -- New head ok
                br_inverse_controls_set <= '0';
                --
                food_collision          <= '1';     -- Food is opgegeten (only needs to be high for 1 clock period)
                --
                gr_flickering_set       <= '0';
                --
                ig_item_loc_clear       <= '0';
                ig_item_ok              <= '0';
                ig_item_set             <= '1';     -- Request a food item generation
                ig_item_type            <= '0';     -- food item
                --
                so_range_clear          <= '0';
                --
                sp_increase_speed_set   <= '0';
                --

                --------------------
                -- LOGIC
                --------------------
                new_state <= WAIT_FOR_ITEMGEN_FOOD;

--======================================================================
--==========          CHECK_COL_ITEM_ONE            ====================
--======================================================================
            when CHECK_COL_ITEM_ONE =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                br_new_head_clear       <= '0';
                br_new_head_ok          <= '0';
                br_inverse_controls_set <= '0';
                --
                food_collision          <= '0';
                --
                gr_flickering_set       <= '0';
                --
                ig_item_loc_clear       <= '0';
                ig_item_ok              <= '0';
                ig_item_set             <= '0';
                ig_item_type            <= '0';
                --
                so_range_clear          <= '0';
                --
                sp_increase_speed_set   <= '0';
                ----

                --------------------
                -- LOGIC
                --------------------
                if (st_item_one(11 downto 2) = "0000000000") then
                    new_state <= CHECK_COL_ITEM_TWO;
                else
                    if (inter_s = ITEMGEN) then
                        if (st_item_one(11 downto 2) = ig_item_loc) then
                            -- Location is not free
                            new_state <= COL_IG;
                        else
                            -- Check for a collision with the second item
                            new_state <= CHECK_COL_ITEM_TWO;
                        end if;
                    --elsif (inter_s = BUTTONREACT) then
                    else
                        -- inter_s = probably BUTTONREACT
                        if (st_item_one(11 downto 2) = br_new_head_loc) then
                            -- Collision with item
                            if (st_item_one(1 downto 0) = "00") then
                                -- Food item
                                new_state <= COL_FOOD;
                            elsif (st_item_one(1 downto 0) = "01") then
                                -- Power-up of type Speed Increase
                                new_state <= PU_SPEED;
                            elsif (st_item_one(1 downto 0) = "10") then
                                -- Power-up of type Inverse Controls
                                new_state <= PU_INV_CONTROLS;
                            else
                                -- Power-up of type Flickering
                                new_state <= PU_FLICK;
                            end if;
                        else
                            -- Check for a collision with the snake's body
                            new_state <= CHECK_COL_SNAKE;
                        end if;
                    end if;
                end if;

--======================================================================
--==========            CHECK_COL_ITEM_TWO          ====================
--======================================================================
            when CHECK_COL_ITEM_TWO =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                br_new_head_clear       <= '0';
                br_new_head_ok          <= '0';
                br_inverse_controls_set <= '0';
                --
                food_collision          <= '0';
                --
                gr_flickering_set       <= '0';
                --
                ig_item_loc_clear       <= '0';
                ig_item_ok              <= '0';
                ig_item_set             <= '0';
                ig_item_type            <= '0';
                --
                so_range_clear          <= '0';
                --
                sp_increase_speed_set   <= '0';
                --


                --------------------
                -- LOGIC
                --------------------
                if (st_item_two(11 downto 2) = "0000000000") then
                    new_state <= CHECK_COL_SNAKE;
                else
                    if (inter_s = ITEMGEN) then
                        if (st_item_two(11 downto 2) = ig_item_loc) then
                            -- Location is not free
                            new_state <= COL_IG;
                        else
                            -- Check for a collision with the second item
                            new_state <= CHECK_COL_SNAKE;
                        end if;
                    --elsif (inter_s = BUTTONREACT) then
                    else
                        -- inter_s = probably BUTTONREACT
                        if (st_item_two(11 downto 2) = br_new_head_loc) then
                            -- Collision with power-up
                            if (st_item_two(1 downto 0) = "00") then
                                -- Food item
                                new_state <= COL_FOOD;
                            elsif (st_item_two(1 downto 0) = "01") then
                                -- Power-up of type Speed Increase
                                new_state <= PU_SPEED;
                            elsif (st_item_two(1 downto 0) = "10") then
                                -- Power-up of type Inverse Controls
                                new_state <= PU_INV_CONTROLS;
                            else
                                -- Power-up of type Flickering
                                new_state <= PU_FLICK;
                            end if;
                        else
                            -- Check for a collision with the snake's body
                            new_state <= CHECK_COL_SNAKE;
                        end if;
                    end if;
                end if;

--======================================================================
--==========            CHECK_COL_SNAKE             ====================
--======================================================================
            when CHECK_COL_SNAKE =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                br_new_head_clear       <= '0';
                br_new_head_ok          <= '0';
                br_inverse_controls_set <= '0';
                --
                food_collision          <= '0';
                --
                gr_flickering_set       <= '0';
                --
                ig_item_loc_clear       <= '0';
                ig_item_ok              <= '0';
                ig_item_set             <= '0';
                ig_item_type            <= '0';
                --
                so_range_clear          <= '0';
                --
                sp_increase_speed_set   <= '0';
                --


                --------------------
                -- LOGIC
                --------------------
                -- Note: After a global reset there will always be the first two corners on the output of Snake Out
                -- Check if there is a new corner on the output of Snake Out
                if (so_range_set = '1') then
                    -- Is the part of the snake horizontally or vertically oriented?
                    if (x_range(9 downto 5) = x_range(4 downto 0)) then
                        -- VERTICALLY ORIENTED
                        if (inter_s = ITEMGEN) then
                            if (ig_item_loc(4 downto 0) = x_range(4 downto 0)) then
                                -- Possible collision
                                if (ig_item_loc(9 downto 5) < y_range(4 downto 0)) or (ig_item_loc(9 downto 5) > y_range(9 downto 5)) then
                                    -- No collision
                                    if (so_tail = '1') then
                                        -- Snake Collision Check succesfull.
                                        new_state <= RESULT_SUCCES_IG;
                                    else
                                        -- Request new part of the snake
                                        new_state <= REQ_NEW_PART;
                                    end if;
                                else 
                                    -- collision
                                    new_state <= RESULT_COLLISION_IG;
                                end if;
                            else
                                -- No collision.
                                if (so_tail = '1') then
                                    -- Snake Collision check successfull
                                    new_state <= RESULT_SUCCES_IG;
                                else
                                    -- Request new part of the snake
                                    new_state <= REQ_NEW_PART;
                                end if;
                            end if;
                        else
                            -- BUTTONREACT
                            if (br_new_head_loc(4 downto 0) = x_range(4 downto 0)) then
                                -- Possible collision
                                if (br_new_head_loc(9 downto 5) < y_range(4 downto 0)) or (br_new_head_loc(9 downto 5) > y_range(9 downto 5)) then
                                    -- No collision
                                    if (so_tail = '1') then
                                        -- Snake Collision Check succesfull.
                                        new_state <= RESULT_SUCCES_BR;
                                    else
                                        -- Request new part of the snake
                                        new_state <= REQ_NEW_PART;
                                    end if;
                                else 
                                    -- collision
                                    new_state <= RESULT_COLLISION_BR;
                                end if;
                            else
                                -- No collision.
                                if (so_tail = '1') then
                                    -- Snake Collision check successfull
                                    new_state <= RESULT_SUCCES_BR;
                                else
                                    -- Request new part of the snake
                                    new_state <= REQ_NEW_PART;
                                end if;
                            end if;
                        end if;
                    else
                        -- HORIZONTALLY ORIENTATION
                        if (inter_s = ITEMGEN) then
                            if (ig_item_loc(9 downto 5) = y_range(4 downto 0)) then
                                -- Possible collision
                                if (ig_item_loc(4 downto 0) < x_range(4 downto 0)) or (ig_item_loc(4 downto 0) > x_range(9 downto 0)) then
                                    -- No collision
                                    if (so_tail = '1') then
                                        new_state <= RESULT_SUCCES_IG;
                                    else
                                        new_state <= REQ_NEW_PART;
                                    end if;
                                else
                                    -- Collision
                                    new_state <= RESULT_COLLISION_IG;
                                end if;
                            else
                                -- No collision
                                if (so_tail <= '1') then
                                    new_state <= RESULT_SUCCES_IG;
                                else 
                                    new_state <= REQ_NEW_PART;
                                end if;
                            end if;
                        else 
                            -- BUTTONREACT
                            if (br_new_head_loc(9 downto 5) = y_range(4 downto 0)) then
                                -- Possible collision
                                if (br_new_head_loc(4 downto 0) < x_range(4 downto 0)) or (br_new_head_loc(4 downto 0) > x_range(9 downto 0)) then
                                    -- No collision
                                    if (so_tail = '1') then
                                        new_state <= RESULT_SUCCES_BR;
                                    else
                                        new_state <= REQ_NEW_PART;
                                    end if;
                                else
                                    -- Collision
                                    new_state <= RESULT_COLLISION_BR;
                                end if;
                            else
                                -- No collision
                                if (so_tail <= '1') then
                                    new_state <= RESULT_SUCCES_BR;
                                else 
                                    new_state <= REQ_NEW_PART;
                                end if;
                            end if;
                        end if;
                    end if;
                else
                    -- Wait for the new corners
                    new_state <= CHECK_COL_SNAKE;
                end if;

--======================================================================
--==========             REQ_NEW_PART               ====================
--======================================================================
            when REQ_NEW_PART =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                br_new_head_clear       <= '0';
                br_new_head_ok          <= '0';
                br_inverse_controls_set <= '0';
                --
                food_collision          <= '0';
                --
                gr_flickering_set       <= '0';
                --
                ig_item_loc_clear       <= '0';
                ig_item_ok              <= '0';
                ig_item_set             <= '0';
                ig_item_type            <= '0';
                --
                so_range_clear          <= '1';     -- Request new corners
                --
                sp_increase_speed_set   <= '0';
                --


                --------------------
                -- LOGIC
                --------------------
                new_state <= CHECK_COL_SNAKE;

--======================================================================
--==========             PU_SPEED                   ====================
--======================================================================
            when PU_SPEED =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                br_new_head_clear       <= '1';     -- Check done
                br_new_head_ok          <= '1';     -- New head ok
                br_inverse_controls_set <= '0';
                --
                food_collision          <= '0';
                --
                gr_flickering_set       <= '0';
                --
                ig_item_loc_clear       <= '0';
                ig_item_ok              <= '0';
                ig_item_set             <= '1';     -- Generate a new item
                ig_item_type            <= '1';     -- Item type Power-up
                --
                so_range_clear          <= '0';
                --
                sp_increase_speed_set   <= '1';     -- Power-up increase speed
                --


                --------------------
                -- LOGIC
                --------------------
                new_state <= WAIT_FOR_ITEMGEN;

--======================================================================
--==========             PU_INV_CONTROLS            ====================
--======================================================================
            when PU_INV_CONTROLS =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                br_new_head_clear       <= '1';     -- Check done
                br_new_head_ok          <= '1';     -- New head ok
                br_inverse_controls_set <= '1';     -- Power-up inverse controls
                --
                food_collision          <= '0';
                --
                gr_flickering_set       <= '0';
                --
                ig_item_loc_clear       <= '0';
                ig_item_ok              <= '0';
                ig_item_set             <= '1';     -- Generate a new item
                ig_item_type            <= '1';     -- Item type Power-up
                --
                so_range_clear          <= '0';
                --
                sp_increase_speed_set   <= '0';
                --


                --------------------
                -- LOGIC
                --------------------
                new_state <= WAIT_FOR_ITEMGEN;

--======================================================================
--==========             PU_FLICK                   ====================
--======================================================================
            when PU_FLICK =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                br_new_head_clear       <= '1';     -- Check done
                br_new_head_ok          <= '1';     -- New head ok
                br_inverse_controls_set <= '0';
                --
                food_collision          <= '0';
                --
                gr_flickering_set       <= '1';     -- Power-up flickering 
                --
                ig_item_loc_clear       <= '0';
                ig_item_ok              <= '0';
                ig_item_set             <= '1';     -- Generate a new item
                ig_item_type            <= '1';     -- Item type Power-up
                --
                so_range_clear          <= '0';
                --
                sp_increase_speed_set   <= '0';
                --


                --------------------
                -- LOGIC
                --------------------
                new_state <= WAIT_FOR_ITEMGEN;

--======================================================================
--==========             WAIT_FOR_ITEMGEN           ====================
--======================================================================
            when WAIT_FOR_ITEMGEN =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                br_new_head_clear       <= '0';
                br_new_head_ok          <= '0';
                br_inverse_controls_set <= '0';
                --
                food_collision          <= '0';
                --
                gr_flickering_set       <= '0';
                --
                ig_item_loc_clear       <= '0';
                ig_item_ok              <= '0';
                ig_item_set             <= '1';
                ig_item_type            <= '1';
                --
                so_range_clear          <= '0';
                --
                sp_increase_speed_set   <= '0';
                --


                --------------------
                -- LOGIC
                --------------------
                if (ig_item_clear = '1') then
                    new_state <= IDLE;
                else
                    new_state <= WAIT_FOR_ITEMGEN;
                end if;

--======================================================================
--==========             WAIT_FOR_ITEMGEN_FOOD      ====================
--======================================================================
            when WAIT_FOR_ITEMGEN_FOOD =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                br_new_head_clear       <= '0';
                br_new_head_ok          <= '0';
                br_inverse_controls_set <= '0';
                --
                food_collision          <= '0';
                --
                gr_flickering_set       <= '0';
                --
                ig_item_loc_clear       <= '0';
                ig_item_ok              <= '0';
                ig_item_set             <= '1';
                ig_item_type            <= '0';
                --
                so_range_clear          <= '0';
                --
                sp_increase_speed_set   <= '0';
                --


                --------------------
                -- LOGIC
                --------------------
                if (ig_item_clear = '1') then
                    new_state <= IDLE;
                else
                    new_state <= WAIT_FOR_ITEMGEN_FOOD;
                end if;

--======================================================================
--==========                RESULT_SUCCES_IG        ====================
--======================================================================
            when RESULT_SUCCES_IG =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                br_new_head_clear       <= '0';
                br_new_head_ok          <= '0';
                br_inverse_controls_set <= '0';
                --
                food_collision          <= '0';
                --
                gr_flickering_set       <= '0';
                --
                ig_item_loc_clear       <= '1';
                ig_item_ok              <= '1';
                ig_item_set             <= '0';
                ig_item_type            <= '0';
                --
                so_range_clear          <= '0';
                --
                sp_increase_speed_set   <= '0';
                --


                --------------------
                -- LOGIC
                --------------------
                new_state <= IDLE;

--======================================================================
--==========                RESULT_SUCCES_BR        ====================
--======================================================================
            when RESULT_SUCCES_BR =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                br_new_head_clear       <= '1';
                br_new_head_ok          <= '1';
                br_inverse_controls_set <= '0';
                --
                food_collision          <= '0';
                --
                gr_flickering_set       <= '0';
                --
                ig_item_loc_clear       <= '0';
                ig_item_ok              <= '0';
                ig_item_set             <= '0';
                ig_item_type            <= '0';
                --
                so_range_clear          <= '0';
                --
                sp_increase_speed_set   <= '0';
                --


                --------------------
                -- LOGIC
                --------------------
                new_state <= IDLE;

--======================================================================
--==========            RESULT_COLLISION_IG         ====================
--======================================================================
            when RESULT_COLLISION_IG =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                br_new_head_clear       <= '0';
                br_new_head_ok          <= '0';
                br_inverse_controls_set <= '0';
                --
                food_collision          <= '0';
                --
                gr_flickering_set       <= '0';
                --
                ig_item_loc_clear       <= '1';
                ig_item_ok              <= '0';
                ig_item_set             <= '0';
                ig_item_type            <= '0';
                --
                so_range_clear          <= '0';
                --
                sp_increase_speed_set   <= '0';
                --


                --------------------
                -- LOGIC
                --------------------
                new_state <= IDLE;

--======================================================================
--==========            RESULT_COLLISION_BR         ====================
--======================================================================
            when RESULT_COLLISION_BR =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                br_new_head_clear       <= '1';
                br_new_head_ok          <= '0';
                br_inverse_controls_set <= '0';
                --
                food_collision          <= '0';
                --
                gr_flickering_set       <= '0';
                --
                ig_item_loc_clear       <= '0';
                ig_item_ok              <= '0';
                ig_item_set             <= '0';
                ig_item_type            <= '0';
                --
                so_range_clear          <= '0';
                --
                sp_increase_speed_set   <= '0';
                --


                --------------------
                -- LOGIC
                --------------------
                new_state <= IDLE;

        end case;
    end process;
end behaviour;