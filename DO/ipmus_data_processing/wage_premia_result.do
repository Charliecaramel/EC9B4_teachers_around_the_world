tempfile all_results
save "`all_results'", emptyok replace

local cname "$thiscountry"
levelsof year if sample_reg == 1 & missing(occupation) == 0 & teacher_status != ., local(years)	
foreach y of local years {
	local cname "$thiscountry"
	di "Processing year `y'"
	estimates restore bs_`cname'_`y'
	lincom 2.occupation
	local est1 = r(estimate)
    local se1 = r(se)
    local p1 = r(p)
	local t1 = r(t)
	local lb1 = r(lb)
	local ub1 = r(ub)
	
	lincom 3.occupation
	local est2 = r(estimate)
    local se2 = r(se)
    local p2 = r(p)
	local t2 = r(t)
	local lb2 = r(lb)
	local ub2 = r(ub)
	
	estimates restore bs2_`cname'_`y'
	lincom 2.occupation
	local est3 = r(estimate)
    local se3 = r(se)
    local p3 = r(p)
	local t3 = r(t)
	local lb3 = r(lb)
	local ub3 = r(ub)
	
	lincom 3.occupation
	local est4 = r(estimate)
    local se4 = r(se)
    local p4 = r(p)
	local t4 = r(t)
	local lb4 = r(lb)
	local ub4 = r(ub)
	
	estimates restore gender_`cname'_`y'
	lincom 2.occupation
	local est5 = r(estimate)
    local se5 = r(se)
    local p5 = r(p)
	local t5 = r(t)
	local lb5 = r(lb)
	local ub5 = r(ub)
	
	lincom 3.occupation
	local est6 = r(estimate)
    local se6 = r(se)
    local p6 = r(p)
	local t6 = r(t)
	local lb6 = r(lb)
	local ub6 = r(ub)
	
	lincom 2.occupation + 2.occupation#2.sex
	local est7 = r(estimate)
    local se7 = r(se)
    local p7 = r(p)
	local t7 = r(t)
	local lb7 = r(lb)
	local ub7 = r(ub)
	
	lincom 3. occupation + 3.occupation#2.sex
	local est8 = r(estimate)
    local se8 = r(se)
    local p8 = r(p)
	local t8 = r(t)
	local lb8 = r(lb)
	local ub8 = r(ub)
	
	estimates restore gender2_`cname'_`y'
	lincom 2.occupation
	local est9 = r(estimate)
    local se9 = r(se)
    local p9 = r(p)
	local t9 = r(t)
	local lb9 = r(lb)
	local ub9 = r(ub)
	
	lincom 3.occupation
	local est10 = r(estimate)
    local se10 = r(se)
    local p10 = r(p)
	local t10 = r(t)
	local lb10 = r(lb)
	local ub10 = r(ub)
	
	lincom 2.occupation + 2.occupation#2.sex
	local est11 = r(estimate)
    local se11 = r(se)
    local p11 = r(p)
	local t11 = r(t)
	local lb11 = r(lb)
	local ub11 = r(ub)
	
	lincom 3. occupation + 3.occupation#2.sex
	local est12 = r(estimate)
    local se12 = r(se)
    local p12 = r(p)
	local t12 = r(t)
	local lb12 = r(lb)
	local ub12 = r(ub)
	
	estimates restore low_`cname'_`y'
	lincom year_school
	local est13 = r(estimate)
    local se13 = r(se)
    local p13 = r(p)
	local t13 = r(t)
	local lb13 = r(lb)
	local ub13 = r(ub)
	
	estimates restore high_`cname'_`y'
	lincom year_school
	local est14 = r(estimate)
    local se14 = r(se)
    local p14 = r(p)
	local t14 = r(t)
	local lb14 = r(lb)
	local ub14 = r(ub)
	
	estimates restore teach_`cname'_`y'
	lincom year_school
	local est15 = r(estimate)
    local se15 = r(se)
    local p15 = r(p)
	local t15 = r(t)
	local lb15 = r(lb)
	local ub15 = r(ub)
	
	estimates restore low_`cname'_`y'_m
	lincom year_school
	local est16 = r(estimate)
    local se16 = r(se)
    local p16 = r(p)
	local t16 = r(t)
	local lb16 = r(lb)
	local ub16 = r(ub)
	
	estimates restore high_`cname'_`y'_m
	lincom year_school
	local est17 = r(estimate)
    local se17 = r(se)
    local p17 = r(p)
	local t17 = r(t)
	local lb17 = r(lb)
	local ub17 = r(ub)
	
	estimates restore teach_`cname'_`y'_m
	lincom year_school
	local est18 = r(estimate)
    local se18 = r(se)
    local p18 = r(p)
	local t18 = r(t)
	local lb18 = r(lb)
	local ub18 = r(ub)
	
	estimates restore low_`cname'_`y'_f
	lincom year_school
	local est19 = r(estimate)
    local se19 = r(se)
    local p19 = r(p)
	local t19 = r(t)
	local lb19 = r(lb)
	local ub19 = r(ub)
	
	estimates restore high_`cname'_`y'_f
	lincom year_school
	local est20 = r(estimate)
    local se20 = r(se)
    local p20 = r(p)
	local t20 = r(t)
	local lb20 = r(lb)
	local ub20 = r(ub)
	
	estimates restore teach_`cname'_`y'_f
	lincom year_school
	local est21 = r(estimate)
    local se21 = r(se)
    local p21 = r(p)
	local t21 = r(t)
	local lb21 = r(lb)
	local ub21 = r(ub)
	
	
	
		preserve
		clear
        set obs 1
        gen year = `y'
		gen country_str2 = "$thiscountry"

        gen wp_hs_est= `est1'
        gen wp_hs_se  = `se1'
        gen wp_hs_p   = `p1'
		gen wp_hs_t   = `t1'
		gen wp_hs_lb   = `lb1'
		gen wp_hs_ub    = `ub1'
		
        gen wp_teach_est= `est2'
        gen wp_teach_se  = `se2'
        gen wp_teach_p   = `p2'
		gen wp_teach_t   = `t2'
		gen wp_teach_lb   = `lb2'
		gen wp_teach_ub    = `ub2'

		gen wp_hs_edu_est= `est3'
        gen wp_hs_edu_se  = `se3'
        gen wp_hs_edu_p   = `p3'
		gen wp_hs_edu_t   = `t3'
		gen wp_hs_edu_lb   = `lb3'
		gen wp_hs_edu_ub    = `ub3'

		gen wp_teach_edu_est= `est4'
        gen wp_teach_edu_se  = `se4'
        gen wp_teach_edu_p   = `p4'
		gen wp_teach_edu_t   = `t4'
		gen wp_teach_edu_lb   = `lb4'
		gen wp_teach_edu_ub    = `ub4'
		
		gen malewp_hs_est= `est5'
        gen malewp_hs_se  = `se5'
        gen malewp_hs_p   = `p5'
		gen malewp_hs_t   = `t5'
		gen malewp_hs_lb   = `lb5'
		gen malewp_hs_ub    = `ub5'
		
		gen malewp_teach_est= `est6'
        gen malewp_teach_se  = `se6'
        gen malewp_teach_p   = `p6'
		gen malewp_teach_t   = `t6'
		gen malewp_teach_lb   = `lb6'
		gen malewp_teach_ub    = `ub6'

		gen femalewp_hs_est= `est7'
        gen femalewp_hs_se  = `se7'
        gen femalewp_hs_p   = `p7'
		gen femalewp_hs_t   = `t7'
		gen femalewp_hs_lb   = `lb7'
		gen femalewp_hs_ub    = `ub7'
		
		gen femalewp_teach_est= `est8'
        gen femalewp_teach_se  = `se8'
        gen femalewp_teach_p   = `p8'
		gen femalewp_teach_t   = `t8'
		gen femalewp_teach_lb   = `lb8'
		gen femalewp_teach_ub    = `ub8'
		
		gen malewp_hs_edu_est= `est9'
        gen malewp_hs_edu_se  = `se9'
        gen malewp_hs_edu_p   = `p9'
		gen malewp_hs_edu_t   = `t9'
		gen malewp_hs_edu_lb   = `lb9'
		gen malewp_hs_edu_ub    = `ub9'
		
		gen malewp_teach_edu_est= `est10'
        gen malewp_teach_edu_se  = `se10'
        gen malewp_teach_edu_p   = `p10'
		gen malewp_teach_edu_t   = `t10'
		gen malewp_teachs_edu_lb   = `lb10'
		gen malewp_teach_edu_ub    = `ub10'

		gen femalewp_hs_edu_est= `est11'
        gen femalewp_hs_edu_se  = `se11'
        gen femalewp_hs_edu_p   = `p11'
		gen femalewp_hs_edu_t   = `t11'
		gen femalewp_hs_edu_lb   = `lb11'
		gen femalewp_hs_edu_ub    = `ub11'
		
		gen femalewp_teach_edu_est= `est12'
        gen femalewp_teach_edu_se  = `se12'
        gen femalewp_teach_edu_p   = `p12'
		gen femalewp_teach_edu_t   = `t12'
		gen femalewp_teach_edu_lb   = `lb12'
		gen femalewp_teach_edu_ub    = `ub12'
		
		gen low_yrschool_est= `est13'
        gen low_yrschool_se  = `se13'
        gen low_yrschool_p   = `p13'
		gen low_yrschool_t   = `t13'
		gen low_yrschool_lb   = `lb13'
		gen low_yrschool_ub    = `ub13'
		
		gen high_yrschool_est= `est14'
        gen high_yrschool_se  = `se14'
        gen high_yrschool_p   = `p14'
		gen high_yrschool_t   = `t14'
		gen high_yrschool_lb   = `lb14'
		gen high_yrschool_ub    = `ub14'
		
		gen teach_yrschool_est= `est15'
        gen teach_yrschool_se  = `se15'
        gen teach_yrschool_p   = `p15'
		gen teach_yrschool_t   = `t15'
		gen teach_yrschool_lb   = `lb15'
		gen teach_yrschool_ub    = `ub15'
		
		gen male_low_yrschool_est = `est16'
		gen male_low_yrschool_se  = `se16'
		gen male_low_yrschool_p   = `p16'
		gen male_low_yrschool_t   = `t16'
		gen male_low_yrschool_lb  = `lb16'
		gen male_low_yrschool_ub  = `ub16'

		gen male_high_yrschool_est = `est17'
		gen male_high_yrschool_se  = `se17'
		gen male_high_yrschool_p   = `p17'
		gen male_high_yrschool_t   = `t17'
		gen male_high_yrschool_lb  = `lb17'
		gen male_high_yrschool_ub  = `ub17'

		gen male_teach_yrschool_est = `est18'
		gen male_teach_yrschool_se  = `se18'
		gen male_teach_yrschool_p   = `p18'
		gen male_teach_yrschool_t   = `t18'
		gen male_teach_yrschool_lb  = `lb18'
		gen male_teach_yrschool_ub  = `ub18'

		gen female_low_yrschool_est = `est19'
		gen female_low_yrschool_se  = `se19'
		gen female_low_yrschool_p   = `p19'
		gen female_low_yrschool_t   = `t19'
		gen female_low_yrschool_lb  = `lb19'
		gen female_low_yrschool_ub  = `ub19'

		gen female_high_yrschool_est = `est20'
		gen female_high_yrschool_se  = `se20'
		gen female_high_yrschool_p   = `p20'
		gen female_high_yrschool_t   = `t20'
		gen female_high_yrschool_lb  = `lb20'
		gen female_high_yrschool_ub  = `ub20'

		gen female_teach_yrschool_est = `est21'
		gen female_teach_yrschool_se  = `se21'
		gen female_teach_yrschool_p   = `p21'
		gen female_teach_yrschool_t   = `t21'
		gen female_teach_yrschool_lb  = `lb21'
		gen female_teach_yrschool_ub  = `ub21'

        * Append to running temporary results file
		append using "`all_results'"
		save "`all_results'", replace
		use "`all_results'", clear

		keep country_str2 year wp_hs_* wp_teach_* wp_hs_edu_* wp_teach_edu_* malewp_hs_* malewp_teach_* femalewp_hs_* femalewp_teach_* malewp_hs_edu_* malewp_teach_edu_* femalewp_hs_edu_* femalewp_teach_edu_* low_yrschool_* high_yrschool_* teach_yrschool_* male_low_yrschool_* male_high_yrschool_* male_teach_yrschool_* female_low_yrschool_* female_high_yrschool_* female_teach_yrschool_*  malewp_teachs_edu_lb

		drop if  wp_hs_est == .
		save "Data_ipmus/temp/lincom_results_`cname'_teachers.dta", replace
		restore
	}
	
