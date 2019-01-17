library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture structure of vga_controller is

	-- component declaration
	component h_cnt_control is
   		port(clk           : in  std_logic;
        			reset         : in  std_logic;
        			h_count       : in  std_logic_vector(8 downto 0);
        			h_sync        : out std_logic;
       		 	h_count_reset : out std_logic;
        			h_video_on    : out std_logic);
	end component;

	component h_counter is
   		port(clk     : in  std_logic;
        		 reset   : in  std_logic;
        		 h_count : out std_logic_vector(8 downto 0));
	end component;

	component v_cnt_control is
		port(clk           : in  std_logic;
        		 reset         : in  std_logic;
		  	  h_count	      : in 	std_logic_vector(8 downto 0);
        		 v_count       : in  std_logic_vector(9 downto 0);
        		 v_sync        : out std_logic;
        		 v_count_reset : out std_logic;
       			 v_video_on    : out std_logic);
	end component;

	component v_counter is
	   port(clk     : in  std_logic;
        		 reset   : in  std_logic;
        		 enable  : in  std_logic;
        		 v_count : out std_logic_vector(9 downto 0));
	end component;

-- signals to connect the components
signal h_count_reset : std_logic;
signal v_count_reset : std_logic;
signal h_count_inter	: std_logic_vector(8 downto 0);
signal v_count_inter	: std_logic_vector(9 downto 0);
signal h_video_on			 : std_logic;
signal v_video_on			 : std_logic;
signal video_on_sig  : std_logic;

begin
-- component initiation

-- h_cnt_control h_sync signal and resets the h_counter and resets the v_counter
h_ctrl:  h_cnt_control
	port map(clk							  => clk,
				reset				  => reset,
				h_count				  => h_count_inter,
				h_sync				  =>	h_sync,
				h_count_reset	=> h_count_reset,
				h_video_on				=> h_video_on);

-- h_counter counts the number of columns
h_cnt: h_counter
	port map(clk				 => clk,
				reset		 => h_count_reset,
				h_count	=> h_count_inter);

-- v_cnt_control generates v_sync signal and resets the v_counter
v_ctrl:  v_cnt_control
	port map(clk								=> clk,
				reset					=> reset,
				h_count					=> h_count_inter,
				v_count					=> v_count_inter,
				v_sync					=>	v_sync,
				v_count_reset		=> v_count_reset,
				v_video_on					=> v_video_on);

-- v_counter counts the number of rows
v_cnt: v_counter
	port map(clk				 => clk,
				reset		 => v_count_reset,
				enable	 => h_count_reset,
				v_count	=> v_count_inter);
	
	h_count	<= h_count_inter;
	v_count	<= v_count_inter;
	-- generate the video_on signal whose value is '1' during display time
	video_on_sig <= h_video_on and v_video_on;

	video_on <= video_on_sig;
	pulse_60hz <= v_count_reset;
end structure;
