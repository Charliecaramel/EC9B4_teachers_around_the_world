********************************************************************************
*Running all regression figures used in the paper.
*******************************************************************************

clear all
set more off
set scheme  tab2

cd

cd ../..

use Data_ipmus/collapsed_combined.dta,replace
cd Results

describe income_group
label define income_group 1 "Low Income" 2 "Middle Income" 3 "High Income"
label values income_group income_group


*******************************************************************************
*Figure 3.1
*******************************************************************************
twoway (scatter teacher_share l_y if teacher_share!=0, mcol("223 158 155") mlabcol("223 158 155") msym(circle) mlab(countrycode)) ///
(lfit teacher_share l_y if teacher_share!=0, lcol("223 158 155") lpattern(solid)), ///
ytitle("Teacher Share") xtitle("Log GDP per worker") ///
legend(order(1 2) ///
label(1 "Teachers") label(2 "Teachers - Fitted") ///
size(small)) ///
name(teacher_share_only, replace)
graph export "teacher_share_only.pdf", replace

*******************************************************************************
*Figure 3.2
*******************************************************************************
twoway (scatter teacher_share l_y if teacher_share!=0, mcol("223 158 155") mlabcol("223 158 155") msym(circle)) ///
(lfit teacher_share l_y if teacher_share!=0, lcol("223 158 155") lpattern(solid)) ///
(scatter hs_share l_y if teacher_share!=0, mcol("153 186 223") mlabcol("153 186 223") msym(triangle)) ///
(lfit hs_share l_y if teacher_share!=0, lcol("153 186 223") lpattern(dash)), ///
ytitle("Occupation Shares") xtitle("Log GDP per worker") ///
legend(order(1 3 2 4) ///
label(1 "Teachers") label(3 "High Skilled") ///
label(2 "Teachers - Fitted") label(4 "High Skilled - Fitted") ///
rows(2) size(small)) ///
name(combined_shares_stacked, replace)
graph export "occupation_share.pdf", replace

twoway (scatter teacher_share l_y if teacher_share!=0, mcol("223 158 155") mlabcol("223 158 155") msym(circle)) ///
(lfit teacher_share l_y if teacher_share!=0, lcol("223 158 155") lpattern(solid)) ///
(scatter hs_prof_share l_y if teacher_share!=0, mcol("153 186 223") mlabcol("153 186 223") msym(triangle)) ///
(lfit hs_prof_share l_y if teacher_share!=0, lcol("153 186 223") lpattern(dash)), ///
ytitle("Occupation Shares") xtitle("Log GDP per worker") ///
legend(order(1 2 3 4) ///
label(1 "Teachers") label(3 "Professionals")  ///
label(2 "Teachers - Fitted") label(4 "Professionals - Fitted") ///
rows(2) size(small)) ///
name(combined_shares_prof, replace)
graph export "occupation_prof.pdf", replace

*******************************************************************************
*Figure 3.3
*******************************************************************************
twoway (scatter teacher_share_he l_y, mcol("204 136 120") mlabcol("204 136 120") msym(circle)) ///
(lfit teacher_share_he l_y , lcol("204 136 120") lpattern(solid)) ///
(scatter teacher_share_pri l_y , mcol("180 151 96") mlabcol("180 151 96") msym(triangle)) ///
(lfit teacher_share_pri l_y, lcol("180 151 96") lpattern(dash)) ///
(scatter teacher_share_sec l_y , mcol("156 112 136") mlabcol("156 112 136") msym(square)) ///
(lfit teacher_share_sec l_y , lcol("156 112 136") lpattern(longdash)), ///
ytitle("Occupation Shares") xtitle("Log GDP per worker") ///
legend(order(1 3 5 2 4 6) ///
label(1 "Teachers in higher education") label(3 "Teachers in primary education") label(5 "Teachers in secondary education") ///
label(2 "Higher Education - Fitted") label(4 "Primary - Fitted") label(6 "Secondary - Fitted") ///
rows(2) size(small)) ///
name(teacher_types_warm, replace)
graph export "occupation_share_teachtype.pdf", replace


*******************************************************************************
*Figure 3.4
*******************************************************************************

twoway (scatter teacher_share year, mcol("204 136 120") mlabcol("204 136 120")), by(income_group,total)
graph export "occ_share_time.pdf", replace

*******************************************************************************
*Figure 3.5 - Occupation share by cohorts
*******************************************************************************
cd ..
use Data_ipmus/collapsed_combined_cohort.dta,replace
merge m:1 country using Data_ipmus/baseline_country.dta
keep if baseline_country ==1
cd Results

gen cohorts = floor(birth_year/5)*5
gen year_10 = floor(year/10)*10
egen country_byear = group(country birth_year)
egen country_year = group(country year)
egen country_cohort = group(country cohorts)


