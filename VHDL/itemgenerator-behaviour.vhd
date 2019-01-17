----------------------------------------------------------------------
-- File:        itemgenerator-behavioural.vhd
-- Author:      Aron Hoogeveen
-- Project:     Design a Chip - EPO3
-- Description: This is the revisioned version of the Mealy machine 
--              version. This version should be a full Moore machine
-----------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of itemgenerator is
--======================================================================
--==========              COMPONENT DECLARATIONS              ==========
--======================================================================
    component shift_register is
        port (clk, reset, enable, D : in std_logic; Q : out std_logic_vector(11 downto 0));
    end component;

    component counter4 is
        port (clk, reset, manual_reset, enable : in std_logic; z_out: out std_logic_vector(3 downto 0));
    end component;

    component counter_fps is
        port (clk, reset, start, fps: in std_logic; z_out: out std_logic);
    end component;

    component rng is
        port (clk, reset : in std_logic; z : out std_logic);
    end component;

    type itemGenerator_state is (IDLE, START_TIMER, SHIFT_FOOD_ONE, SHIFT_FOOD_TWO, GEN_LOC, GEN_LOC_ZERO, CHECK_LOC, SHIFT_REG_ONE, SHIFT_REG_TWO, SEND_LOC, GEN_PU, GEN_PU_ZERO, GEN_PU_RNG);
    signal state, new_state: itemGenerator_state;
    signal counter_out: std_logic_vector(3 downto 0);
    signal counter_enable, counter_reset, register_enable, register_D: std_logic;
    signal rng_out: std_logic;  -- only enable this signal when the rng is finished 
    signal register_Q: std_logic_vector(11 downto 0);
    signal countfps_done, countfps_start: std_logic;

begin
    
    count4: counter4 port map (clk=>clk, reset=>reset, manual_reset=>counter_reset, enable=>counter_enable, z_out=>counter_out);
    shift_reg: shift_register port map (clk=>clk, reset=>reset, enable=>register_enable, D=>register_D, Q=>register_Q);
    fpscount: counter_fps port map (clk=>clk, reset=>reset, start=>countfps_start, fps=>countfps_fps, z_out=>countfps_done);
    IG_rng: rng port map (clk=>clk, reset=>reset, z=>rng_out);


    lbl_itemgen_clk: process (clk)
    begin
        if (rising_edge(clk)) then
            if (reset = '1') then
                state <= IDLE;
            else
                state <= new_state;
            end if;
        end if;
    end process;

    lbl_itemgen_state: process (state, snake_item_set, snake_req_item, snake_item_loc_clear, snake_item_ok, storage_item_clear, countfps_done, counter_out, rng_out, register_Q)
    begin
        case state is
--======================================================================
--==========                    IDLE                          ==========
--======================================================================
            when IDLE =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                snake_item_clear                <= '0';
                snake_item_loc_set              <= '0';
                snake_item_loc                  <= (others => '0');
                --
                storage_item_set                <= '0';
                storage_item_loc                <= (others => '0');
                --
                counter_reset                   <= '0';
                counter_enable                  <= '0';
                --
                register_enable                 <= '0';
                register_D                      <= '0';
                --
                countfps_start                  <= '0';
                --


                --------------------
                -- LOGIC
                --------------------
                if (snake_item_set = '1') and (snake_req_item = '0') then
                    -- Generate a food item
                    new_state <= SHIFT_FOOD_ONE;
                elsif (snake_item_set = '1') and (snake_req_item = '1') then
                    -- Start the timer after which a power-up will be generated
                    new_state <= START_TIMER;
                elsif (snake_item_set = '0') and (countfps_done = '1') then
                    -- Generate a power-up
                    new_state <= GEN_PU;
                else
                    new_state <= IDLE;
                end if;

--======================================================================
--==========                   START_TIMER                    ==========
--======================================================================
            when START_TIMER =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                snake_item_clear                <= '0';
                snake_item_loc_set              <= '0';
                snake_item_loc                  <= (others => '0');
                --
                storage_item_set                <= '0';
                storage_item_loc                <= (others => '0');
                --
                counter_reset                   <= '0';
                counter_enable                  <= '0';
                --
                register_enable                 <= '0';
                register_D                      <= '0';
                --
                countfps_start                  <= '1';
                --


                --------------------
                -- LOGIC
                --------------------
                new_state <= IDLE;

--======================================================================
--==========                     GEN_PU                       ==========
--======================================================================
            when GEN_PU =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                snake_item_clear                <= '0';
                snake_item_loc_set              <= '0';
                snake_item_loc                  <= (others => '0');
                --
                storage_item_set                <= '0';
                storage_item_loc                <= (others => '0');
                --
                counter_reset                   <= '0';
                counter_enable                  <= '0';
                --
                register_enable                 <= '1';
                register_D                      <= rng_out;
                --
                countfps_start                  <= '1';             -- This additional start signal will reset the countfps counter
                --


                --------------------
                -- LOGIC
                --------------------
                if (rng_out = '0') then
                    new_state <= GEN_PU_ZERO;
                else 
                    new_state <= GEN_PU_RNG;
                end if;

