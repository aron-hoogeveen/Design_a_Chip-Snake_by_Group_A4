library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture structure of image_gen is
-- component decalaration
	component item_image is
   	   port(clk   					   : in  std_logic;
        			reset 			   : in  std_logic;
		 	  video_on   			 : in  std_logic;
        			location_in 			 : in  std_logic_vector(11 downto 0);
        			location_pow_in : in  std_logic_vector(11 downto 0);
        			h_count    			 : in  std_logic_vector(8 downto 0);
        	  v_count    		 	: in  std_logic_vector(9 downto 0);
		  	  item_type	 		  :	out	std_logic_vector(1 downto 0);
        			item      			  : out std_logic);
	end component;

	component snake_image is
   		port(clk        : in  std_logic;
        		 reset      : in  std_logic;
        		 video_on   : in  std_logic;
        		 snake_x_loc 				: in  std_logic_vector(9 downto 0);
        		 snake_y_loc				: in  std_logic_vector(9 downto 0);
        		 h_count    : in  std_logic_vector(8 downto 0);
        		 v_count    : in  std_logic_vector(9 downto 0);
        		 snake     	: out std_logic;
		     clr_flag 		: out std_logic);
	end component;

	component color_gen is
   	 port(clk          : in 	std_logic;
     		   reset     			: in  std_logic;
        		snake     			: in  std_logic;
	       item      			: in  std_logic;
		    item_type 			: in 	std_logic_vector(1 downto 0);
		    pulse_60hz 		: in 	std_logic;
          video_on  			: in  std_logic;
          color_cnt 		 :	in 	std_logic_vector(6 downto 0);
		    enable_flick : in 	std_logic;
		    red       		 : out std_logic;
          green     		 : out std_logic;
          blue      		 : out std_logic);
	end component;

	component color_counter is
   		port(clk        : in  std_logic;
        			 reset      : in  std_logic;
        			 pulse_60hz : in  std_logic;
        			 flicker    : in  std_logic;
        			 color_cnt  : out std_logic_vector(6 downto 0);
 	 		 enable_flick : out std_logic);
	end component;

	signal snake_inter : std_logic;
	signal item_inter  : std_logic;
	signal item_type_inter  : std_logic_vector(1 downto 0);
	signal color_cnt_inter : std_logic_vector(6 downto 0);
	signal flick_enable		: std_logic;
begin

item: item_image
	port map(clk   					   => clk,
        		  reset 				   => reset,
		  	   video_on   			 => video_on,
       	 	  location_in     => item_in,
			 	location_pow_in => power_in,
	  	   		h_count    			 => h_count,
    	    	  v_count    				=> v_count,
				item_type			   => item_type_inter,
   	     	  item      				 => item_inter);

snake: snake_image
	port map(clk   			 => clk,
			 	reset 		  => reset,
        		 	video_on  => video_on,
        			 snake_x_loc => snake_x_loc,
        			 snake_y_loc => snake_y_loc,
        			 h_count   => h_count,
        			 v_count   => v_count,
        			 snake     => snake_inter,
		  	 	clr_flag  => clr_flag);

rgb: color_gen
	port map(clk      	  => clk,
      			   reset    	  => reset,
        			 snake    	  => snake_inter,
        			 item     	  => item_inter,
			 	item_type   => item_type_inter,
			 	pulse_60hz  => pulse_60hz,
        			 video_on 	  => video_on,
			 	color_cnt   => color_cnt_inter,
			 	enable_flick	=> flick_enable,
        			 red      	  => red,
        			 green    	  => green,
	         blue    	   => blue);

cnt_60hz:	color_counter
			port map(clk        => clk,
        			 		  reset      => reset,
        			 		  pulse_60hz => pulse_60hz,
        			 		  flicker    => flicker_in,
        			 		  color_cnt  => color_cnt_inter,
			 		  enable_flick => flick_enable);
end structure;