*** Cohort level occupation shares

* All population
gen ln_teachshare = ln(teacher_share)
gen ln_hsshare = ln(hs_share)

gen yeareffects1 = .
gen yeareffects2 = .
gen birtheffects1 = . 

foreach num in 1 2 3 {
	reghdfe ln_teachshare i.year_10 [aw = weight_c] if income_group == `num', a(country) 
	predict ln_yeareffects if e(sample) == 1, xb
	egen ln_yeareffects_m = wtmean(ln_teachshare) if e(sample) == 1,weight(weight_c)
	egen ln_yeareffects_m2 = wtmean(ln_yeareffects) if e(sample) == 1,weight(weight_c)
	replace ln_yeareffects = ln_yeareffects + ln_yeareffects_m - ln_yeareffects_m2
	replace yeareffects1 = exp(ln_yeareffects) if income_group == `num'
	drop ln_yeareffects ln_yeareffects_m ln_yeareffects_m2
}

foreach num in 1 2 3 {
	reghdfe ln_teachshare i.year_10[aw = weight_c] if income_group == `num' , a(country_byear)
	predict ln_yeareffects if e(sample) == 1, xb
	egen ln_yeareffects_m = wtmean(ln_teachshare) if e(sample) == 1,weight(weight_c)
	egen ln_yeareffects_m2 = wtmean(ln_yeareffects) if e(sample) == 1,weight(weight_c)
	replace ln_yeareffects = ln_yeareffects + ln_yeareffects_m - ln_yeareffects_m2
	replace yeareffects2 = exp(ln_yeareffects) if income_group == `num'
	drop ln_yeareffects ln_yeareffects_m ln_yeareffects_m2
}

preserve
collapse yeareffects1 yeareffects2, by(year_10 income_group)
drop if year_10 == 2020
drop if year_10 == 1960
twoway ///
(scatter yeareffects1 year_10 if income_group == 1, mcolor(gs14) msize(medium)) ///
(scatter yeareffects1 year_10 if income_group == 2, mcolor(gs10) msize(medium)) ///
(scatter yeareffects1 year_10 if income_group == 3, mcolor(gs5)  msize(medium)) ///
(scatter yeareffects2 year_10 if income_group == 1, mcolor(gs14) msize(medium) msym(T)) ///
(scatter yeareffects2 year_10 if income_group == 2, mcolor(gs10) msize(medium) msym(T)) ///
(scatter yeareffects2 year_10 if income_group == 3, mcolor(gs5)  msize(medium) msym(T)) ///
(line yeareffects1 year_10 if income_group == 1, lcolor(gs14) lpattern(solid) lwidth(medthick)) ///
(line yeareffects1 year_10 if income_group == 2, lcolor(gs10) lpattern(solid) lwidth(medthick)) ///
(line yeareffects1 year_10 if income_group == 3, lcolor(gs5) lpattern(solid) lwidth(medthick)) ///
(line yeareffects2 year_10 if income_group == 1, lcolor(gs14) lpattern(dash_dot) lwidth(medthick)) ///
(line yeareffects2 year_10 if income_group == 2, lcolor(gs10) lpattern(dash_dot) lwidth(medthick)) ///
(line yeareffects2 year_10 if income_group == 3, lcolor(gs5) lpattern(dash_dot) lwidth(medthick)) ///
, xtitle(Year) ytitle("Relative share of Teachers") ///
title("Relative share amongst employed population") ///
legend(order (1 2 3 7 10) ///
    lab(1 "Low Income") lab(2 "Mid Income") lab(3 "High Income") ///
    lab(7 "Country FE") lab(10 "Country X Cohort")) ///
name(year_effects_hs, replace)

graph export fig9.pdf, replace
restore

//Cohrot Effects among high skill workers
foreach num in 1 2 3 {
	reghdfe ln_teachshare i.birth_year [pw = weight_c] if income_group == `num', a(country_year)
	predict ln_birtheffects if e(sample) == 1, xb
	egen ln_birtheffects_m = wtmean(ln_teachshare) if e(sample) == 1,weight(weight_c)
	egen ln_birtheffects_m2 = wtmean(ln_birtheffects) if e(sample) == 1,weight(weight_c)
	replace ln_birtheffects = ln_birtheffects + ln_birtheffects_m - ln_birtheffects_m2
	replace birtheffects1 = exp(ln_birtheffects) if income_group == `num'
	drop ln_birtheffects ln_birtheffects_m ln_birtheffects_m2
}

