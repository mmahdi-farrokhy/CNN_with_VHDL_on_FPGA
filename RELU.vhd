-- This component takes the 8 layers of image after
-- Convolution operation and applies the activation
-- Function called "RELU" on the inputs
-- The input is taken as a vector wuth the legth of
-- All layers together

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity RELU is
	port(
			conved_img : in std_logic_vector(3999 downto 0);
			En : in std_logic;
			RELU_img : out std_logic_vector(3999 downto 0)
		  );
end RELU;


architecture Behavioral of RELU is

begin
	
	RELU_FUNC:process(En,conved_img)
		variable up   : integer :=499;
		variable down : integer :=492;
	begin
		if En = '1' then
			for i in 500 downto 1 loop
				up := (i*8) - 1;
				down := up - 7;
				if conved_img(up downto down) < 0 then
					RELU_img(up downto down) <= "00000000";
				else
					RELU_img(up downto down) <= conved_img(up downto down);
				end if;
			end loop;
		end if;
	end process;

end Behavioral;


