********************************************************************************
* Cleaning STEP data for comparability with PIAAC  & IPMUS data
********************************************************************************
*** Processing imported PIAAC data


cd ../..


use "Data_piaac\piaac_improted_1.dta", replace
quietly do "Do\piaac_step_data_processing\piaac_cleaning.do"
save "Data_piaac\piacc_processed_w1.dta", replace


use "Data_piaac\STEP\raw_data\STEP Bolivia_working.dta", replace
*** Processing imported STEP data
foreach country in Bolivia Colombia Georgia Ghana Kenya Macedonia Ukraine Vietnam Armenia {
    use "Data_piaac\STEP\raw_data\STEP `country'_working.dta", replace
    qui do "Do\piaac_step_data_processing\step_cleaning.do"
    save "Data_piaac\STEP\raw_data\STEP `country'_processed.dta", replace
}

use "Data_piaac\STEP\raw_data\STEP Bolivia_processed.dta",replace
foreach country in Colombia Georgia Ghana Kenya Macedonia Ukraine Vietnam Armenia {
    append using "Data_piaac\STEP\raw_data\STEP `country'_processed.dta", force
}
save "Data_piaac\STEP\STEP_processed.dta", replace

*** Combing STEP and PIAAC & Adding the year of observation for future comparison
append using "Data_piaac\piacc_processed_w1.dta"
gen year = .

rename country country_str
encode country_str, gen(country_id)

replace year = 2012 if country_str == "Australia" | country_str == "Austria" | country_str == "Belgium" | country_str == "Canada" | country_str == "Czechia" | country_str == "Denmark" | country_str == "Estonia" | country_str == "Finland" | country_str == "France" | country_str == "Germany" | country_str == "Ireland" | country_str == "Italy" | country_str == "Japan" | country_str == "Korea" | country_str == "Netherlands" | country_str == "Norway" | country_str == "Poland" | country_str == "Russian Federation" | country_str == "Slovak Republic" | country_str == "Spain" | country_str == "Sweden" | country_str == "United Kingdom" | country_str == "United States" | country_str == "Bolivia" | country_str == "Colombia" | country_str == "Ukraine" | country_str == "Vietnam"

replace year = 2013 if country_str == "Georgia" | country_str == "Ghana" | country_str == "Kenya" | country_str == "Macedonia" | country_str == "Armenia"

replace year = 2014 if country_str == "Chile" | country_str == "Greece" | country_str == "Indonesia" | country_str == "Israel" | country_str == "Lithuania" | country_str == "New Zealand" | country_str == "Singapore" | country_str == "Slovenia" | country_str == "Türkiye"

replace year = 2017 if country_str == "Ecuador" | country_str == "Hungary" | country_str == "Kazakhstan" | country_str == "Mexico" | country_str == "Peru"

gen score_lit_p=.
gen score_num_p=.
gen score_psl_p =.

foreach s in num lit psl{
	sum pv`s'1 [aw=perwt], det 
	gen mean_pv`s'1 = r(mean)
	gen var_pv`s'1 = r(Var)
	gen sd_pv`s'1= sqrt(var_pv`s'1)
	replace score_`s'_p= (pv`s'1 - mean_pv`s'1)/sd_pv`s'1
	}
	drop mean_* var_* sd_*
	
gen birth_year = round(year - age) 


save "Data_piaac\piaac_step_combined.dta",replace


********************************************************************************
* Collapsing the PIAAC data for representations on graph
********************************************************************************
use "Data_piaac\piaac_step_combined.dta", clear
do "Do\piaac_step_data_processing\collapsed_step_piaac.do"
do "Do\piaac_step_data_processing\collapsed_step_piaac_merge.do"
save "Data_piaac\collapsed_piaac_step.dta",replace