preserve
collapse birtheffects1, by(birth_year income_group)
rename birth_year cohorts
twoway ///
(scatter birtheffects1 cohorts if income_group == 1, mcolor(gs14) msize(medium)) ///
(scatter birtheffects1 cohorts if income_group == 2, mcolor(gs10) msize(medium)) ///
(scatter birtheffects1 cohorts if income_group == 3, mcolor(gs0)  msize(medium)) ///
(line birtheffects1 cohorts if income_group == 1, lcolor(gs14) lpattern(solid) lwidth(medthick)) ///
(line birtheffects1 cohorts if income_group == 2, lcolor(gs10) lpattern(solid) lwidth(medthick)) ///
(line birtheffects1 cohorts if income_group == 3, lcolor(gs0) lpattern(solid) lwidth(medthick)) ///
, xtitle(Year) ytitle("Relative share of teachers") ///
title("Relative share amongst employed population") ///
scheme(modern) ///
legend(order(1 2 3) lab(1 "Low Income") lab(2 "Mid Income") lab(3 "High Income")) ///
name(birth_effects2, replace)

graph export fig11.pdf, replace
restore


******************************************************************************
*Figure 3.6
******************************************************************************
cd ..
use Data_ipmus/collapsed_combined.dta,replace 
cd Results

twoway ///
(scatter yrschool_teachers l_y if yrschool_teachers != ., ///
    mcolor("223 158 155") mlabcolor("223 158 155") mlab(countrycode)) ///
(scatter yrschool_hsworkers l_y if yrschool_hsworkers != ., ///
    mcolor("153 186 223") mlabcolor("153 186 223") mlab(countrycode)) ///
(scatter yrschool_workers l_y if yrschool_workers != ., ///
    mcolor("153 154 205") mlabcolor("153 154 205") mlab(countrycode)) ///
(lfit yrschool_teachers l_y if yrschool_teachers != ., ///
    lcolor("223 158 155")) ///
(lfit yrschool_hsworkers l_y if yrschool_hsworkers != ., ///
    lcolor("153 186 223")) ///
(lfit yrschool_workers l_y if yrschool_workers != ., ///
    lcolor("153 154 205")), ///
ytitle("Years of Schooling") ///
xtitle("Log GDP p.w.") ///
legend(order(1 2 3) ///
    label(1 "Teachers") ///
    label(2 "High skilled workers") ///
    label(3 "Average workers")) ///
name(yrschool_combined, replace)
graph export "yrschool_combined.pdf", replace


******************************************************************************
*Figure 3.7
******************************************************************************
twoway ///
(scatter yrschool_teachers l_y if yrschool_teachers != ., ///
    mcolor("223 158 155") mlabcolor("223 158 155") mlab(countrycode)) ///
(scatter yrschool_hsworkers_prof l_y if yrschool_hsworkers_prof != ., ///
    mcolor("153 186 223") mlabcolor("153 186 223") mlab(countrycode)) ///
(lfit yrschool_teachers l_y if yrschool_teachers != ., ///
    lcolor("223 158 155")) ///
(lfit yrschool_hsworkers_prof l_y if yrschool_hsworkers_prof != ., ///
    lcolor("153 186 223")), ///
ytitle("Years of Schooling") ///
xtitle("Log GDP p.w.") ///
legend(order(1 2 3) ///
    label(1 "Teachers") ///
    label(2 "Professionals")) ///
name(yrschool_combined, replace)
graph export "yrschool_combined_prof.pdf", replace

******************************************************************************
*Figure 3.8
******************************************************************************
label define income_group 1 "Low" 2 "Middle" 3"High",modify
label values income_group income_group
// Average Workers
graph bar (mean) uni_workers secondary_workers primary_workers lprimary_workers, ///
    over(income_group, sort(frac) descending label(angle(stdarrow) labsize(medlarge))) ///
    stack percentages ///
    legend(order(1 "University" 2 "Secondary" 3 "Primary" 4 "Less than Primary") size(medlarge)) ///
    bar(1, color("49 130 189")) ///
    bar(2, color("107 174 214")) ///
    bar(3, color("158 202 225")) ///
    bar(4, color("198 219 239")) ///
    name(AVE_workers, replace)
graph export "AVE_workers.pdf", replace

// Teachers
graph bar (mean) uni_teachers secondary_teachers primary_teachers lprimary_teachers, ///
   over(income_group, sort(frac) descending label(angle(stdarrow) labsize(medlarge))) ///
    stack percentages ///
    bar(1, color("49 130 189")) bar(2, color("107 174 214")) bar(3, color("158 202 225")) bar(4, color("198 219 239")) ///
	legend(order(1 "University" 2 "Secondary" 3 "Primary" 4 "Less than Primary") size(medlarge)) ///
    name(TEACH_attain, replace)
graph export "TEACH_attain.pdf", replace

