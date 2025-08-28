***************************************************************
* STEP analysis of liteary skills of lower income economies
***************************************************************

*Country Labels
***************************country
*kountry CNTRYID, from(iso3n)
*rename NAMES_STD country

************************ sample restrictions (countries)
drop if country=="Russia"
egen id_country=group(country)


* Standardised test scores
capture rename W_FinSPwt weight
capture rename w3_finspwt weight
bys country: egen totw=sum(weight)
gen perwt = weight/totw


rename PVLIT1 pvlit1

gen score_lit=.
gen score_num=.
gen score_psl =.

levelsof id_country, local(country)
foreach cname of local country{
	foreach s in lit{
	sum pv`s'1 [aw=weight/totw] if id_country == `cname', det 
	gen mean_pv`s'1 = r(mean)
	gen var_pv`s'1 = r(Var)
	gen sd_pv`s'1= sqrt(var_pv`s'1)

	replace score_`s'= (pv`s'1 - mean_pv`s'1)/sd_pv`s'1 if id_country == `cname'
	}
	drop mean_* var_* sd_*
}

* Other variables
* 1. Classifying Teachers 
gen isco08_c = string(occupationcode)
gen teacher=1 if substr(isco08_c,1,2)=="23"
gen teacher_type=.
replace teacher_type=1 if substr(isco08_c,1,3)=="234"
replace teacher_type=2 if substr(isco08_c,1,3)=="232" | substr(isco08_c,1,3)=="233"
replace teacher_type=3 if substr(isco08_c,1,3)=="231"
replace teacher_type=4 if substr(isco08_c,1,3)=="235" | isco08_c=="23"
label define teach 1 "Primary" 2 "Secondary" 3 "Tertiary" 4 "Not spec" 
label values teacher_type teach

gen skilled_occ=0
replace skilled_occ = 1 if substr(isco08_c,1,1)=="1"| substr(isco08_c,1,1)=="2" | substr(isco08_c,1,1)=="3"
replace skilled_occ = . if missing(isco08_c) == 1

gen professional = 0
replace professional = 1 if substr(isco08_c,1,1)=="2"
replace professional = . if missing(isco08_c) == 1


* Generate the new edu variable
gen edu = .

* ISCED 1 or below: ISCED 0, 1, 2 → values 0, 1, 2
replace edu = 1 if inlist(ISCED_p, 0, 1)

* ISCED 2 (lower secondary)
replace edu = 2 if inlist(ISCED_p, 2)

* ISCED 3 (upper secondary)
replace edu = 3 if ISCED_p == 3

* ISCED 4 (access to tertiary)
replace edu = 4 if ISCED_p == 4

* ISCED 5+ (tertiary): ISCED 5A bachelor, 5A master, ISCED 6 → values 6, 7, 8
replace edu = 5 if inlist(ISCED_p, 5,6,7,8)

* Label the new edu variable
label define edu ///
    1 "ISCED 1 or below" ///
	2 "ISCED 2" ///
    3 "ISCED 3" ///
    4 "ISCED 4" ///
    5 "ISCED 5+ (tertiary)"

label values edu edu

gen edattain = .
replace edattain = 1 if edu == 5 // University
replace edattain = 2 if inlist(edu, 3, 4) // Secondary
replace edattain = 3 if edu == 2 // Primary
replace edattain = 4 if edu == 1 // Less than primary

label define edattain 1 "University" 2 "Secondary" 3 "Primary" 4 "Less than primary"
label values edattain edattain


* 3. Focusing on specifically university and above education

* Bachelor's degree (ISCED 5A, bachelor)
gen bachelors = .
replace bachelors = 1 if ISCED_p == 6

* Master's degree (ISCED 5A, master)
gen masters = .
replace masters = 1 if ISCED_p == 7

* Postgraduate or higher (ISCED 6)
gen pg_high = .
replace pg_high = 1 if ISCED_p == 8

* Set all others to 0
replace bachelors = 0 if missing(bachelors) & !missing(ISCED_p)
replace masters   = 0 if missing(masters)   & !missing(ISCED_p)
replace pg_high   = 0 if missing(pg_high)   & !missing(ISCED_p)


* 4. The required level of qualification for their occupation (Perceived?)
* Generate the new education requirement variable
gen edu_req = .

* ISCED 1 or below (codes 0, 1, 2)
replace edu_req = 1 if inlist(ISCED_needed, 0, 1, 2)

* ISCED 2 (lower secondary)
replace edu_req = 2 if ISCED_needed == 2

* ISCED 3 (upper secondary)
replace edu_req = 3 if ISCED_needed == 3

* ISCED 4 (post-secondary non-tertiary) — not in this sample, but include for completeness
replace edu_req = 4 if ISCED_needed == 4

* ISCED 5 (tertiary, non-advanced) — not distinct here, but include if needed
replace edu_req = 5 if ISCED_needed == 5

* ISCED 5+ (advanced tertiary) — add this if ISCED 6 appears in other samples
replace edu_req = 6 if ISCED_needed == 6

* Apply consistent labels
label define edu_req ///
    1 "ISCED 1 or below" ///
    2 "ISCED 2 (lower secondary)" ///
    3 "ISCED 3 (upper secondary)" ///
    4 "ISCED 4 (post-sec non-tertiary)" ///
    5 "ISCED 5 (short-cycle tertiary)" ///
    6 "ISCED 5+ (tertiary)"

label values edu_req edu_req

* 5. Wages
gen l_wage = ln_earnings_h_usd

*     (c) Gender
gen female = .
replace female = 1 if m1a_q02 == 2
replace female = 0 if m1a_q02 == 1


*     (d) Employment status B_Q15a D_Q04

capture gen employed = emp

foreach var of varlist _all {
    rename `var' `=lower("`var'")'
}


*** Generating three occupation groups
gen teachers = 0 
replace teachers = 1 if teacher_type !=.
drop occupation
gen occupation = .
replace occupation = 1 if skilled_occ == 0 & teachers == 0
replace occupation = 2 if skilled_occ == 1 & teachers == 0
replace occupation = 3 if teachers == 1

label define occupation_code 1"Low skill occuptaion" 2"Other high skill occupation" 3"Teachers"
label value occupation occupation_code

keep country weight perwt score_lit score_num score_psl ///
     teacher teacher_type skilled_occ professional ///
     edu edattain bachelors masters pg_high edu_req ///
     l_wage ///
     age female employed ///
     teachers occupation isco08_c 