********************************************************************************
* READ ME
********************************************************************************
* This do file is going to estimate wage differentilals for the IPMUS international
* sample. This has to be completed after IPMUS files have been imported, and after
* it is processed using DO file "ipumsint_cleaning.do".

cd ../..
clear all

********************************************************************************
*[1] Estimating Wage premia for teachers
********************************************************************************
*Country level regressions
foreach country in brazil indonesia canada dr mauritius tt mexico panama sa uruguay us venezuela israel jamaica {
    global thiscountry `country' 
    use "Data_ipmus/`country'/`country'.dta", clear
    do "DO/wage_premia_reg.do" // This file runs the regressions and save results in memory
	do "DO/wage_premia_result.do" // These files runs access the stored result and write into a dataset
    estimates drop _all 
}

use "Data_ipmus/temp/lincom_results_brazil_teachers.dta", replace
foreach country in brazil canada dr mauritius tt mexico panama sa uruguay us venezuela israel {
	append using "Data_ipmus/temp/lincom_results_`country'_teachers.dta"
}
save "Data_ipmus/lincom_results_combined.dta",replace

replace country_str2 = "dominican republic" if country_str2 == "dr"
replace country_str2 = "south africa" if country_str2 == "sa"
replace country_str2 = "united states" if country_str2 == "us"
replace country_str2 = "trinidad and tobago" if country_str2 == "tt"
replace country_str2 = "mauritius" if country_str2 == "mauritus"

rename country_str2 country_str	
duplicates drop

save "Data_ipmus/lincom_results_combined.dta",replace

*** Restricting to university returns and premia

foreach country in brazil indonesia canada dr mauritius tt mexico panama sa uruguay us venezuela israel jamaica {
    global thiscountry `country' 
    use "Data_ipmus/`country'/`country'.dta", clear
    do "DO/degree_premia_reg.do" // This file runs the regressions and save results in memory
	do "DO/degree_premia_result.do" // These files runs access the stored result and write into a dataset
    estimates drop _all 
}

use "Data_ipmus/temp/lincom_uni_brazil_teachers.dta", replace
foreach country in brazil canada dr mauritius tt mexico panama sa uruguay us venezuela israel {
	append using "Data_ipmus/temp/lincom_uni_`country'_teachers.dta"
}
save "Data_ipmus/lincom_uni_combined.dta",replace

replace country_str2 = "dominican republic" if country_str2 == "dr"
replace country_str2 = "south africa" if country_str2 == "sa"
replace country_str2 = "united states" if country_str2 == "us"
replace country_str2 = "trinidad and tobago" if country_str2 == "tt"
replace country_str2 = "mauritius" if country_str2 == "mauritus"

rename country_str2 country_str	
duplicates drop

save "Data_ipmus/lincom_uni_combined.dta",replace

*******************************************************************************
*[2] Generating education and other variables for teachers and average worker 
*******************************************************************************
* Cohorts

foreach country in argentina armenia austria brazil belarus benin bf bolivia botswana cambodia cameroon canada chile china coloumbia cr cuba dr ecuador egypt es ethiopia fiji finland france ghana greece guatemala guinea haiti honduras hungary indonesia iran ireland israel italy jamaica jordan kenya kyrgyzstan laos lesotho liberia malawi malaysia mali mauritius mexico mongolia morocco mozambique nepal nicaragua pakistan panama papau paraguay peru philippines poland portugal Romania Rwanda sa sengal sl slovakia slovenia spain suriname switzerland tanzania thailand tt turkey uganda uruguay us venezuela vietnam zambia {
	use  "Data_ipmus/`country'/`country'.dta" ,replace
    quietly do  "DO/collapsed_impus_cohort_var.do"
	do  "DO/collapsed_impus_cohort_merge.do"
	save "Data_ipmus/temp/`country'_edu_cohort_collapsed.dta", replace	
}

use "Data_ipmus/temp/brazil_edu_cohort_collapsed.dta", replace
foreach country in  argentina armenia austria belarus benin bf bolivia botswana cambodia cameroon canada chile china coloumbia cr cuba dr ecuador egypt es ethiopia fiji finland france ghana greece guatemala guinea haiti honduras hungary indonesia iran ireland israel italy jamaica jordan kenya kyrgyzstan laos lesotho liberia malawi malaysia mali mauritius mexico mongolia morocco mozambique nepal nicaragua pakistan panama papau paraguay peru philippines poland portugal Romania Rwanda sa sengal sl slovakia slovenia spain suriname switzerland tanzania thailand tt turkey uganda uruguay us venezuela vietnam zambia {
    append using "Data_ipmus/temp/`country'_edu_cohort_collapsed.dta"
	save "Data_ipmus/temp/combined_edu_cohort_collapsed.dta",replace
}
save "Data_ipmus/collapsed_combined_cohort.dta",replace

* Saving a set of countries which we observe for multiple crosssection.
use Data_ipmus/collapsed_combined_cohort.dta,replace
gen year_10 = floor(year/10)*10
keep country income_group year_10
duplicates drop income_group country year_10,force
bys country: gen count = _N
drop if count <4
gen baseline_country = 1
collapse (mean) baseline_country, by(country)
save "Data_ipmus\baseline_country.dta"

 
*Cross Sections