// High Skilled Workers
graph bar (mean) uni_hs secondary_hs primary_hs lprimary_hs, ///
    over(income_group, sort(frac) descending label(angle(stdarrow) labsize(medlarge))) ///
    stack percentages  ///
    legend(order(1 "University" 2 "Secondary" 3 "Primary" 4 "Less than Primary") size(medlarge)) ///
    bar(1, color("49 130 189")) bar(2, color("107 174 214")) bar(3, color("158 202 225")) bar(4, color("198 219 239")) ///
    name(hs_attain, replace)
graph export "hs_attain.pdf", replace


grc1leg2 TEACH_attain hs_attain AVE_workers, row(1) legendfrom(TEACH_attain) position(6) ring(0) name(edu_attain_occ, replace)

graph export "edu_attain_occ.pdf", replace


******************************************************************************
*Figure 3.9
******************************************************************************
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
    estadd local cfe "Yes"
	* Margins: difference vs LS
	margins r.occ_type, at(l_y=(6.397915(0.1)11.30453))
	
	marginsplot, ///
    title("") ///
    ytitle("Difference in predicted shares") ///
    xtitle("Log GDP p.c.") ///
    recast(connected) ///
    plot1opts(lcolor("153 186 223") mcolor("153 186 223") lwidth(medium) msymbol(circle) msize(small)) ///
    plot2opts(lcolor("223 158 155") mcolor("223 158 155") lwidth(medium) msymbol(circle) msize(small)) ///
    ci1opts(lcolor("153 186 223")) ///
    ci2opts(lcolor("223 158 155")) ///
    legend(order(1 "High skilled workers" 2 "Teachers") box)
    graph export "Additional_effect_uni.pdf", replace
	
restore


******************************************************************************
* Figure 3.10 - PIAAC POOLED
******************************************************************************

use "Data_piaac\collapsed_piaac_step.dta",replace
cd results

twoway ///
	(scatter litscore_teachers_p l_y if litscore_teachers_p != ., mlabel(countrycode) sort ///
		mcolor("223 158 155") mlabcolor("223 158 155")) ///
	(lfit litscore_teachers_p l_y, sort ///
		lcolor("223 158 155") lpattern(solid)) ///
	(scatter litscore_hs_p l_y if litscore_teachers_p != ., mlabel(countrycode) sort ///
		mcolor("153 186 223") mlabcolor("153 186 223")) ///
	(lfit litscore_hs_p l_y if litscore_teachers_p != ., sort ///
		lcolor("153 186 223") lpattern(solid)), ///
	ytitle("Standardised Score") ///
	xtitle("Log GDP") ///
	name(lit_score_p,replace) ///
	legend( ///
		label(1 "Teachers") ///
		label(3 "Other High Skill worker"))
graph export "litscore_p.pdf", replace name(lit_score_p)

******************************************************************************
* Figure 3.11 - PIAAC POOLED
******************************************************************************

twoway ///
	(scatter litscore_teachers l_y if litscore_teachers != ., mlabel(countrycode) sort ///
		mcolor("223 158 155") mlabcolor("223 158 155")) ///
	(lfit litscore_teachers l_y  if litscore_teachers !=., sort ///
		lcolor("223 158 155") lpattern(solid)) ///
	(scatter litscore_hs l_y if litscore_teachers !=., mlabel(countrycode) sort ///
		mcolor("153 186 223") mlabcolor("153 186 223")) ///
	(lfit litscore_hs l_y if litscore_teachers !=., sort ///
		lcolor("153 186 223") lpattern(solid)) ///
	(scatter litscore_ls l_y if litscore_teachers !=., mlabel(countrycode) sort ///
		mcolor("119 179 153") mlabcolor("119 179 153")) ///
	(lfit litscore_ls l_y if litscore_teachers !=., sort ///
		lcolor("119 179 153") lpattern(solid)), ///
	ytitle("Standardised Score") ///
	xtitle("Log GDP") ///
	name(lit_score,replace) ///
	legend( ///
		label(1 "Teachers") ///
		label(3 "Other High Skill worker") ///
		label(5 "Low Skill workers"))
graph export "litscore.pdf", replace name(lit_score)
		

******************************************************************************
* Figure 3.12 - PIAAC -additionascores - combined
******************************************************************************
cd ..
use "Data_piaac\piaac_step_combined.dta",replace

replace country_str = lower(country_str)
merge m:1 country_str year using "pwt_gdp.dta"
cd results

drop if _m == 2		
		
gen age2 = age^2

reg score_lit c.l_y##ib1.occupation age age2 i.female [pw = perwt] if employed == 1, vce(robust)
est store t3
lincom 3.occupation - 2.occupation
lincom c.l_y#2.occupation + l_y
lincom c.l_y#3.occupation + l_y
lincom c.l_y#3.occupation - c.l_y#2.occupation

sum l_y

margins r.occupation, at(l_y=(8.023336(0.1)11.45795))
	
