library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


architecture Behavioral of ball is

	constant size: integer:=8;
	signal ball_on: STD_LOGIC; -- indicates whether ball is over current pixel position
	-- current ball position - intitialized to center of screen
	signal ball_x, new_ball_x : STD_LOGIC_VECTOR(8 downto 0):= CONV_STD_LOGIC_VECTOR(158,9);
	signal ball_y, new_ball_y: STD_LOGIC_VECTOR(9 downto 0):= CONV_STD_LOGIC_VECTOR(240,10);
	-- current ball motion - initialized to +4 pixels/frame
	signal ball_x_motion, new_ball_x_motion: STD_LOGIC_VECTOR(8 downto 0):= "000000100";
	signal ball_y_motion, new_ball_y_motion: STD_LOGIC_VECTOR(9 downto 0):= "0000000100";

begin
v_on:
	process(video_on,ball_on)
	begin
	if(video_on = '1') then
		red <= '1'; -- color setup for red ball on white background
		green <= not ball_on;
		blue <= not ball_on;
	else
		red <= '0';
		green <= '0';
		blue <= '0';
	end if;
	end process;

	-- process to draw ball current pixel address is covered by ball position
bdraw: process (ball_x, ball_y, pixel_row, pixel_col) is
begin
	if (pixel_col >= ball_x - size) and
		(pixel_col <= ball_x + size) and
		(pixel_row >= ball_y - 2*size) and
		(pixel_row <= ball_y + 2*size) then
		ball_on <= '1'; 
	else
		ball_on <= '0';
	end if;
end process;
-- process to move ball once every frame (i.e. once every vsync pulse)
-- wait until rising_edge(v_sync);
-- -- allow for bounce off top or bottom of screen
-- if ball_y + size >= 480 then
-- ball_y_motion <= "1111111100"; -- -4 pixels
-- elsif ball_y <= size then
-- ball_y_motion <= "0000000100"; -- +4 pixels
-- end if;
-- ball_y <= ball_y + ball_y_motion; -- compute next ball position
-- end process;
clk_lbl: process(clk)
begin
	if(clk'event and clk = '1') then
		if(reset = '1') then
			ball_y <= (others => '0');
			ball_y_motion <= (others => '0');
			ball_x <= (others => '0');
			ball_x_motion <= (others => '0');
		else
			ball_y <= new_ball_y;
			ball_y_motion <= new_ball_y_motion;
			ball_x <= new_ball_x;
			ball_x_motion <= new_ball_x_motion;
		end if;
	end if;
end process;


mball: process(v_enable, ball_y, ball_y_motion)
begin
	if(v_enable = '1') then
		-- allow for bounce off top or bottom of screen
		if (ball_y + size >= 472) AND ( 10 >= ball_y + size)then
			new_ball_y_motion <= "1111111100"; -- -4 pixels
		elsif ball_y <= size then
			new_ball_y_motion <= "0000000100"; -- +4 pixels
		else
			new_ball_y_motion <= ball_y_motion;
		end if;
		new_ball_y <= ball_y + ball_y_motion; -- compute next ball position
	else
		new_ball_y <= ball_y;
		new_ball_y_motion <= ball_y_motion;
	end if;
end process;

mbal2: process(v_enable, ball_x, ball_x_motion)
begin
	if(v_enable = '1') then
		-- allow for bounce off top or bottom of screen
		if ball_x + size >= 316 then
			new_ball_x_motion <= "111111101"; -- -3 pixels
		elsif ball_x <= size then
			new_ball_x_motion <= "000000011"; -- +3 pixels
		else
			new_ball_x_motion <= ball_x_motion; 
		end if;
		new_ball_x <= ball_x + ball_x_motion; -- compute next ball position
	else
		new_ball_x <= ball_x;
		new_ball_x_motion <= ball_x_motion;
	end if;
end process;
end Behavioral;
