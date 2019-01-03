library IEEE;
use IEEE.std_logic_1164.ALL;

entity snake_out is
   port(reset, clk		 : in	 std_logic; 				-- General reset and clk signals
	flag_coc     : in  std_logic;							-- Flag van corner calc. entity om aan te geven dat de corner calc. entity de corners klaar heeft staan
        corner1      : in  std_logic_vector(9 downto 0);	--Corner ontvangen van corner calc. entity (notatie: [x0,x1,x2,x3,x4,y0,y1,y2,y3,y4], 10 bits)
        corner2      : in  std_logic_vector(9 downto 0);	--Corner ontvangen van corner calc. entity (notatie: [x0,x1,x2,x3,x4,y0,y1,y2,y3,y4], 10 bits)
        clr_flag_g   : in  std_logic;						--Graphics geeft aan dat de corners ontvangen en dat nieuwe gestuurd kunnen worden
        clr_flag_chc : in  std_logic;						--Check corner entity geeft aan dat de corners ontvangen en dat nieuwe gestuurd kunnen worden

        clr_flag_coc : out std_logic;						--Geeft aan dat nieuwe corner coordinaten kunnen worden gestuurd
        x_bounds     : out std_logic_vector(9 downto 0);	--Het kleinste en grootste x coordinaat van de 2 corners (notatie: [xmin0, xmin1, xmin2, xmin3, xmin4, xmax0, xmax1, xmax2, xmax3, xmax4], 10 bits)
        y_bounds     : out std_logic_vector(9 downto 0);	--Het kleinste en grootste y coordinaat van de 2 corners (notatie: [ymin0, ymin1, ymin2, ymin3, ymin4, ymax0, ymax1, ymax2, ymax3, ymax4], 10 bits)
        flag_g       : out std_logic;						--Geeft de graphics module aan dat de nieuwe corner klaarstaan
        flag_chc     : out std_logic);						--Geeft de check corner entity aan dat de nieuwe corner klaarstaan
end snake_out;