marginsplot, ///
    title("") ///
    ytitle("Difference in litearcy test scores") ///
    xtitle("Log GDP p.c.") ///
    recast(connected) ///
    plot1opts(lcolor("153 186 223") mcolor("153 186 223") lwidth(medium) msymbol(circle) msize(small)) ///
    plot2opts(lcolor("223 158 155") mcolor("223 158 155") lwidth(medium) msymbol(circle) msize(small)) ///
    ci1opts(lcolor("153 186 223")) ///
    ci2opts(lcolor("223 158 155")) ///
    legend(order(1 "High skilled workers" 2 "Teachers") box size(medsmall))
    graph export "Additional_effect_litscore1.pdf", replace 
		
reg score_lit c.l_y##ib1.occupation age age2 i.female i.edu [pw = perwt] if employed == 1, vce(robust)
est store t4
lincom 3.occupation - 2.occupation
lincom c.l_y#2.occupation + l_y
lincom c.l_y#3.occupation + l_y
lincom c.l_y#3.occupation - c.l_y#2.occupation


	margins r.occupation, at(l_y=(8.023336(0.1)11.45795))
	
	marginsplot, ///
    title("") ///
    ytitle("Difference in litearcy test scores") ///
    xtitle("Log GDP p.c.") ///
    recast(connected) ///
    plot1opts(lcolor("153 186 223") mcolor("153 186 223") lwidth(medium) msymbol(circle) msize(small)) ///
    plot2opts(lcolor("223 158 155") mcolor("223 158 155") lwidth(medium) msymbol(circle) msize(small)) ///
    ci1opts(lcolor("153 186 223")) ///
    ci2opts(lcolor("223 158 155")) ///
    legend(order(1 "High skilled workers" 2 "Teachers") box size(medsmall))
    graph export "Additional_effect_litscore2.pdf", replace 


******************************************************************************
* Figure 3.13 - PIAAC -additionascores -teachers
******************************************************************************
reg score_lit c.l_y##i.teachers i.female age age2 [pw = perwt] if employed == 1, vce(robust)
margins r.teachers, at(l_y=(8.023336(0.1)11.45795))
	
	marginsplot, ///
    title("") ///
    ytitle("Difference in litearcy test scores") ///
    xtitle("Log GDP p.c.") ///
    recast(connected) ///
    plot1opts(lcolor("223 158 155") mcolor("223 158 155") lwidth(medium) msymbol(circle) msize(small)) ///
    ci1opts(lcolor("223 158 155")) ///
    legend(order(1 "Teachers") box)
    graph export "Additional_effect_litscore_teach1.pdf", replace 
	
reg score_lit c.l_y##i.teachers i.female age age2 i.edu [pw = perwt] if employed == 1, vce(robust)
margins r.teachers, at(l_y=(8.023336(0.1)11.45795))
	
	marginsplot, ///
    title("") ///
    ytitle("Difference in litearcy test scores") ///
    xtitle("Log GDP p.c.") ///
    recast(connected) ///
    plot1opts(lcolor("223 158 155") mcolor("223 158 155") lwidth(medium) msymbol(circle) msize(small)) ///
    ci1opts(lcolor("223 158 155")) ///
    legend(order(1 "Teachers") box)
    graph export "Additional_effect_litscore_teach2.pdf", replace 

******************************************************************************
* Figure 3.13 - PIAAC -additionascores -hs
******************************************************************************
gen hs = 0 if occupation != .
replace hs =1 if occupation ==2	

reg score_lit c.l_y##i.hs i.female age age2 [pw = perwt] if employed == 1, vce(robust)
margins r.hs, at(l_y=(8.023336(0.1)11.45795))
	
	marginsplot, ///
    title("") ///
    ytitle("Difference in litearcy test scores") ///
    xtitle("Log GDP p.c.") ///
    recast(connected) ///
    plot1opts(lcolor("153 186 223") mcolor("153 186 223") lwidth(medium) msymbol(circle) msize(small)) ///
    ci1opts(lcolor("153 186 223")) ///
    legend(order(1 "Other high-skilled") box)
    graph export "Additional_effect_litscore_hs1.pdf", replace 
	
reg score_lit c.l_y##i.hs i.female age age2 i.edu [pw = perwt] if employed == 1, vce(robust)
margins r.hs, at(l_y=(8.023336(0.1)11.45795))
	
	marginsplot, ///
    title("") ///
    ytitle("Difference in litearcy test scores") ///
    xtitle("Log GDP p.c.") ///
    recast(connected) ///
    plot1opts(lcolor("153 186 223") mcolor("153 186 223") lwidth(medium) msymbol(circle) msize(small)) ///
    ci1opts(lcolor("153 186 223")) ///
    legend(order(1 "Other high-skilled") box)
    graph export "Additional_effect_litscore_hs2.pdf", replace 	

******************************************************************************
* Figure 3.14 
******************************************************************************
cd ..
use Data_ipmus/collapsed_combined.dta,replace
cd Results

