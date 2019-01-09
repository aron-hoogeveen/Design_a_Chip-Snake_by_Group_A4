library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of itemgenerator is
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

    type itemGenerator_state is (IDLE, GEN_TYPE, GEN_TYPE_PU_ONE, GEN_TYPE_PU_TWO, SHIFT_FOOD_ONE, SHIFT_FOOD_TWO, GEN_LOC, SHIFT_REG_ONE, SHIFT_REG_TWO, CHECK_LOC, SEND_LOC);
    signal state, new_state: itemGenerator_state;
    signal counter_out, count_comp: std_logic_vector(3 downto 0);
    signal counter_enable, counter_reset, register_enable, register_D: std_logic;
    signal rng_out: std_logic;  -- only enable this signal when the rng is finished 
    signal register_Q: std_logic_vector(11 downto 0);
    signal countfps_done, countfps_start: std_logic;

begin
    
    count4: counter4 port map (clk=>clk, reset=>reset, manual_reset=>counter_reset, enable=>counter_enable, z_out=>counter_out);
    shift_reg: shift_register port map (clk=>clk, reset=>reset, enable=>register_enable, D=>register_D, Q=>register_Q);
    fpscount: counter_fps port map (clk=>clk, reset=>reset, start=>countfps_start, fps=>countfps_fps, z_out=>countfps_done);
    IG_rng: rng port map (clk=>clk, reset=>reset, z=>rng_out);

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

    lbl2: process(state, snake_item_set, snake_req_item, snake_item_loc_clear, snake_item_ok, rng_out, storage_item_clear, counter_out, register_Q, countfps_done)
    begin
        case state is
            when IDLE =>
                --------------------
                -- Initial values --
                --------------------
                snake_item_clear <= '0';
                snake_item_loc_set <= '0';
                snake_item_loc <= (others => '0');
                storage_item_set <= '0';
                storage_item <= (others => '0');
                -----
                counter_reset <= '1';
                counter_enable <= '0';
                register_enable <= '0';
                register_D <= '0';
                -----
                countfps_start <= '0';
                -----


                -- Now check if snake wants us to generate a new item (and what
                -- for type of item)
                if (snake_item_set = '1') and (snake_req_item = '0') then
                    -- Generate a food item "00"

                    -- Let Snake know that we proccessed the request
                    snake_item_clear <= '1';
                    
                    -- Now loop through the states that put the item type bits 
                    -- into the shift register
                    new_state <= SHIFT_FOOD_ONE;
                elsif (snake_item_set = '1') and (snake_req_item = '1') then
                    -- Wait for count_fps_done and then generate the pu item
                    countfps_start <= '1';

                    -- Let Snake know that we proccessed the request
                    snake_item_clear <= '1';

                    new_state <= IDLE;
                elsif (snake_item_set = '0') and (countfps_done = '1') then
                    -- Time has gone by, and now generate the pu
                    -- If the fpscounter receives a start signal when it is in the finished state, it will work as a reset signal
                    countfps_start <= '1';

                    new_state <= GEN_TYPE;
                else
                    new_state <= IDLE;
                end if;

            when GEN_TYPE =>
                --------------------
                -- Initial values --
                --------------------
                snake_item_clear <= '0';
                snake_item_loc_set <= '0';
                snake_item_loc <= (others => '0');
                storage_item_set <= '0';
                storage_item <= (others => '0');
                -----
                counter_reset <= '1';
                counter_enable <= '0';
                register_enable <= '0';
                register_D <= '0';
                -----
                countfps_start <= '0';
                -----

                if (rng_out = '0') then
                    -- The only possible outcome of the second bit is now 1, as 0 means 'food'
                    register_enable <= '1';
                    register_D <= rng_out;

                    new_state <= GEN_TYPE_PU_ONE;
                else
                    register_enable <= '1';
                    register_D <= rng_out;

                    new_state <= GEN_TYPE_PU_TWO;
                end if;

            when GEN_TYPE_PU_ONE =>
                --------------------
                -- Initial values --
                --------------------
                snake_item_clear <= '0';
                snake_item_loc_set <= '0';
                snake_item_loc <= (others => '0');
                storage_item_set <= '0';
                storage_item <= (others => '0');
                -----
                counter_reset <= '1';
                counter_enable <= '0';
                register_enable <= '0';
                register_D <= '0';
                -----
                countfps_start <= '0';
                -----

                register_enable <= '1';
                register_D <= '1';

                new_state <= GEN_LOC;

            when GEN_TYPE_PU_TWO =>
                --------------------
                -- Initial values --
                --------------------
                snake_item_clear <= '0';
                snake_item_loc_set <= '0';
                snake_item_loc <= (others => '0');
                storage_item_set <= '0';
                storage_item <= (others => '0');
                -----
                counter_reset <= '1';
                counter_enable <= '0';
                register_enable <= '0';
                register_D <= '0';
                -----
                countfps_start <= '0';
                -----

                register_enable <= '1';
                register_D <= rng_out;

                new_state <= GEN_LOC;

            when SHIFT_FOOD_ONE =>
                --------------------
                -- Initial values --
                --------------------
                snake_item_clear <= '0';
                snake_item_loc_set <= '0';
                snake_item_loc <= (others => '0');
                storage_item_set <= '0';
                storage_item <= (others => '0');
                -----
                counter_reset <= '1';
                counter_enable <= '0';
                register_enable <= '0';
                register_D <= '0';
                -----
                countfps_start <= '0';
                -----


                -- Shift the LSB of food ("00") into the Shift Register
                register_enable <= '1';
                register_D <= '0';

                new_state <= SHIFT_FOOD_TWO;

            when SHIFT_FOOD_TWO =>
                --------------------
                -- Initial values --
                --------------------
                snake_item_clear <= '0';
                snake_item_loc_set <= '0';
                snake_item_loc <= (others => '0');
                storage_item_set <= '0';
                storage_item <= (others => '0');
                -----
                counter_reset <= '1';
                counter_enable <= '0';
                register_enable <= '0';
                register_D <= '0';
                -----
                countfps_start <= '0';
                -----

                -- Shift the second bit of food ("00") into the SR 
                register_enable <= '1';
                register_D <= '0';

                new_state <= GEN_LOC;

            when GEN_LOC =>
                --------------------
                -- Initial values --
                --------------------
                snake_item_clear <= '0';
                snake_item_loc_set <= '0';
                snake_item_loc <= (others => '0');
                storage_item_set <= '0';
                storage_item <= (others => '0');
                -----
                counter_reset <= '1';
                counter_enable <= '0';
                register_enable <= '0';
                register_D <= '0';
                -----
                countfps_start <= '0';
                -----
                
                ----- NOTE -----
                -- Voor de y-as mag de maximale waarde van de locatie 24 zijn ("11000"), dus als bit 3 en 4 van y coordinaat allebij 1 zijn, moeten er drie 0'en toegevoegd worden aan het shift register.
                -- 
                -- 

                -- Enable the internal counter
                counter_enable <= '1';
                counter_reset <= '0';

                -- Check if the x coordinate does not go out of bound
                if (counter_out = "1001") then          -- The last bit will now be generated
                    if (register_Q(11) = '1') then 
                        counter_enable <= '1';
                        register_enable <= '1';
                        register_D <= '0';              -- This is for keeping the y coordinate in bound

                        new_state <= GEN_LOC;
                    else
                        counter_enable <= '1';
                        register_enable <= '1';
                        register_D <= rng_out;

                        new_state <= GEN_LOC;
                    end if;
                elsif (counter_out = "1010") then      -- "1010" equals decimal 10
                    counter_enable <= '0';
                    
                    new_state <= CHECK_LOC;
                else
                    -- Add new random bit to the shift register
                    -- There should be implemented a check here, that checks if the x coordinate is not out of bounds, otherwise make it fit inside the grid.
                    counter_enable <= '1';
                    register_enable <= '1';
                    register_D <= rng_out;

                    new_state <= GEN_LOC;
                end if;

            when CHECK_LOC =>
                --------------------
                -- Initial values --
                --------------------
                snake_item_clear <= '0';
                snake_item_loc_set <= '0';
                snake_item_loc <= (others => '0');
                storage_item_set <= '0';
                storage_item <= (others => '0');
                -----
                counter_reset <= '1';
                counter_enable <= '0';
                register_enable <= '0';
                register_D <= '0';
                -----
                countfps_start <= '0';
                -----


                snake_item_loc_set <= '1';

                if (snake_item_loc_clear = '0') then
                    snake_item_loc <= register_Q(11 downto 2);

                    new_state <= CHECK_LOC;
                elsif (snake_item_loc_clear = '1') and (snake_item_ok = '1') then 
                    snake_item_loc_set <= '0';

                    new_state <= SEND_LOC;
                elsif (snake_item_loc_clear = '1') and (snake_item_ok = '0') then
                    -- Calculate a new location
                    new_state <= SHIFT_REG_ONE;
                else 
                    new_state <= CHECK_LOC;
                end if;

            when SHIFT_REG_ONE =>
                --------------------
                -- Initial values --
                --------------------
                snake_item_clear <= '0';
                snake_item_loc_set <= '0';
                snake_item_loc <= (others => '0');
                storage_item_set <= '0';
                storage_item <= (others => '0');
                -----
                counter_reset <= '1';
                counter_enable <= '0';
                register_enable <= '0';
                register_D <= '0';
                -----
                countfps_start <= '0';
                -----

                register_enable <= '1';
                register_D <= register_Q(0);

                new_state <= SHIFT_REG_TWO;

            when SHIFT_REG_TWO =>
                --------------------
                -- Initial values --
                --------------------
                snake_item_clear <= '0';
                snake_item_loc_set <= '0';
                snake_item_loc <= (others => '0');
                storage_item_set <= '0';
                storage_item <= (others => '0');
                -----
                counter_reset <= '1';
                counter_enable <= '0';
                register_enable <= '0';
                register_D <= '0';
                -----
                countfps_start <= '0';
                -----

                register_enable <= '1';
                register_D <= register_Q(0);

                new_state <= GEN_LOC;

            when SEND_LOC =>
                --------------------
                -- Initial values --
                --------------------
                snake_item_clear <= '0';
                snake_item_loc_set <= '0';
                snake_item_loc <= (others => '0');
                storage_item_set <= '0';
                storage_item <= (others => '0');
                -----
                counter_reset <= '1';
                counter_enable <= '0';
                register_enable <= '0';
                register_D <= '0';
                -----
                countfps_start <= '0';
                -----


                storage_item_set <= '1';

                if (storage_item_clear = '1') then
                    storage_item_set <= '0';

                    new_state <= IDLE;
                else 
                    storage_item <= register_Q;

                    new_state <= SEND_LOC;
                end if;
                -- If the storage fails to respond with an send_storage_succes, then this will hang forever: IG = kapot
        end case;
    end process;

    count_comp <= "1010";
end behaviour;

