-- Contains of 5 filters for convolutional operation
-- The input is an image of 10x10 pixels which means
-- It has 100 pixels while each pixel's size is 8 bit
-- So the input has 800 bits
-- After 5 convolution with 5 edge detector filters
-- And 1 zero padding on the main image
-- The output of 10x10 pixels(800 bits) in 5 different
-- Layers will be resulted(4000 bits in total)
-- filters are as shown in follow:
-- F(1) = PREWITT G(x)
-- |+1 0 -1|
-- |+1 0 -1|
-- |+1 0 -1|
-- F(2) = PREWITT G(y)
-- |+1 +1 +1|
-- | 0  0  0|
-- |-1 -1 -1|
-- F(3) = 3D LAPLACIAN 1st PLANE
-- |0  0  0|
-- |0 +1  0|
-- |0  0  0|
-- F(4) = 3D LAPLACIAN 2nd PLANE
-- |+1 +1 +1|
-- | 0  0  0|
-- |-1 -1 -1|
-- F(5) = 3D LAPLACIAN 3rd PLANE
-- |0  0  0|
-- |0 +1  0|
-- |0  0  0|
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_SIGNED.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity conv is
    Port ( img : in  STD_LOGIC_VECTOR (799 downto 0);
           En : in  STD_LOGIC;
           conved_img : out  STD_LOGIC_VECTOR (3999 downto 0));
end conv;

architecture Behavioral of conv is
	-- FILTERS DECLARATIN
	signal f1 : signed(71 downto 0);-- PREWITT G(x)
--	signal f2 : signed(71 downto 0);-- PREWITT G(y)
--	signal f6 : signed(71 downto 0);-- 3D LAPLACIAN 1st PLANE
--	signal f7 : signed(71 downto 0);-- 3D LAPLACIAN 2nd PLANE
--	signal f8 : signed(71 downto 0);-- 3D LAPLACIAN 3rd PLANE
	
	--signal zero_padded_img : unsigned(1151 downto 0) := ('0', OTHERS => '0');
	signal tmp_img1 : unsigned(799 downto 0);
	signal tmp_img2 : signed (799 downto 0);
	signal tmp_sub : signed(8 downto 0);
begin
	
	tmp_img1 <= unsigned(img);
	
	-- FILTERS DEFINITION
--	f1 <= ("00000001")&("00000000")&("11111111")&-- |+1 0 -1|
--			("00000001")&("00000000")&("11111111")&-- |+1 0 -1|
--			("00000001")&("00000000")&("11111111");-- |+1 0 -1|
--
--	f2 <= ("00000001")&("00000001")&("00000001")&-- |+1 +1 +1|
--			("00000000")&("00000000")&("00000000")&-- | 0  0  0|
--			("11111111")&("11111111")&("11111111");-- |-1 -1 -1|
--	
--	f3 <= ("00000000")&("00000000")&("00000000")&-- |0 0 0|
--			("00000000")&("00000001")&("00000000")&-- |0 1 0|
--			("00000000")&("00000000")&("00000000");-- |0 0 0|
--	
--	f4 <= ("00000000")&("00000000")&("00000000")&-- |0  1  0|
--			("00000000")&("00000001")&("00000000")&-- |0  1  0|
--			("00000000")&("00000000")&("00000000");-- |0  0  0|
--	
--	f5 <= ("00000000")&("00000000")&("00000000")&-- |0 0 0|
--			("00000000")&("00000001")&("00000000")&-- |0 1 0|
--			("00000000")&("00000000")&("00000000");-- |0 0 0|
--	
	
	CONVOLUTION:process(En,tmp_img1,tmp_sub,tmp_img2)
	begin
		if En = '1' then