twoway ///
(rcap wp_teach_ub wp_teach_lb l_y if wp_teach_est != ., lcolor("223 158 155")) ///
(rcap wp_hs_ub wp_hs_lb l_y if wp_hs_est != ., lcolor("153 186 223")) ///
(scatter wp_teach_est l_y if wp_teach_est != ., mcolor("223 158 155") mlabcolor("223 158 155") mlab(countrycode)) ///
(scatter wp_hs_est l_y if wp_hs_est != ., mcolor("153 186 223") mlabcolor("153 186 223") mlab(countrycode)) ///
(lfit wp_teach_est l_y if wp_teach_est != ., lcolor("223 158 155")) ///
(lfit wp_hs_est l_y if wp_hs_est != ., lcolor("153 186 223")), ///
ytitle("Wage premia") ///
xtitle("Log GDP p.c.") ///
legend(order(3 1 4 2) ///
       label(1 "95% CI for teachers") ///
       label(2 "95% CI for high skilled workers") ///
       label(3 "Teachers") ///
       label(4 "High Skilled workers") ///
       size(medsmall) cols(2)) ///
name(wp_gdp_graph, replace)

// Export to PDF
graph export "wp_gdp_graph.pdf", replace name(wp_gdp_graph)


twoway ///
(rcap wp_teach_edu_ub wp_teach_edu_lb l_y if wp_teach_edu_est != ., lcolor("223 158 155")) ///
(rcap wp_hs_edu_ub wp_hs_edu_lb l_y if wp_hs_edu_est != ., lcolor("153 186 223")) ///
(scatter wp_teach_edu_est l_y if wp_teach_edu_est != ., mcolor("223 158 155") mlabcolor("223 158 155") mlab(countrycode)) ///
(scatter wp_hs_edu_est l_y if wp_hs_edu_est != ., mcolor("153 186 223") mlabcolor("153 186 223") mlab(countrycode)) ///
(lfit wp_teach_edu_est l_y if wp_teach_edu_est != ., lcolor("223 158 155")) ///
(lfit wp_hs_edu_est l_y if wp_hs_edu_est != ., lcolor("153 186 223")), ///
ytitle("Wage premia") ///
xtitle("Log GDP p.c.") ///
legend(order(3 1 4 2) ///
       label(1 "95% CI for teachers") ///
       label(2 "95% CI for high skilled workers") ///
       label(3 "Teachers") ///
       label(4 "High Skilled workers") ///
       size(medsmall) cols(2)) ///
name(wp_edu_gdp_graph, replace)

// Export to PDF
graph export "wp_edu_gdp_graph.pdf", replace name(wp_edu_gdp_graph)



******************************************************************************
* Figure 3.15 - robust
******************************************************************************
twoway ///
(rcap wp_teach_ub wp_teach_lb l_y if wp_teach_est != ., lcolor("223 158 155")) ///
(rcap wp_hs_ub wp_hs_lb l_y if wp_hs_est != ., lcolor("153 186 223")) ///
(scatter wp_teach_est l_y if wp_teach_est != ., mcolor("223 158 155") mlabcolor("223 158 155") mlab(countrycode)) ///
(scatter wp_hs_est l_y if wp_hs_est != ., mcolor("153 186 223") mlabcolor("153 186 223") mlab(countrycode)) ///
(lfit wp_teach_est l_y if wp_teach_est != ., lcolor("223 158 155")) ///
(lfit wp_hs_est l_y if wp_hs_est != ., lcolor("153 186 223")), ///
ytitle("Wage premia") ///
xtitle("Log GDP p.c.") ///
legend(order(3 1 4 2) ///
       label(1 "95% CI for teachers") ///
       label(2 "95% CI for high skilled workers") ///
       label(3 "Teachers") ///
       label(4 "High Skilled workers") ///
       size(medsmall) cols(2)) ///
name(wp_gdp_graph, replace)

// Export to PDF
graph export "wp_gdp_graph_r.pdf", replace name(wp_gdp_graph)


twoway ///
(rcap wp_teach_edu_ub wp_teach_edu_lb l_y if wp_teach_edu_est != ., lcolor("223 158 155")) ///
(rcap wp_hs_edu_ub wp_hs_edu_lb l_y if wp_hs_edu_est != ., lcolor("153 186 223")) ///
(scatter wp_teach_edu_est l_y if wp_teach_edu_est != ., mcolor("223 158 155") mlabcolor("223 158 155") mlab(countrycode)) ///
(scatter wp_hs_edu_est l_y if wp_hs_edu_est != ., mcolor("153 186 223") mlabcolor("153 186 223") mlab(countrycode)) ///
(lfit wp_teach_edu_est l_y if wp_teach_edu_est != ., lcolor("223 158 155")) ///
(lfit wp_hs_edu_est l_y if wp_hs_edu_est != ., lcolor("153 186 223")), ///
ytitle("Wage premia") ///
xtitle("Log GDP p.c.") ///
legend(order(3 1 4 2) ///
       label(1 "95% CI for teachers") ///
       label(2 "95% CI for high skilled workers") ///
       label(3 "Teachers") ///
       label(4 "High Skilled workers") ///
       size(medsmall) cols(2)) ///