--======================================================================
--==========                     GEN_PU_RNG                   ==========
--======================================================================
            when GEN_PU_RNG =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                snake_item_clear                <= '0';
                snake_item_loc_set              <= '0';
                snake_item_loc                  <= (others => '0');
                --
                storage_item_set                <= '0';
                storage_item_loc                <= (others => '0');
                --
                counter_reset                   <= '0';
                counter_enable                  <= '0';
                --
                register_enable                 <= '1';             
                register_D                      <= rng_out;
                --
                countfps_start                  <= '0';
                --


                --------------------
                -- LOGIC
                --------------------
                new_state <= GEN_LOC;

--======================================================================
--==========                     GEN_PU_ZERO                  ==========
--======================================================================
            when GEN_PU_ZERO =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                snake_item_clear                <= '0';
                snake_item_loc_set              <= '0';
                snake_item_loc                  <= (others => '0');
                --
                storage_item_set                <= '0';
                storage_item_loc                <= (others => '0');
                --
                counter_reset                   <= '0';
                counter_enable                  <= '0';
                --
                register_enable                 <= '1';                 -- Enable register  
                register_D                      <= '0';                   -- D = '0'
                --
                countfps_start                  <= '0';
                --


                --------------------
                -- LOGIC
                --------------------
                new_state <= GEN_LOC;

--======================================================================
--==========                   SHIFT_FOOD_ONE                 ==========
--======================================================================
            when SHIFT_FOOD_ONE =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                snake_item_clear                <= '1';             -- Let module Snake know we will process the request
                snake_item_loc_set              <= '0';
                snake_item_loc                  <= (others => '0');
                --
                storage_item_set                <= '0';
                storage_item_loc                <= (others => '0');
                --
                counter_reset                   <= '0';             
                counter_enable                  <= '0';
                --
                register_enable                 <= '1';             -- Shift D into register
                register_D                      <= '0';             -- D = '0'
                --
                countfps_start                  <= '0';
                --


                --------------------
                -- LOGIC
                --------------------
                -- The counter will be reset every time we are done with it, so no need to reset the counter at this moment
                new_state <= SHIFT_FOOD_TWO;

--======================================================================
--==========                   SHIFT_FOOD_TWO                 ==========
--======================================================================
            when SHIFT_FOOD_TWO =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                snake_item_clear                <= '0';
                snake_item_loc_set              <= '0';
                snake_item_loc                  <= (others => '0');
                --
                storage_item_set                <= '0';
                storage_item_loc                <= (others => '0');
                --
                counter_reset                   <= '0';             
                counter_enable                  <= '1';             -- Let the counter start counting for the gen loc state
                --
                register_enable                 <= '1';             -- Shift D into register
                register_D                      <= '0';             -- D = '0'
                --
                countfps_start                  <= '0';
                --


                --------------------
                -- LOGIC
                --------------------
                new_state <= GEN_LOC;

--======================================================================
--==========                    ENABLE_COUNTER                ==========
--======================================================================
--            when ENABLE_COUNTER =>
--                --------------------
--                -- SIGNAL VALUES
--                --------------------
--                snake_item_clear                <= '0';
--                snake_item_loc_set              <= '0';
--                snake_item_loc                  <= (others => '0');
--                --
--                storage_item_set                <= '0';
--                storage_item_loc                <= (others => '0');
--                --
--                counter_reset                   <= '0';
--                counter_enable                  <= '1';             -- Start counting (amount of item bits)
--                --
--                register_enable                 <= '1';             -- Add D to shift register
--                register_D                      <= rng_out;         -- D = rng_out
--                --
--                countfps_start                  <= '0';
--                --
--
--
--                --------------------
--                -- LOGIC
--                --------------------
--
--                if (counter_out = "1000") then
--                    -- Generate the second last bit. 
--                    if (register_Q(11) = '1') then
--                        -- Make the last bit '0', otherwise y will go out of bound
--                        new_state <= GEN_LOC_ZERO;
--                    else
--                        new_state <= GEN_LOC;
--                    end if;
--                elsif (counter_out = "1001") then 
--                    -- Ten bits have been generated.
--                    -- Check the generated location
--                    new_state <= CHECK_LOC;
--                else
--                    -- Add another bit to the shift register
--                    new_state <= GEN_LOC;
--                end if;

