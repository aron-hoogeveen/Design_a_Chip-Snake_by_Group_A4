library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

architecture behaviour of counter4 is
signal tmp : std_logic_vector(3 downto 0);
begin
    lbl1: process (clk)
    begin
        if (rising_edge(clk)) then
            if (reset = '1') then
                tmp <= "0000";
            else
                if (enable = '1') and (tmp = "1111") then
                    tmp <= "0000";
                elsif (enable = '1') then
                    tmp <= tmp + 1;
                end if;
            end if;
        end if;
    end process;

    z_out <= tmp;
end behaviour;