name(wp_edu_gdp_graph, replace)

// Export to PDF
graph export "wp_edu_gdp_graph_r.pdf", replace name(wp_edu_gdp_graph)


******************************************************************************
* Figure 3.16- robust
******************************************************************************
twoway ///
(rcap wp_uni_teach_ub wp_uni_teach_lb l_y if wp_uni_teach_est != ., lcolor("223 158 155")) ///
(rcap wp_uni_hs_ub wp_uni_hs_lb l_y if wp_uni_hs_est != ., lcolor("153 186 223")) ///
(scatter wp_uni_teach_est l_y if wp_uni_teach_est != ., mcolor("223 158 155") mlabcolor("223 158 155") mlab(countrycode)) ///
(scatter wp_uni_hs_est l_y if wp_uni_hs_est != ., mcolor("153 186 223") mlabcolor("153 186 223") mlab(countrycode)) ///
(lfit wp_uni_teach_est l_y if wp_uni_teach_est != ., lcolor("223 158 155")) ///
(lfit wp_uni_hs_est l_y if wp_uni_hs_est != ., lcolor("153 186 223")), ///
ytitle("Wage premia average workers") ///
xtitle("Log GDP p.w.") ///
legend(order(3 1 4 2) label(1 "95% CI for teachers") label(2 "95% CI for high skilled workers") label(3 "Teachers") label(4 "High Skilled workers")) ///
name(wp_gdp_graph_uni, replace)
// Export to PDF
graph export "wp_gdp_graph_uni_r.pdf", replace 


******************************************************************************
* Figure 3.17 - robust
******************************************************************************
twoway ///
(rcap malewp_uni_teach_ub malewp_uni_teach_lb l_y if malewp_uni_teach_est != ., lcolor("223 158 155")) ///
(rcap malewp_uni_hs_ub malewp_uni_hs_lb l_y if malewp_uni_hs_est != ., lcolor("153 186 223")) ///
(scatter malewp_uni_teach_est l_y if malewp_uni_teach_est != ., mcolor("223 158 155") mlabcolor("223 158 155") mlab(countrycode)) ///
(scatter malewp_uni_hs_est l_y if malewp_uni_hs_est != ., mcolor("153 186 223") mlabcolor("153 186 223") mlab(countrycode)) ///
(lfit malewp_uni_teach_est l_y if malewp_uni_teach_est != ., lcolor("223 158 155")) ///
(lfit malewp_uni_hs_est l_y if malewp_uni_hs_est != ., lcolor("153 186 223")), ///
ytitle("Wage premia average workers") ///
xtitle("Log GDP p.w.") ///
subtitle("Male") ///
legend(order(3 1 4 2) label(1 "95% CI for teachers") label(2 "95% CI for high skilled workers") label(3 "Teachers") label(4 "High Skilled workers") size(medsmall)) ///
name(wp_gdp_graph_m_uni, replace)
graph export "wp_gdp_graph_uni_m.pdf", replace 

twoway ///
(rcap femalewp_uni_teach_ub femalewp_uni_teach_lb l_y if femalewp_uni_teach_est != ., lcolor("223 158 155")) ///
(rcap femalewp_uni_hs_ub femalewp_uni_hs_lb l_y if femalewp_uni_hs_est != ., lcolor("153 186 223")) ///
(scatter femalewp_uni_teach_est l_y if femalewp_uni_teach_est != ., mcolor("223 158 155") mlabcolor("223 158 155") mlab(countrycode)) ///
(scatter femalewp_uni_hs_est l_y if femalewp_uni_hs_est != ., mcolor("153 186 223") mlabcolor("153 186 223") mlab(countrycode)) ///
(lfit femalewp_uni_teach_est l_y if femalewp_uni_teach_est != ., lcolor("223 158 155")) ///
(lfit femalewp_uni_hs_est l_y if femalewp_uni_hs_est != ., lcolor("153 186 223")), ///
ytitle("Wage premia average workers") ///
xtitle("Log GDP p.w.") ///
subtitle("Female") ///
legend(order(3 1 4 2) label(1 "95% CI for teachers") label(2 "95% CI for high skilled workers") label(3 "Teachers") label(4 "High Skilled workers") size(medsmall))  ///
name(wp_gdp_graph_f_uni, replace)
graph export "wp_gdp_graph_uni_f.pdf", replace  

