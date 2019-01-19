library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

architecture behaviour of movecounter is
type counter_state is (IDLE, COUNT, DONE);
    signal state, new_state : counter_state;
    signal tmp, new_tmp : std_logic_vector(5 downto 0);
begin
    lbl1: process (clk)
    begin
        if (rising_edge(clk)) then
            if (reset = '1') then
                state <= IDLE;
                tmp <= (others => '0');
            else 
                state <= new_state;
                tmp <= new_tmp;
            end if;
        end if;
    end process;

    lbl2: process (state, start, move)
    begin
        case state is 
            when IDLE =>
                --------------------
                -- Initial values --
                --------------------
                z_out <= '0';
                -----

                new_tmp <= (others => '0');
                
                if (start = '1') then
                    new_state <= COUNT;
                else
                    new_state <= IDLE;
                end if;
            when COUNT =>
                --------------------
                -- Initial values --
                --------------------
                z_out <= '1';
                -----

		--"111111"
                if (new_tmp = "000011") then
                    new_state <= DONE;
                elsif (move = '1') then
                    new_tmp <= tmp + 1;

                    new_state <= COUNT;
                else 
                    new_state <= COUNT;
                end if;
            when DONE =>
                z_out <= '0';

                if (start = '1') then
                    new_state <= IDLE;
                else
                    new_state <= DONE;
                end if;
            end case;
    end process;
end behaviour;

