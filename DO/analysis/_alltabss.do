
********************************************************************************
*Running all regression tables, summary statistics tables
*used in the paper.
*******************************************************************************
cd
clear all
set more off
set scheme  tab2

cd ../..


********************************************************************************
* Table 1
********************************************************************************
use Data_ipmus/collapsed_combined.dta,replace
cd Results
describe income_group
label define income_group 1 "Low Income" 2 "Middle Income" 3 "High Income"
label values income_group income_group

gen ln_teach = ln(teacher_share)
gen ln_hs = ln(hs_share)
gen ln_hs_prof = ln(hs_prof_share)
gen ln_ls = ln(ls_share)

gen ln_pri = ln(teacher_share_pri)
gen ln_sec = ln(teacher_share_sec)
gen ln_ter = ln(teacher_share_he)
gen ln_yrschool = ln(yrschool_workers)

reghdfe ln_teach l_y ,  a(country) vce(robust)
est store t1
estadd local cfe "No"

reghdfe ln_teach ln_yrschool l_y , vce(robust)
est store t2
estadd local cfe "No"

reghdfe ln_teach ln_yrschool l_y, a(country) vce(robust)
test ln_yrschool l_y
est store t3
estadd local cfe "Yes"

reghdfe ln_hs l_y , vce(robust)
est store hs1
estadd local cfe "No"

reghdfe ln_hs ln_yrschool l_y ,  a(country) vce(robust)
est store hs2
estadd local cfe "No"

reghdfe ln_hs ln_yrschool l_y, a(country) vce(robust)
test ln_yrschool l_y
est store hs3
estadd local cfe "Yes"

reghdfe ln_hs_prof  l_y ,  a(country) vce(robust)
est store prof1
estadd local cfe "No"

reghdfe ln_hs_prof ln_yrschool l_y , vce(robust)
est store prof2
estadd local cfe "No"

reghdfe ln_hs_prof ln_yrschool l_y, a(country) vce(robust)
test ln_yrschool l_y
est store prof3
estadd local cfe "Yes"

#delimit ;
esttab t1 t3 hs1 hs3  prof1 prof3 
 using "share_occ.tex", 
    cells(b(star fmt(%9.3f)) se(par fmt(%9.3f))) 
	stats(r2_a N cfe, fmt(%9.3f 0 0) labels("Adj. R-squared" "Observations" "Country FE"))
    ar2 
    style(tex) 
    legend 
    replace 
    label 
    starlevels(* 0.10 ** 0.05 *** 0.01)
    title("Regression Results: Years of Schooling by Occupation")
    mtitles("Teachers" "Teachers"  "Other High Skill Occupation" "Other High Skill Occupation"  "Other professional Occupation" "Other professional Occupation" )
    nonumbers
    addnotes("Robust standard errors in parentheses." 
             "* p<0.10, ** p<0.05, *** p<0.01");
#delimit cr

********************************************************************************
* Table 2
********************************************************************************
reghdfe ln_pri l_y,  a(country) vce(robust)
est store pri1
estadd local cfe "Yes"

reghdfe ln_pri ln_yrschool l_y, a(country) vce(robust)
est store pri3
estadd local cfe "Yes"

reghdfe ln_sec l_y,  a(country) vce(robust)
est store sec1
estadd local cfe "Yes"

reghdfe ln_sec ln_yrschool l_y, a(country) vce(robust)
est store sec3
estadd local cfe "Yes"

reghdfe ln_ter l_y,  a(country) vce(robust)
est store ter1
estadd local cfe "Yes"

reghdfe ln_ter ln_yrschool l_y, a(country) vce(robust)
est store ter3
estadd local cfe "Yes"

#delimit ;
esttab pri1 pri3 sec1 sec3 ter1 ter3
 using "share_teach_type.tex", 
    cells(b(star fmt(%9.3f)) se(par fmt(%9.3f))) 
	stats(r2_a N cfe, fmt(%9.3f 0 0) labels("Adj. R-squared" "Observations" "Country FE"))
    ar2 
    style(tex) 
    legend 
    replace 
    label 
    starlevels(* 0.10 ** 0.05 *** 0.01)
    title("Regression Results: Years of Schooling by Occupation")
    nonumbers
    addnotes("Robust standard errors in parentheses." 
             "* p<0.10, ** p<0.05, *** p<0.01");
#delimit cr


********************************************************************************
* Table 3
********************************************************************************
gen year_10 = floor(year/10)*10
replace year_10 = . if year_10 == 1960 | year_10 == 2020


levelsof year_10, local(decades)
levelsof income_group, local(income_levels)

