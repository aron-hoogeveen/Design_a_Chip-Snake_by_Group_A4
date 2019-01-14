library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

architecture behaviour of counter4 is

    type counter4_state is (RESET_S, IDLE, COUNT);
    signal state, new_state : counter4_state;
    signal tmp, new_tmp : std_logic_vector(3 downto 0);

begin

    lbl_counter4_clk: process (clk)
    begin
        if (rising_edge(clk)) then
            if (reset = '1') then
                state <= RESET_S;
                tmp <= (others => '0');
            elsif (manual_reset = '1') then
                state <= RESET_S;
                tmp <= (others => '0');
            elsif (reset = '1') and (manual_reset = '1') then
                state <= RESET_S;
                tmp <= (others => '0');
            else
                state <= new_state;
                tmp <= new_tmp;
            end if;
        end if;
    end process;


    lbl_counter4_state: process (state, manual_reset, enable, tmp)
    begin
        case state is
            when RESET_S =>
                new_tmp <= (others => '0');

                new_state <= IDLE;
                
            when IDLE =>
                if (enable = '1') then
                    new_state <= COUNT;
                else
                    new_state <= IDLE;
                end if;

            when COUNT =>
                new_tmp <= tmp + 1;

                if (enable = '1') then
                    new_state <= COUNT;
                else 
                    new_state <= IDLE;
                end if;
        end case;
    end process;

    z_out <= tmp;
end behaviour;