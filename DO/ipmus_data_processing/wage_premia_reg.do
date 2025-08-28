********************************************************************************
* READ ME
********************************************************************************
* This do file estimates wage gaps and labor supply for a given country, using
* all other available cross-sections in 1990-2010.


*******************************************************************************
*[1] Sample restrictions & generating teacher identifiers
******************************************************************************
keep empstat wage_worker self_employed ln_wages_h occ_type age sex edattain year_school year perwt teacher_status
keep if empstat==1
gen l_wage = ln_wages_h
gen sample_reg=1 if wage_worker==1 & l_wage!=.
gen sample_reg_self=1 if ( wage_worker==1 | self_employed==1)

local cname "$thiscountry"

**** Generating three occupation groups
gen occupation = occ_type

**** Other regression variables
gen age_sq = age^2

*******************************************************************************
*[2] Running regressions to estimate wage differentials
*******************************************************************************
*regressions to get an estiamte of normalized wages

levelsof year if sample_reg == 1 & missing(occupation) == 0 & teacher_status != ., local(years)

foreach y of local years {
    di "Processing year `y'"

	di "running baseline regression"
    * 1. Baseline regression 
    regress l_wage ib1.occupation ib1.sex age age_sq if sample_reg == 1 & year == `y' [pw = perwt], robust
	est store bs_`cname'_`y'
	estadd local education "No"
	estadd local year "`y'"
	
	di "running baseline regression controlling education"
    * 2. Baseline regression controlling for education
    regress l_wage ib1.occupation ib1.sex age age_sq ib3.edattain if sample_reg == 1 & year == `y' [pw = perwt], robust
	est store bs2_`cname'_`y'
	estadd local education "Yes"
	estadd local year "`y'"

	
	di "estimating wage premia by gender"
	 * 4. Wage premia  by gender
	 regress l_wage ib1.occupation##i.sex i.sex##c.age i.sex##c.age_sq if sample_reg == 1 & year == `y' [pw = perwt], robust
	 est store gender_`cname'_`y'
	 estadd local  education "No"
	 estadd local year "`y'"
	 
	 regress l_wage ib1.occupation##i.sex i.sex##c.age i.sex##c.age_sq i.sex##ib3.edattain if sample_reg == 1 & year == `y' [pw = perwt], robust
	 est store gender2_`cname'_`y'
	 estadd local  education "Yes"
	 estadd local year "`y'"
	 
	 di "Estimating returns to schooling"
	* 3. estimating returns to schooling
	regress l_wage year_school ib1.sex age age_sq [pw = perwt] if sample_reg == 1 & occupation == 1 & year == `y', robust
	est store low_`cname'_`y'
	 estadd local  education "Yes"
	 estadd local year "`y'"
	
	regress l_wage year_school ib1.sex age age_sq [pw = perwt] if sample_reg == 1 & occupation == 2 & year == `y', robust
	est store high_`cname'_`y'
	 estadd local  education "Yes"
	 estadd local year "`y'"
	
	regress l_wage year_school ib1.sex age age_sq [pw = perwt] if sample_reg == 1 & occupation == 3 & year == `y', robust
	est store teach_`cname'_`y'
	 estadd local  education "Yes"
	 estadd local year "`y'"
	 
	 regress l_wage year_school age age_sq [pw = perwt] if sample_reg == 1 & occupation == 1 & year == `y' & sex == 1, robust
	est store low_`cname'_`y'_m
	 estadd local  education "Yes"
	 estadd local year "`y'"
	
	regress l_wage year_school age age_sq [pw = perwt] if sample_reg == 1 & occupation == 2 & year == `y' & sex == 1, robust
	est store high_`cname'_`y'_m
	 estadd local  education "Yes"
	 estadd local year "`y'"
	
	regress l_wage year_school  age age_sq [pw = perwt] if sample_reg == 1 & occupation == 3 & year == `y' & sex == 1, robust
	est store teach_`cname'_`y'_m
	 estadd local  education "Yes"
	 estadd local year "`y'"
	 
	  regress l_wage year_school age age_sq [pw = perwt] if sample_reg == 1 & occupation == 1 & year == `y' & sex == 2, robust
	est store low_`cname'_`y'_f
	 estadd local  education "Yes"
	 estadd local year "`y'"
	
	regress l_wage year_school age age_sq [pw = perwt] if sample_reg == 1 & occupation == 2 & year == `y' & sex == 2, robust
	est store high_`cname'_`y'_f
	 estadd local  education "Yes"
	 estadd local year "`y'"
	
	regress l_wage year_school  age age_sq [pw = perwt] if sample_reg == 1 & occupation == 3 & year == `y' & sex == 2, robust
	est store teach_`cname'_`y'_f
	 estadd local  education "Yes"
	 estadd local year "`y'"
    }
	
	

