LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY CNN_tb IS
END CNN_tb;
 
ARCHITECTURE behavior OF CNN_tb IS 
 
    COMPONENT CNN
    PORT(
         image : IN  std_logic_vector(799 downto 0);
         En_main : IN  std_logic;
         feature : OUT  std_logic_vector(999 downto 0)
        );
    END COMPONENT;
    
   signal image : std_logic_vector(799 downto 0) := (others => '0');
   signal En_main : std_logic := '0';
   signal feature : std_logic_vector(999 downto 0);
	signal tmp1 : std_logic_vector(191 downto 0);
	signal tmp2 : std_logic_vector(47 downto 0);
	signal tmp3 : std_logic_vector(55 downto 0);
	signal tmp4 : std_logic_vector(63 downto 0);
	signal tmp5 : std_logic_vector(39 downto 0);
BEGIN
 
   uut: CNN PORT MAP (
          image => image,
          En_main => En_main,
          feature => feature
        );


	En_main <= '0', '1' after 10 ns;
	tmp1 <= (others => '1');
	image(799 downto 608) <= tmp1;--255
	image(607 downto 600) <= "00000000";--000
	image(599 downto 592) <= "00000000";--000
	image(591 downto 584) <= "00000000";--000
	tmp2 <= (others => '1');
	image(583 downto 536) <= tmp2;--255
	image(535 downto 528) <= "00000000";--000
	image(527 downto 520) <= "00000000";--000
	tmp3 <= (others => '1');
	image(519 downto 464) <= tmp3;--255
	image(463 downto 456) <= "00000000";--000
	image(455 downto 448) <= "00000000";--000
	tmp4 <= (others => '1');
	image(447 downto 384) <= tmp4;--255
	image(383 downto 376) <= "00000000";--000
	image(375 downto 360) <= "1111111111111111";--255
	image(359 downto 352) <= "00000000";--000
	tmp5 <= (others => '1');
	image(351 downto 312) <= tmp5;--255
	image(311 downto 304) <= "00000000";--000
	image(303 downto 296) <= "00000000";--000
	image(295 downto 288) <= "00000000";--000
	image(287 downto 280) <= "00000000";--000
	image(279 downto 272) <= "00000000";--000
	image(271 downto 232) <= "1111111111111111111111111111111111111111";--255
	image(231 downto 224) <= "00000000";--000
	image(223 downto 216) <= "00000000";--000
	image(215 downto 208) <= "00000000";--000
	image(207 downto 192) <= "1111111111111111";--255
	image(191 downto 184) <= "00000000";--000
	image(183 downto 176) <= "00000000";--000
	image(175 downto 144) <= "11111111111111111111111111111111";--255
	image(143 downto 136) <= "00000000";--000
	image(135 downto 128) <= "00000000";--000
	image(127 downto 112) <= "1111111111111111";--255
	image(111 downto 104) <= "00000000";--000
	image(103 downto  96) <= "00000000";--000
	image(95  downto  56) <= "1111111111111111111111111111111111111111";--255
	image(55  downto  48) <= "00000000";--000
	image(47  downto  40) <= "00000000";--000
	image(39  downto  32) <= "00000000";--000
	image(31  downto  24) <= "00000000";--000
	image(23  downto   0) <= "111111111111111111111111";--255
	
END;
