********************************************************************************
* READ ME
********************************************************************************
* This do file estimates wage gaps and labor supply for a given country, using
* all other available cross-sections in 1990-2010.

*******************************************************************************
*[1] Sample restrictions & generating teacher identifiers
******************************************************************************
keep if empstat==1
gen l_wage = ln_wages_h
gen sample_reg=1 if wage_worker==1 & l_wage!=.
gen sample_reg_self=1 if ( wage_worker==1 | self_employed==1)

local cname "$thiscountry"

**** Generating three occupation groups
gen occupation = occ_type

**** Other regression variables
gen age_sq = age^2

**** Memory management
keep sample_reg l_wage occupation edattain sex age age_sq perwt country country_str year teacher_status edattain_mom edattain_pop
*******************************************************************************
*[2] Running regressions to estimate wage differentials
*******************************************************************************
*regressions to get an estiamte of normalized wages

levelsof year if sample_reg == 1 & missing(occupation) == 0 & teacher_status != . & edattain_mom!=., local(years)

foreach y of local years {
    di "Processing year `y'"
	di "running wp by university"
    * 1. Wage premia for university grads - Baseline regression 
	regress l_wage ib1.occupation##ib3.edattain ib1.sex age age_sq ib3.edattain_mom ib3.edattain_pop if sample_reg == 1 & year == `y' [pw = perwt], robust
	est store uni_`cname'_`y'
	estadd local education "No"
	estadd local year "`y'"
	
	* 2. Wage premia for university grads - By gender
	regress l_wage ib1.occupation##ib1.sex##ib3.edattain age age_sq ib3.edattain_mom ib3.edattain_pop if sample_reg == 1 & year == `y' [pw = perwt], robust
	est store uni_`cname'_`y'_gender
	estadd local education "No"
	estadd local year "`y'"
}