--======================================================================
--==========                    GEN_LOC                       ==========
--======================================================================
            when GEN_LOC =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                snake_item_clear                <= '0';
                snake_item_loc_set              <= '0';
                snake_item_loc                  <= (others => '0');
                --
                storage_item_set                <= '0';
                storage_item_loc                <= (others => '0');
                --
                counter_reset                   <= '0';
                counter_enable                  <= '1';             -- Start counting (amount of item bits)
                --
                register_enable                 <= '1';             -- Add D to shift register
                register_D                      <= rng_out;         -- D = rng_out
                --
                countfps_start                  <= '0';
                --


                --------------------
                -- LOGIC
                --------------------

                if (counter_out = "0111") then
                    -- Generate the second last bit. 
                    if (register_Q(11) = '1') then
                        -- Make the last bit '0', otherwise y will go out of bound
                        new_state <= GEN_LOC_ZERO;
                    else
                        new_state <= GEN_LOC;
                    end if;
                elsif (counter_out = "1000") then
                    -- Ten bits have been generated.
                    -- Check the generated location
                    new_state <= CHECK_LOC;
                else
                    -- Add another bit to the shift register
                    new_state <= GEN_LOC;
                end if;

--======================================================================
--==========                    GEN_LOC_ZERO                  ==========
--======================================================================
            when GEN_LOC_ZERO =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                snake_item_clear                <= '0';
                snake_item_loc_set              <= '0';
                snake_item_loc                  <= (others => '0');
                --
                storage_item_set                <= '0';
                storage_item_loc                <= (others => '0');
                --
                counter_reset                   <= '0';
                counter_enable                  <= '1';             -- Start counting (amount of item bits)
                --
                register_enable                 <= '1';             -- Add D to shift register
                register_D                      <= '0';             -- D = '0'
                --
                countfps_start                  <= '0';
                --


                --------------------
                -- LOGIC
                --------------------
                new_state <= CHECK_LOC;             -- loc state

--======================================================================
--==========                   CHECK_LOC                      ==========
--======================================================================
            when CHECK_LOC =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                snake_item_clear                <= '0';
                snake_item_loc_set              <= '1';                 -- Check loc
                snake_item_loc                  <= register_Q(11 downto 2); -- Check log
                --
                storage_item_set                <= '0';
                storage_item_loc                <= (others => '0');
                --
                counter_reset                   <= '1';                 -- Reset the counter             
                counter_enable                  <= '0';
                --
                register_enable                 <= '0';
                register_D                      <= '0';
                --
                countfps_start                  <= '0';
                --


                --------------------
                -- LOGIC
                --------------------
                if (snake_item_loc_clear = '1') and (snake_item_ok = '1') then
                    -- Generated location was ok
                    new_state <= SEND_LOC;
                elsif (snake_item_loc_clear = '1') and (snake_item_ok = '0') then
                    -- Generated location was not ok, shift type bits and generate new location
                    new_state <= SHIFT_REG_ONE;
                else
                    new_state <= CHECK_LOC;
                end if;

--======================================================================
--==========                    SHIFT_REG_ONE                 ==========
--======================================================================
            when SHIFT_REG_ONE =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                snake_item_clear                <= '0';
                snake_item_loc_set              <= '0';
                snake_item_loc                  <= (others => '0');
                --
                storage_item_set                <= '0';
                storage_item_loc                <= (others => '0');
                --
                counter_reset                   <= '0';
                counter_enable                  <= '0';
                --
                register_enable                 <= '1';             -- Enable the register
                register_D                      <= register_Q(0);             -- Shift first bit back into reg
                --
                countfps_start                  <= '0';
                --


                --------------------
                -- LOGIC
                --------------------
                new_state <= SHIFT_REG_TWO;

--======================================================================
--==========                    SHIFT_REG_TWO                 ==========
--======================================================================
            when SHIFT_REG_TWO =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                snake_item_clear                <= '0';
                snake_item_loc_set              <= '0';
                snake_item_loc                  <= (others => '0');
                --
                storage_item_set                <= '0';
                storage_item_loc                <= (others => '0');
                --
                counter_reset                   <= '0';
                counter_enable                  <= '0';
                --
                register_enable                 <= '1';             -- Enable the register
                register_D                      <= register_Q(0);             -- Shift first bit back into reg
                --
                countfps_start                  <= '0';
                --


                --------------------
                -- LOGIC
                --------------------
                new_state <= GEN_LOC;

--======================================================================
--==========                      SEND_LOC                    ==========
--======================================================================
            when SEND_LOC =>
                --------------------
                -- SIGNAL VALUES
                --------------------
                snake_item_clear                <= '0';
                snake_item_loc_set              <= '0';
                snake_item_loc                  <= (others => '0');
                --
                storage_item_set                <= '1';
                storage_item_loc                <= register_Q;
                --
                counter_reset                   <= '0';
                counter_enable                  <= '0';
                --
                register_enable                 <= '0';
                register_D                      <= '0';
                --
                countfps_start                  <= '0';
                --


                --------------------
                -- LOGIC
                --------------------
                if (storage_item_clear = '1') then
                    new_state <= IDLE;
                else
                    new_state <= SEND_LOC;
                end if;

        end case;
    end process;
end behaviour;