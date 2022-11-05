library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Max_Pool is
    Port ( feature_map : in  STD_LOGIC_VECTOR (3999 downto 0);
			  En : in STD_LOGIC;
           pooled_fm : out  STD_LOGIC_VECTOR (999 downto 0));
end Max_Pool;



architecture Behavioral of Max_Pool is
	signal pool : std_logic_vector(799 downto 0);
begin
	process(En,feature_map)
		variable max : std_logic_vector(7 downto 0):= "00000000";
	begin
		if En = '1' then
			-- 1st layer
			-- Max pooling number 1
			if (feature_map(3999 downto 3992))>max then
				max := feature_map(3999 downto 3992);
			elsif (feature_map(3991 downto 3984))>max then
				max := feature_map(3991 downto 3984);
			elsif (feature_map(3919 downto 3912))>max then
				max := feature_map(3919 downto 3912);
			elsif (feature_map(3911 downto 3904))>max then
				max := feature_map(3911 downto 3904);
			end if;
			pooled_fm(999 downto 992) <= max;
			-- Max pooling number 2
			max := "00000000";
			if (feature_map(3983 downto 3976))>max then
				max := feature_map(3983 downto 3976);
			elsif (feature_map(3975 downto 3968))>max then
				max := feature_map(3975 downto 3968);
			elsif (feature_map(3903 downto 3896))>max then
				max := feature_map(3903 downto 3896);
			elsif (feature_map(3895 downto 3888))>max then
				max := feature_map(3895 downto 3888);
			end if;
			pooled_fm(991 downto 984) <= max;
			-- Max pooling number 3
			max := "00000000";
			if (feature_map(3967 downto 3960))>max then
				max := feature_map(3967 downto 3960);
			elsif (feature_map(3959 downto 3952))>max then
				max := feature_map(3959 downto 3952);
			elsif (feature_map(3887 downto 3880))>max then
				max := feature_map(3887 downto 3880);
			elsif (feature_map(3879 downto 3872))>max then
				max := feature_map(3879 downto 3872);
			end if;
			pooled_fm(983 downto 976) <= max;
			-- Max pooling number 4
			max := "00000000";
			if (feature_map(3951 downto 3944))>max then
				max := feature_map(3951 downto 3944);
			elsif (feature_map(3943 downto 3936))>max then
				max := feature_map(3943 downto 3936);
			elsif (feature_map(3871 downto 3864))>max then
				max := feature_map(3871 downto 3864);
			elsif (feature_map(3863 downto 3856))>max then
				max := feature_map(3863 downto 3856);
			end if;
			pooled_fm(975 downto 968) <= max;
			-- Max pooling number 5
			max := "00000000";
			if (feature_map(3935 downto 3928))>max then
				max := feature_map(3935 downto 3928);
			elsif (feature_map(3927 downto 3920))>max then
				max := feature_map(3927 downto 3920);
			elsif (feature_map(3855 downto 3848))>max then
				max := feature_map(3855 downto 3848);
			elsif (feature_map(3847 downto 3840))>max then
				max := feature_map(3847 downto 3840);
			end if;
			pooled_fm(967 downto 960) <= max;
			-- Max pooling number 6
			max := "00000000";
			if (feature_map(3839 downto 3832))>max then
				max := feature_map(3839 downto 3832);
			elsif (feature_map(3831 downto 3824))>max then
				max := feature_map(3831 downto 3824);
			elsif (feature_map(3759 downto 3752))>max then
				max := feature_map(3759 downto 3752);
			elsif (feature_map(3751 downto 3744))>max then
				max := feature_map(3751 downto 3744);
			end if;
			pooled_fm(959 downto 952) <= max;
			-- Max pooling number 7
			max := "00000000";
			if (feature_map(3823 downto 3816))>max then
				max := feature_map(3823 downto 3816);
			elsif (feature_map(3815 downto 3808))>max then
				max := feature_map(3815 downto 3808);
			elsif (feature_map(3743 downto 3736))>max then
				max := feature_map(3743 downto 3736);
			elsif (feature_map(3735 downto 3728))>max then
				max := feature_map(3735 downto 3728);
			end if;
			pooled_fm(951 downto 944) <= max;
			-- Max pooling number 8
			max := "00000000";
			if (feature_map(3807 downto 3800))>max then
				max := feature_map(3807 downto 3800);
			elsif (feature_map(3799 downto 3792))>max then
				max := feature_map(3799 downto 3792);
			elsif (feature_map(3727 downto 3720))>max then
				max := feature_map(3727 downto 3720);
			elsif (feature_map(3719 downto 3712))>max then
				max := feature_map(3719 downto 3712);
			end if;
			pooled_fm(943 downto 936) <= max;
			-- Max pooling number 9
			max := "00000000";
			if (feature_map(3791 downto 3784))>max then
				max := feature_map(3791 downto 3784);
			elsif (feature_map(3783 downto 3776))>max then
				max := feature_map(3783 downto 3776);
			elsif (feature_map(3711 downto 3704))>max then
				max := feature_map(3711 downto 3704);
			elsif (feature_map(3703 downto 3696))>max then
				max := feature_map(3703 downto 3696);
			end if;
			pooled_fm(935 downto 928) <= max;
			-- Max pooling number 10
			max := "00000000";
			if (feature_map(3775 downto 3768))>max then
				max := feature_map(3775 downto 3768);
			elsif (feature_map(3767 downto 3760))>max then
				max := feature_map(3767 downto 3760);
			elsif (feature_map(3695 downto 3688))>max then
				max := feature_map(3695 downto 3688);
			elsif (feature_map(3687 downto 3680))>max then
				max := feature_map(3687 downto 3680);
			end if;
			pooled_fm(927 downto 920) <= max;
			-- Max pooling number 11
			max := "00000000";
			if (feature_map(3679 downto 3672))>max then
				max := feature_map(3679 downto 3672);
			elsif (feature_map(3671 downto 3664))>max then
				max := feature_map(3671 downto 3664);
			elsif (feature_map(3599 downto 3592))>max then
				max := feature_map(3599 downto 3592);
			elsif (feature_map(3591 downto 3584))>max then
				max := feature_map(3591 downto 3584);
			end if;
			pooled_fm(919 downto 912) <= max;
			-- Max pooling number 12
			max := "00000000";
			if (feature_map(3663 downto 3656))>max then
				max := feature_map(3663 downto 3656);
			elsif (feature_map(3655 downto 3648))>max then
				max := feature_map(3655 downto 3648);
			elsif (feature_map(3583 downto 3576))>max then
				max := feature_map(3583 downto 3576);
			elsif (feature_map(3575 downto 3568))>max then
				max := feature_map(3575 downto 3568);
			end if;
			pooled_fm(911 downto 904) <= max;
			-- Max pooling number 13
			max := "00000000";
			if (feature_map(3647 downto 3640))>max then
				max := feature_map(3647 downto 3640);
			elsif (feature_map(3639 downto 3632))>max then
				max := feature_map(3639 downto 3632);
			elsif (feature_map(3567 downto 3560))>max then
				max := feature_map(3567 downto 3560);
			elsif (feature_map(3559 downto 3552))>max then
				max := feature_map(3559 downto 3552);
			end if;
			pooled_fm(903 downto 896) <= max;
			-- Max pooling number 14
			max := "00000000";
			if (feature_map(3631 downto 3624))>max then
				max := feature_map(3631 downto 3624);
			elsif (feature_map(3623 downto 3616))>max then
				max := feature_map(3623 downto 3616);
			elsif (feature_map(3551 downto 3544))>max then
				max := feature_map(3551 downto 3544);
			elsif (feature_map(3543 downto 3536))>max then
				max := feature_map(3543 downto 3536);
			end if;
			pooled_fm(895 downto 888) <= max;
			-- Max pooling number 15
			max := "00000000";
			if (feature_map(3615 downto 3608))>max then
				max := feature_map(3615 downto 3608);
			elsif (feature_map(3607 downto 3600))>max then
				max := feature_map(3607 downto 3600);
			elsif (feature_map(3535 downto 3528))>max then
				max := feature_map(3535 downto 3528);
			elsif (feature_map(3527 downto 3520))>max then
				max := feature_map(3527 downto 3520);
			end if;
			pooled_fm(887 downto 880) <= max;
			-- Max pooling number 16
			max := "00000000";
			if (feature_map(3519 downto 3512))>max then
				max := feature_map(3519 downto 3512);
			elsif (feature_map(3511 downto 3504))>max then
				max := feature_map(3511 downto 3504);
			elsif (feature_map(3439 downto 3432))>max then
				max := feature_map(3439 downto 3432);
			elsif (feature_map(3431 downto 3424))>max then
				max := feature_map(3431 downto 3424);
			end if;
			pooled_fm(879 downto 872) <= max;
			-- Max pooling number 17
			max := "00000000";
			if (feature_map(3503 downto 3496))>max then
				max := feature_map(3503 downto 3496);
			elsif (feature_map(3495 downto 3488))>max then
				max := feature_map(3495 downto 3488);
			elsif (feature_map(3423 downto 3416))>max then
				max := feature_map(3423 downto 3416);
			elsif (feature_map(3415 downto 3408))>max then
				max := feature_map(3415 downto 3408);
			end if;
			pooled_fm(871 downto 864) <= max;
			-- Max pooling number 18
			max := "00000000";
			if (feature_map(3487 downto 3480))>max then
				max := feature_map(3487 downto 3480);
			elsif (feature_map(3479 downto 3472))>max then
				max := feature_map(3479 downto 3472);
			elsif (feature_map(3407 downto 3400))>max then
				max := feature_map(3407 downto 3400);
			elsif (feature_map(3399 downto 3392))>max then
				max := feature_map(3399 downto 3392);
			end if;
			pooled_fm(863 downto 856) <= max;
			-- Max pooling number 19
			max := "00000000";
			if (feature_map(3471 downto 3464))>max then
				max := feature_map(3471 downto 3464);
			elsif (feature_map(3463 downto 3456))>max then
				max := feature_map(3463 downto 3456);
			elsif (feature_map(3391 downto 3384))>max then
				max := feature_map(3391 downto 3384);
			elsif (feature_map(3383 downto 3376))>max then
				max := feature_map(3383 downto 3376);
			end if;
			pooled_fm(855 downto 848) <= max;
			-- Max pooling number 20
			max := "00000000";
			if (feature_map(3455 downto 3448))>max then
				max := feature_map(3455 downto 3448);
			elsif (feature_map(3447 downto 3440))>max then
				max := feature_map(3447 downto 3440);
			elsif (feature_map(3375 downto 3368))>max then
				max := feature_map(3375 downto 3368);
			elsif (feature_map(3367 downto 3360))>max then
				max := feature_map(3367 downto 3360);
			end if;
			pooled_fm(847 downto 840) <= max;
			-- Max pooling number 21
			max := "00000000";
			if (feature_map(3359 downto 3352))>max then
				max := feature_map(3359 downto 3352);
			elsif (feature_map(3351 downto 3344))>max then
				max := feature_map(3351 downto 3344);
			elsif (feature_map(3279 downto 3272))>max then
				max := feature_map(3279 downto 3272);
			elsif (feature_map(3271 downto 3264))>max then
				max := feature_map(3271 downto 3264);
			end if;
			pooled_fm(839 downto 832) <= max;
			-- Max pooling number 22
			max := "00000000";
			if (feature_map(3343 downto 3336))>max then
				max := feature_map(3343 downto 3336);
			elsif (feature_map(3335 downto 3328))>max then
				max := feature_map(3335 downto 3328);
			elsif (feature_map(3263 downto 3256))>max then
				max := feature_map(3263 downto 3256);
			elsif (feature_map(3255 downto 3248))>max then
				max := feature_map(3255 downto 3248);
			end if;
			pooled_fm(831 downto 824) <= max;
			-- Max pooling number 23
			max := "00000000";
			if (feature_map(3327 downto 3320))>max then
				max := feature_map(3327 downto 3320);
			elsif (feature_map(3319 downto 3312))>max then
				max := feature_map(3319 downto 3312);
			elsif (feature_map(3247 downto 3240))>max then
				max := feature_map(3247 downto 3240);
			elsif (feature_map(3239 downto 3232))>max then
				max := feature_map(3239 downto 3232);
			end if;
			pooled_fm(823 downto 816) <= max;
			-- Max pooling number 24
			max := "00000000";
			if (feature_map(3311 downto 3304))>max then
				max := feature_map(3311 downto 3304);
			elsif (feature_map(3303 downto 3296))>max then
				max := feature_map(3303 downto 3296);
			elsif (feature_map(3231 downto 3224))>max then
				max := feature_map(3231 downto 3224);
			elsif (feature_map(3223 downto 3216))>max then
				max := feature_map(3223 downto 3216);
			end if;
			pooled_fm(815 downto 808) <= max;
			-- Max pooling number 25
			max := "00000000";
			if (feature_map(3295 downto 3288))>max then
				max := feature_map(3295 downto 3288);
			elsif (feature_map(3287 downto 3280))>max then
				max := feature_map(3287 downto 3280);
			elsif (feature_map(3215 downto 3208))>max then
				max := feature_map(3215 downto 3208);
			elsif (feature_map(3207 downto 3200))>max then
				max := feature_map(3207 downto 3200);
			end if;
			pooled_fm(807 downto 800) <= max;
			-- 2nd layer
			-- Max pooling number 1
			if (feature_map(3199 downto 3192))>max then
				max := feature_map(3199 downto 3192);
			elsif (feature_map(3191 downto 3184))>max then
				max := feature_map(3191 downto 3184);
			elsif (feature_map(3119 downto 3112))>max then
				max := feature_map(3119 downto 3112);
			elsif (feature_map(3911 downto 3904))>max then
				max := feature_map(3111 downto 3104);
			end if;
			pooled_fm(799 downto 792) <= max;
			-- Max pooling number 2
			max := "00000000";
			if (feature_map(3183 downto 3176))>max then
				max := feature_map(3183 downto 3176);
			elsif (feature_map(3975 downto 3968))>max then
				max := feature_map(3175 downto 3168);
			elsif (feature_map(3103 downto 3096))>max then
				max := feature_map(3103 downto 3096);
			elsif (feature_map(3895 downto 3888))>max then
				max := feature_map(3095 downto 3088);
			end if;
			pooled_fm(791 downto 784) <= max;
			-- Max pooling number 3
			max := "00000000";
			if (feature_map(3167 downto 3160))>max then
				max := feature_map(3167 downto 3160);
			elsif (feature_map(3959 downto 3952))>max then
				max := feature_map(3159 downto 3152);
			elsif (feature_map(3087 downto 3080))>max then
				max := feature_map(3087 downto 3080);
			elsif (feature_map(3079 downto 3072))>max then
				max := feature_map(3079 downto 3072);
			end if;
			pooled_fm(783 downto 776) <= max;
			-- Max pooling number 4
			max := "00000000";
			if (feature_map(3151 downto 3144))>max then
				max := feature_map(3151 downto 3144);
			elsif (feature_map(3143 downto 3136))>max then
				max := feature_map(3143 downto 3136);
			elsif (feature_map(3071 downto 3064))>max then
				max := feature_map(3071 downto 3064);
			elsif (feature_map(3863 downto 3856))>max then
				max := feature_map(3063 downto 3056);
			end if;
			pooled_fm(775 downto 768) <= max;
			-- Max pooling number 5
			max := "00000000";
			if (feature_map(3135 downto 3128))>max then
				max := feature_map(3135 downto 3128);
			elsif (feature_map(3127 downto 3120))>max then
				max := feature_map(3127 downto 3120);
			elsif (feature_map(3055 downto 3048))>max then
				max := feature_map(3055 downto 3048);
			elsif (feature_map(3047 downto 3040))>max then
				max := feature_map(3047 downto 3040);
			end if;
			pooled_fm(767 downto 760) <= max;
			-- Max pooling number 6
			max := "00000000";
			if (feature_map(3039 downto 3032))>max then
				max := feature_map(3039 downto 3032);
			elsif (feature_map(3031 downto 3024))>max then
				max := feature_map(3031 downto 3024);
			elsif (feature_map(2959 downto 2952))>max then
				max := feature_map(2959 downto 2952);
			elsif (feature_map(2951 downto 2944))>max then
				max := feature_map(2951 downto 2944);
			end if;
			pooled_fm(759 downto 752) <= max;
			-- Max pooling number 7
			max := "00000000";
			if (feature_map(3023 downto 3016))>max then
				max := feature_map(3023 downto 3016);
			elsif (feature_map(3015 downto 3008))>max then
				max := feature_map(3015 downto 3008);
			elsif (feature_map(2943 downto 2936))>max then
				max := feature_map(2943 downto 2936);
			elsif (feature_map(2935 downto 2928))>max then
				max := feature_map(2935 downto 2928);
			end if;
			pooled_fm(751 downto 744) <= max;
			-- Max pooling number 8
			max := "00000000";
			if (feature_map(3007 downto 3000))>max then
				max := feature_map(3007 downto 3000);
			elsif (feature_map(2999 downto 2992))>max then
				max := feature_map(2999 downto 2992);
			elsif (feature_map(2927 downto 2920))>max then
				max := feature_map(2927 downto 2920);
			elsif (feature_map(2919 downto 2912))>max then
				max := feature_map(2919 downto 2912);
			end if;
			pooled_fm(743 downto 736) <= max;
			-- Max pooling number 9
			max := "00000000";
			if (feature_map(2991 downto 2984))>max then
				max := feature_map(2991 downto 2984);
			elsif (feature_map(2983 downto 2976))>max then
				max := feature_map(2983 downto 2976);
			elsif (feature_map(2911 downto 2904))>max then
				max := feature_map(2911 downto 2904);
			elsif (feature_map(2903 downto 2896))>max then
				max := feature_map(2903 downto 2896);
			end if;
			pooled_fm(735 downto 728) <= max;
			-- Max pooling number 10
			max := "00000000";
			if (feature_map(2975 downto 2968))>max then
				max := feature_map(2975 downto 2968);
			elsif (feature_map(2967 downto 2960))>max then
				max := feature_map(2967 downto 2960);
			elsif (feature_map(2895 downto 2888))>max then
				max := feature_map(2895 downto 2888);
			elsif (feature_map(2887 downto 2880))>max then
				max := feature_map(2887 downto 2880);
			end if;
			pooled_fm(727 downto 720) <= max;
			-- Max pooling number 11
			max := "00000000";
			if (feature_map(2879 downto 2872))>max then
				max := feature_map(2879 downto 2872);
			elsif (feature_map(2871 downto 2864))>max then
				max := feature_map(2871 downto 2864);
			elsif (feature_map(2799 downto 2792))>max then
				max := feature_map(2799 downto 2792);
			elsif (feature_map(2791 downto 2784))>max then
				max := feature_map(2791 downto 2784);
			end if;
			pooled_fm(719 downto 712) <= max;
			-- Max pooling number 12
			max := "00000000";
			if (feature_map(2863 downto 2856))>max then
				max := feature_map(2863 downto 2856);
			elsif (feature_map(2855 downto 2848))>max then
				max := feature_map(2855 downto 2848);
			elsif (feature_map(2783 downto 2776))>max then
				max := feature_map(2783 downto 2776);
			elsif (feature_map(2775 downto 2768))>max then
				max := feature_map(2775 downto 2768);
			end if;
			pooled_fm(711 downto 704) <= max;
			-- Max pooling number 13
			max := "00000000";
			if (feature_map(2847 downto 2840))>max then
				max := feature_map(2847 downto 2840);
			elsif (feature_map(2839 downto 2832))>max then
				max := feature_map(2839 downto 2832);
			elsif (feature_map(2767 downto 2760))>max then
				max := feature_map(2767 downto 2760);
			elsif (feature_map(2759 downto 2752))>max then
				max := feature_map(2759 downto 2752);
			end if;
			pooled_fm(703 downto 696) <= max;
			-- Max pooling number 14
			max := "00000000";
			if (feature_map(2831 downto 2824))>max then
				max := feature_map(2831 downto 2824);
			elsif (feature_map(2823 downto 2816))>max then
				max := feature_map(2823 downto 2816);
			elsif (feature_map(2751 downto 2744))>max then
				max := feature_map(2751 downto 2744);
			elsif (feature_map(2743 downto 2736))>max then
				max := feature_map(2743 downto 2736);
			end if;
			pooled_fm(695 downto 688) <= max;
			-- Max pooling number 15
			max := "00000000";
			if (feature_map(2815 downto 2808))>max then
				max := feature_map(2815 downto 2808);
			elsif (feature_map(2807 downto 2800))>max then
				max := feature_map(2807 downto 2800);
			elsif (feature_map(2735 downto 2728))>max then
				max := feature_map(2735 downto 2728);
			elsif (feature_map(2727 downto 2720))>max then
				max := feature_map(2727 downto 2720);
			end if;
			pooled_fm(687 downto 680) <= max;
			-- Max pooling number 16
			max := "00000000";
			if (feature_map(2719 downto 2712))>max then
				max := feature_map(2719 downto 2712);
			elsif (feature_map(2711 downto 2704))>max then
				max := feature_map(2711 downto 2704);
			elsif (feature_map(2639 downto 2632))>max then
				max := feature_map(2639 downto 2632);
			elsif (feature_map(2631 downto 2624))>max then
				max := feature_map(2631 downto 2624);
			end if;
			pooled_fm(679 downto 672) <= max;
			-- Max pooling number 17
			max := "00000000";
			if (feature_map(2703 downto 2696))>max then
				max := feature_map(2703 downto 2696);
			elsif (feature_map(2695 downto 2688))>max then
				max := feature_map(2695 downto 2688);
			elsif (feature_map(2623 downto 2616))>max then
				max := feature_map(2623 downto 2616);
			elsif (feature_map(2615 downto 2608))>max then
				max := feature_map(2615 downto 2608);
			end if;
			pooled_fm(671 downto 664) <= max;
			-- Max pooling number 18
			max := "00000000";
			if (feature_map(2687 downto 2680))>max then
				max := feature_map(2687 downto 2680);
			elsif (feature_map(2679 downto 2672))>max then
				max := feature_map(2679 downto 2672);
			elsif (feature_map(2607 downto 2600))>max then
				max := feature_map(2607 downto 2600);
			elsif (feature_map(2599 downto 2592))>max then
				max := feature_map(2599 downto 2592);
			end if;
			pooled_fm(663 downto 656) <= max;
			-- Max pooling number 19
			max := "00000000";
			if (feature_map(2671 downto 2664))>max then
				max := feature_map(2671 downto 2664);
			elsif (feature_map(2663 downto 2656))>max then
				max := feature_map(2663 downto 2656);
			elsif (feature_map(2591 downto 2584))>max then
				max := feature_map(2591 downto 2584);
			elsif (feature_map(2583 downto 2576))>max then
				max := feature_map(2583 downto 2576);
			end if;
			pooled_fm(655 downto 648) <= max;
			-- Max pooling number 20
			max := "00000000";
			if (feature_map(2655 downto 2648))>max then
				max := feature_map(2655 downto 2648);
			elsif (feature_map(2647 downto 2640))>max then
				max := feature_map(2647 downto 2640);
			elsif (feature_map(2575 downto 2568))>max then
				max := feature_map(2575 downto 2568);
			elsif (feature_map(2567 downto 2560))>max then
				max := feature_map(2567 downto 2560);
			end if;
			pooled_fm(647 downto 640) <= max;
			-- Max pooling number 21
			max := "00000000";
			if (feature_map(2559 downto 2552))>max then
				max := feature_map(2559 downto 2552);
			elsif (feature_map(2551 downto 2544))>max then
				max := feature_map(2551 downto 2544);
			elsif (feature_map(2479 downto 2472))>max then
				max := feature_map(2479 downto 2472);
			elsif (feature_map(2471 downto 2464))>max then
				max := feature_map(2471 downto 2464);
			end if;
			pooled_fm(639 downto 632) <= max;
			-- Max pooling number 22
			max := "00000000";
			if (feature_map(2543 downto 2536))>max then
				max := feature_map(2543 downto 2536);
			elsif (feature_map(2535 downto 2528))>max then
				max := feature_map(2535 downto 2528);
			elsif (feature_map(2463 downto 2456))>max then
				max := feature_map(2463 downto 2456);
			elsif (feature_map(2455 downto 2448))>max then
				max := feature_map(2455 downto 2448);
			end if;
			pooled_fm(631 downto 624) <= max;
			-- Max pooling number 23
			max := "00000000";
			if (feature_map(2527 downto 2520))>max then
				max := feature_map(2527 downto 2520);
			elsif (feature_map(2519 downto 2512))>max then
				max := feature_map(2519 downto 2512);
			elsif (feature_map(2447 downto 2440))>max then
				max := feature_map(2447 downto 2440);
			elsif (feature_map(2439 downto 2432))>max then
				max := feature_map(2439 downto 2432);
			end if;
			pooled_fm(623 downto 616) <= max;
			-- Max pooling number 24
			max := "00000000";
			if (feature_map(2511 downto 2504))>max then
				max := feature_map(2511 downto 2504);
			elsif (feature_map(2503 downto 2496))>max then
				max := feature_map(2503 downto 2496);
			elsif (feature_map(2431 downto 2424))>max then
				max := feature_map(2431 downto 2424);
			elsif (feature_map(2423 downto 2416))>max then
				max := feature_map(2423 downto 2416);
			end if;
			pooled_fm(615 downto 608) <= max;
			-- Max pooling number 25
			max := "00000000";
			if (feature_map(2495 downto 2488))>max then
				max := feature_map(2495 downto 2488);
			elsif (feature_map(2487 downto 2480))>max then
				max := feature_map(2487 downto 2480);
			elsif (feature_map(2415 downto 2408))>max then
				max := feature_map(2415 downto 2408);
			elsif (feature_map(2407 downto 2400))>max then
				max := feature_map(2407 downto 2400);
			end if;
			pooled_fm(607 downto 600) <= max;
			-- 3rd layer
			-- Max pooling number 1
			if (feature_map(2399 downto 2392))>max then
				max := feature_map(2399 downto 2392);
			elsif (feature_map(2391 downto 2384))>max then
				max := feature_map(2391 downto 2384);
			elsif (feature_map(2319 downto 2312))>max then
				max := feature_map(2319 downto 2312);
			elsif (feature_map(2311 downto 2304))>max then
				max := feature_map(2311 downto 2304);
			end if;
			pooled_fm(599 downto 592) <= max;
			-- Max pooling number 2
			max := "00000000";
			if (feature_map(2383 downto 2376))>max then
				max := feature_map(2383 downto 2376);
			elsif (feature_map(2375 downto 2368))>max then
				max := feature_map(2375 downto 2368);
			elsif (feature_map(2303 downto 2296))>max then
				max := feature_map(2303 downto 2296);
			elsif (feature_map(2295 downto 2288))>max then
				max := feature_map(2295 downto 2288);
			end if;
			pooled_fm(591 downto 584) <= max;
			-- Max pooling number 3
			max := "00000000";
			if (feature_map(2367 downto 2360))>max then
				max := feature_map(2367 downto 2360);
			elsif (feature_map(2359 downto 2352))>max then
				max := feature_map(2359 downto 2352);
			elsif (feature_map(2287 downto 2280))>max then
				max := feature_map(2287 downto 2280);
			elsif (feature_map(2279 downto 2272))>max then
				max := feature_map(2279 downto 2272);
			end if;
			pooled_fm(583 downto 576) <= max;
			-- Max pooling number 4
			max := "00000000";
			if (feature_map(2351 downto 2344))>max then
				max := feature_map(2351 downto 2344);
			elsif (feature_map(2343 downto 2336))>max then
				max := feature_map(2343 downto 2336);
			elsif (feature_map(2271 downto 2264))>max then
				max := feature_map(2271 downto 2264);
			elsif (feature_map(2263 downto 2256))>max then
				max := feature_map(2263 downto 2256);
			end if;
			pooled_fm(575 downto 568) <= max;
			-- Max pooling number 5
			max := "00000000";
			if (feature_map(2335 downto 2328))>max then
				max := feature_map(2335 downto 2328);
			elsif (feature_map(2327 downto 2320))>max then
				max := feature_map(2327 downto 2320);
			elsif (feature_map(2255 downto 2248))>max then
				max := feature_map(2255 downto 2248);
			elsif (feature_map(2247 downto 2240))>max then
				max := feature_map(2247 downto 2240);
			end if;
			pooled_fm(567 downto 560) <= max;
			-- Max pooling number 6
			max := "00000000";
			if (feature_map(2239 downto 2232))>max then
				max := feature_map(2239 downto 2232);
			elsif (feature_map(2231 downto 2224))>max then
				max := feature_map(2231 downto 2224);
			elsif (feature_map(2159 downto 2152))>max then
				max := feature_map(2159 downto 2152);
			elsif (feature_map(2151 downto 2144))>max then
				max := feature_map(2151 downto 2144);
			end if;
			pooled_fm(559 downto 552) <= max;
			-- Max pooling number 7
			max := "00000000";
			if (feature_map(2223 downto 2216))>max then
				max := feature_map(2223 downto 2216);
			elsif (feature_map(2215 downto 2208))>max then
				max := feature_map(2215 downto 2208);
			elsif (feature_map(2143 downto 2136))>max then
				max := feature_map(2143 downto 2136);
			elsif (feature_map(2135 downto 2128))>max then
				max := feature_map(2135 downto 2128);
			end if;
			pooled_fm(551 downto 544) <= max;
			-- Max pooling number 8
			max := "00000000";
			if (feature_map(2207 downto 2200))>max then
				max := feature_map(2207 downto 2200);
			elsif (feature_map(2199 downto 2192))>max then
				max := feature_map(2199 downto 2192);
			elsif (feature_map(2127 downto 2120))>max then
				max := feature_map(2127 downto 2120);
			elsif (feature_map(2119 downto 2112))>max then
				max := feature_map(2119 downto 2112);
			end if;
			pooled_fm(543 downto 536) <= max;
			-- Max pooling number 9
			max := "00000000";
			if (feature_map(2191 downto 2184))>max then
				max := feature_map(2191 downto 2184);
			elsif (feature_map(2183 downto 2176))>max then
				max := feature_map(2183 downto 2176);
			elsif (feature_map(2111 downto 2104))>max then
				max := feature_map(2111 downto 2104);
			elsif (feature_map(2103 downto 2096))>max then
				max := feature_map(2103 downto 2096);
			end if;
			pooled_fm(535 downto 528) <= max;
			-- Max pooling number 10
			max := "00000000";
			if (feature_map(2175	 downto 2168))>max then
				max := feature_map(2175 downto 2168);
			elsif (feature_map(2167 downto 2160))>max then
				max := feature_map(2167 downto 2160);
			elsif (feature_map(2095 downto 2088))>max then
				max := feature_map(2095 downto 2088);
			elsif (feature_map(2087 downto 2080))>max then
				max := feature_map(2087 downto 2080);
			end if;
			pooled_fm(527 downto 520) <= max;
			-- Max pooling number 11
			max := "00000000";
			if (feature_map(2079 downto 2072))>max then
				max := feature_map(2079 downto 2072);
			elsif (feature_map(2071 downto 2064))>max then
				max := feature_map(2071 downto 2064);
			elsif (feature_map(1999 downto 1992))>max then
				max := feature_map(1999 downto 1992);
			elsif (feature_map(1991 downto 1984))>max then
				max := feature_map(1991 downto 1984);
			end if;
			pooled_fm(519 downto 512) <= max;
			-- Max pooling number 12
			max := "00000000";
			if (feature_map(2063 downto 2056))>max then
				max := feature_map(2063 downto 2056);
			elsif (feature_map(2055 downto 2048))>max then
				max := feature_map(2055 downto 2048);
			elsif (feature_map(1983 downto 1976))>max then
				max := feature_map(1983 downto 1976);
			elsif (feature_map(1975 downto 1968))>max then
				max := feature_map(1975 downto 1968);
			end if;
			pooled_fm(511 downto 504) <= max;
			-- Max pooling number 13
			max := "00000000";
			if (feature_map(2047 downto 2040))>max then
				max := feature_map(2047 downto 2040);
			elsif (feature_map(2039 downto 2032))>max then
				max := feature_map(2039 downto 2032);
			elsif (feature_map(1967 downto 1960))>max then
				max := feature_map(1967 downto 1960);
			elsif (feature_map(1959 downto 1952))>max then
				max := feature_map(1959 downto 1952);
			end if;
			pooled_fm(503 downto 496) <= max;
			-- Max pooling number 14
			max := "00000000";
			if (feature_map(2031 downto 2024))>max then
				max := feature_map(2031 downto 2024);
			elsif (feature_map(2023 downto 2016))>max then
				max := feature_map(2023 downto 2016);
			elsif (feature_map(1951 downto 1944))>max then
				max := feature_map(1951 downto 1944);
			elsif (feature_map(1943 downto 1936))>max then
				max := feature_map(1943 downto 1936);
			end if;
			pooled_fm(495 downto 488) <= max;
			-- Max pooling number 15
			max := "00000000";
			if (feature_map(2015 downto 2008))>max then
				max := feature_map(2015 downto 2008);
			elsif (feature_map(2007 downto 2000))>max then
				max := feature_map(2007 downto 2000);
			elsif (feature_map(1935 downto 1928))>max then
				max := feature_map(1935 downto 1928);
			elsif (feature_map(1927 downto 1920))>max then
				max := feature_map(1927 downto 1920);
			end if;
			pooled_fm(487 downto 480) <= max;
			-- Max pooling number 16
			max := "00000000";
			if (feature_map(1919 downto 1912))>max then
				max := feature_map(1919 downto 1912);
			elsif (feature_map(1911 downto 1904))>max then
				max := feature_map(1911 downto 1904);
			elsif (feature_map(1839 downto 1832))>max then
				max := feature_map(1839 downto 1832);
			elsif (feature_map(1831 downto 1824))>max then
				max := feature_map(1831 downto 1824);
			end if;
			pooled_fm(479 downto 472) <= max;
			-- Max pooling number 17
			max := "00000000";
			if (feature_map(1903 downto 1896))>max then
				max := feature_map(1903 downto 1896);
			elsif (feature_map(1895 downto 1888))>max then
				max := feature_map(1895 downto 1888);
			elsif (feature_map(1823 downto 1816))>max then
				max := feature_map(1823 downto 1816);
			elsif (feature_map(1815 downto 1808))>max then
				max := feature_map(1815 downto 1808);
			end if;
			pooled_fm(471 downto 464) <= max;
			-- Max pooling number 18
			max := "00000000";
			if (feature_map(1887 downto 1880))>max then
				max := feature_map(1887 downto 1880);
			elsif (feature_map(1879 downto 1872))>max then
				max := feature_map(1879 downto 1872);
			elsif (feature_map(1807 downto 1800))>max then
				max := feature_map(1807 downto 1800);
			elsif (feature_map(1799 downto 1792))>max then
				max := feature_map(1799 downto 1792);
			end if;
			pooled_fm(463 downto 456) <= max;
			-- Max pooling number 19
			max := "00000000";
			if (feature_map(1871 downto 1864))>max then
				max := feature_map(1871 downto 1864);
			elsif (feature_map(1863 downto 1856))>max then
				max := feature_map(1863 downto 1856);
			elsif (feature_map(1791 downto 1784))>max then
				max := feature_map(1791 downto 1784);
			elsif (feature_map(1783 downto 1776))>max then
				max := feature_map(1783 downto 1776);
			end if;
			pooled_fm(455 downto 448) <= max;
			-- Max pooling number 20
			max := "00000000";
			if (feature_map(1855 downto 1848))>max then
				max := feature_map(1855 downto 1848);
			elsif (feature_map(1847 downto 1840))>max then
				max := feature_map(1847 downto 1840);
			elsif (feature_map(1775 downto 1768))>max then
				max := feature_map(1775 downto 1768);
			elsif (feature_map(1767 downto 1760))>max then
				max := feature_map(1767 downto 1760);
			end if;
			pooled_fm(447 downto 440) <= max;
			-- Max pooling number 21
			max := "00000000";
			if (feature_map(1759 downto 1752))>max then
				max := feature_map(1759 downto 1752);
			elsif (feature_map(1751 downto 1744))>max then
				max := feature_map(1751 downto 1744);
			elsif (feature_map(1679 downto 1672))>max then
				max := feature_map(1679 downto 1672);
			elsif (feature_map(1671 downto 1664))>max then
				max := feature_map(1671 downto 1664);
			end if;
			pooled_fm(439 downto 432) <= max;
			-- Max pooling number 22
			max := "00000000";
			if (feature_map(1743 downto 1736))>max then
				max := feature_map(1743 downto 1736);
			elsif (feature_map(1735 downto 1728))>max then
				max := feature_map(1735 downto 1728);
			elsif (feature_map(1663 downto 1656))>max then
				max := feature_map(1663 downto 1656);
			elsif (feature_map(1655 downto 1648))>max then
				max := feature_map(1655 downto 1648);
			end if;
			pooled_fm(431 downto 424) <= max;
			-- Max pooling number 23
			max := "00000000";
			if (feature_map(1727 downto 1720))>max then
				max := feature_map(1727 downto 1720);
			elsif (feature_map(1719 downto 1712))>max then
				max := feature_map(1719 downto 1712);
			elsif (feature_map(1647 downto 1640))>max then
				max := feature_map(1647 downto 1640);
			elsif (feature_map(1639 downto 1632))>max then
				max := feature_map(1639 downto 1632);
			end if;
			pooled_fm(423 downto 416) <= max;
			-- Max pooling number 24
			max := "00000000";
			if (feature_map(1711 downto 1704))>max then
				max := feature_map(1711 downto 1704);
			elsif (feature_map(1703 downto 1696))>max then
				max := feature_map(1703 downto 1696);
			elsif (feature_map(1631 downto 1624))>max then
				max := feature_map(1631 downto 1624);
			elsif (feature_map(1623 downto 1616))>max then
				max := feature_map(1623 downto 1616);
			end if;
			pooled_fm(415 downto 408) <= max;
			-- Max pooling number 25
			max := "00000000";
			if (feature_map(1695 downto 1688))>max then
				max := feature_map(1695 downto 1688);
			elsif (feature_map(1687 downto 1680))>max then
				max := feature_map(1687 downto 1680);
			elsif (feature_map(1615 downto 1608))>max then
				max := feature_map(1615 downto 1608);
			elsif (feature_map(1607 downto 1600))>max then
				max := feature_map(1607 downto 1600);
			end if;
			pooled_fm(407 downto 400) <= max;
			-- 4th layer
			-- Max pooling number 1
			if (feature_map(1599 downto 1592))>max then
				max := feature_map(1599 downto 1592);
			elsif (feature_map(1591 downto 1584))>max then
				max := feature_map(1591 downto 1584);
			elsif (feature_map(1519 downto 1512))>max then
				max := feature_map(1519 downto 1512);
			elsif (feature_map(1511 downto 1504))>max then
				max := feature_map(1511 downto 1504);
			end if;
			pooled_fm(399 downto 392) <= max;
			-- Max pooling number 2
			max := "00000000";
			if (feature_map(1583 downto 1576))>max then
				max := feature_map(1583 downto 1576);
			elsif (feature_map(1575 downto 1568))>max then
				max := feature_map(1575 downto 1568);
			elsif (feature_map(1503 downto 1496))>max then
				max := feature_map(1503 downto 1496);
			elsif (feature_map(1495 downto 1488))>max then
				max := feature_map(1495 downto 1488);
			end if;
			pooled_fm(391 downto 384) <= max;
			-- Max pooling number 3
			max := "00000000";
			if (feature_map(1567 downto 1560))>max then
				max := feature_map(1567 downto 1560);
			elsif (feature_map(1559 downto 1552))>max then
				max := feature_map(1559 downto 1552);
			elsif (feature_map(1487 downto 1480))>max then
				max := feature_map(1487 downto 1480);
			elsif (feature_map(1479 downto 1472))>max then
				max := feature_map(1479 downto 1472);
			end if;
			pooled_fm(383 downto 376) <= max;
			-- Max pooling number 4
			max := "00000000";
			if (feature_map(1551 downto 1544))>max then
				max := feature_map(1551 downto 1544);
			elsif (feature_map(1543 downto 1536))>max then
				max := feature_map(1543 downto 1536);
			elsif (feature_map(1471 downto 1464))>max then
				max := feature_map(1471 downto 1464);
			elsif (feature_map(1463 downto 1456))>max then
				max := feature_map(1463 downto 1456);
			end if;
			pooled_fm(375 downto 368) <= max;
			-- Max pooling number 5
			max := "00000000";
			if (feature_map(1535 downto 1528))>max then
				max := feature_map(1535 downto 1528);
			elsif (feature_map(1527 downto 1520))>max then
				max := feature_map(1527 downto 1520);
			elsif (feature_map(1455 downto 1448))>max then
				max := feature_map(1455 downto 1448);
			elsif (feature_map(1447 downto 1440))>max then
				max := feature_map(1447 downto 1440);
			end if;
			pooled_fm(367 downto 360) <= max;
			-- Max pooling number 6
			max := "00000000";
			if (feature_map(1439 downto 1432))>max then
				max := feature_map(1439 downto 1432);
			elsif (feature_map(1431 downto 1424))>max then
				max := feature_map(1431 downto 1424);
			elsif (feature_map(1359 downto 1352))>max then
				max := feature_map(1359 downto 1352);
			elsif (feature_map(1351 downto 1344))>max then
				max := feature_map(1351 downto 1344);
			end if;
			pooled_fm(359 downto 352) <= max;
			-- Max pooling number 7
			max := "00000000";
			if (feature_map(1423 downto 1416))>max then
				max := feature_map(1423 downto 1416);
			elsif (feature_map(1415 downto 1408))>max then
				max := feature_map(1415 downto 1408);
			elsif (feature_map(1343 downto 1336))>max then
				max := feature_map(1343 downto 1336);
			elsif (feature_map(1335 downto 1328))>max then
				max := feature_map(1335 downto 1328);
			end if;
			pooled_fm(351 downto 344) <= max;
			-- Max pooling number 8
			max := "00000000";
			if (feature_map(1407 downto 1400))>max then
				max := feature_map(1407 downto 1400);
			elsif (feature_map(1399 downto 1392))>max then
				max := feature_map(1399 downto 1392);
			elsif (feature_map(1327 downto 1320))>max then
				max := feature_map(1327 downto 1320);
			elsif (feature_map(1319 downto 1312))>max then
				max := feature_map(1319 downto 1312);
			end if;
			pooled_fm(343 downto 336) <= max;
			-- Max pooling number 9
			max := "00000000";
			if (feature_map(1391 downto 1384))>max then
				max := feature_map(1391 downto 1384);
			elsif (feature_map(1383 downto 1376))>max then
				max := feature_map(1383 downto 1376);
			elsif (feature_map(1311 downto 1304))>max then
				max := feature_map(1311 downto 1304);
			elsif (feature_map(1303 downto 1296))>max then
				max := feature_map(1303 downto 1296);
			end if;
			pooled_fm(335 downto 328) <= max;
			-- Max pooling number 10
			max := "00000000";
			if (feature_map(1375	 downto 1368))>max then
				max := feature_map(1375 downto 1368);
			elsif (feature_map(1367 downto 1360))>max then
				max := feature_map(1367 downto 1360);
			elsif (feature_map(1295 downto 1288))>max then
				max := feature_map(1295 downto 1288);
			elsif (feature_map(1287 downto 1280))>max then
				max := feature_map(1287 downto 1280);
			end if;
			pooled_fm(327 downto 320) <= max;
			-- Max pooling number 11
			max := "00000000";
			if (feature_map(1279 downto 1272))>max then
				max := feature_map(1279 downto 1272);
			elsif (feature_map(1271 downto 1264))>max then
				max := feature_map(1271 downto 1264);
			elsif (feature_map(1199 downto 1192))>max then
				max := feature_map(1199 downto 1192);
			elsif (feature_map(1191 downto 1184))>max then
				max := feature_map(1191 downto 1184);
			end if;
			pooled_fm(319 downto 312) <= max;
			-- Max pooling number 12
			max := "00000000";
			if (feature_map(1263 downto 1256))>max then
				max := feature_map(1263 downto 1256);
			elsif (feature_map(1255 downto 1248))>max then
				max := feature_map(1255 downto 1248);
			elsif (feature_map(1183 downto 1176))>max then
				max := feature_map(1183 downto 1176);
			elsif (feature_map(1175 downto 1168))>max then
				max := feature_map(1175 downto 1168);
			end if;
			pooled_fm(311 downto 304) <= max;
			-- Max pooling number 13
			max := "00000000";
			if (feature_map(1247 downto 1240))>max then
				max := feature_map(1247 downto 1240);
			elsif (feature_map(1239 downto 1232))>max then
				max := feature_map(1239 downto 1232);
			elsif (feature_map(1167 downto 1160))>max then
				max := feature_map(1167 downto 1160);
			elsif (feature_map(1159 downto 1152))>max then
				max := feature_map(1159 downto 1152);
			end if;
			pooled_fm(303 downto 296) <= max;
			-- Max pooling number 14
			max := "00000000";
			if (feature_map(1231 downto 1224))>max then
				max := feature_map(1231 downto 1224);
			elsif (feature_map(1223 downto 1216))>max then
				max := feature_map(1223 downto 1216);
			elsif (feature_map(1151 downto 1144))>max then
				max := feature_map(1151 downto 1144);
			elsif (feature_map(1143 downto 1136))>max then
				max := feature_map(1143 downto 1136);
			end if;
			pooled_fm(295 downto 288) <= max;
			-- Max pooling number 15
			max := "00000000";
			if (feature_map(1215 downto 1208))>max then
				max := feature_map(1215 downto 1208);
			elsif (feature_map(1207 downto 1200))>max then
				max := feature_map(1207 downto 1200);
			elsif (feature_map(1135 downto 1128))>max then
				max := feature_map(1135 downto 1128);
			elsif (feature_map(1127 downto 1120))>max then
				max := feature_map(1127 downto 1120);
			end if;
			pooled_fm(287 downto 280) <= max;
			-- Max pooling number 16
			max := "00000000";
			if (feature_map(1119 downto 1112))>max then
				max := feature_map(1119 downto 1112);
			elsif (feature_map(1111 downto 1104))>max then
				max := feature_map(1111 downto 1104);
			elsif (feature_map(1039 downto 1032))>max then
				max := feature_map(1039 downto 1032);
			elsif (feature_map(1031 downto 1024))>max then
				max := feature_map(1031 downto 1024);
			end if;
			pooled_fm(279 downto 272) <= max;
			-- Max pooling number 17
			max := "00000000";
			if (feature_map(1103 downto 1096))>max then
				max := feature_map(1103 downto 1096);
			elsif (feature_map(1095 downto 1088))>max then
				max := feature_map(1095 downto 1088);
			elsif (feature_map(1023 downto 1016))>max then
				max := feature_map(1023 downto 1016);
			elsif (feature_map(1015 downto 1008))>max then
				max := feature_map(1015 downto 1008);
			end if;
			pooled_fm(271 downto 264) <= max;
			-- Max pooling number 18
			max := "00000000";
			if (feature_map(1087 downto 1080))>max then
				max := feature_map(1087 downto 1080);
			elsif (feature_map(1079 downto 1072))>max then
				max := feature_map(1079 downto 1072);
			elsif (feature_map(1007 downto 1000))>max then
				max := feature_map(1007 downto 1000);
			elsif (feature_map(999  downto  992))>max then
				max := feature_map(999  downto  992);
			end if;
			pooled_fm(263 downto 256) <= max;
			-- Max pooling number 19
			max := "00000000";
			if (feature_map(1071 downto 1064))>max then
				max := feature_map(1071 downto 1064);
			elsif (feature_map(1063 downto 1056))>max then
				max := feature_map(1063 downto 1056);
			elsif (feature_map(991  downto  984))>max then
				max := feature_map(991  downto  984);
			elsif (feature_map(983  downto  976))>max then
				max := feature_map(983  downto  976);
			end if;
			pooled_fm(255 downto 248) <= max;
			-- Max pooling number 20
			max := "00000000";
			if (feature_map(1055 downto 1048))>max then
				max := feature_map(1055 downto 1048);
			elsif (feature_map(1047 downto 1040))>max then
				max := feature_map(1047 downto 1040);
			elsif (feature_map(975  downto  968))>max then
				max := feature_map(975  downto  968);
			elsif (feature_map(967  downto  960))>max then
				max := feature_map(967  downto  960);
			end if;
			pooled_fm(247 downto 240) <= max;
			-- Max pooling number 21
			max := "00000000";
			if (feature_map(959  downto  952))>max then
				max := feature_map(959  downto  952);
			elsif (feature_map(951  downto  944))>max then
				max := feature_map(951  downto  944);
			elsif (feature_map(879  downto  872))>max then
				max := feature_map(879  downto  872);
			elsif (feature_map(871  downto  864))>max then
				max := feature_map(871  downto  864);
			end if;
			pooled_fm(239 downto 232) <= max;
			-- Max pooling number 22
			max := "00000000";
			if (feature_map(943  downto  936))>max then
				max := feature_map(943  downto  936);
			elsif (feature_map(935  downto  928))>max then
				max := feature_map(935  downto  928);
			elsif (feature_map(863  downto  856))>max then
				max := feature_map(863  downto  856);
			elsif (feature_map(855  downto  848))>max then
				max := feature_map(855  downto  848);
			end if;
			pooled_fm(231 downto 224) <= max;
			-- Max pooling number 23
			max := "00000000";
			if (feature_map(927  downto  920))>max then
				max := feature_map(927  downto  920);
			elsif (feature_map(919  downto  912))>max then
				max := feature_map(919  downto  912);
			elsif (feature_map(847  downto  840))>max then
				max := feature_map(847  downto  840);
			elsif (feature_map(839  downto  832))>max then
				max := feature_map(839  downto  832);
			end if;
			pooled_fm(223 downto 216) <= max;
			-- Max pooling number 24
			max := "00000000";
			if (feature_map(911  downto  904))>max then
				max := feature_map(911 downto  904);
			elsif (feature_map(903  downto  896))>max then
				max := feature_map(903 downto  896);
			elsif (feature_map(831  downto  824))>max then
				max := feature_map(831 downto  824);
			elsif (feature_map(823  downto  816))>max then
				max := feature_map(823  downto  816);
			end if;
			pooled_fm(215 downto 208) <= max;
			-- Max pooling number 25
			max := "00000000";
			if (feature_map(895  downto  888))>max then
				max := feature_map(895 downto  888);
			elsif (feature_map(887  downto  880))>max then
				max := feature_map(887 downto  880);
			elsif (feature_map(815  downto  808))>max then
				max := feature_map(815 downto  808);
			elsif (feature_map(807  downto  800))>max then
				max := feature_map(807  downto  800);
			end if;
			pooled_fm(207 downto 200) <= max;
			-- 5th layer
			-- Max pooling number 1
			if (feature_map(799 downto 792))>max then
				max := feature_map(799 downto 792);
			elsif (feature_map(791 downto 784))>max then
				max := feature_map(791 downto 784);
			elsif (feature_map(719 downto 712))>max then
				max := feature_map(719 downto 712);
			elsif (feature_map(711 downto 704))>max then
				max := feature_map(711 downto 704);
			end if;
			pooled_fm(199 downto 192) <= max;
			-- Max pooling number 2
			max := "00000000";
			if (feature_map(783 downto 776))>max then
				max := feature_map(783 downto 776);
			elsif (feature_map(775 downto 768))>max then
				max := feature_map(775 downto 768);
			elsif (feature_map(703 downto 696))>max then
				max := feature_map(703 downto 696);
			elsif (feature_map(695 downto 688))>max then
				max := feature_map(695 downto 688);
			end if;
			pooled_fm(191 downto 184) <= max;
			-- Max pooling number 3
			max := "00000000";
			if (feature_map(767 downto 660))>max then
				max := feature_map(767 downto 760);
			elsif (feature_map(759 downto 652))>max then
				max := feature_map(659 downto 652);
			elsif (feature_map(687 downto 680))>max then
				max := feature_map(687 downto 680);
			elsif (feature_map(679 downto 672))>max then
				max := feature_map(679 downto 672);
			end if;
			pooled_fm(183 downto 176) <= max;
			-- Max pooling number 4
			max := "00000000";
			if (feature_map(751 downto 744))>max then
				max := feature_map(751 downto 744);
			elsif (feature_map(743 downto 736))>max then
				max := feature_map(743 downto 736);
			elsif (feature_map(671 downto 664))>max then
				max := feature_map(671 downto 664);
			elsif (feature_map(663 downto 656))>max then
				max := feature_map(663 downto 656);
			end if;
			pooled_fm(175 downto 168) <= max;
			-- Max pooling number 5
			max := "00000000";
			if (feature_map(735 downto 728))>max then
				max := feature_map(735 downto 728);
			elsif (feature_map(727 downto 720))>max then
				max := feature_map(727 downto 720);
			elsif (feature_map(655 downto 648))>max then
				max := feature_map(655 downto 648);
			elsif (feature_map(647 downto 640))>max then
				max := feature_map(647 downto 640);
			end if;
			pooled_fm(167 downto 160) <= max;
			-- Max pooling number 6
			max := "00000000";
			if (feature_map(639 downto 632))>max then
				max := feature_map(639 downto 632);
			elsif (feature_map(631 downto 624))>max then
				max := feature_map(631 downto 624);
			elsif (feature_map(559 downto 552))>max then
				max := feature_map(559 downto 552);
			elsif (feature_map(551 downto 544))>max then
				max := feature_map(551 downto 544);
			end if;
			pooled_fm(159 downto 152) <= max;
			-- Max pooling number 7
			max := "00000000";
			if (feature_map(623 downto 616))>max then
				max := feature_map(623 downto 616);
			elsif (feature_map(615 downto 608))>max then
				max := feature_map(615 downto 608);
			elsif (feature_map(543 downto 536))>max then
				max := feature_map(543 downto 536);
			elsif (feature_map(535 downto 528))>max then
				max := feature_map(535 downto 528);
			end if;
			pooled_fm(151 downto 144) <= max;
			-- Max pooling number 8
			max := "00000000";
			if (feature_map(607 downto 600))>max then
				max := feature_map(607 downto 600);
			elsif (feature_map(599 downto 592))>max then
				max := feature_map(599 downto 592);
			elsif (feature_map(527 downto 520))>max then
				max := feature_map(527 downto 520);
			elsif (feature_map(519 downto 512))>max then
				max := feature_map(519 downto 512);
			end if;
			pooled_fm(143 downto 136) <= max;
			-- Max pooling number 9
			max := "00000000";
			if (feature_map(591 downto 584))>max then
				max := feature_map(591 downto 584);
			elsif (feature_map(583 downto 576))>max then
				max := feature_map(583 downto 576);
			elsif (feature_map(511 downto 504))>max then
				max := feature_map(511 downto 504);
			elsif (feature_map(503 downto 496))>max then
				max := feature_map(503 downto 496);
			end if;
			pooled_fm(135 downto 128) <= max;
			-- Max pooling number 10
			max := "00000000";
			if (feature_map(575	 downto 568))>max then
				max := feature_map(575 downto 568);
			elsif (feature_map(567 downto 560))>max then
				max := feature_map(567 downto 560);
			elsif (feature_map(495 downto 488))>max then
				max := feature_map(495 downto 488);
			elsif (feature_map(487 downto 480))>max then
				max := feature_map(487 downto 480);
			end if;
			pooled_fm(127 downto 120) <= max;
			-- Max pooling number 11
			max := "00000000";
			if (feature_map(479 downto 472))>max then
				max := feature_map(479 downto 472);
			elsif (feature_map(471 downto 464))>max then
				max := feature_map(471 downto 464);
			elsif (feature_map(399 downto 392))>max then
				max := feature_map(399 downto 392);
			elsif (feature_map(391 downto 384))>max then
				max := feature_map(391 downto 384);
			end if;
			pooled_fm(119 downto 112) <= max;
			-- Max pooling number 12
			max := "00000000";
			if (feature_map(463 downto 456))>max then
				max := feature_map(463 downto 456);
			elsif (feature_map(455 downto 448))>max then
				max := feature_map(455 downto 448);
			elsif (feature_map(383 downto 376))>max then
				max := feature_map(383 downto 376);
			elsif (feature_map(375 downto 368))>max then
				max := feature_map(375 downto 368);
			end if;
			pooled_fm(111 downto 104) <= max;
			-- Max pooling number 13
			max := "00000000";
			if (feature_map(447 downto 440))>max then
				max := feature_map(447 downto 440);
			elsif (feature_map(439 downto 432))>max then
				max := feature_map(439 downto 432);
			elsif (feature_map(367 downto 360))>max then
				max := feature_map(367 downto 360);
			elsif (feature_map(359 downto 352))>max then
				max := feature_map(359 downto 352);
			end if;
			pooled_fm(103 downto 96) <= max;
			-- Max pooling number 14
			max := "00000000";
			if (feature_map(431 downto 424))>max then
				max := feature_map(431 downto 424);
			elsif (feature_map(423 downto 416))>max then
				max := feature_map(423 downto 416);
			elsif (feature_map(351 downto 344))>max then
				max := feature_map(351 downto 344);
			elsif (feature_map(343 downto 336))>max then
				max := feature_map(343 downto 336);
			end if;
			pooled_fm(95 downto 88) <= max;
			-- Max pooling number 15
			max := "00000000";
			if (feature_map(415 downto 408))>max then
				max := feature_map(415 downto 408);
			elsif (feature_map(407 downto 400))>max then
				max := feature_map(407 downto 400);
			elsif (feature_map(335 downto 328))>max then
				max := feature_map(335 downto 328);
			elsif (feature_map(327 downto 320))>max then
				max := feature_map(327 downto 320);
			end if;
			pooled_fm(87 downto 80) <= max;
			-- Max pooling number 16
			max := "00000000";
			if (feature_map(319 downto 312))>max then
				max := feature_map(319 downto 312);
			elsif (feature_map(311 downto 304))>max then
				max := feature_map(311 downto 304);
			elsif (feature_map(239 downto 232))>max then
				max := feature_map(239 downto 232);
			elsif (feature_map(231 downto 224))>max then
				max := feature_map(231 downto 224);
			end if;
			pooled_fm(79 downto 72) <= max;
			-- Max pooling number 17
			max := "00000000";
			if (feature_map(303 downto 296))>max then
				max := feature_map(303 downto 296);
			elsif (feature_map(295 downto 288))>max then
				max := feature_map(295 downto 288);
			elsif (feature_map(223 downto 216))>max then
				max := feature_map(223 downto 216);
			elsif (feature_map(215 downto 208))>max then
				max := feature_map(215 downto 208);
			end if;
			pooled_fm(71 downto 64) <= max;
			-- Max pooling number 18
			max := "00000000";
			if (feature_map(287 downto 280))>max then
				max := feature_map(287 downto 280);
			elsif (feature_map(279 downto 272))>max then
				max := feature_map(279 downto 272);
			elsif (feature_map(207 downto 200))>max then
				max := feature_map(207 downto 200);
			elsif (feature_map(199  downto  192))>max then
				max := feature_map(199  downto  192);
			end if;
			pooled_fm(63 downto 56) <= max;
			-- Max pooling number 19
			max := "00000000";
			if (feature_map(271 downto 264))>max then
				max := feature_map(271 downto 264);
			elsif (feature_map(263 downto 256))>max then
				max := feature_map(263 downto 256);
			elsif (feature_map(191  downto  184))>max then
				max := feature_map(191  downto  184);
			elsif (feature_map(183  downto  176))>max then
				max := feature_map(183  downto  176);
			end if;
			pooled_fm(55 downto 48) <= max;
			-- Max pooling number 20
			max := "00000000";
			if (feature_map(255 downto 248))>max then
				max := feature_map(255 downto 248);
			elsif (feature_map(247 downto 240))>max then
				max := feature_map(247 downto 240);
			elsif (feature_map(175  downto  168))>max then
				max := feature_map(175  downto  168);
			elsif (feature_map(167  downto  160))>max then
				max := feature_map(167  downto  160);
			end if;
			pooled_fm(47 downto 40) <= max;
			-- Max pooling number 21
			max := "00000000";
			if (feature_map(159  downto  152))>max then
				max := feature_map(159  downto  152);
			elsif (feature_map(151  downto  144))>max then
				max := feature_map(151  downto  144);
			elsif (feature_map(79  downto  72))>max then
				max := feature_map(79  downto  72);
			elsif (feature_map(71  downto  64))>max then
				max := feature_map(71  downto  64);
			end if;
			pooled_fm(39 downto 32) <= max;
			-- Max pooling number 22
			max := "00000000";
			if (feature_map(143  downto  136))>max then
				max := feature_map(143  downto  136);
			elsif (feature_map(135  downto  128))>max then
				max := feature_map(135  downto  128);
			elsif (feature_map(63  downto  56))>max then
				max := feature_map(63  downto  56);
			elsif (feature_map(55  downto  48))>max then
				max := feature_map(55  downto  48);
			end if;
			pooled_fm(31 downto 24) <= max;
			-- Max pooling number 23
			max := "00000000";
			if (feature_map(127  downto  120))>max then
				max := feature_map(127  downto  120);
			elsif (feature_map(119  downto  112))>max then
				max := feature_map(119  downto  112);
			elsif (feature_map(47  downto  40))>max then
				max := feature_map(47  downto  40);
			elsif (feature_map(39  downto  32))>max then
				max := feature_map(39  downto  32);
			end if;
			pooled_fm(23 downto 16) <= max;
			-- Max pooling number 24
			max := "00000000";
			if (feature_map(111  downto  104))>max then
				max := feature_map(111 downto  104);
			elsif (feature_map(103  downto  96))>max then
				max := feature_map(103 downto  96);
			elsif (feature_map(31  downto  24))>max then
				max := feature_map(31 downto  24);
			elsif (feature_map(23  downto  16))>max then
				max := feature_map(23  downto  16);
			end if;
			pooled_fm(15 downto 08) <= max;
			-- Max pooling number 25
			max := "00000000";
			if (feature_map(95  downto  88))>max then
				max := feature_map(95 downto  88);
			elsif (feature_map(87  downto  80))>max then
				max := feature_map(87 downto  80);
			elsif (feature_map(15  downto  08))>max then
				max := feature_map(15 downto  08);
			elsif (feature_map(07  downto  00))>max then
				max := feature_map(07  downto 0);
			end if;
			pooled_fm(7 downto 0) <= max;
		end if;
	end process;

end Behavioral;