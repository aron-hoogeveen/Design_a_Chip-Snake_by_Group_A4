library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structure of snake_struct is
component speed is
   port(clk            : in  std_logic;
        reset          : in  std_logic;
        collision_food : in  std_logic; -- 1->0 to 0; be sure to change this in speed/length
        move           : out std_logic;
	length_out	    : out std_logic_vector(5 downto 0));
end component;

component col_detect is
   port(clk                 : in  std_logic;
        reset               : in  std_logic;
        ig_item_loc         : in std_logic_vector(9 downto 0);
        ig_item_loc_set     : in std_logic;
        ig_item_loc_clear   : out std_logic;
        ig_item_ok          : out std_logic;
        st_item_loc         : in std_logic_vector(9 downto 0);
        st_item_clear   			 : in std_logic;
        st_item_exists      : in std_logic;
        st_item_type        : in std_logic_vector(1 downto 0);
        st_item_set         : out std_logic;
        st_item_no          : out std_logic;
        x_range             : in std_logic_vector(9 downto 0);
        y_range             : in std_logic_vector(9 downto 0);
        tail                : in std_logic;
        so_range_set        : in std_logic;
        so_range_clear      : out std_logic;
        so_reset            : out std_logic;
        br_new_head         : in std_logic_vector(11 downto 0);
        br_new_head_set     : in std_logic;
        br_new_head_clear   : out std_logic;
        br_new_head_ok      : out std_logic;
        --br_inverse_controls_set : out std_logic;
        --br_inverse_controls_set : in std_logic;
        food_collision      : out std_logic
    );
end component;

component button_react is
port(		clk			: in std_logic;
		reset			: in std_logic;
		head     			: in std_logic_vector(11 downto 0);	
		move			: in std_logic;				
		buttons			: in std_logic_vector(1 downto 0);	
		new_head_clr_flag			: in std_logic;						
		corner_clr_flag			: in std_logic;						
		chc_clr_flag			: in std_logic;						
		new_head			: out std_logic_vector(11 downto 0);	--check this with BR: 11-0 or 9-0?
		corner 			: out std_logic_vector(5 downto 0);
		corner_flag			: out std_logic;					
		new_head_flag			: out std_logic;					
		chc_flag			: out std_logic);				
end component;
signal sig_new_head : std_logic_vector(11 downto 0);
signal sig_head_flag	:	std_logic;
signal move	: std_logic;
signal clr_head_flag : std_logic;
--signal for BR<-ChC: ??? <-br_new_head_clear 
signal food	: std_logic;

begin
comp_speed: speed
	port map(clk            => clk,
        		 reset          => reset,
       		 collision_food => food,
        		 move           => move,
		 length_out		=> length);

comp_col_detect: col_detect
	port map(clk                    => clk,
        		 reset                  => reset,
       		 ig_item_loc			=> ig_item_loc,          
        		 ig_item_loc_set   		   => ig_loc_set,  
        		 ig_item_loc_clear      => ig_loc_clear,
       		 ig_item_ok         			=> ig_item_ok,
       		 st_item_loc        			=> st_item_loc,
       		 st_item_clear   			=> st_item_clear,
       		 st_item_exists         => st_item_exists,
       		 st_item_type           => st_item_type,
       		 st_item_set            => st_item_set,
       		 st_item_no             => st_item_no,
       		 x_range                => x_range,
      	         y_range                => y_range,
       		 tail                   => tail,
       		 so_range_set           => so_range_set,
       		 so_range_clear         => so_range_clear,
       		 so_reset               => so_reset,
       		 br_new_head            => sig_new_head,
       		 br_new_head_set        => sig_head_flag,
       		 --br_new_head_clear      => --?????????,
       		 br_new_head_ok         => clr_head_flag,
       		 --br_inverse_controls_set => ????,
       		 --br_inverse_controls_set => ????,
       		 food_collision         => food);

comp_button_react: button_react
	port map(clk				=> clk,	
		 reset			=> reset,
		 head     			=> head,	
		 move			=> move,	
		 buttons			=> buttons,
		 new_head_clr_flag			=> newh_clr_flag,			
		 corner_clr_flag			=> crn_clr_flag,				
		 chc_clr_flag			=> clr_head_flag,				
		 new_head			=> sig_new_head,
		 corner 			=> corner,
		 corner_flag			=> corner_flag,			
		 new_head_flag			=> new_head_flag,				
		 chc_flag			=> sig_head_flag);

new_head <= sig_new_head;		--signal tap to output

end structure;