foreach country in argentina armenia austria brazil belarus benin bf bolivia botswana cambodia cameroon canada chile china coloumbia cr cuba dr ecuador egypt es ethiopia fiji finland france ghana greece guatemala guinea haiti honduras hungary indonesia iran ireland israel italy jamaica jordan kenya kyrgyzstan laos lesotho liberia malawi malaysia mali mauritius mexico mongolia morocco mozambique nepal nicaragua pakistan panama papau paraguay peru philippines poland portugal Romania Rwanda sa sengal sl slovakia slovenia spain suriname switzerland tanzania thailand tt turkey uganda uruguay us venezuela vietnam zambia {
	use  "Data_ipmus/`country'/`country'.dta" ,replace
    qui do  "DO/collapsed_impus_var.do"
	qui do  "DO/collapsed_impus_merge.do"
	save "Data_ipmus/temp/`country'_edu_collapsed.dta", replace	
}

use "Data_ipmus/temp/brazil_edu_collapsed.dta", replace
foreach country in  argentina armenia austria belarus benin bf bolivia botswana cambodia cameroon canada chile china coloumbia cr cuba dr ecuador egypt es ethiopia fiji finland france ghana greece guatemala guinea haiti honduras hungary indonesia iran ireland israel italy jamaica jordan kenya kyrgyzstan laos lesotho liberia malawi malaysia mali mauritius mexico mongolia morocco mozambique nepal nicaragua pakistan panama papau paraguay peru philippines poland portugal Romania Rwanda sa sengal sl slovakia slovenia spain suriname switzerland tanzania thailand tt turkey uganda uruguay us venezuela vietnam zambia {
    append using "Data_ipmus/temp/`country'_edu_collapsed.dta"
	save "Data_ipmus/temp/combined_edu_collapsed.dta",replace
}

use "Data_ipmus/temp/combined_edu_collapsed.dta", replace
merge 1:1  country_str year using "Data_ipmus/lincom_results_combined.dta"
drop _m
merge 1:1  country_str year using "Data_ipmus/lincom_uni_combined.dta"
label define country_lbl 703 "Slovakia", add
drop _m
foreach var in teacher_share_uni_f hs_share_uni_f ls_share_uni_f ///
    teacher_share_uni_m hs_share_uni_m ls_share_uni_m ///
    teacher_share teacher_share_he teacher_share_sec teacher_share_pri ///
    teacher_share_hs teacher_share_uni hs_share_uni ls_share_uni ///
    teachers_male_share teachers_female_share hs_prof_share hs_other_share ///
    teacher_share_prisec teacher_share_secter teacher_share_unspec ///
    primary_share secondary_share he_share prisec_share secter_share ///
    unspec_share hs_share hs_share_f hs_share_m ls_share_f ls_share_m ///
    male_share_teachers male_share_hs male_share_ls ///
    female_share_teachers female_share_hs female_share_ls ///
    ls_share maleteacher_share_uni femaleteacher_share_uni ///
    maleteacher_share_hs femaleteacher_share_hs {

    replace `var' = . if `var' == 0
}


save "Data_ipmus/collapsed_combined.dta",replace


********************************************************************************
* Robustness Testing - indlueing parental education in wage regressions
********************************************************************************
foreach country in brazil indonesia canada dr mauritius tt mexico panama sa uruguay us venezuela israel jamaica {
    global thiscountry `country' 
    use "Data_ipmus/`country'/`country'.dta", clear
    do "DO/wage_premia_reg_robustness.do" // This file runs the regressions and save results in memory
	do "DO/wage_premia_result_robustness.do" // These files runs access the stored result and write into a dataset
    estimates drop _all 
}

use "Data_ipmus/temp/lincom_results_brazil_teachers_r.dta", replace
foreach country in brazil canada dr mauritius tt mexico panama sa uruguay us venezuela israel {
	append using "Data_ipmus/temp/lincom_results_`country'_teachers_r.dta"
}
save "Data_ipmus/lincom_results_combined_r.dta",replace

replace country_str2 = "dominican republic" if country_str2 == "dr"
replace country_str2 = "south africa" if country_str2 == "sa"
replace country_str2 = "united states" if country_str2 == "us"
replace country_str2 = "trinidad and tobago" if country_str2 == "tt"
replace country_str2 = "mauritius" if country_str2 == "mauritus"

rename country_str2 country_str	
duplicates drop

save "Data_ipmus/lincom_results_combined_r.dta",replace


*** Restricting to university returns and premia

foreach country in brazil indonesia canada dr mauritius tt mexico panama sa uruguay us venezuela israel jamaica {
    global thiscountry `country' 
    use "Data_ipmus/`country'/`country'.dta", clear
    do "DO/degree_premia_reg_robustness.do" // This file runs the regressions and save results in memory
	do "DO/degree_premia_result_robustness.do" // These files runs access the stored result and write into a dataset
    estimates drop _all 
}

use "Data_ipmus/temp/lincom_uni_brazil_teachers_r.dta", replace
foreach country in brazil canada dr mauritius tt mexico panama sa uruguay us venezuela israel {
	append using "Data_ipmus/temp/lincom_uni_`country'_teachers_r.dta"
}
save "Data_ipmus/lincom_uni_combined_r.dta",replace

replace country_str2 = "dominican republic" if country_str2 == "dr"
replace country_str2 = "south africa" if country_str2 == "sa"
replace country_str2 = "united states" if country_str2 == "us"
replace country_str2 = "trinidad and tobago" if country_str2 == "tt"
replace country_str2 = "mauritius" if country_str2 == "mauritus"

rename country_str2 country_str	
duplicates drop

save "Data_ipmus/lincom_uni_combined_r.dta",replace



use "Data_ipmus/temp/combined_edu_collapsed.dta", replace
merge 1:1  country_str year using "Data_ipmus/lincom_results_combined_r.dta"
drop _m
merge 1:1  country_str year using "Data_ipmus/lincom_uni_combined_r.dta"
label define country_lbl 703 "Slovakia", add
drop _m
save "Data_ipmus/collapsed_combined_r.dta",replace














