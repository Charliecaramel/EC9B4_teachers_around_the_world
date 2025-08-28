tempfile all_results
save "`all_results'", emptyok replace

local cname "$thiscountry"
levelsof year if sample_reg == 1 & missing(occupation) == 0 & teacher_status != .& edattain_mom!=., local(years)	
foreach y of local years {
	local cname "$thiscountry"
	di "Processing year `y'"
	
	estimates restore uni_`cname'_`y'
	lincom 3.occupation + 3.occupation#4.edattain
	local est1 = r(estimate)
    local se1 = r(se)
    local p1 = r(p)
	local t1 = r(t)
	local lb1 = r(lb)
	local ub1 = r(ub)
	
	lincom 2.occupation + 2.occupation#4.edattain
	local est2 = r(estimate)
    local se2 = r(se)
    local p2 = r(p)
	local t2 = r(t)
	local lb2 = r(lb)
	local ub2 = r(ub)
	
	lincom 4.edattain + 4.edattain#3.occupation	
	local est3 = r(estimate)
    local se3 = r(se)
    local p3 = r(p)
	local t3 = r(t)
	local lb3 = r(lb)
	local ub3 = r(ub)
	
	lincom 4.edattain + 4.edattain#2.occupation
	local est4 = r(estimate)
    local se4 = r(se)
    local p4 = r(p)
	local t4 = r(t)
	local lb4 = r(lb)
	local ub4 = r(ub)
	
	estimates restore uni_`cname'_`y'_gender
	lincom 3.occupation + 3.occupation#4.edattain
	local est5 = r(estimate)
    local se5 = r(se)
    local p5 = r(p)
	local t5 = r(t)
	local lb5 = r(lb)
	local ub5 = r(ub)
	
	lincom 2.occupation + 2.occupation#4.edattain
	local est6 = r(estimate)
    local se6 = r(se)
    local p6 = r(p)
	local t6 = r(t)
	local lb6 = r(lb)
	local ub6 = r(ub)
	
	lincom 3.occupation#2.sex + 3.occupation#4.edattain#2.sex + 3.occupation + 3.occupation#4.edattain
	local est7 = r(estimate)
    local se7 = r(se)
    local p7 = r(p)
	local t7 = r(t)
	local lb7 = r(lb)
	local ub7 = r(ub)
	
	lincom 2.occupation#2.sex + 2.occupation#4.edattain#2.sex + 2.occupation + 2.occupation#4.edattain
	local est8 = r(estimate)
    local se8 = r(se)
    local p8 = r(p)
	local t8 = r(t)
	local lb8 = r(lb)
	local ub8 = r(ub)
	
	lincom 4.edattain + 4.edattain#3.occupation	
	local est9 = r(estimate)
    local se9 = r(se)
    local p9 = r(p)
	local t9 = r(t)
	local lb9 = r(lb)
	local ub9 = r(ub)
	
	lincom 4.edattain + 4.edattain#2.occupation	
	local est10 = r(estimate)
    local se10 = r(se)
    local p10 = r(p)
	local t10 = r(t)
	local lb10 = r(lb)
	local ub10 = r(ub)
	
	lincom 4.edattain#2.sex + 4.edattain#3.occupation#2.sex	+ 4.edattain + 4.edattain#3.occupation
	local est11 = r(estimate)
    local se11 = r(se)
    local p11 = r(p)
	local t11 = r(t)
	local lb11 = r(lb)
	local ub11 = r(ub)	
	
	lincom 4.edattain#2.sex + 4.edattain#2.occupation#2.sex	+ 4.edattain + 4.edattain#3.occupation	
	local est12 = r(estimate)
    local se12 = r(se)
    local p12 = r(p)
	local t12 = r(t)
	local lb12 = r(lb)
	local ub12 = r(ub)		
	
		preserve
		clear
        set obs 1
        gen year = `y'
		gen country_str2 = "$thiscountry"

			gen wp_uni_teach_est = `est1'
			gen wp_uni_teach_se  = `se1'
			gen wp_uni_teach_p   = `p1'
			gen wp_uni_teach_t   = `t1'
			gen wp_uni_teach_lb  = `lb1'
			gen wp_uni_teach_ub  = `ub1'

			gen wp_uni_hs_est    = `est2'
			gen wp_uni_hs_se     = `se2'
			gen wp_uni_hs_p      = `p2'
			gen wp_uni_hs_t      = `t2'
			gen wp_uni_hs_lb     = `lb2'
			gen wp_uni_hs_ub     = `ub2'

			gen degree_teach_est = `est3'
			gen degree_teach_se  = `se3'
			gen degree_teach_p   = `p3'
			gen degree_teach_t   = `t3'
			gen degree_teach_lb  = `lb3'
			gen degree_teach_ub  = `ub3'

			gen degree_hs_est    = `est4'
			gen degree_hs_se     = `se4'
			gen degree_hs_p      = `p4'
			gen degree_hs_t      = `t4'
			gen degree_hs_lb     = `lb4'
			gen degree_hs_ub     = `ub4'

			gen malewp_uni_teach_est = `est5'
			gen malewp_uni_teach_se  = `se5'
			gen malewp_uni_teach_p   = `p5'
			gen malewp_uni_teach_t   = `t5'
			gen malewp_uni_teach_lb  = `lb5'
			gen malewp_uni_teach_ub  = `ub5'

			gen malewp_uni_hs_est  = `est6'
			gen malewp_uni_hs_se   = `se6'
			gen malewp_uni_hs_p    = `p6'
			gen malewp_uni_hs_t    = `t6'
			gen malewp_uni_hs_lb   = `lb6'
			gen malewp_uni_hs_ub   = `ub6'

			gen femalewp_uni_teach_est = `est7'
			gen femalewp_uni_teach_se  = `se7'
			gen femalewp_uni_teach_p   = `p7'
			gen femalewp_uni_teach_t   = `t7'
			gen femalewp_uni_teach_lb  = `lb7'
			gen femalewp_uni_teach_ub  = `ub7'

			gen femalewp_uni_hs_est  = `est8'
			gen femalewp_uni_hs_se   = `se8'
			gen femalewp_uni_hs_p    = `p8'
			gen femalewp_uni_hs_t    = `t8'
			gen femalewp_uni_hs_lb   = `lb8'
			gen femalewp_uni_hs_ub   = `ub8'

			gen maledegree_teach_est = `est9'
			gen maledegree_teach_se  = `se9'
			gen maledegree_teach_p   = `p9'
			gen maledegree_teach_t   = `t9'
			gen maledegree_teach_lb  = `lb9'
			gen maledegree_teach_ub  = `ub9'

			gen maledegree_hs_est    = `est10'
			gen maledegree_hs_se     = `se10'
			gen maledegree_hs_p      = `p10'
			gen maledegree_hs_t      = `t10'
			gen maledegree_hs_lb     = `lb10'
			gen maledegree_hs_ub     = `ub10'

			gen femaledegree_teach_est = `est11'
			gen femaledegree_teach_se  = `se11'
			gen femaledegree_teach_p   = `p11'
			gen femaledegree_teach_t   = `t11'
			gen femaledegree_teach_lb  = `lb11'
			gen femaledegree_teach_ub  = `ub11'

			gen femaledegree_hs_est    = `est12'
			gen femaledegree_hs_se     = `se12'
			gen femaledegree_hs_p      = `p12'
			gen femaledegree_hs_t      = `t12'
			gen femaledegree_hs_lb     = `lb12'
			gen femaledegree_hs_ub     = `ub12'

        * Append to running temporary results file
		append using "`all_results'"
		save "`all_results'", replace
		use "`all_results'", clear

		keep country_str2 year wp_uni_teach* wp_uni_hs* degree_teach* degree_hs* malewp_uni_teach* malewp_uni_hs* femalewp_uni_teach* femalewp_uni_hs* maledegree_teach* maledegree_hs* femaledegree_teach* femaledegree_hs*
		
		drop if  femaledegree_hs_est == .
		save "Data_ipmus/temp/lincom_uni_`cname'_teachers_r.dta", replace
		restore
	}
	