foreach inc of local income_levels {
    foreach decade of local decades {
        estpost tabstat teacher_share hs_share ls_share if year_10 == `decade' & income_group == `inc', ///
            statistics(mean semean count) columns(statistics)
        eststo decade_`decade'_inc`inc'
    }
}

	* First income group - create the table header
esttab decade_1970_inc1 decade_1980_inc1 decade_1990_inc1 decade_2000_inc1 ///
    using "occupation_table.tex", ///
    main(mean) aux(semean) label nodepvar nonote replace ///
    mtitles("1970" "1980" "1990" "2000") ///
    title("Occupation Shares by Decade and Income Group") ///
    prehead("\begin{table}[htbp]\centering" "\caption{Occupation Shares by Decade and Income Group}" "\begin{tabular}{l*{4}{c}}" "\hline\hline" "\multicolumn{5}{c}{\textbf{Panel A: Income Group 1}} \\" "\hline")

* Subsequent income groups - append as fragments without table headers
esttab decade_1970_inc2 decade_1980_inc2 decade_1990_inc2 decade_2000_inc2 ///
    using "occupation_table.tex", ///
    main(mean) aux(semean) label nodepvar nonote append fragment ///
    prehead("\hline" "\multicolumn{5}{c}{\textbf{Panel B: Income Group 2}} \\" "\hline")

esttab decade_1970_inc3 decade_1980_inc3 decade_1990_inc3 decade_2000_inc3 ///
    using "occupation_table.tex", ///
    main(mean) aux(semean) label nodepvar nonote append fragment ///
    prehead("\hline" "\multicolumn{5}{c}{\textbf{Panel C: Income Group 3}} \\" "\hline") ///
    postfoot("\hline\hline" "\end{tabular}" "\end{table}")

	

********************************************************************************
* Table 4
********************************************************************************
gen ln_yrschool_teachers =ln(yrschool_teachers)
gen ln_yrschool_hsworkers=ln(yrschool_hsworkers)
gen ln_yrschool_hsworkers_prof = ln(yrschool_hsworkers_prof)
gen ln_yrschool_workers = ln(yrschool_workers)
gen ln_yrschool_lsworkers = ln(yrschool_lsworkers)


reghdfe ln_yrschool_teachers l_y, vce(robust)
est store t1
estadd local cfe "No"

reghdfe ln_yrschool_teachers l_y, a(country) vce(robust)
est store t2
estadd local cfe "Yes"

reghdfe ln_yrschool_teachers l_y ln_yrschool_workers, a(country) vce(robust)
est store t3
estadd local cfe "Yes"

reghdfe ln_yrschool_hsworkers l_y, vce(robust)
est store hs1
estadd local cfe "No"

reghdfe ln_yrschool_hsworkers  l_y, a(country) vce(robust)
est store hs2
estadd local cfe "Yes"

reghdfe ln_yrschool_hsworkers l_y ln_yrschool_workers, a(country) vce(robust)
est store hs3
estadd local cfe "Yes"

preserve
    keep ln_yrschool_teachers ln_yrschool_hsworkers ln_yrschool_lsworkers ln_yrschool_workers country year l_y
    // Reshape wide → long
	rename ln_yrschool_teachers yrschool_teachers
	rename ln_yrschool_hsworkers yrschool_hsworkers
	rename ln_yrschool_lsworkers yrschool_lsworkers
    reshape long yrschool_, i(country year) j(occ_str) string
    
    // Encode occupation names
    gen occ_type = 1 if occ_str == "lsworkers"
	replace occ_type = 2 if occ_str == "hsworkers"
	replace occ_type = 3 if occ_str == "teachers"
	
    // Regression
    reghdfe yrschool_ c.l_y##ib2.occ_type ln_yrschool_workers, a(country) vce(robust)
    est store combine1
    estadd local cfe "Yes"
	
	gen teachers = 1 if occ_str == "teachers"
	replace teachers = 0 if occ_str != "teachers"
	reghdfe yrschool_ c.l_y##i.teachers, a(country) vce(robust)
    est store combine2
    estadd local cfe "Yes"
	
restore


// Generate LaTeX table
#delimit ;
esttab t1 t2 t3 hs1 hs2 hs3 combine1 combine2 using "share_school.tex", 
    cells(b(star fmt(%9.3f)) se(par fmt(%9.3f))) 
    stats(r2_a N cfe, fmt(%9.3f 0 0) labels("Adj. R-squared" "Observations" "Country FE"))
    ar2 
    style(tex) 
    legend 
    replace 
    label 
    starlevels(* 0.10 ** 0.05 *** 0.01)
    title("Regression Results: Years of Schooling by Occupation")
    nonumbers
    addnotes("Robust standard errors in parentheses." 
             "* p<0.10, ** p<0.05, *** p<0.01");