--			-- ZERO PADDING APPLYING
--			zero_padded_img(1047 downto 968) <= unsigned(img(799 downto 720));
--			zero_padded_img(951  downto 872) <= unsigned(img(719 downto 640));
--			zero_padded_img(855  downto 776) <= unsigned(img(639 downto 560));
--			zero_padded_img(759  downto 680) <= unsigned(img(559 downto 480));
--			zero_padded_img(663  downto 584) <= unsigned(img(479 downto 400));
--			zero_padded_img(567  downto 488) <= unsigned(img(399 downto 320));
--			zero_padded_img(471  downto 392) <= unsigned(img(319 downto 240));
--			zero_padded_img(375  downto 296) <= unsigned(img(239 downto 160));
--			zero_padded_img(279  downto 200) <= unsigned(img(159 downto  80));
--			zero_padded_img(183  downto 104) <= unsigned(img(79  downto   0));
			-- Convolving with f1
			-- 1st Row
			tmp_sub <= "00000000" - tmp_img1(791 downto 784)- tmp_img1(711 downto 704);
			tmp_img2(799 downto 792) <= tmp_sub(7 downto 0);									
			tmp_sub <= "00000000" + tmp_img1(799 downto 792)+tmp_img1(719 downto 712)-(tmp_img1(783 downto 776)+tmp_img1(703 downto 696));
			tmp_img2(791 downto 784) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(791 downto 784)+tmp_img1(711 downto 704)-(tmp_img1(775 downto 768)+tmp_img1(695 downto 688));
			tmp_img2(783 downto 776) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(783 downto 776)+tmp_img1(703 downto 696)-(tmp_img1(767 downto 760)+tmp_img1(687 downto 680));
			tmp_img2(775 downto 768) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(775 downto 768)+tmp_img1(695 downto 688)-(tmp_img1(759 downto 752)+tmp_img1(679 downto 672));
			tmp_img2(767 downto 760) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(767 downto 760)+tmp_img1(687 downto 680)-(tmp_img1(751 downto 744)+tmp_img1(671 downto 664));
			tmp_img2(759 downto 752) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(759 downto 752)+tmp_img1(679 downto 672)-(tmp_img1(743 downto 736)+tmp_img1(663 downto 656));
			tmp_img2(751 downto 744) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(751 downto 744)+tmp_img1(671 downto 664)-(tmp_img1(735 downto 728)+tmp_img1(655 downto 648));
			tmp_img2(743 downto 736) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(743 downto 736)+tmp_img1(663 downto 656)-(tmp_img1(727 downto 720)+tmp_img1(647 downto 640));
			tmp_img2(735 downto 728) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(735 downto 728)+tmp_img1(655 downto 648);
			tmp_img2(727 downto 720) <= tmp_sub(7 downto 0);
			-- 2nd Row
			tmp_sub <= "00000000" - tmp_img1(791 downto 784)-tmp_img1(711 downto 704)- tmp_img1(631 downto 624);
			tmp_img2(719 downto 712) <= tmp_sub(7 downto 0);									
			tmp_sub <= "00000000" + tmp_img1(799 downto 792)+tmp_img1(719 downto 712)+tmp_img1(639 downto 632)-(tmp_img1(783 downto 776)+tmp_img1(703 downto 696)+tmp_img1(623 downto 616));
			tmp_img2(711 downto 704) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(791 downto 784)+tmp_img1(711 downto 704)+tmp_img1(631 downto 624)-(tmp_img1(775 downto 768)+tmp_img1(695 downto 688)+tmp_img1(615 downto 608));
			tmp_img2(703 downto 696) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(783 downto 776)+tmp_img1(703 downto 696)+tmp_img1(623 downto 616)-(tmp_img1(767 downto 760)+tmp_img1(687 downto 680)+tmp_img1(607 downto 600));
			tmp_img2(695 downto 688) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(775 downto 768)+tmp_img1(695 downto 688)+tmp_img1(615 downto 608)-(tmp_img1(759 downto 752)+tmp_img1(679 downto 672)+tmp_img1(599 downto 592));
			tmp_img2(687 downto 680) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(767 downto 760)+tmp_img1(687 downto 680)+tmp_img1(607 downto 600)-(tmp_img1(751 downto 744)+tmp_img1(671 downto 664)+tmp_img1(691 downto 684));
			tmp_img2(679 downto 672) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(759 downto 752)+tmp_img1(679 downto 672)+tmp_img1(599 downto 592)-(tmp_img1(743 downto 736)+tmp_img1(663 downto 656)+tmp_img1(583 downto 576));
			tmp_img2(671 downto 664) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(751 downto 744)+tmp_img1(671 downto 664)+tmp_img1(591 downto 584)-(tmp_img1(735 downto 728)+tmp_img1(655 downto 648)+tmp_img1(575 downto 568));
			tmp_img2(663 downto 656) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(743 downto 736)+tmp_img1(663 downto 656)+tmp_img1(583 downto 576)-(tmp_img1(727 downto 720)+tmp_img1(647 downto 640)+tmp_img1(567 downto 560));
			tmp_img2(655 downto 648) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(735 downto 728)+tmp_img1(655 downto 648)+tmp_img1(575 downto 568);
			tmp_img2(647 downto 640) <= tmp_sub(7 downto 0);
			-- 3rd Row
			tmp_sub <= "00000000" - tmp_img1(711 downto 704)-tmp_img1(631 downto 624)-tmp_img1(551 downto 544);
			tmp_img2(639 downto 632) <= tmp_sub(7 downto 0);									
			tmp_sub <= "00000000" + tmp_img1(719 downto 712)+tmp_img1(639 downto 632)+tmp_img1(559 downto 552)-(tmp_img1(703 downto 696)+tmp_img1(623 downto 616)+tmp_img1(543 downto 536));
			tmp_img2(631 downto 624) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(711 downto 704)+tmp_img1(631 downto 624)+tmp_img1(551 downto 544)-(tmp_img1(695 downto 688)+tmp_img1(615 downto 608)+tmp_img1(635 downto 628));
			tmp_img2(623 downto 616) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(703 downto 696)+tmp_img1(623 downto 616)+tmp_img1(543 downto 536)-(tmp_img1(687 downto 680)+tmp_img1(607 downto 600)+tmp_img1(527 downto 520));
			tmp_img2(615 downto 608) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(695 downto 688)+tmp_img1(615 downto 608)+tmp_img1(535 downto 528)-(tmp_img1(759 downto 752)+tmp_img1(599 downto 592)+tmp_img1(519 downto 512));
			tmp_img2(607 downto 600) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(687 downto 680)+tmp_img1(607 downto 600)+tmp_img1(527 downto 520)-(tmp_img1(671 downto 664)+tmp_img1(591 downto 584)+tmp_img1(511 downto 504));
			tmp_img2(599 downto 592) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(679 downto 672)+tmp_img1(599 downto 592)+tmp_img1(519 downto 512)-(tmp_img1(663 downto 656)+tmp_img1(583 downto 576)+tmp_img1(503 downto 496));
			tmp_img2(591 downto 584) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(671 downto 664)+tmp_img1(591 downto 584)+tmp_img1(511 downto 504)-(tmp_img1(655 downto 648)+tmp_img1(575 downto 568)+tmp_img1(465 downto 458));
			tmp_img2(583 downto 576) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(663 downto 656)+tmp_img1(583 downto 576)+tmp_img1(503 downto 496)-(tmp_img1(647 downto 640)+tmp_img1(567 downto 560)+tmp_img1(487 downto 480));
			tmp_img2(575 downto 568) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(655 downto 648)+tmp_img1(575 downto 568)+tmp_img1(495 downto 488);
			tmp_img2(567 downto 560) <= tmp_sub(7 downto 0);
			-- 4th row
			tmp_sub <= "00000000" - tmp_img1(631 downto 624)-tmp_img1(551 downto 544)- tmp_img1(471 downto 464);
			tmp_img2(559 downto 552) <= tmp_sub(7 downto 0);									
			tmp_sub <= "00000000" + tmp_img1(639 downto 632)+tmp_img1(559 downto 552)+tmp_img1(479 downto 472)-(tmp_img1(623 downto 616)+tmp_img1(543 downto 536)+tmp_img1(463 downto 456));
			tmp_img2(551 downto 544) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(631 downto 624)+tmp_img1(551 downto 544)+tmp_img1(471 downto 464)-(tmp_img1(615 downto 608)+tmp_img1(535 downto 528)+tmp_img1(455 downto 448));
			tmp_img2(543 downto 536) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(623 downto 616)+tmp_img1(543 downto 536)+tmp_img1(463 downto 456)-(tmp_img1(607 downto 600)+tmp_img1(527 downto 520)+tmp_img1(447 downto 440));
			tmp_img2(535 downto 528) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(615 downto 608)+tmp_img1(535 downto 528)+tmp_img1(455 downto 448)-(tmp_img1(599 downto 592)+tmp_img1(519 downto 512)+tmp_img1(439 downto 432));
			tmp_img2(527 downto 520) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(607 downto 600)+tmp_img1(527 downto 520)+tmp_img1(447 downto 440)-(tmp_img1(591 downto 584)+tmp_img1(511 downto 504)+tmp_img1(431 downto 424));
			tmp_img2(519 downto 512) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(599 downto 592)+tmp_img1(519 downto 512)+tmp_img1(439 downto 432)-(tmp_img1(583 downto 576)+tmp_img1(503 downto 496)+tmp_img1(423 downto 416));
			tmp_img2(511 downto 504) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(591 downto 584)+tmp_img1(511 downto 504)+tmp_img1(431 downto 424)-(tmp_img1(575 downto 568)+tmp_img1(495 downto 488)+tmp_img1(415 downto 408));
			tmp_img2(503 downto 496) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(583 downto 576)+tmp_img1(503 downto 496)+tmp_img1(423 downto 416)-(tmp_img1(567 downto 560)+tmp_img1(487 downto 480)+tmp_img1(407 downto 400));
			tmp_img2(495 downto 488) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(575 downto 568)+tmp_img1(495 downto 488)+tmp_img1(415 downto 408);
			tmp_img2(487 downto 480) <= tmp_sub(7 downto 0);
			-- 5th Row
			tmp_sub <= "00000000" - tmp_img1(551 downto 544)-tmp_img1(471 downto 464)-tmp_img1(391 downto 384);
			tmp_img2(479 downto 472) <= tmp_sub(7 downto 0);									
			tmp_sub <= "00000000" + tmp_img1(559 downto 552)+tmp_img1(479 downto 472)+tmp_img1(399 downto 392)-(tmp_img1(543 downto 536)+tmp_img1(463 downto 456)+tmp_img1(383 downto 376));
			tmp_img2(471 downto 464) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(551 downto 544)+tmp_img1(471 downto 464)+tmp_img1(391 downto 384)-(tmp_img1(535 downto 528)+tmp_img1(455 downto 448)+tmp_img1(375 downto 368));
			tmp_img2(463 downto 456) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(543 downto 536)+tmp_img1(463 downto 456)+tmp_img1(383 downto 376)-(tmp_img1(527 downto 520)+tmp_img1(447 downto 440)+tmp_img1(367 downto 360));
			tmp_img2(455 downto 448) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(535 downto 528)+tmp_img1(455 downto 448)+tmp_img1(375 downto 368)-(tmp_img1(519 downto 512)+tmp_img1(439 downto 432)+tmp_img1(359 downto 352));
			tmp_img2(447 downto 440) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(527 downto 520)+tmp_img1(447 downto 440)+tmp_img1(367 downto 360)-(tmp_img1(511 downto 504)+tmp_img1(431 downto 424)+tmp_img1(351 downto 344));
			tmp_img2(439 downto 432) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(519 downto 512)+tmp_img1(439 downto 432)+tmp_img1(359 downto 352)-(tmp_img1(503 downto 496)+tmp_img1(423 downto 416)+tmp_img1(343 downto 336));
			tmp_img2(431 downto 424) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(511 downto 504)+tmp_img1(431 downto 424)+tmp_img1(351 downto 344)-(tmp_img1(495 downto 488)+tmp_img1(415 downto 408)+tmp_img1(335 downto 328));
			tmp_img2(423 downto 416) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(503 downto 496)+tmp_img1(423 downto 416)+tmp_img1(343 downto 336)-(tmp_img1(487 downto 480)+tmp_img1(407 downto 400)+tmp_img1(327 downto 320));
			tmp_img2(415 downto 408) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(495 downto 488)+tmp_img1(415 downto 408)+tmp_img1(335 downto 328);
			tmp_img2(407 downto 400) <= tmp_sub(7 downto 0);
			-- 6th row
			tmp_sub <= "00000000" - tmp_img1(471 downto 464)-tmp_img1(391 downto 384)-tmp_img1(311 downto 304);
			tmp_img2(399 downto 392) <= tmp_sub(7 downto 0);									
			tmp_sub <= "00000000" + tmp_img1(479 downto 472)+tmp_img1(399 downto 392)+tmp_img1(319 downto 312)-(tmp_img1(463 downto 456)+tmp_img1(383 downto 376)+tmp_img1(303 downto 296));
			tmp_img2(391 downto 384) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(471 downto 464)+tmp_img1(391 downto 384)+tmp_img1(311 downto 304)-(tmp_img1(455 downto 448)+tmp_img1(375 downto 368)+tmp_img1(295 downto 288));
			tmp_img2(383 downto 376) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(463 downto 456)+tmp_img1(383 downto 376)+tmp_img1(303 downto 296)-(tmp_img1(447 downto 440)+tmp_img1(367 downto 360)+tmp_img1(287 downto 280));
			tmp_img2(375 downto 368) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(455 downto 448)+tmp_img1(375 downto 368)+tmp_img1(295 downto 288)-(tmp_img1(439 downto 432)+tmp_img1(359 downto 352)+tmp_img1(279 downto 272));
			tmp_img2(367 downto 360) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(447 downto 440)+tmp_img1(367 downto 360)+tmp_img1(287 downto 280)-(tmp_img1(431 downto 424)+tmp_img1(351 downto 344)+tmp_img1(271 downto 264));
			tmp_img2(359 downto 352) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(439 downto 432)+tmp_img1(359 downto 352)+tmp_img1(279 downto 272)-(tmp_img1(423 downto 416)+tmp_img1(343 downto 336)+tmp_img1(263 downto 256));
			tmp_img2(351 downto 344) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(431 downto 424)+tmp_img1(351 downto 344)+tmp_img1(271 downto 264)-(tmp_img1(415 downto 408)+tmp_img1(335 downto 328)+tmp_img1(255 downto 248));
			tmp_img2(343 downto 336) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(423 downto 416)+tmp_img1(343 downto 336)+tmp_img1(263 downto 256)-(tmp_img1(407 downto 400)+tmp_img1(327 downto 320)+tmp_img1(247 downto 240));
			tmp_img2(335 downto 328) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(415 downto 408)+tmp_img1(335 downto 328)+tmp_img1(255 downto 248);
			tmp_img2(327 downto 320) <= tmp_sub(7 downto 0);
			-- 7th Row
			tmp_sub <= "00000000" - tmp_img1(391 downto 384)-tmp_img1(311 downto 304)-tmp_img1(231 downto 224);
			tmp_img2(319 downto 312) <= tmp_sub(7 downto 0);									
			tmp_sub <= "00000000" + tmp_img1(399 downto 392)+tmp_img1(319 downto 312)+tmp_img1(239 downto 232)-(tmp_img1(383 downto 376)+tmp_img1(303 downto 296)+tmp_img1(223 downto 216));
			tmp_img2(311 downto 304) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(391 downto 384)+tmp_img1(311 downto 304)+tmp_img1(231 downto 224)-(tmp_img1(375 downto 368)+tmp_img1(295 downto 288)+tmp_img1(215 downto 208));
			tmp_img2(303 downto 296) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(383 downto 376)+tmp_img1(303 downto 296)+tmp_img1(223 downto 216)-(tmp_img1(367 downto 360)+tmp_img1(287 downto 280)+tmp_img1(207 downto 200));
			tmp_img2(295 downto 288) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(375 downto 368)+tmp_img1(295 downto 288)+tmp_img1(215 downto 208)-(tmp_img1(359 downto 352)+tmp_img1(279 downto 272)+tmp_img1(199 downto 192));
			tmp_img2(287 downto 280) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(367 downto 360)+tmp_img1(287 downto 280)+tmp_img1(207 downto 200)-(tmp_img1(351 downto 344)+tmp_img1(271 downto 264)+tmp_img1(191 downto 184));
			tmp_img2(279 downto 272) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(359 downto 352)+tmp_img1(279 downto 272)+tmp_img1(199 downto 192)-(tmp_img1(343 downto 336)+tmp_img1(263 downto 256)+tmp_img1(183 downto 176));
			tmp_img2(271 downto 264) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(351 downto 344)+tmp_img1(271 downto 264)+tmp_img1(191 downto 184)-(tmp_img1(335 downto 328)+tmp_img1(255 downto 248)+tmp_img1(175 downto 168));
			tmp_img2(263 downto 256) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(343 downto 336)+tmp_img1(263 downto 256)+tmp_img1(183 downto 176)-(tmp_img1(327 downto 320)+tmp_img1(247 downto 240)+tmp_img1(167 downto 160));
			tmp_img2(255 downto 248) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(335 downto 328)+tmp_img1(255 downto 248)+tmp_img1(175 downto 168);
			tmp_img2(247 downto 240) <= tmp_sub(7 downto 0);
			-- 8th row
			tmp_sub <= "00000000" - tmp_img1(311 downto 304)-tmp_img1(231 downto 224)-tmp_img1(151 downto 144);
			tmp_img2(239 downto 232) <= tmp_sub(7 downto 0);									
			tmp_sub <= "00000000" + tmp_img1(319 downto 312)+tmp_img1(239 downto 232)+tmp_img1(159 downto 152)-(tmp_img1(303 downto 296)+tmp_img1(223 downto 216)+tmp_img1(143 downto 136));
			tmp_img2(231 downto 224) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(311 downto 304)+tmp_img1(231 downto 224)+tmp_img1(151 downto 144)-(tmp_img1(295 downto 288)+tmp_img1(215 downto 208)+tmp_img1(135 downto 128));
			tmp_img2(223 downto 216) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(303 downto 296)+tmp_img1(223 downto 216)+tmp_img1(143 downto 136)-(tmp_img1(287 downto 280)+tmp_img1(207 downto 200)+tmp_img1(127 downto 120));
			tmp_img2(215 downto 208) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(295 downto 288)+tmp_img1(215 downto 208)+tmp_img1(135 downto 128)-(tmp_img1(279 downto 272)+tmp_img1(119 downto 112)+tmp_img1(119 downto 112));
			tmp_img2(207 downto 200) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(287 downto 280)+tmp_img1(207 downto 200)+tmp_img1(127 downto 120)-(tmp_img1(271 downto 264)+tmp_img1(191 downto 184)+tmp_img1(111 downto 104));
			tmp_img2(199 downto 192) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(279 downto 272)+tmp_img1(199 downto 192)+tmp_img1(119 downto 112)-(tmp_img1(263 downto 256)+tmp_img1(183 downto 176)+tmp_img1(103 downto  96));
			tmp_img2(191 downto 184) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(271 downto 264)+tmp_img1(191 downto 184)+tmp_img1(111 downto 104)-(tmp_img1(255 downto 248)+tmp_img1(175 downto 168)+tmp_img1(95  downto  88));
			tmp_img2(183 downto 176) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(263 downto 256)+tmp_img1(183 downto 176)+tmp_img1(103 downto  96)-(tmp_img1(247 downto 240)+tmp_img1(167 downto 160)+tmp_img1(87  downto  80));
			tmp_img2(175 downto 168) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(255 downto 248)+tmp_img1(175 downto 168)+tmp_img1(95  downto  88);
			tmp_img2(167 downto 160) <= tmp_sub(7 downto 0);
			-- 9th Row
			tmp_sub <= "00000000" - tmp_img1(231 downto 224)-tmp_img1(151 downto 144)-tmp_img1(71  downto  64);
			tmp_img2(159 downto 152) <= tmp_sub(7 downto 0);									
			tmp_sub <= "00000000" + tmp_img1(239 downto 232)+tmp_img1(159 downto 152)+tmp_img1(79  downto  72)-(tmp_img1(223 downto 216)+tmp_img1(143 downto 136)+tmp_img1(63  downto  56));
			tmp_img2(151 downto 144) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(231 downto 224)+tmp_img1(151 downto 144)+tmp_img1(71  downto  64)-(tmp_img1(215 downto 208)+tmp_img1(135 downto 128)+tmp_img1(55  downto  48));
			tmp_img2(143 downto 136) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(223 downto 216)+tmp_img1(143 downto 136)+tmp_img1(63  downto  56)-(tmp_img1(207 downto 200)+tmp_img1(127 downto 120)+tmp_img1(47  downto  40));
			tmp_img2(135 downto 128) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(215 downto 208)+tmp_img1(135 downto 128)+tmp_img1(55  downto  48)-(tmp_img1(199 downto 192)+tmp_img1(119 downto 112)+tmp_img1(39  downto  32));
			tmp_img2(127 downto 120) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(207 downto 200)+tmp_img1(127 downto 120)+tmp_img1(47  downto  40)-(tmp_img1(191 downto 184)+tmp_img1(111 downto 104)+tmp_img1(31  downto  24));
			tmp_img2(119 downto 112) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(199 downto 192)+tmp_img1(119 downto 112)+tmp_img1(39  downto  32)-(tmp_img1(183 downto 176)+tmp_img1(103 downto  96)+tmp_img1(23  downto  16));
			tmp_img2(111 downto 104) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(191 downto 184)+tmp_img1(111 downto 104)+tmp_img1(31  downto  24)-(tmp_img1(175 downto 168)+tmp_img1(95  downto  88)+tmp_img1(15  downto   8));
			tmp_img2(103 downto  96) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(183 downto 176)+tmp_img1(103 downto  96)+tmp_img1(23  downto  16)-(tmp_img1(167 downto 160)+tmp_img1(87  downto  80)+tmp_img1(7   downto   0));
			tmp_img2(95  downto  88) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(175 downto 168)+tmp_img1(95  downto  88)+tmp_img1(15  downto   8);
			tmp_img2(87  downto  80) <= tmp_sub(7 downto 0);
			-- 10th row
			tmp_sub <= "00000000" - tmp_img1(151 downto 144)-tmp_img1(71  downto  64);
			tmp_img2(79  downto  72) <= tmp_sub(7 downto 0);									
			tmp_sub <= "00000000" + tmp_img1(159 downto 152)+tmp_img1(79  downto  72)-(tmp_img1(143 downto 136)+tmp_img1(63  downto  56));
			tmp_img2(71  downto  64) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(151 downto 144)+tmp_img1(71  downto  64)-(tmp_img1(135 downto 128)+tmp_img1(55  downto  48));
			tmp_img2(63  downto  56) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(143 downto 136)+tmp_img1(63  downto  56)-(tmp_img1(127 downto 120)+tmp_img1(47  downto  40));
			tmp_img2(55  downto  48) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(135 downto 128)+tmp_img1(55  downto  48)-(tmp_img1(119 downto 112)+tmp_img1(39  downto  32));
			tmp_img2(47  downto  40) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(127 downto 120)+tmp_img1(47  downto  40)-(tmp_img1(111 downto 104)+tmp_img1(31  downto  24));
			tmp_img2(39  downto  32) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(119 downto 112)+tmp_img1(39  downto  32)-(tmp_img1(103 downto  96)+tmp_img1(23  downto  16));
			tmp_img2(31  downto  24) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(111 downto 104)+tmp_img1(31  downto  24)-(tmp_img1(95  downto  88)+tmp_img1(15  downto   8));
			tmp_img2(23  downto  16) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(103 downto  96)+tmp_img1(23  downto  16)-(tmp_img1(87  downto  80)+tmp_img1(7   downto   0));
			tmp_img2(15  downto   8) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(95  downto  88)+tmp_img1(15  downto   8);
			tmp_img2(7   downto   0) <= tmp_sub(7 downto 0);
			
			conved_img(3999 downto 3200) <= std_logic_vector(tmp_img2);
			
			
			-- Convolving with f2
			-- 1st Row
			tmp_sub <= "00000000" - tmp_img1(719 downto 712)- tmp_img1(711 downto 704);
			tmp_img2(799 downto 792) <= tmp_sub(7 downto 0);									
			tmp_sub <= "00000000" -(tmp_img1(719 downto 712)+tmp_img1(711 downto 704)+tmp_img1(703 downto 696));
			tmp_img2(791 downto 784) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" -(tmp_img1(711 downto 704)+tmp_img1(703 downto 696)+tmp_img1(695 downto 688));
			tmp_img2(783 downto 776) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" -(tmp_img1(703 downto 696)+tmp_img1(695 downto 688)+tmp_img1(687 downto 680));
			tmp_img2(775 downto 768) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" -(tmp_img1(695 downto 688)+tmp_img1(687 downto 680)+tmp_img1(679 downto 672));
			tmp_img2(767 downto 760) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" -(tmp_img1(687 downto 680)+tmp_img1(679 downto 672)+tmp_img1(671 downto 664));
			tmp_img2(759 downto 752) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" -(tmp_img1(679 downto 672)+tmp_img1(671 downto 664)+tmp_img1(663 downto 656));
			tmp_img2(751 downto 744) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" -(tmp_img1(671 downto 664)+tmp_img1(663 downto 656)+tmp_img1(655 downto 648));
			tmp_img2(743 downto 736) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" -(tmp_img1(663 downto 656)+tmp_img1(655 downto 648)+tmp_img1(647 downto 640));
			tmp_img2(735 downto 728) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" -(tmp_img1(655 downto 648)+tmp_img1(647 downto 640));
			tmp_img2(727 downto 720) <= tmp_sub(7 downto 0);
			-- 2nd Row
			tmp_sub <= "00000000" + tmp_img1(799 downto 792)+tmp_img1(791 downto 784)-tmp_img1(639 downto 632)-tmp_img1(631 downto 624);
			tmp_img2(719 downto 712) <= tmp_sub(7 downto 0);									
			tmp_sub <= "00000000" + tmp_img1(799 downto 792)+tmp_img1(791 downto 784)+tmp_img1(783 downto 776)-(tmp_img1(639 downto 632)+tmp_img1(631 downto 624)+tmp_img1(623 downto 616));
			tmp_img2(711 downto 704) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(791 downto 784)+tmp_img1(783 downto 776)+tmp_img1(775 downto 768)-(tmp_img1(631 downto 624)+tmp_img1(623 downto 616)+tmp_img1(615 downto 608));
			tmp_img2(703 downto 696) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(783 downto 776)+tmp_img1(775 downto 768)+tmp_img1(767 downto 760)-(tmp_img1(623 downto 616)+tmp_img1(615 downto 608)+tmp_img1(607 downto 600));
			tmp_img2(695 downto 688) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(775 downto 768)+tmp_img1(767 downto 760)+tmp_img1(759 downto 752)-(tmp_img1(615 downto 608)+tmp_img1(607 downto 600)+tmp_img1(599 downto 592));
			tmp_img2(687 downto 680) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(767 downto 760)+tmp_img1(759 downto 752)+tmp_img1(751 downto 744)-(tmp_img1(607 downto 600)+tmp_img1(599 downto 592)+tmp_img1(591 downto 584));
			tmp_img2(679 downto 672) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(759 downto 752)+tmp_img1(751 downto 744)+tmp_img1(743 downto 736)-(tmp_img1(599 downto 592)+tmp_img1(591 downto 584)+tmp_img1(583 downto 576));
			tmp_img2(671 downto 664) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(751 downto 744)+tmp_img1(743 downto 736)+tmp_img1(735 downto 728)-(tmp_img1(591 downto 584)+tmp_img1(583 downto 576)+tmp_img1(575 downto 568));
			tmp_img2(663 downto 656) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(743 downto 736)+tmp_img1(735 downto 728)+tmp_img1(727 downto 720)-(tmp_img1(583 downto 576)+tmp_img1(575 downto 568)+tmp_img1(567 downto 560));
			tmp_img2(655 downto 648) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(735 downto 728)+tmp_img1(727 downto 720)+tmp_img1(719 downto 712);
			tmp_img2(647 downto 640) <= tmp_sub(7 downto 0);
			-- 3rd Row
			tmp_sub <= "00000000" + tmp_img1(719 downto 712)+tmp_img1(711 downto 704)-tmp_img1(559 downto 552)-tmp_img1(551 downto 544);
			tmp_img2(639 downto 632) <= tmp_sub(7 downto 0);									
			tmp_sub <= "00000000" + tmp_img1(719 downto 712)+tmp_img1(711 downto 704)+tmp_img1(703 downto 696)-(tmp_img1(559 downto 552)+tmp_img1(551 downto 544)+tmp_img1(542 downto 536));
			tmp_img2(631 downto 624) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(711 downto 704)+tmp_img1(703 downto 696)+tmp_img1(695 downto 688)-(tmp_img1(551 downto 544)+tmp_img1(543 downto 536)+tmp_img1(534 downto 528));
			tmp_img2(623 downto 616) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(703 downto 696)+tmp_img1(695 downto 688)+tmp_img1(687 downto 680)-(tmp_img1(543 downto 536)+tmp_img1(535 downto 528)+tmp_img1(526 downto 520));
			tmp_img2(615 downto 608) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(695 downto 688)+tmp_img1(687 downto 680)+tmp_img1(679 downto 672)-(tmp_img1(535 downto 528)+tmp_img1(527 downto 520)+tmp_img1(518 downto 512));
			tmp_img2(607 downto 600) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(687 downto 680)+tmp_img1(679 downto 672)+tmp_img1(671 downto 664)-(tmp_img1(527 downto 520)+tmp_img1(519 downto 512)+tmp_img1(510 downto 504));
			tmp_img2(599 downto 592) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(679 downto 672)+tmp_img1(671 downto 664)+tmp_img1(663 downto 656)-(tmp_img1(519 downto 512)+tmp_img1(511 downto 504)+tmp_img1(502 downto 496));
			tmp_img2(591 downto 584) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(671 downto 664)+tmp_img1(663 downto 656)+tmp_img1(655 downto 648)-(tmp_img1(511 downto 504)+tmp_img1(503 downto 496)+tmp_img1(494 downto 488));
			tmp_img2(583 downto 576) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(663 downto 656)+tmp_img1(655 downto 648)+tmp_img1(647 downto 640)-(tmp_img1(503 downto 496)+tmp_img1(495 downto 488)+tmp_img1(486 downto 480));
			tmp_img2(575 downto 568) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(655 downto 648)+tmp_img1(647 downto 640)+tmp_img1(639 downto 632)-tmp_img1(495 downto 488)-tmp_img1(487 downto 480);
			tmp_img2(567 downto 560) <= tmp_sub(7 downto 0);
			-- 4th row
			tmp_sub <= "00000000" + tmp_img1(639 downto 632)+tmp_img1(531 downto 524)- tmp_img1(479 downto 472)- tmp_img1(471 downto 464);
			tmp_img2(559 downto 552) <= tmp_sub(7 downto 0);									
			tmp_sub <= "00000000" + tmp_img1(639 downto 632)+tmp_img1(523 downto 516)+tmp_img1(623 downto 616)-(tmp_img1(479 downto 472)+tmp_img1(471 downto 464)+tmp_img1(463 downto 456));
			tmp_img2(551 downto 544) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(631 downto 624)+tmp_img1(515 downto 508)+tmp_img1(615 downto 608)-(tmp_img1(471 downto 464)+tmp_img1(463 downto 456)+tmp_img1(455 downto 448));
			tmp_img2(543 downto 536) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(623 downto 616)+tmp_img1(507 downto 500)+tmp_img1(607 downto 600)-(tmp_img1(463 downto 456)+tmp_img1(455 downto 448)+tmp_img1(447 downto 440));
			tmp_img2(535 downto 528) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(615 downto 608)+tmp_img1(499 downto 492)+tmp_img1(599 downto 592)-(tmp_img1(455 downto 448)+tmp_img1(447 downto 440)+tmp_img1(439 downto 432));
			tmp_img2(527 downto 520) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(607 downto 600)+tmp_img1(491 downto 484)+tmp_img1(591 downto 584)-(tmp_img1(447 downto 440)+tmp_img1(439 downto 432)+tmp_img1(431 downto 424));
			tmp_img2(519 downto 512) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(599 downto 592)+tmp_img1(483 downto 476)+tmp_img1(583 downto 576)-(tmp_img1(439 downto 432)+tmp_img1(431 downto 424)+tmp_img1(423 downto 416));
			tmp_img2(511 downto 504) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(591 downto 584)+tmp_img1(475 downto 468)+tmp_img1(575 downto 568)-(tmp_img1(431 downto 424)+tmp_img1(423 downto 416)+tmp_img1(415 downto 408));
			tmp_img2(503 downto 496) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(583 downto 576)+tmp_img1(467 downto 460)+tmp_img1(567 downto 560)-(tmp_img1(423 downto 416)+tmp_img1(415 downto 408)+tmp_img1(407 downto 400));
			tmp_img2(495 downto 488) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(575 downto 568)+tmp_img1(567 downto 560)-tmp_img1(415 downto 408)-tmp_img1(407 downto 400);
			tmp_img2(487 downto 480) <= tmp_sub(7 downto 0);
			-- 5th Row
			tmp_sub <= "00000000" + tmp_img1(559 downto 552)+tmp_img1(551 downto 544)-tmp_img1(399 downto 392)-tmp_img1(391 downto 384);
			tmp_img2(479 downto 472) <= tmp_sub(7 downto 0);									
			tmp_sub <= "00000000" + tmp_img1(559 downto 552)+tmp_img1(551 downto 544)+tmp_img1(543 downto 536)-(tmp_img1(399 downto 392)+tmp_img1(391 downto 384)+tmp_img1(383 downto 376));
			tmp_img2(471 downto 464) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(551 downto 544)+tmp_img1(543 downto 536)+tmp_img1(535 downto 528)-(tmp_img1(391 downto 384)+tmp_img1(455 downto 448)+tmp_img1(375 downto 368));
			tmp_img2(463 downto 456) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(543 downto 536)+tmp_img1(535 downto 528)+tmp_img1(527 downto 520)-(tmp_img1(383 downto 376)+tmp_img1(447 downto 440)+tmp_img1(367 downto 360));
			tmp_img2(455 downto 448) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(535 downto 528)+tmp_img1(527 downto 520)+tmp_img1(519 downto 512)-(tmp_img1(375 downto 368)+tmp_img1(439 downto 432)+tmp_img1(359 downto 352));
			tmp_img2(447 downto 440) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(527 downto 520)+tmp_img1(519 downto 512)+tmp_img1(511 downto 504)-(tmp_img1(367 downto 360)+tmp_img1(431 downto 424)+tmp_img1(351 downto 344));
			tmp_img2(439 downto 432) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(519 downto 512)+tmp_img1(511 downto 504)+tmp_img1(503 downto 496)-(tmp_img1(359 downto 352)+tmp_img1(423 downto 416)+tmp_img1(343 downto 336));
			tmp_img2(431 downto 424) <= tmp_sub(7 downto 0);
