library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CNN is
    Port ( image : in  STD_LOGIC_VECTOR (799 downto 0);
           En_main : in  STD_LOGIC;
           feature : out  STD_LOGIC_VECTOR (999 downto 0));
end CNN;

architecture Behavioral of CNN is
	component conv is
   Port ( img : in  STD_LOGIC_VECTOR (799 downto 0);
           En : in  STD_LOGIC;
           conved_img : out  STD_LOGIC_VECTOR (3999 downto 0));
	end component;
	
	component RELU is
	port(
			conved_img : in std_logic_vector(3999 downto 0);
			En : in std_logic;
			RELU_img : out std_logic_vector(3999 downto 0)
		  );
	end component;
		
	component Max_Pool is
   Port ( feature_map : in  STD_LOGIC_VECTOR (3999 downto 0);
			  En : in STD_LOGIC;
           pooled_fm : out  STD_LOGIC_VECTOR (999 downto 0));
	end component;

	signal tmp1 : std_logic_vector(3999 downto 0);
	signal tmp2 : std_logic_vector(3999 downto 0);
	signal tmp3 : std_logic_vector(999 downto 0);
begin
	
	A2D:conv
		port map(
					img => image,
					En => En_main,
					conved_img => tmp1
					);
					
	D2F:RELU
		port map(
					conved_img => tmp1,
					En => En_main,
					RELU_img => tmp2
					);
					
	F2H:Max_Pool
		port map(
					feature_map => tmp2,
					En => En_main,
					pooled_fm => tmp3
					);
					
	feature <= tmp3;
end Behavioral;