#delimit cr


*******************************************************************************
* Table 5
*******************************************************************************
reghdfe uni_teachers l_y, vce(robust)
est store t1
estadd local cfe "No"

reghdfe uni_teachers l_y, a(country) vce(robust)
est store t2
estadd local cfe "Yes"

reghdfe uni_hs l_y, vce(robust)
est store hs1
estadd local cfe "No"

reghdfe uni_hs l_y, a(country) vce(robust)
est store hs2
estadd local cfe "Yes"

preserve
    keep uni_teachers uni_hs uni_ls country year l_y
    // Reshape wide → long
    reshape long uni_, i(country year) j(occ_str) string
    
    // Encode occupation names
    gen occ_type = 1 if occ_str == "ls"
	replace occ_type = 2 if occ_str == "hs"
	replace occ_type = 3 if occ_str == "teachers"
	
    // Regression
    reghdfe uni_ c.l_y##i.occ_type, a(country) vce(robust)
    est store combine1
	lincom c.l_y#2.occ_type-c.l_y#3.occ_type
    estadd local cfe "Yes"
	
	gen teachers = 1 if occ_str == "teachers"
	replace teachers = 0 if occ_str != "teachers"
	reghdfe uni_ c.l_y##i.teachers, a(country) vce(robust)
    est store combine2
    estadd local cfe "Yes"
	
restore

// Generate LaTeX table
#delimit ;
esttab t1 t2 hs1 hs2 combine1 combine2 using "share_uni.tex", 
    cells(b(star fmt(%9.3f)) se(par fmt(%9.3f))) 
    stats(r2_a N cfe, fmt(%9.3f 0 0) labels("Adj. R-squared" "Observations" "Country FE")) 
    ar2 
    style(tex) 
    legend 
    replace 
    label 
    starlevels(* 0.10 ** 0.05 *** 0.01)
    title("Regression Results: Years of Schooling by Occupation")
    nonumbers
    addnotes("Robust standard errors in parentheses." 
             "* p<0.10, ** p<0.05, *** p<0.01");
#delimit cr


********************************************************************************
*Table 6
********************************************************************************
cd ..
use "Data_piaac\piaac_step_combined.dta", clear
cd results
tab edu, gen(edu_)
tab occupation, gen(occ_)
**** Pooled Data
	estpost tabstat score_lit_p female age occ_1 occ_2 occ_3 edu_1 edu_2 edu_3 edu_4 edu_5 [aw = perwt], ///
	statistics(mean sd n) columns(statistics)
	est store sum_pooled

	estpost tabstat score_lit_p female age edu_1 edu_2 edu_3 edu_4 edu_5 [aw = perwt] if  occupation == 1, ///
	statistics(mean sd n) columns(statistics)
	est store sum_pooled_1
	
	estpost tabstat score_lit_p female age edu_1 edu_2 edu_3 edu_4 edu_5 [aw = perwt] if occupation == 2, ///
	statistics(mean sd n) columns(statistics) 
	est store sum_pooled_2

	estpost tabstat score_lit_p female age edu_1 edu_2 edu_3 edu_4 edu_5 [aw = perwt] if occupation == 3, ///
	statistics(mean sd n) columns(statistics)
	est store sum_pooled_3

    esttab sum_pooled sum_pooled_1 sum_pooled_2 sum_pooled_3, main(mean) aux(sd) nostar unstack ///
        mtitles("Pooled Cross section" "Low Skilled Workers" "High Skilled Workers" "Teachers") 

**** Country Level dataset
levelsof country_id if score_lit!=. & occupation == 3 & age !=., local(country)
foreach cname of local country{
	di "processing country_id `cname'" 
	estpost tabstat score_lit female age edu_1 edu_2 edu_3 edu_4 edu_5 [aw = perwt] if country_id == `cname' & occupation == 1, ///
	statistics(mean sd n) columns(statistics) 
	est store sum_`cname'_1
	
	estpost tabstat score_lit female age edu_1 edu_2 edu_3 edu_4 edu_5 [aw = perwt] if country_id == `cname' & occupation == 2, ///
	statistics(mean sd n) columns(statistics)
	est store sum_`cname'_2

	estpost tabstat score_lit female age edu_1 edu_2 edu_3 edu_4 edu_5[aw = perwt] if country_id == `cname' & occupation == 3, ///
	statistics(mean sd n) columns(statistics)
	est store sum_`cname'_3
}

