library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

architecture behaviour of counter_fps is
    type fpscounter_state is (IDLE, COUNT, DONE);
    signal state, new_state : fpscounter_state;
    signal tmp : std_logic_vector(8 downto 0);
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

    lbl2: process (state, start, tmp, fps)
    begin
        case state is 
            when IDLE =>
                --------------------
                -- Initial values --
                --------------------
                z_out <= '0';
                -----

                tmp <= (others => '0');
                
                if (start = '1') then
                    new_state <= COUNT;
                else
                    new_state <= IDLE;
                end if;
            when COUNT =>
                --------------------
                -- Initial values --
                --------------------
                z_out <= '0';
                -----

                if (tmp = "111011111") then
                    z_out <= '1';   -- Maybe it is better to set z_out to 1 only in the DONE state, but I guess that this is faster by one clock period

                    new_state <= DONE;
                elsif (fps = '1') then
                    tmp <= tmp + 1;

                    new_state <= COUNT;
                else 
                    new_state <= COUNT;
                end if;
            when DONE =>
                z_out <= '1';

                if (start = '1') then
                    z_out <= '0';

                    new_state <= IDLE;
                else
                    new_state <= DONE;
                end if;
            end case;
    end process;
end behaviour;

