********************************************************************************
*[3] Collapsing the data to country year
********************************************************************************
collapse (mean)yrschool_teachers yrschool_prisec yrschool_he ///
    uni_teachers secondary_teachers primary_teachers lprimary_teachers ///
    uni_teachers_f secondary_teachers_f primary_teachers_f lprimary_teachers_f ///
    uni_teachers_m secondary_teachers_m primary_teachers_m lprimary_teachers_m ///
    yrschool_primary yrschool_secondary2 yrschool_un yrschool_secter ///
    uni_pri secondary_pri primary_pri lprimary_pri ///
    uni_sec secondary_sec primary_sec lprimary_sec ///
    uni_he secondary_he primary_he lprimary_he ///
    uni_pri_f secondary_pri_f primary_pri_f lprimary_pri_f ///
    uni_sec_f secondary_sec_f primary_sec_f lprimary_sec_f ///
    uni_he_f secondary_he_f primary_he_f lprimary_he_f ///
    uni_pri_m secondary_pri_m primary_pri_m lprimary_pri_m ///
    uni_sec_m secondary_sec_m primary_sec_m lprimary_sec_m ///
    uni_he_m secondary_he_m primary_he_m lprimary_he_m ///
    yrschool_workers uni_workers secondary_workers primary_workers lprimary_workers ///
    uni_workers_f secondary_workers_f primary_workers_f lprimary_workers_f ///
    uni_workers_m secondary_workers_m primary_workers_m lprimary_workers_m ///
    yrschool_hsworkers uni_hs secondary_hs primary_hs lprimary_hs ///
    uni_hs_m secondary_hs_m primary_hs_m lprimary_hs_m ///
    uni_hs_f secondary_hs_f primary_hs_f lprimary_hs_f ///
    teacher_share_uni_f hs_share_uni_f ls_share_uni_f ///
    teacher_share_uni_m hs_share_uni_m ls_share_uni_m ///
    teacher_share teacher_share_he teacher_share_sec teacher_share_pri ///
    teacher_share_hs teacher_share_uni hs_share_uni ls_share_uni ///
    teachers_male_share teachers_female_share ///
    age_teachers age_teachers_f age_teachers_m ///
    age_highskill age_highskill_f age_highskill_m ///
    age_workers age_workers_f age_workers_m ///
    age_lowskill age_lowskill_f age_lowskill_m ///
    hs_share hs_share_f hs_share_m ls_share_f ls_share_m ///
    male_share_teachers male_share_hs male_share_ls ///
    female_share_teachers female_share_hs female_share_ls ///
    yrschool_lsworkers lprimary_ls primary_ls secondary_ls uni_ls ///
    lprimary_ls_f primary_ls_f secondary_ls_f uni_ls_f ///
    lprimary_ls_m primary_ls_m secondary_ls_m uni_ls_m ls_share ///
    maleteacher_share_uni femaleteacher_share_uni ///
    maleteacher_share_hs femaleteacher_share_hs,  by(country year birth_year)  


********************************************************************************
*[4] Merging with PWT and Lee and Lee enrollment data
********************************************************************************
*1. PWT and worldbank classification data
decode country, gen(country_str)
replace country_str = lower(country_str)
merge m:1 country_str year using "C:\Users\cmlvh\OneDrive\Documents\Mres_PhD\Mres\Teachers\MRes_thesis\pwt_gdp.dta"
replace income_group=1 if country_str=="papua new guinea" |country_str=="south sudan" 
replace income_group=2 if country_str=="cuba" 
replace income_group=3 if country_str=="puerto rico" 
drop if _m==2 
drop _m
label var l_y "Log GDP p.c."

egen id_country=group(country_str)
merge m:1 country_str year using "C:\Users\cmlvh\OneDrive\Documents\Mres_PhD\Mres\Teachers\MRes_thesis\wbclass.dta"
drop if _m==2 
drop _m

*2. Enrollemnt data
gen year_5 = floor(birth_year/5)*5

replace countrycode = "MEX" if country_str == "mexico"
replace countrycode = "USA" if country_str == "united states"
replace countrycode = "CUB" if country_str == "cuba"

gen wbcode = countrycode

merge m:1 wbcode year_5 using "C:\Users\cmlvh\OneDrive\Documents\Mres_PhD\Mres\Teachers\MRes_thesis\LeeLee_LRdata_yearave.dta"
drop if _merge == 2
drop _m

********************************************************************************
*[5] Labeling varaibels
********************************************************************************
label variable teacher_share_uni "Teacher share among university workers"

label variable hs_share_uni "High-skill share among university workers"

label variable ls_share_uni "Low-skill share among university workers"

label variable teacher_share_hs "Teacher share among high-skill workers"

label variable teacher_share_he "University teachers among employed"

label variable teacher_share_sec "Secondary teachers among employed"

label variable teacher_share_pri "Primary teachers among employed"

label variable ls_share "Low-skill share among employed"

label variable hs_share "High-skill share among employed"

label variable teacher_share "teacher share among employed"

label variable male_share_teachers "Male share among teachers"

label variable male_share_hs "Male share among high-skill workers"

label variable male_share_ls "Male share among low-skill workers"

label variable female_share_teachers "Female share among teachers"

label variable female_share_hs "Female share among high-skill workers"

label variable female_share_ls "Female share among low-skill workers"

label variable hs_share_f "High-skill share among employed women"

label variable hs_share_m "High-skill share among employed men"

label variable ls_share_f "Low-skill share among employed women"

label variable ls_share_m "Low-skill share among employed men"

label variable teachers_male_share "Teacher share among employed men"

label variable teachers_female_share "Teacher share among employed women"

label variable maleteacher_share_uni "Male teacher share among university workers"

label variable femaleteacher_share_uni "Female teacher share among university workers"

label variable maleteacher_share_hs "Male teacher share among high-skill workers"

label variable femaleteacher_share_hs "Female teacher share among high-skill workers"