levelsof country_id if score_lit!=. & occupation == 3 & age !=., local(country)
foreach cname of local country{ 
    local country_name : label (country_id) `cname'
    di "processing `country_name'"
    esttab sum_`cname'_1 sum_`cname'_2 sum_`cname'_3, main(mean) aux(sd) nostar unstack ///
        mgroups("`country_name'") ///
        mtitles("Low Skilled Workers" "High Skilled Workers" "Teachers") 
}

*** Exporting to Latex

levelsof country_id if score_lit!=. & occupation == 3 & age !=., local(country)
foreach cname of local country{ 
    local country_name : label (country_id) `cname'
    di "processing `country_name'"
    esttab sum_`cname'_1 sum_`cname'_2 sum_`cname'_3 using "table_`cname'.tex", ///
        main(mean) aux(sd) nostar unstack ///
        mgroups("`country_name'", pattern(1 0 0) prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) ///
        mtitles("Low Skilled Workers" "High Skilled Workers" "Teachers") ///
        booktabs label fragment ///
        title("`country_name' Summary Statistics") ///
        replace
}

esttab sum_pooled sum_pooled_1 sum_pooled_2 sum_pooled_3 using "pooled_table.tex", ///
    main(mean) aux(sd) nostar unstack ///
    mtitles("Pooled Cross section" "Low Skilled Workers" "High Skilled Workers" "Teachers") ///
    booktabs label fragment ///
    title("Summary Statistics by Occupation Groups") ///
    stats(N, fmt(0) labels("Observations")) ///
    replace

*******************************************************************************
* Table 7
*******************************************************************************
cd ..
use "Data_piaac\piaac_step_combined.dta", clear
replace country_str = lower(country_str)
merge m:1 country_str year using "pwt_gdp.dta"
cd results
drop if _m == 2		
		
gen age2 = age^2

reg score_lit_p c.l_y [pw = perwt] if employed == 1 & occupation == 3, vce(robust)
est store t1

reg score_lit_p c.l_y##ib1.occupation [pw = perwt] if employed == 1, vce(robust)
est store t2	
lincom 3.occupation - 2.occupation
lincom c.l_y#2.occupation + l_y
lincom c.l_y#3.occupation + l_y
lincom c.l_y#3.occupation - c.l_y#2.occupation
*Across occupation
lincom c.l_y#3.occupation + 3.occupation
lincom c.l_y#2.occupation + 2.occupation
		
reg score_lit_p c.l_y##ib1.occupation age age2 i.female [pw = perwt] if employed == 1, vce(robust)
est store t3
lincom 3.occupation - 2.occupation
lincom c.l_y#2.occupation + l_y
lincom c.l_y#3.occupation + l_y
lincom c.l_y#3.occupation - c.l_y#2.occupation

*Across occupation
lincom c.l_y#3.occupation + 3.occupation
lincom c.l_y#2.occupation + 2.occupation
		
reg score_lit_p c.l_y##ib1.occupation age age2 i.female i.edu[pw = perwt] if employed == 1, vce(robust)
est store t4
*Within occupation 
lincom 3.occupation - 2.occupation
lincom c.l_y#2.occupation + l_y
lincom c.l_y#3.occupation + l_y
lincom c.l_y#3.occupation - c.l_y#2.occupation

*Across occupation
lincom c.l_y#3.occupation + 3.occupation
lincom c.l_y#2.occupation + 2.occupation

#delimit ;
esttab t1 t2 t3 t4 using "piaac_pscore_occ.tex", 
    cells(b(star fmt(%9.3f)) se(par fmt(%9.3f))) 
   stats(r2_a N cfe, fmt(%9.3f 0 0) labels("Adj. R-squared" "Observations" "Country FE"))
    ar2 
    style(tex) 
    legend 
    replace 
    label 
    starlevels(* 0.10 ** 0.05 *** 0.01)
    title("Regression Results: Litearcy Score by Occupation")
    nonumbers
    addnotes("Robust standard errors in parentheses." 
             "* p<0.10, ** p<0.05, *** p<0.01");
#delimit cr

*******************************************************************************
*Table 8 (IV.3)
*******************************************************************************

gen sample_reg = 1 if employed == 1 & l_wage_imp !=. & score_lit !=. & (age >= 20 & age<=60)

*** Other regression variables
gen age_sq = age^2

* Pooled Regression with country FE
** (a) Baseline returns & occupation wage premia

reghdfe l_wage_imp c.score_lit ib1.occupation i.female age age_sq [pw = perwt] if sample_reg ==1 ,  absorb(country_id) vce(robust)
est store returns_pool_base
estadd local cfe "Yes"

