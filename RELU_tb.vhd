LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY RELU_tb IS
END RELU_tb;
 
ARCHITECTURE behavior OF RELU_tb IS 
 
    COMPONENT RELU
    PORT(
         conved_img : IN  std_logic_vector(3999 downto 0);
         En : IN  std_logic;
         RELU_img : OUT  std_logic_vector(3999 downto 0)
        );
    END COMPONENT;
    
   signal conved_img : std_logic_vector(3999 downto 0) := (others => '0');
   signal En : std_logic := '0';
   signal RELU_img : std_logic_vector(3999 downto 0);
	signal tmp : std_logic_vector(3919 downto 0);
BEGIN
	tmp <= (others => '0');
   uut: RELU PORT MAP (
          conved_img => conved_img,
          En => En,
          RELU_img => RELU_img
        );

	
	En <= '0', '1' after 1 ns;
	conved_img <= X"08258941DDBC1203ECA9" & tmp;
	
END;