--			tmp_sub <= "00000000" + tmp_img1(511 downto 504)+tmp_img1(503 downto 469)+tmp_img1(495 downto 488)-(tmp_img1(351 downto 344)+tmp_img1(415 downto 408)+tmp_img1(335 downto 328));
			tmp_img2(423 downto 416) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(503 downto 496)+tmp_img1(495 downto 488)+tmp_img1(477 downto 470)-(tmp_img1(343 downto 336)+tmp_img1(407 downto 400)+tmp_img1(327 downto 320));
			tmp_img2(415 downto 408) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(495 downto 488)+tmp_img1(487 downto 480)-tmp_img1(335 downto 328)-tmp_img1(327 downto 320);
			tmp_img2(407 downto 400) <= tmp_sub(7 downto 0);
			-- 6th row
			tmp_sub <= "00000000" + tmp_img1(479 downto 472)-tmp_img1(471 downto 464)-tmp_img1(319 downto 312)-tmp_img1(311 downto 304);
			tmp_img2(399 downto 392) <= tmp_sub(7 downto 0);									
			tmp_sub <= "00000000" + tmp_img1(479 downto 472)+tmp_img1(471 downto 464)+tmp_img1(463 downto 456)-(tmp_img1(319 downto 312)+tmp_img1(311 downto 304)+tmp_img1(303 downto 296));
			tmp_img2(391 downto 384) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(471 downto 464)+tmp_img1(463 downto 456)+tmp_img1(455 downto 448)-(tmp_img1(311 downto 304)+tmp_img1(303 downto 296)+tmp_img1(295 downto 288));
			tmp_img2(383 downto 376) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(463 downto 456)+tmp_img1(455 downto 448)+tmp_img1(447 downto 440)-(tmp_img1(303 downto 296)+tmp_img1(295 downto 288)+tmp_img1(287 downto 280));
			tmp_img2(375 downto 368) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(455 downto 448)+tmp_img1(447 downto 440)+tmp_img1(439 downto 432)-(tmp_img1(295 downto 288)+tmp_img1(287 downto 280)+tmp_img1(279 downto 272));
			tmp_img2(367 downto 360) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(447 downto 440)+tmp_img1(439 downto 432)+tmp_img1(431 downto 424)-(tmp_img1(287 downto 280)+tmp_img1(279 downto 272)+tmp_img1(271 downto 264));
			tmp_img2(359 downto 352) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(439 downto 432)+tmp_img1(431 downto 424)+tmp_img1(423 downto 416)-(tmp_img1(279 downto 272)+tmp_img1(271 downto 264)+tmp_img1(263 downto 256));
			tmp_img2(351 downto 344) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(431 downto 424)+tmp_img1(423 downto 416)+tmp_img1(415 downto 408)-(tmp_img1(271 downto 264)+tmp_img1(263 downto 256)+tmp_img1(255 downto 248));
			tmp_img2(343 downto 336) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(423 downto 416)+tmp_img1(415 downto 408)+tmp_img1(407 downto 400)-(tmp_img1(263 downto 256)+tmp_img1(255 downto 248)+tmp_img1(247 downto 240));
			tmp_img2(335 downto 328) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(415 downto 408)+tmp_img1(407 downto 400)-tmp_img1(255 downto 248)-tmp_img1(247 downto 240);
			tmp_img2(327 downto 320) <= tmp_sub(7 downto 0);
			-- 7th Row
			tmp_sub <= "00000000" + tmp_img1(399 downto 392)+tmp_img1(391 downto 384)-tmp_img1(231 downto 224)-tmp_img1(239 downto 232);
			tmp_img2(319 downto 312) <= tmp_sub(7 downto 0);									
			tmp_sub <= "00000000" + tmp_img1(399 downto 392)+tmp_img1(391 downto 384)+tmp_img1(383 downto 376)-(tmp_img1(239 downto 232)+tmp_img1(231 downto 224)+tmp_img1(223 downto 216));
			tmp_img2(311 downto 304) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(391 downto 384)+tmp_img1(383 downto 376)+tmp_img1(375 downto 368)-(tmp_img1(231 downto 224)+tmp_img1(223 downto 216)+tmp_img1(215 downto 208));
			tmp_img2(303 downto 296) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(383 downto 376)+tmp_img1(375 downto 368)+tmp_img1(367 downto 360)-(tmp_img1(223 downto 216)+tmp_img1(215 downto 208)+tmp_img1(207 downto 200));
			tmp_img2(295 downto 288) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(375 downto 368)+tmp_img1(367 downto 360)+tmp_img1(359 downto 352)-(tmp_img1(215 downto 208)+tmp_img1(207 downto 200)+tmp_img1(199 downto 192));
			tmp_img2(287 downto 280) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(367 downto 360)+tmp_img1(359 downto 352)+tmp_img1(351 downto 344)-(tmp_img1(207 downto 200)+tmp_img1(199 downto 192)+tmp_img1(191 downto 184));
			tmp_img2(279 downto 272) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(359 downto 352)+tmp_img1(351 downto 344)+tmp_img1(343 downto 336)-(tmp_img1(199 downto 192)+tmp_img1(191 downto 184)+tmp_img1(183 downto 176));
			tmp_img2(271 downto 264) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(351 downto 344)+tmp_img1(343 downto 336)+tmp_img1(335 downto 328)-(tmp_img1(191 downto 184)+tmp_img1(183 downto 176)+tmp_img1(175 downto 168));
			tmp_img2(263 downto 256) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(343 downto 336)+tmp_img1(335 downto 328)+tmp_img1(327 downto 320)-(tmp_img1(183 downto 176)+tmp_img1(175 downto 168)+tmp_img1(167 downto 160));
			tmp_img2(255 downto 248) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(335 downto 328)+tmp_img1(327 downto 320)-tmp_img1(175 downto 168)-tmp_img1(167 downto 160);
			tmp_img2(247 downto 240) <= tmp_sub(7 downto 0);
			-- 8th row
			tmp_sub <= "00000000" + tmp_img1(319 downto 312)+tmp_img1(311 downto 304)-tmp_img1(159 downto 152)-tmp_img1(141 downto 134);
			tmp_img2(239 downto 232) <= tmp_sub(7 downto 0);									
			tmp_sub <= "00000000" + tmp_img1(319 downto 312)+tmp_img1(311 downto 304)+tmp_img1(303 downto 296)-(tmp_img1(159 downto 152)+tmp_img1(151 downto 144)+tmp_img1(143 downto 136));
			tmp_img2(231 downto 224) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(311 downto 304)+tmp_img1(303 downto 296)+tmp_img1(295 downto 288)-(tmp_img1(151 downto 144)+tmp_img1(143 downto 136)+tmp_img1(135 downto 128));
			tmp_img2(223 downto 216) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(303 downto 296)+tmp_img1(295 downto 288)+tmp_img1(287 downto 280)-(tmp_img1(143 downto 136)+tmp_img1(135 downto 128)+tmp_img1(127 downto 120));
			tmp_img2(215 downto 208) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(295 downto 288)+tmp_img1(287 downto 280)+tmp_img1(279 downto 272)-(tmp_img1(135 downto 128)+tmp_img1(127 downto 120)+tmp_img1(119 downto 112));
			tmp_img2(207 downto 200) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(287 downto 280)+tmp_img1(279 downto 272)+tmp_img1(271 downto 264)-(tmp_img1(127 downto 120)+tmp_img1(119 downto 112)+tmp_img1(111 downto 104));
			tmp_img2(199 downto 192) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(279 downto 272)+tmp_img1(271 downto 264)+tmp_img1(263 downto 256)-(tmp_img1(119 downto 112)+tmp_img1(111 downto 104)+tmp_img1(103 downto  96));
			tmp_img2(191 downto 184) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(271 downto 264)+tmp_img1(263 downto 256)+tmp_img1(255 downto 248)-(tmp_img1(111 downto 104)+tmp_img1(103 downto 96)+tmp_img1(95  downto  88));
			tmp_img2(183 downto 176) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(263 downto 256)+tmp_img1(255 downto 248)+tmp_img1(247 downto 240)-(tmp_img1(103 downto 96)+tmp_img1(95 downto 88)+tmp_img1(87  downto  80));
			tmp_img2(175 downto 168) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(255 downto 248)+tmp_img1(247 downto 240)-tmp_img1(95  downto  88)-tmp_img1(87  downto  80);
			tmp_img2(167 downto 160) <= tmp_sub(7 downto 0);
			-- 9th Row
			tmp_sub <= "00000000" + tmp_img1(239 downto 232)+tmp_img1(231 downto 224)-tmp_img1(79  downto  72)-tmp_img1(71  downto  64);
			tmp_img2(159 downto 152) <= tmp_sub(7 downto 0);									
			tmp_sub <= "00000000" + tmp_img1(239 downto 232)+tmp_img1(231 downto 224)+tmp_img1(223  downto  216)-(tmp_img1(79 downto 72)+tmp_img1(71 downto 64)+tmp_img1(63  downto  56));
			tmp_img2(151 downto 144) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(231 downto 224)+tmp_img1(223 downto 216)+tmp_img1(215  downto  208)-(tmp_img1(71 downto 64)+tmp_img1(63 downto 56)+tmp_img1(55  downto  48));
			tmp_img2(143 downto 136) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(223 downto 216)+tmp_img1(215 downto 208)+tmp_img1(207  downto  200)-(tmp_img1(63 downto 56)+tmp_img1(55 downto 48)+tmp_img1(47  downto  40));
			tmp_img2(135 downto 128) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(215 downto 208)+tmp_img1(207 downto 200)+tmp_img1(199  downto  192)-(tmp_img1(55 downto 48)+tmp_img1(47 downto 40)+tmp_img1(39  downto  32));
			tmp_img2(127 downto 120) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(207 downto 200)+tmp_img1(199 downto 192)+tmp_img1(191  downto  184)-(tmp_img1(47 downto 40)+tmp_img1(39 downto 32)+tmp_img1(31  downto  24));
			tmp_img2(119 downto 112) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(199 downto 192)+tmp_img1(191 downto 184)+tmp_img1(183  downto  176)-(tmp_img1(39 downto 32)+tmp_img1(31 downto  24)+tmp_img1(23  downto  16));
			tmp_img2(111 downto 104) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(191 downto 184)+tmp_img1(183 downto 176)+tmp_img1(175  downto  168)-(tmp_img1(31 downto 24)+tmp_img1(23  downto  16)+tmp_img1(15  downto   8));
			tmp_img2(103 downto  96) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(183 downto 176)+tmp_img1(175 downto  168)+tmp_img1(167  downto  160)-(tmp_img1(167 downto 160)+tmp_img1(15  downto  8)+tmp_img1(7   downto   0));
			tmp_img2(95  downto  88) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(175 downto 168)+tmp_img1(167  downto  160)-tmp_img1(15  downto   8)-tmp_img1(7  downto   0);
			tmp_img2(87  downto  80) <= tmp_sub(7 downto 0);
			-- 10th row
			tmp_sub <= "00000000" + tmp_img1(159 downto 152)+tmp_img1(151 downto  144);
			tmp_img2(79  downto  72) <= tmp_sub(7 downto 0);									
			tmp_sub <= "00000000" + tmp_img1(159 downto 152)+tmp_img1(151 downto  144)+tmp_img1(143 downto 136);
			tmp_img2(71  downto  64) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(151 downto 144)+tmp_img1(143  downto  136)+(tmp_img1(135 downto 128));
			tmp_img2(63  downto  56) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(143 downto 136)+tmp_img1(135  downto  128)+(tmp_img1(127 downto 120));
			tmp_img2(55  downto  48) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(135 downto 128)+tmp_img1(127  downto  120)+(tmp_img1(119 downto 112));
			tmp_img2(47  downto  40) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(127 downto 120)+tmp_img1(119  downto  112)+(tmp_img1(111 downto 104));
			tmp_img2(39  downto  32) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(119 downto 112)+tmp_img1(111  downto  104)+(tmp_img1(103 downto  96));
			tmp_img2(31  downto  24) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(111 downto 104)+tmp_img1(103  downto  96)+(tmp_img1(95  downto  88));
			tmp_img2(23  downto  16) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(103 downto  96)+tmp_img1(95  downto  88)+(tmp_img1(87  downto  80));
			tmp_img2(15  downto   8) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(95  downto  88)+tmp_img1(87  downto   80);
			tmp_img2(7   downto   0) <= tmp_sub(7 downto 0);
			
			conved_img(3199 downto 2400) <= std_logic_vector(tmp_img2);
			
			
			-- Convolving with f3
			-- 1st Row
			tmp_sub <= "00000000" + tmp_img1(799 downto 792);
			tmp_img2(799 downto 792) <= tmp_sub(7 downto 0);	
			tmp_sub <= "00000000" + tmp_img1(791 downto 784);
			tmp_img2(791 downto 784) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(783 downto 776);
			tmp_img2(783 downto 776) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(775 downto 768);
			tmp_img2(775 downto 768) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(767 downto 760);
			tmp_img2(767 downto 760) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(759 downto 752);
			tmp_img2(759 downto 752) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(751 downto 744);
			tmp_img2(751 downto 744) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(743 downto 736);
			tmp_img2(743 downto 736) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(735 downto 728);
			tmp_img2(735 downto 728) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(727 downto 720);
			tmp_img2(727 downto 720) <= tmp_sub(7 downto 0);
			-- 2nd Row
			tmp_sub <= "00000000" + tmp_img1(719 downto 712);
			tmp_img2(719 downto 712) <= tmp_sub(7 downto 0);	
			tmp_sub <= "00000000" + tmp_img1(711 downto 704);
			tmp_img2(711 downto 704) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(703 downto 696);
			tmp_img2(703 downto 696) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(695 downto 688);
			tmp_img2(695 downto 688) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(687 downto 680);
			tmp_img2(687 downto 680) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(679 downto 672);
			tmp_img2(679 downto 672) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(671 downto 664);
			tmp_img2(671 downto 664) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(663 downto 656);
			tmp_img2(663 downto 656) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(655 downto 648);
			tmp_img2(655 downto 648) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(647 downto 640);
			tmp_img2(647 downto 640) <= tmp_sub(7 downto 0);
			-- 3rd Row
			tmp_sub <= "00000000" + tmp_img1(639 downto 632);
			tmp_img2(639 downto 632) <= tmp_sub(7 downto 0);	
			tmp_sub <= "00000000" + tmp_img1(631 downto 624);
			tmp_img2(631 downto 624) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(623 downto 616);
			tmp_img2(623 downto 616) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(615 downto 608);
			tmp_img2(615 downto 608) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(607 downto 600);
			tmp_img2(607 downto 600) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(599 downto 592);
			tmp_img2(599 downto 592) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(591 downto 584);
			tmp_img2(591 downto 584) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(583 downto 576);
			tmp_img2(583 downto 576) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(575 downto 568);
			tmp_img2(575 downto 568) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(567 downto 560);
			tmp_img2(567 downto 560) <= tmp_sub(7 downto 0);
			-- 4th Row
			tmp_sub <= "00000000" + tmp_img1(559 downto 552);
			tmp_img2(559 downto 552) <= tmp_sub(7 downto 0);	
			tmp_sub <= "00000000" + tmp_img1(551 downto 544);
			tmp_img2(551 downto 544) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(543 downto 536);
			tmp_img2(543 downto 536) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(535 downto 528);
			tmp_img2(535 downto 528) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(527 downto 520);
			tmp_img2(527 downto 520) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(519 downto 512);
			tmp_img2(519 downto 512) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(511 downto 504);
			tmp_img2(511 downto 504) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(503 downto 496);
			tmp_img2(503 downto 496) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(495 downto 488);
			tmp_img2(495 downto 488) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(487 downto 480);
			tmp_img2(487 downto 480) <= tmp_sub(7 downto 0);
			-- 5th Row
			tmp_sub <= "00000000" + tmp_img1(479 downto 472);
			tmp_img2(479 downto 472) <= tmp_sub(7 downto 0);	
			tmp_sub <= "00000000" + tmp_img1(471 downto 464);
			tmp_img2(471 downto 464) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(463 downto 456);
			tmp_img2(463 downto 456) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(455 downto 448);
			tmp_img2(455 downto 448) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(447 downto 440);
			tmp_img2(447 downto 440) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(439 downto 432);
			tmp_img2(439 downto 432) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(431 downto 424);
			tmp_img2(431 downto 424) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(423 downto 416);
			tmp_img2(423 downto 416) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(415 downto 408);
			tmp_img2(415 downto 408) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(407 downto 400);
			tmp_img2(407 downto 400) <= tmp_sub(7 downto 0);
			-- 6th Row
			tmp_sub <= "00000000" + tmp_img1(399 downto 392);
			tmp_img2(399 downto 392) <= tmp_sub(7 downto 0);	
			tmp_sub <= "00000000" + tmp_img1(391 downto 384);
			tmp_img2(391 downto 384) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(383 downto 376);
			tmp_img2(383 downto 376) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(375 downto 368);
			tmp_img2(375 downto 368) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(367 downto 360);
			tmp_img2(367 downto 360) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(359 downto 352);
			tmp_img2(359 downto 352) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(351 downto 344);
			tmp_img2(351 downto 344) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(343 downto 336);
			tmp_img2(343 downto 336) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(335 downto 328);
			tmp_img2(335 downto 328) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(327 downto 320);
			tmp_img2(327 downto 320) <= tmp_sub(7 downto 0);
			-- 7th Row
			tmp_sub <= "00000000" + tmp_img1(319 downto 312);
			tmp_img2(319 downto 312) <= tmp_sub(7 downto 0);	
			tmp_sub <= "00000000" + tmp_img1(311 downto 304);
			tmp_img2(311 downto 304) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(303 downto 296);
			tmp_img2(303 downto 296) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(295 downto 288);
			tmp_img2(295 downto 288) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(287 downto 280);
			tmp_img2(287 downto 280) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(279 downto 272);
			tmp_img2(279 downto 272) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(271 downto 264);
			tmp_img2(271 downto 264) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(263 downto 256);
			tmp_img2(263 downto 256) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(255 downto 248);
			tmp_img2(255 downto 248) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(247 downto 240);
			tmp_img2(247 downto 240) <= tmp_sub(7 downto 0);
			-- 8th Row
			tmp_sub <= "00000000" + tmp_img1(239 downto 232);
			tmp_img2(239 downto 232) <= tmp_sub(7 downto 0);	
			tmp_sub <= "00000000" + tmp_img1(231 downto 224);
			tmp_img2(231 downto 224) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(223 downto 216);
			tmp_img2(223 downto 216) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(215 downto 208);
			tmp_img2(215 downto 208) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(207 downto 200);
			tmp_img2(207 downto 200) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(199 downto 192);
			tmp_img2(199 downto 192) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(191 downto 184);
			tmp_img2(191 downto 184) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(183 downto 176);
			tmp_img2(183 downto 176) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(175 downto 168);
			tmp_img2(175 downto 168) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(167 downto 160);
			tmp_img2(167 downto 160) <= tmp_sub(7 downto 0);
			-- 9th Row
			tmp_sub <= "00000000" + tmp_img1(159 downto 152);
			tmp_img2(159 downto 152) <= tmp_sub(7 downto 0);	
			tmp_sub <= "00000000" + tmp_img1(151 downto 144);
			tmp_img2(151 downto 144) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(143 downto 136);
			tmp_img2(143 downto 136) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(135 downto 128);
			tmp_img2(135 downto 128) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(127 downto 120);
			tmp_img2(127 downto 120) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(119 downto 112);
			tmp_img2(119 downto 112) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(111 downto 104);
			tmp_img2(111 downto 104) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(103 downto 96);
			tmp_img2(103 downto 96) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(95 downto 88);
			tmp_img2(95 downto 88) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(87 downto 80);
			tmp_img2(87 downto 80) <= tmp_sub(7 downto 0);
			-- 10th Row
			tmp_sub <= "00000000" + tmp_img1(79 downto 72);
			tmp_img2(79 downto 72) <= tmp_sub(7 downto 0);	
			tmp_sub <= "00000000" + tmp_img1(71 downto 64);
			tmp_img2(71 downto 64) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(63 downto 56);
			tmp_img2(63 downto 56) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(55 downto 48);
			tmp_img2(55 downto 48) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(47 downto 40);
			tmp_img2(47 downto 40) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(39 downto 32);
			tmp_img2(39 downto 32) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(31 downto 24);
			tmp_img2(31 downto 24) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(23 downto 16);
			tmp_img2(23 downto 16) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(15 downto 8);
			tmp_img2(15 downto 8) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(7 downto 0);
			tmp_img2(7 downto 0) <= tmp_sub(7 downto 0);
			
			conved_img(2399 downto 1600) <= std_logic_vector(tmp_img2);		
			
			
			-- Convolving with f4
			-- 1st Row
			tmp_sub <= "00000000" + tmp_img1(799 downto 792);
			tmp_img2(799 downto 792) <= tmp_sub(7 downto 0);	
			tmp_sub <= "00000000" + tmp_img1(791 downto 784);
			tmp_img2(791 downto 784) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(783 downto 776);
			tmp_img2(783 downto 776) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(775 downto 768);
			tmp_img2(775 downto 768) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(767 downto 760);
			tmp_img2(767 downto 760) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(759 downto 752);
			tmp_img2(759 downto 752) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(751 downto 744);
			tmp_img2(751 downto 744) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(743 downto 736);
			tmp_img2(743 downto 736) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(735 downto 728);
			tmp_img2(735 downto 728) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(727 downto 720);
			tmp_img2(727 downto 720) <= tmp_sub(7 downto 0);
			-- 2nd Row
			tmp_sub <= "00000000" + tmp_img1(719 downto 712)+ tmp_img1(799 downto 792);
			tmp_img2(719 downto 712) <= tmp_sub(7 downto 0);	
			tmp_sub <= "00000000" + tmp_img1(711 downto 704)+ tmp_img1(791 downto 784);
			tmp_img2(711 downto 704) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(703 downto 696)+ tmp_img1(783 downto 776);
			tmp_img2(703 downto 696) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(695 downto 688)+ tmp_img1(775 downto 768);
			tmp_img2(695 downto 688) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(687 downto 680)+ tmp_img1(767 downto 760);
			tmp_img2(687 downto 680) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(679 downto 672)+ tmp_img1(759 downto 752);
			tmp_img2(679 downto 672) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(671 downto 664)+ tmp_img1(751 downto 744);
			tmp_img2(671 downto 664) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(663 downto 656)+ tmp_img1(743 downto 736);
			tmp_img2(663 downto 656) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(655 downto 648)+ tmp_img1(735 downto 728);
			tmp_img2(655 downto 648) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(647 downto 640)+ tmp_img1(727 downto 720);
			tmp_img2(647 downto 640) <= tmp_sub(7 downto 0);
			-- 3rd Row
			tmp_sub <= "00000000" + tmp_img1(639 downto 632)+ tmp_img1(719 downto 712);
			tmp_img2(639 downto 632) <= tmp_sub(7 downto 0);	
			tmp_sub <= "00000000" + tmp_img1(631 downto 624)+ tmp_img1(711 downto 704);
			tmp_img2(631 downto 624) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(623 downto 616)+ tmp_img1(703 downto 696);
			tmp_img2(623 downto 616) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(615 downto 608)+ tmp_img1(695 downto 688);
			tmp_img2(615 downto 608) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(607 downto 600)+ tmp_img1(687 downto 680);
			tmp_img2(607 downto 600) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(599 downto 592)+ tmp_img1(679 downto 672);
			tmp_img2(599 downto 592) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(591 downto 584)+ tmp_img1(671 downto 664);
			tmp_img2(591 downto 584) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(583 downto 576)+ tmp_img1(663 downto 656);
			tmp_img2(583 downto 576) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(575 downto 568)+ tmp_img1(655 downto 648);
			tmp_img2(575 downto 568) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(567 downto 560)+ tmp_img1(647 downto 640);
			tmp_img2(567 downto 560) <= tmp_sub(7 downto 0);
			-- 4th Row
			tmp_sub <= "00000000" + tmp_img1(559 downto 552)+ tmp_img1(639 downto 632);
			tmp_img2(559 downto 552) <= tmp_sub(7 downto 0);	
			tmp_sub <= "00000000" + tmp_img1(551 downto 544)+ tmp_img1(631 downto 624);
			tmp_img2(551 downto 544) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(543 downto 536)+ tmp_img1(623 downto 616);
			tmp_img2(543 downto 536) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(535 downto 528)+ tmp_img1(615 downto 608);
			tmp_img2(535 downto 528) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(527 downto 520)+ tmp_img1(607 downto 600);
			tmp_img2(527 downto 520) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(519 downto 512)+ tmp_img1(599 downto 592);
			tmp_img2(519 downto 512) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(511 downto 504)+ tmp_img1(591 downto 584);
			tmp_img2(511 downto 504) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(503 downto 496)+ tmp_img1(583 downto 576);
			tmp_img2(503 downto 496) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(495 downto 488)+ tmp_img1(575 downto 568);
			tmp_img2(495 downto 488) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(487 downto 480)+ tmp_img1(567 downto 560);
			tmp_img2(487 downto 480) <= tmp_sub(7 downto 0);
			-- 5th Row
			tmp_sub <= "00000000" + tmp_img1(479 downto 472)+ tmp_img1(559 downto 552);
			tmp_img2(479 downto 472) <= tmp_sub(7 downto 0);	
			tmp_sub <= "00000000" + tmp_img1(471 downto 464)+ tmp_img1(551 downto 544);
			tmp_img2(471 downto 464) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(463 downto 456)+ tmp_img1(543 downto 536);
			tmp_img2(463 downto 456) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(455 downto 448)+ tmp_img1(535 downto 528);
			tmp_img2(455 downto 448) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(447 downto 440)+ tmp_img1(527 downto 520);
			tmp_img2(447 downto 440) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(439 downto 432)+ tmp_img1(519 downto 512);
			tmp_img2(439 downto 432) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(431 downto 424)+ tmp_img1(511 downto 504);
			tmp_img2(431 downto 424) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(423 downto 416)+ tmp_img1(503 downto 496);
			tmp_img2(423 downto 416) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(415 downto 408)+ tmp_img1(495 downto 488);
			tmp_img2(415 downto 408) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(407 downto 400)+ tmp_img1(487 downto 480);
			tmp_img2(407 downto 400) <= tmp_sub(7 downto 0);
			-- 6th Row
			tmp_sub <= "00000000" + tmp_img1(399 downto 392)+ tmp_img1(479 downto 472);
			tmp_img2(399 downto 392) <= tmp_sub(7 downto 0);	
			tmp_sub <= "00000000" + tmp_img1(391 downto 384)+ tmp_img1(471 downto 464);
			tmp_img2(391 downto 384) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(383 downto 376)+ tmp_img1(463 downto 456);
			tmp_img2(383 downto 376) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(375 downto 368)+ tmp_img1(455 downto 448);
			tmp_img2(375 downto 368) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(367 downto 360)+ tmp_img1(447 downto 440);
			tmp_img2(367 downto 360) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(359 downto 352)+ tmp_img1(439 downto 432);
			tmp_img2(359 downto 352) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(351 downto 344)+ tmp_img1(431 downto 424);
			tmp_img2(351 downto 344) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(343 downto 336)+ tmp_img1(423 downto 416);
			tmp_img2(343 downto 336) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(335 downto 328)+ tmp_img1(415 downto 408);
			tmp_img2(335 downto 328) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(327 downto 320)+ tmp_img1(407 downto 400);
			tmp_img2(327 downto 320) <= tmp_sub(7 downto 0);
			-- 7th Row
			tmp_sub <= "00000000" + tmp_img1(319 downto 312)+ tmp_img1(399 downto 392);
			tmp_img2(319 downto 312) <= tmp_sub(7 downto 0);	
			tmp_sub <= "00000000" + tmp_img1(311 downto 304)+ tmp_img1(391 downto 384);
			tmp_img2(311 downto 304) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(303 downto 296)+ tmp_img1(383 downto 376);
			tmp_img2(303 downto 296) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(295 downto 288)+ tmp_img1(375 downto 368);
			tmp_img2(295 downto 288) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(287 downto 280)+ tmp_img1(367 downto 360);
			tmp_img2(287 downto 280) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(279 downto 272)+ tmp_img1(359 downto 352);
			tmp_img2(279 downto 272) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(271 downto 264)+ tmp_img1(351 downto 344);
			tmp_img2(271 downto 264) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(263 downto 256)+ tmp_img1(343 downto 336);
			tmp_img2(263 downto 256) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(255 downto 248)+ tmp_img1(335 downto 328);
			tmp_img2(255 downto 248) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(247 downto 240)+ tmp_img1(327 downto 320);
			tmp_img2(247 downto 240) <= tmp_sub(7 downto 0);
			-- 8th Row
			tmp_sub <= "00000000" + tmp_img1(239 downto 232)+ tmp_img1(319 downto 312);
			tmp_img2(239 downto 232) <= tmp_sub(7 downto 0);	
			tmp_sub <= "00000000" + tmp_img1(231 downto 224)+ tmp_img1(311 downto 304);
			tmp_img2(231 downto 224) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(223 downto 216)+ tmp_img1(303 downto 296);
			tmp_img2(223 downto 216) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(215 downto 208)+ tmp_img1(295 downto 288);
			tmp_img2(215 downto 208) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(207 downto 200)+ tmp_img1(287 downto 280);
			tmp_img2(207 downto 200) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(199 downto 192)+ tmp_img1(279 downto 272);
			tmp_img2(199 downto 192) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(191 downto 184)+ tmp_img1(271 downto 264);
			tmp_img2(191 downto 184) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(183 downto 176)+ tmp_img1(263 downto 256);
			tmp_img2(183 downto 176) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(175 downto 168)+ tmp_img1(255 downto 248);
			tmp_img2(175 downto 168) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(167 downto 160)+ tmp_img1(247 downto 240);
			tmp_img2(167 downto 160) <= tmp_sub(7 downto 0);
			-- 9th Row
			tmp_sub <= "00000000" + tmp_img1(159 downto 152)+ tmp_img1(239 downto 232);
			tmp_img2(159 downto 152) <= tmp_sub(7 downto 0);	
			tmp_sub <= "00000000" + tmp_img1(151 downto 144)+ tmp_img1(231 downto 224);
			tmp_img2(151 downto 144) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(143 downto 136)+ tmp_img1(223 downto 216);
			tmp_img2(143 downto 136) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(135 downto 128)+ tmp_img1(215 downto 208);
			tmp_img2(135 downto 128) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(127 downto 120)+ tmp_img1(207 downto 200);
			tmp_img2(127 downto 120) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(119 downto 112)+ tmp_img1(199 downto 196);
			tmp_img2(119 downto 112) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(111 downto 104)+ tmp_img1(191 downto 188);
			tmp_img2(111 downto 104) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(103 downto 96)+ tmp_img1(183 downto 176);
			tmp_img2(103 downto 96) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(95 downto 88)+ tmp_img1(175 downto 168);
			tmp_img2(95 downto 88) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(87 downto 80)+ tmp_img1(167 downto 160);
			tmp_img2(87 downto 80) <= tmp_sub(7 downto 0);
			-- 10th Row
			tmp_sub <= "00000000" + tmp_img1(79 downto 72)+ tmp_img1(159 downto 152);
			tmp_img2(79 downto 72) <= tmp_sub(7 downto 0);	
			tmp_sub <= "00000000" + tmp_img1(71 downto 64)+ tmp_img1(151 downto 144);
			tmp_img2(71 downto 64) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(63 downto 56)+ tmp_img1(143 downto 136);
			tmp_img2(63 downto 56) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(55 downto 48)+ tmp_img1(135 downto 128);
			tmp_img2(55 downto 48) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(47 downto 40)+ tmp_img1(127 downto 120);
			tmp_img2(47 downto 40) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(39 downto 32)+ tmp_img1(119 downto 112);
			tmp_img2(39 downto 32) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(31 downto 24)+ tmp_img1(111 downto 104);
			tmp_img2(31 downto 24) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(23 downto 16)+ tmp_img1(103 downto 96);
			tmp_img2(23 downto 16) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(15 downto 8)+ tmp_img1(95 downto 88);
			tmp_img2(15 downto 8) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(7 downto 0)  + tmp_img1(87 downto 80);
			tmp_img2(7 downto 0) <= tmp_sub(7 downto 0);
			
			conved_img(1599 downto 800) <= std_logic_vector(tmp_img2);						
			
			
			-- Convolving with f5
			-- 1st Row
			tmp_sub <= "00000000" + tmp_img1(799 downto 792);
			tmp_img2(799 downto 792) <= tmp_sub(7 downto 0);	
			tmp_sub <= "00000000" + tmp_img1(791 downto 784);
			tmp_img2(791 downto 784) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(783 downto 776);
			tmp_img2(783 downto 776) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(775 downto 768);
			tmp_img2(775 downto 768) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(767 downto 760);
			tmp_img2(767 downto 760) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(759 downto 752);
			tmp_img2(759 downto 752) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(751 downto 744);
			tmp_img2(751 downto 744) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(743 downto 736);
			tmp_img2(743 downto 736) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(735 downto 728);
			tmp_img2(735 downto 728) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(727 downto 720);
			tmp_img2(727 downto 720) <= tmp_sub(7 downto 0);
			-- 2nd Row
			tmp_sub <= "00000000" + tmp_img1(719 downto 712);
			tmp_img2(719 downto 712) <= tmp_sub(7 downto 0);	
			tmp_sub <= "00000000" + tmp_img1(711 downto 704);
			tmp_img2(711 downto 704) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(703 downto 696);
			tmp_img2(703 downto 696) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(695 downto 688);
			tmp_img2(695 downto 688) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(687 downto 680);
			tmp_img2(687 downto 680) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(679 downto 672);
			tmp_img2(679 downto 672) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(671 downto 664);
			tmp_img2(671 downto 664) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(663 downto 656);
			tmp_img2(663 downto 656) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(655 downto 648);
			tmp_img2(655 downto 648) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(647 downto 640);
			tmp_img2(647 downto 640) <= tmp_sub(7 downto 0);
			-- 3rd Row
			tmp_sub <= "00000000" + tmp_img1(639 downto 632);
			tmp_img2(639 downto 632) <= tmp_sub(7 downto 0);	
			tmp_sub <= "00000000" + tmp_img1(631 downto 624);
			tmp_img2(631 downto 624) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(623 downto 616);
			tmp_img2(623 downto 616) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(615 downto 608);
			tmp_img2(615 downto 608) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(607 downto 600);
			tmp_img2(607 downto 600) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(599 downto 592);
			tmp_img2(599 downto 592) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(591 downto 584);
			tmp_img2(591 downto 584) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(583 downto 576);
			tmp_img2(583 downto 576) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(575 downto 568);
			tmp_img2(575 downto 568) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(567 downto 560);
			tmp_img2(567 downto 560) <= tmp_sub(7 downto 0);
			-- 4th Row
			tmp_sub <= "00000000" + tmp_img1(559 downto 552);
			tmp_img2(559 downto 552) <= tmp_sub(7 downto 0);	
			tmp_sub <= "00000000" + tmp_img1(551 downto 544);
			tmp_img2(551 downto 544) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(543 downto 536);
			tmp_img2(543 downto 536) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(535 downto 528);
			tmp_img2(535 downto 528) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(527 downto 520);
			tmp_img2(527 downto 520) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(519 downto 512);
			tmp_img2(519 downto 512) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(511 downto 504);
			tmp_img2(511 downto 504) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(503 downto 496);
			tmp_img2(503 downto 496) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(495 downto 488);
			tmp_img2(495 downto 488) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(487 downto 480);
			tmp_img2(487 downto 480) <= tmp_sub(7 downto 0);
			-- 5th Row
			tmp_sub <= "00000000" + tmp_img1(479 downto 472);
			tmp_img2(479 downto 472) <= tmp_sub(7 downto 0);	
			tmp_sub <= "00000000" + tmp_img1(471 downto 464);
			tmp_img2(471 downto 464) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(463 downto 456);
			tmp_img2(463 downto 456) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(455 downto 448);
			tmp_img2(455 downto 448) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(447 downto 440);
			tmp_img2(447 downto 440) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(439 downto 432);
			tmp_img2(439 downto 432) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(431 downto 424);
			tmp_img2(431 downto 424) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(423 downto 416);
			tmp_img2(423 downto 416) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(415 downto 408);
			tmp_img2(415 downto 408) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(407 downto 400);
			tmp_img2(407 downto 400) <= tmp_sub(7 downto 0);
			-- 6th Row
			tmp_sub <= "00000000" + tmp_img1(399 downto 392);
			tmp_img2(399 downto 392) <= tmp_sub(7 downto 0);	
			tmp_sub <= "00000000" + tmp_img1(391 downto 384);
			tmp_img2(391 downto 384) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(383 downto 376);
			tmp_img2(383 downto 376) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(375 downto 368);
			tmp_img2(375 downto 368) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(367 downto 360);
			tmp_img2(367 downto 360) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(359 downto 352);
			tmp_img2(359 downto 352) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(351 downto 344);
			tmp_img2(351 downto 344) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(343 downto 336);
			tmp_img2(343 downto 336) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(335 downto 328);
			tmp_img2(335 downto 328) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(327 downto 320);
			tmp_img2(327 downto 320) <= tmp_sub(7 downto 0);
			-- 7th Row
			tmp_sub <= "00000000" + tmp_img1(319 downto 312);
			tmp_img2(319 downto 312) <= tmp_sub(7 downto 0);	
			tmp_sub <= "00000000" + tmp_img1(311 downto 304);
			tmp_img2(311 downto 304) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(303 downto 296);
			tmp_img2(303 downto 296) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(295 downto 288);
			tmp_img2(295 downto 288) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(287 downto 280);
			tmp_img2(287 downto 280) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(279 downto 272);
			tmp_img2(279 downto 272) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(271 downto 264);
			tmp_img2(271 downto 264) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(263 downto 256);
			tmp_img2(263 downto 256) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(255 downto 248);
			tmp_img2(255 downto 248) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(247 downto 240);
			tmp_img2(247 downto 240) <= tmp_sub(7 downto 0);
			-- 8th Row
			tmp_sub <= "00000000" + tmp_img1(239 downto 232);
			tmp_img2(239 downto 232) <= tmp_sub(7 downto 0);	
			tmp_sub <= "00000000" + tmp_img1(231 downto 224);
			tmp_img2(231 downto 224) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(223 downto 216);
			tmp_img2(223 downto 216) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(215 downto 208);
			tmp_img2(215 downto 208) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(207 downto 200);
			tmp_img2(207 downto 200) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(199 downto 192);
			tmp_img2(199 downto 192) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(191 downto 184);
			tmp_img2(191 downto 184) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(183 downto 176);
			tmp_img2(183 downto 176) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(175 downto 168);
			tmp_img2(175 downto 168) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(167 downto 160);
			tmp_img2(167 downto 160) <= tmp_sub(7 downto 0);
			-- 9th Row
			tmp_sub <= "00000000" + tmp_img1(159 downto 152);
			tmp_img2(159 downto 152) <= tmp_sub(7 downto 0);	
			tmp_sub <= "00000000" + tmp_img1(151 downto 144);
			tmp_img2(151 downto 144) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(143 downto 136);
			tmp_img2(143 downto 136) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(135 downto 128);
			tmp_img2(135 downto 128) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(127 downto 120);
			tmp_img2(127 downto 120) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(119 downto 112);
			tmp_img2(119 downto 112) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(111 downto 104);
			tmp_img2(111 downto 104) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(103 downto 96);
			tmp_img2(103 downto 96) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(95 downto 88);
			tmp_img2(95 downto 88) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(87 downto 80);
			tmp_img2(87 downto 80) <= tmp_sub(7 downto 0);
			-- 10th Row
			tmp_sub <= "00000000" + tmp_img1(79 downto 72);
			tmp_img2(79 downto 72) <= tmp_sub(7 downto 0);	
			tmp_sub <= "00000000" + tmp_img1(71 downto 64);
			tmp_img2(71 downto 64) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(63 downto 56);
			tmp_img2(63 downto 56) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(55 downto 48);
			tmp_img2(55 downto 48) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(47 downto 40);
			tmp_img2(47 downto 40) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(39 downto 32);
			tmp_img2(39 downto 32) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(31 downto 24);
			tmp_img2(31 downto 24) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(23 downto 16);
			tmp_img2(23 downto 16) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(15 downto 8);
			tmp_img2(15 downto 8) <= tmp_sub(7 downto 0);
			tmp_sub <= "00000000" + tmp_img1(7 downto 0);
			tmp_img2(7 downto 0) <= tmp_sub(7 downto 0);	
			
			conved_img(799  downto   0) <= std_logic_vector(tmp_img2);
		
		
		end if;
	end process;
	
end Behavioral;