grc1leg2 wp_gdp_graph_m_uni wp_gdp_graph_f_uni, ///
    legendfrom(wp_gdp_graph_f_uni) ///
	ycommon ///
    name(wp_combined_graph_gender, replace)
// Export combined graph to PDF
graph export "wp_combined_graph_gender_uni_r.pdf", replace name(wp_combined_graph_gender)




******************************************************************************
* Figure 3.18
************************************************************************

twoway ///
    (rcap teach_yrschool_ub teach_yrschool_lb l_y if teach_yrschool_est != ., lcolor("223 158 155")) ///
    (scatter teach_yrschool_est l_y if teach_yrschool_est != ., mcolor("223 158 155") mlabcolor("223 158 155") mlab(countrycode)) ///
    (rcap high_yrschool_ub high_yrschool_lb l_y if high_yrschool_est != ., lcolor("153 186 223")) ///
    (scatter high_yrschool_est l_y if high_yrschool_est != ., mcolor("153 186 223") mlabcolor("153 186 223") mlab(countrycode)), ///
    ytitle("Returns to Schooling") ///
    xtitle("Log GDP p.w.") ///
    legend(order(2 1 4 3) ///
           label(2 "Teachers") ///
           label(1 "Teacher CIs") ///
           label(4 "High-skilled workers") ///
           label(3 "High-skilled CIs") cols(2)) ///
    name(rts_teacher_highskill_graph, replace)
graph export "rts_teacher_highskill_graph.pdf", replace
	
	
	twoway ///
    (rcap teach_yrschool_ub teach_yrschool_lb l_y if teach_yrschool_est != ., lcolor("223 158 155")) ///
    (scatter teach_yrschool_est l_y if teach_yrschool_est != ., mcolor("223 158 155") mlabcolor("223 158 155") mlab(countrycode)) ///
    (rcap low_yrschool_ub low_yrschool_lb l_y if low_yrschool_est != ., lcolor("160 160 160")) ///
    (scatter low_yrschool_est l_y if low_yrschool_est != ., mcolor("160 160 160") mlabcolor("160 160 160") mlab(countrycode)), ///
    ytitle("Returns to Schooling") ///
    xtitle("Log GDP p.w.") ///
    legend(order(2 1 4 3) ///
           label(2 "Teachers") ///
           label(1 "Teacher CIs") ///
           label(4 "Low-skilled workers") ///
           label(3 "Low-skilled CIs") cols(2)) ///
    name(rts_teacher_lowskill_graph, replace)
graph export "rts_teacher_lowskill_graph.pdf", replace

******************************************************************************
* Figure 3.19 - robust
************************************************************************

twoway ///
    (rcap teach_yrschool_ub teach_yrschool_lb l_y if teach_yrschool_est != ., lcolor("223 158 155")) ///
    (scatter teach_yrschool_est l_y if teach_yrschool_est != ., mcolor("223 158 155") mlabcolor("223 158 155") mlab(countrycode)) ///
    (rcap high_yrschool_ub high_yrschool_lb l_y if high_yrschool_est != ., lcolor("153 186 223")) ///
    (scatter high_yrschool_est l_y if high_yrschool_est != ., mcolor("153 186 223") mlabcolor("153 186 223") mlab(countrycode)), ///
    ytitle("Returns to Schooling") ///
    xtitle("Log GDP p.w.") ///
    legend(order(2 1 4 3) ///
           label(2 "Teachers") ///
           label(1 "Teacher CIs") ///
           label(4 "High-skilled workers") ///
           label(3 "High-skilled CIs") cols(2)) ///
    name(rts_teacher_highskill_graph, replace)
graph export "rts_teacher_highskill_graph_r.pdf", replace
	
	
	twoway ///
    (rcap teach_yrschool_ub teach_yrschool_lb l_y if teach_yrschool_est != ., lcolor("223 158 155")) ///
    (scatter teach_yrschool_est l_y if teach_yrschool_est != ., mcolor("223 158 155") mlabcolor("223 158 155") mlab(countrycode)) ///
    (rcap low_yrschool_ub low_yrschool_lb l_y if low_yrschool_est != ., lcolor("160 160 160")) ///
    (scatter low_yrschool_est l_y if low_yrschool_est != ., mcolor("160 160 160") mlabcolor("160 160 160") mlab(countrycode)), ///
    ytitle("Returns to Schooling") ///
    xtitle("Log GDP p.w.") ///
    legend(order(2 1 4 3) ///
           label(2 "Teachers") ///
           label(1 "Teacher CIs") ///
           label(4 "Low-skilled workers") ///
           label(3 "Low-skilled CIs") cols(2)) ///
    name(rts_teacher_lowskill_graph, replace)
graph export "rts_teacher_lowskill_graph_r.pdf", replace

















