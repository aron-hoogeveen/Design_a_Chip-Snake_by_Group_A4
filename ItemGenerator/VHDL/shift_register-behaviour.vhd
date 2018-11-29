library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of shift_register is
signal shift_reg: std_logic_vector(11 downto 0);
begin
    lbl1: process (clk)
    begin
        if (rising_edge(clk)) and (reset = '1') then
            shift_reg <= "000000000000";
        elsif (rising_edge(clk)) and (enable = '1') then        -- This may lead to unwanted behaviour. It is possible that I need to nest the if statements to keep the flip flop behaviour.
            shift_reg(11) <= D;
            shift_reg(10) <= shift_reg(11);
            shift_reg(9) <= shift_reg(10);
            shift_reg(8) <= shift_reg(9);
            shift_reg(7) <= shift_reg(8);
            shift_reg(6) <= shift_reg(7);
            shift_reg(5) <= shift_reg(6);
            shift_reg(4) <= shift_reg(5);
            shift_reg(3) <= shift_reg(4);
            shift_reg(2) <= shift_reg(3);
            shift_reg(1) <= shift_reg(2);
            shift_reg(0) <= shift_reg(1);
        end if;
    end process;

    Q <= shift_reg;

end behaviour;