** (b) Returns by occupation
reghdfe l_wage_imp c.score_lit##ib1.occupation i.female age age_sq if sample_reg == 1 [pw = perwt],  absorb(country_id) vce(robust)
lincom c.score_lit + c.score_lit # 3.occupation
lincom c.score_lit + c.score_lit # 2.occupation
lincom (c.score_lit + c.score_lit # 3.occupation) - (c.score_lit+ c.score_lit # 2.occupation)
est store returns_pool_occ
estadd local cfe "Yes"

reghdfe l_wage_imp c.score_lit##ib1.occupation i.female age age_sq ib1.edu if sample_reg == 1 [pw = perwt],  absorb(country_id) vce(robust)
lincom c.score_lit + c.score_lit # 3.occupation
lincom c.score_lit + c.score_lit # 2.occupation
lincom (c.score_lit + c.score_lit # 3.occupation) - (c.score_lit+ c.score_lit # 2.occupation)
est store returns_pool_occ_edu
estadd local cfe "Yes"

#delimit ;
esttab returns_pool_base returns_pool_occ returns_pool_occ_edu
 using "rts_skill_reg.tex", 
    cells(b(star fmt(%9.3f)) se(par fmt(%9.3f))) 
	stats(r2_a N cfe, fmt(%9.3f 0 0) labels("Adj. R-squared" "Observations" "Country FE"))
    ar2 
    style(tex) 
    legend 
    replace 
    label 
    starlevels(* 0.10 ** 0.05 *** 0.01)
    title("Regression Results: Returns to litearcy skills")
    addnotes("Robust standard errors in parentheses." 
             "* p<0.10, ** p<0.05, *** p<0.01");
#delimit cr


*******************************************************************************
*Table 9 (IV.3)
******************************************************************************* 
reghdfe l_wage_imp c.score_lit##ib1.occupation  i.female age age_sq if sample_reg == 1 & income_group == 2 [pw = perwt],  absorb(country_id) vce(robust)
lincom c.score_lit + c.score_lit # 3.occupation
lincom c.score_lit + c.score_lit # 2.occupation
lincom (c.score_lit + c.score_lit # 3.occupation) - (c.score_lit+ c.score_lit # 2.occupation)
est store returns_pool_occ_med
estadd local cfe "Yes"

reghdfe l_wage_imp c.score_lit##ib1.occupation i.female age age_sq ib1.edu if sample_reg == 1 & income_group == 2 [pw = perwt],  absorb(country_id) vce(robust)
lincom c.score_lit + c.score_lit # 3.occupation
lincom c.score_lit + c.score_lit # 2.occupation
lincom (c.score_lit + c.score_lit # 3.occupation) - (c.score_lit+ c.score_lit # 2.occupation)
est store returns_pool_occ_edu_med
estadd local cfe "Yes"


reghdfe l_wage_imp c.score_lit##ib1.occupation  i.female age age_sq if sample_reg == 1 & income_group == 3 [pw = perwt],  absorb(country_id) vce(robust)
lincom c.score_lit + c.score_lit # 3.occupation
lincom c.score_lit + c.score_lit # 2.occupation
lincom (c.score_lit + c.score_lit # 3.occupation) - (c.score_lit+ c.score_lit # 2.occupation)
est store returns_pool_occ_high
estadd local cfe "Yes"

reghdfe l_wage_imp c.score_lit##ib1.occupation  i.female age age_sq ib1.edu if sample_reg == 1 & income_group == 3 [pw = perwt],  absorb(country_id) vce(robust)
lincom c.score_lit + c.score_lit # 3.occupation
lincom c.score_lit + c.score_lit # 2.occupation
lincom (c.score_lit + c.score_lit # 3.occupation) - (c.score_lit+ c.score_lit # 2.occupation)
est store returns_pool_occ_edu_high
estadd local cfe "Yes"



#delimit ;
esttab returns_pool_occ_med returns_pool_occ_edu_med  returns_pool_occ_high returns_pool_occ_edu_high
 using "rts_skill_reg_inc.tex", 
    cells(b(star fmt(%9.3f)) se(par fmt(%9.3f))) 
	stats(r2_a N cfe, fmt(%9.3f 0 0) labels("Adj. R-squared" "Observations" "Country FE"))
    ar2 
    style(tex) 
    legend 
    replace 
    label 
    starlevels(* 0.10 ** 0.05 *** 0.01)
    title("Regression Results: Returns to litearcy skills")
    addnotes("Robust standard errors in parentheses." 
             "* p<0.10, ** p<0.05, *** p<0.01");
#delimit cr










