*******************************************************************************
* Preliminary Step
*******************************************************************************
*** Relabeling variables to agree to IPMUS categories and variable names
gen university = 0 
replace university = 1 if edattain == 1
replace university = . if edattain == . 

gen secondary = 0
replace secondary = 1 if edattain == 2
replace secondary = . if edattain == .

gen primary = 0
replace primary = 1 if edattain == 3
replace primary = . if edattain == . 

gen lprimary = 0
replace lprimary = 1 if edattain == 4
replace lprimary = . if edattain == .

gen teacher_status = teacher_type

gen sex = 1 if female == 0
replace sex = 2 if female == 1
label define sex 1"Male" 2 "Female"

gen high_skill = 1 if skilled_occ == 1

*******************************************************************************
*[1] Generating average education levels for teachers, highskilled and average
*    wokers. 
********************************************************************************

* 1. Average teachers educations and educational attainments
* a. Educational Attainment
	bys country_id: egen uni_teachers = wtmean(university) if teacher_status != . , weight(perwt)
	
	bys country_id: egen secondary_teachers = wtmean(secondary) if teacher_status != . , weight(perwt)
	
	bys country_id: egen primary_teachers = wtmean(primary) if teacher_status != . , weight(perwt)
	
	bys country_id: egen lprimary_teachers = wtmean(lprimary) if teacher_status != . , weight(perwt)
	
	* for women 
	bys country_id: egen uni_teachers_f = wtmean(university) if teacher_status !=. & sex == 2 , weight(perwt)
	
	bys country_id: egen secondary_teachers_f = wtmean(secondary) if teacher_status !=. & sex == 2 , weight(perwt)
	
	bys country_id: egen primary_teachers_f = wtmean(primary) if teacher_status !=. & sex == 2 , weight(perwt)
	
	bys country_id: egen lprimary_teachers_f = wtmean(lprimary) if teacher_status !=. & sex == 2 , weight(perwt)
	
	* for men 
	bys country_id: egen uni_teachers_m = wtmean(university) if teacher_status !=. & sex == 1 , weight(perwt)
	
	bys country_id: egen secondary_teachers_m = wtmean(secondary) if teacher_status !=. & sex == 1 , weight(perwt)
	
	bys country_id: egen primary_teachers_m = wtmean(primary) if teacher_status !=. & sex == 1 , weight(perwt)
	
	bys country_id: egen lprimary_teachers_m = wtmean(lprimary) if teacher_status !=. & sex == 1 , weight(perwt)
	
* c. Educational attainment by teacher type	
*     -- Types of Qualification
	bys country_id: egen uni_pri = wtmean(university) if teacher_status != . & teacher_type==1 , weight(perwt)
	bys country_id: egen secondary_pri = wtmean(secondary) if teacher_status != .  & teacher_type==1, weight(perwt)
	bys country_id: egen primary_pri = wtmean(primary) if teacher_status != . & teacher_type==1 , weight(perwt)
	bys country_id: egen lprimary_pri = wtmean(lprimary) if teacher_status != . & teacher_type==1 , weight(perwt)

	bys country_id: egen uni_sec = wtmean(university) if teacher_status != . & teacher_type==2 , weight(perwt)
	bys country_id: egen secondary_sec = wtmean(secondary) if teacher_status != .  & teacher_type==2, weight(perwt)
	bys country_id: egen primary_sec = wtmean(primary) if teacher_status != . & teacher_type==2 , weight(perwt)
	bys country_id: egen lprimary_sec = wtmean(lprimary) if teacher_status != . & teacher_type==2 , weight(perwt)
	
	bys country_id: egen uni_he = wtmean(university) if teacher_status != . & teacher_type==3 , weight(perwt)
	bys country_id: egen secondary_he = wtmean(secondary) if teacher_status != .  & teacher_type==3, weight(perwt)
	bys country_id: egen primary_he = wtmean(primary) if teacher_status != . & teacher_type==3 , weight(perwt)
	bys country_id: egen lprimary_he = wtmean(lprimary) if teacher_status != . & teacher_type==3 , weight(perwt)
	
*     -- For women
	bys country_id: egen uni_pri_f = wtmean(university) if teacher_status != . & teacher_type==1 & sex == 2 , weight(perwt)
	bys country_id: egen secondary_pri_f = wtmean(secondary) if teacher_status != .  & teacher_type==1 & sex == 2, weight(perwt)
	bys country_id: egen primary_pri_f = wtmean(primary) if teacher_status != . & teacher_type==1 & sex == 2 , weight(perwt)
	bys country_id: egen lprimary_pri_f = wtmean(lprimary) if teacher_status != . & teacher_type==1  & sex == 2, weight(perwt)

	bys country_id: egen uni_sec_f = wtmean(university) if teacher_status != . & teacher_type==2 & sex == 2 , weight(perwt)
	bys country_id: egen secondary_sec_f = wtmean(secondary) if teacher_status != .  & teacher_type==2 & sex == 2, weight(perwt)
	bys country_id: egen primary_sec_f = wtmean(primary) if teacher_status != . & teacher_type==2 & sex == 2, weight(perwt)
	bys country_id: egen lprimary_sec_f = wtmean(lprimary) if teacher_status != . & teacher_type==2 & sex == 2 , weight(perwt)
	
	bys country_id: egen uni_he_f = wtmean(university) if teacher_status != . & teacher_type==3 & sex == 2 , weight(perwt)
	bys country_id: egen secondary_he_f = wtmean(secondary) if teacher_status != .  & teacher_type==3 & sex == 2, weight(perwt)
	bys country_id: egen primary_he_f = wtmean(primary) if teacher_status != . & teacher_type==3 & sex == 2, weight(perwt)
	bys country_id: egen lprimary_he_f = wtmean(lprimary) if teacher_status != . & teacher_type==3 & sex == 2 , weight(perwt)
	
	
*    -- For men
	bys country_id: egen uni_pri_m = wtmean(university) if teacher_status != . & teacher_type==1 & sex == 1, weight(perwt)
	bys country_id: egen secondary_pri_m = wtmean(secondary) if teacher_status != . & teacher_type==1 & sex == 1, weight(perwt)
	bys country_id: egen primary_pri_m = wtmean(primary) if teacher_status != . & teacher_type==1 & sex == 1, weight(perwt)
	bys country_id: egen lprimary_pri_m = wtmean(lprimary) if teacher_status != . & teacher_type==1 & sex == 1, weight(perwt)

	bys country_id: egen uni_sec_m = wtmean(university) if teacher_status != . & teacher_type==2 & sex == 1, weight(perwt)
	bys country_id: egen secondary_sec_m = wtmean(secondary) if teacher_status != . & teacher_type==2 & sex == 1, weight(perwt)
	bys country_id: egen primary_sec_m = wtmean(primary) if teacher_status != . & teacher_type==2 & sex == 1, weight(perwt)
	bys country_id: egen lprimary_sec_m = wtmean(lprimary) if teacher_status != . & teacher_type==2 & sex == 1, weight(perwt)

	bys country_id: egen uni_he_m = wtmean(university) if teacher_status != . & teacher_type==3 & sex == 1, weight(perwt)
	bys country_id: egen secondary_he_m = wtmean(secondary) if teacher_status != . & teacher_type==3 & sex == 1, weight(perwt)
	bys country_id: egen primary_he_m = wtmean(primary) if teacher_status != . & teacher_type==3 & sex == 1, weight(perwt)
	bys country_id: egen lprimary_he_m = wtmean(lprimary) if teacher_status != . & teacher_type==3 & sex == 1, weight(perwt)

*2. Average workers education and educational attaiments
	
* b. Educational Attainment
	bys country_id: egen uni_workers = wtmean(university) if teacher_status == . , weight(perwt)
	
	bys country_id: egen secondary_workers = wtmean(secondary) if teacher_status == . , weight(perwt)
	
	bys country_id: egen primary_workers = wtmean(primary) if teacher_status == . , weight(perwt)
	
	bys country_id: egen lprimary_workers = wtmean(lprimary) if teacher_status == . , weight(perwt)
	
	* for women 
	bys country_id: egen uni_workers_f = wtmean(university) if teacher_status == . & sex == 2 , weight(perwt)
	
	bys country_id: egen secondary_workers_f = wtmean(secondary) if teacher_status == . & sex == 2 , weight(perwt)
	
	bys country_id: egen primary_workers_f = wtmean(primary) if teacher_status == . & sex == 2 , weight(perwt)
	
	bys country_id: egen lprimary_workers_f = wtmean(lprimary) if teacher_status == . & sex == 2 , weight(perwt)
	
	* for men 
	bys country_id: egen uni_workers_m = wtmean(university) if teacher_status == . & sex == 1 , weight(perwt)
	
	bys country_id: egen secondary_workers_m = wtmean(secondary) if teacher_status == . & sex == 1 , weight(perwt)
	
	bys country_id: egen primary_workers_m = wtmean(primary) if teacher_status == . & sex == 1 , weight(perwt)
	
	bys country_id: egen lprimary_workers_m = wtmean(lprimary) if teacher_status == . & sex == 1 , weight(perwt)
	
*3. Average highskilled workers and education attainments

* b. Educational Attainment
	bys country_id: egen uni_hs = wtmean(university) if teacher_status == . & high_skill == 1 , weight(perwt)
	
	bys country_id: egen secondary_hs = wtmean(secondary) if teacher_status == . & high_skill == 1, weight(perwt)
	
	bys country_id: egen primary_hs = wtmean(primary) if teacher_status == . & high_skill == 1, weight(perwt)
	
	bys country_id: egen lprimary_hs = wtmean(lprimary) if teacher_status == . & high_skill == 1 , weight(perwt)
	
	* for men
	bys country_id: egen uni_hs_m = wtmean(university) if teacher_status == . & high_skill == 1 & sex == 1 , weight(perwt)
	
	bys country_id: egen secondary_hs_m = wtmean(secondary) if teacher_status == . & high_skill == 1 & sex == 1, weight(perwt)
	
	bys country_id: egen primary_hs_m = wtmean(primary) if teacher_status == . & high_skill == 1 & sex == 1, weight(perwt)
	
	bys country_id: egen lprimary_hs_m = wtmean(lprimary) if teacher_status == . & high_skill == 1 & sex == 1 , weight(perwt)
	
	*for women
	
	bys country_id: egen uni_hs_f = wtmean(university) if teacher_status == . & high_skill == 1 & sex == 2 , weight(perwt)
	
	bys country_id: egen secondary_hs_f = wtmean(secondary) if teacher_status == . & high_skill == 1 & sex == 2, weight(perwt)
	
	bys country_id: egen primary_hs_f = wtmean(primary) if teacher_status == . & high_skill == 1 & sex == 2, weight(perwt)
	
	bys country_id: egen lprimary_hs_f = wtmean(lprimary) if teacher_status == . & high_skill == 1 & sex == 2, weight(perwt)
	
*****Low Skilled
	* b. Educational Attainment
	bys country_id: egen uni_ls = wtmean(university) if teacher_status == . & high_skill != 1 , weight(perwt)
	
	bys country_id: egen secondary_ls = wtmean(secondary) if teacher_status == . & high_skill != 1, weight(perwt)
	
	bys country_id: egen primary_ls = wtmean(primary) if teacher_status == . & high_skill != 1, weight(perwt)
	
	bys country_id: egen lprimary_ls = wtmean(lprimary) if teacher_status == . & high_skill != 1 , weight(perwt)
	
	* for men
	bys country_id: egen uni_ls_m = wtmean(university) if teacher_status == . & high_skill != 1 & sex == 1 , weight(perwt)
	
	bys country_id: egen secondary_ls_m = wtmean(secondary) if teacher_status == . & high_skill != 1 & sex == 1, weight(perwt)
	
	bys country_id: egen primary_ls_m = wtmean(primary) if teacher_status == . & high_skill != 1 & sex == 1, weight(perwt)
	
	bys country_id: egen lprimary_ls_m = wtmean(lprimary) if teacher_status == . & high_skill != 1 & sex == 1 , weight(perwt)
	
	*for women
	
	bys country_id: egen uni_ls_f = wtmean(university) if teacher_status == . & high_skill != 1 & sex == 2 , weight(perwt)
	
	bys country_id: egen secondary_ls_f = wtmean(secondary) if teacher_status == . & high_skill != 1 & sex == 2, weight(perwt)
	
	bys country_id: egen primary_ls_f = wtmean(primary) if teacher_status == . & high_skill != 1 & sex == 2, weight(perwt)
	
	bys country_id: egen lprimary_ls_f = wtmean(lprimary) if teacher_status == . & high_skill != 1 & sex == 2, weight(perwt)
**# teacher_share
	
*******************************************************************************
*[2] Congnitive Ability
********************************************************************************
	bys country_id: egen litscore_ls_p = wtmean(score_lit_p) if occupation == 1 , weight(perwt)
	bys country_id: egen litscore_hs_p = wtmean(score_lit_p) if occupation == 2 , weight(perwt)
	bys country_id: egen litscore_teachers_p = wtmean(score_lit_p) if occupation == 3 , weight(perwt)
	
	bys country_id: egen numscore_ls_p = wtmean(score_num_p) if occupation == 1 , weight(perwt)
	bys country_id: egen numscore_hs_p = wtmean(score_num_p) if occupation == 2 , weight(perwt)
	bys country_id: egen numscore_teachers_p = wtmean(score_num_p) if occupation == 3 , weight(perwt)

**** Teachers
	bys country_id: egen litscore_teachers = wtmean(score_lit) if teacher_status !=. , weight(perwt)
	bys country_id: egen numscore_teachers = wtmean(score_num) if teacher_status !=., weight(perwt)
	bys country_id: egen pslscore_teachers = wtmean(score_psl) if teacher_status !=., weight(perwt)
	
	bys country_id: egen litscore_teachers_m = wtmean(score_lit) if teacher_status !=. & sex == 1 , weight(perwt)
	bys country_id: egen numscore_teachers_m = wtmean(score_num) if teacher_status !=. & sex == 1 , weight(perwt)
	bys country_id: egen pslscore_teachers_m = wtmean(score_psl) if teacher_status !=. & sex == 1 , weight(perwt)
	
	bys country_id: egen litscore_teachers_f = wtmean(score_lit) if teacher_status !=. & sex == 2 , weight(perwt)
	bys country_id: egen numscore_teachers_f = wtmean(score_num) if teacher_status !=. & sex == 2 , weight(perwt)
	bys country_id: egen pslscore_teachers_f = wtmean(score_psl) if teacher_status !=. & sex == 2 , weight(perwt)
	
**** High Skilled
	bys country_id: egen litscore_hs = wtmean(score_lit) if teacher_status ==. & high_skill == 1 , weight(perwt)
	bys country_id: egen numscore_hs = wtmean(score_num) if teacher_status ==. & high_skill == 1 , weight(perwt)
	bys country_id: egen pslscore_hs = wtmean(score_psl) if teacher_status ==. & high_skill == 1 , weight(perwt)
	
	bys country_id: egen litscore_hs_m = wtmean(score_lit) if teacher_status ==. & high_skill == 1 & sex == 1 , weight(perwt)
	bys country_id: egen numscore_hs_m = wtmean(score_num) if teacher_status ==. & high_skill == 1 & sex == 1 , weight(perwt)
	bys country_id: egen pslscore_hs_m = wtmean(score_psl) if teacher_status ==. & high_skill == 1 & sex == 1 , weight(perwt)
	
	bys country_id: egen litscore_hs_f = wtmean(score_lit) if teacher_status ==. & high_skill == 1 & sex == 2 , weight(perwt)
	bys country_id: egen numscore_hs_f = wtmean(score_num) if teacher_status ==.  & high_skill == 1 & sex == 2 , weight(perwt)
	bys country_id: egen pslscore_hs_f = wtmean(score_psl) if teacher_status ==. & high_skill == 1 & sex == 2 , weight(perwt)
	
**** low Skilled
	bys country_id: egen litscore_ls = wtmean(score_lit) if teacher_status ==. & high_skill != 1 , weight(perwt)
	bys country_id: egen numscore_ls = wtmean(score_num) if teacher_status ==. & high_skill != 1 , weight(perwt)
	bys country_id: egen pslscore_ls = wtmean(score_psl) if teacher_status ==. & high_skill != 1 , weight(perwt)
	
	bys country_id: egen litscore_ls_m = wtmean(score_lit) if teacher_status ==. & high_skill != 1 & sex == 1 , weight(perwt)
	bys country_id: egen numscore_ls_m = wtmean(score_num) if teacher_status ==. & high_skill != 1 & sex == 1 , weight(perwt)
	bys country_id: egen pslscore_ls_m = wtmean(score_psl) if teacher_status ==. & high_skill != 1 & sex == 1 , weight(perwt)
	
	bys country_id: egen litscore_ls_f = wtmean(score_lit) if teacher_status ==. & high_skill != 1 & sex == 2 , weight(perwt)
	bys country_id: egen numscore_ls_f = wtmean(score_num) if teacher_status ==.  & high_skill != 1 & sex == 2 , weight(perwt)
	bys country_id: egen pslscore_ls_f = wtmean(score_psl) if teacher_status ==. & high_skill != 1 & sex == 2 , weight(perwt)
	
***** Average working population
	bys country_id: egen litscore_workers = wtmean(score_lit) if teacher_status ==. , weight(perwt)
	bys country_id: egen numscore_workers = wtmean(score_num) if teacher_status ==. , weight(perwt)
	bys country_id: egen pslscore_workers = wtmean(score_psl) if teacher_status ==. , weight(perwt)
	
	bys country_id: egen litscore_workers_m = wtmean(score_lit) if teacher_status ==. & sex == 1 , weight(perwt)
	bys country_id: egen numscore_workers_m = wtmean(score_num) if teacher_status ==. & sex == 1 , weight(perwt)
	bys country_id: egen pslscore_workers_m = wtmean(score_psl) if teacher_status ==. & sex == 1 , weight(perwt)
	
	bys country_id: egen litscore_workers_f = wtmean(score_lit) if teacher_status ==. & sex == 2 , weight(perwt)
	bys country_id: egen numscore_workers_f = wtmean(score_num) if teacher_status ==. & sex == 2 , weight(perwt)
	bys country_id: egen pslscore_workers_f = wtmean(score_psl) if teacher_status ==. & sex == 2 , weight(perwt)
	
	
*******************************************************************************
*[3] Generating labour market shares for occupations
*******************************************************************************

* 1. Shares of teachers in the employed population
	bys country_id: egen teacher_share = wtmean(teachers) if employed == 1, weight(perwt)
	
	gen teachers_pri = 0
	replace teachers_pri = 1 if teacher_type == 1
	bys country_id: egen teacher_share_pri = wtmean(teachers_pri) if employed == 1, weight(perwt)
	
	gen teachers_sec = 0
	replace teachers_sec = 1 if teacher_type == 2
	bys country_id: egen teacher_share_sec = wtmean(teachers_sec) if employed == 1, weight(perwt)
	
	gen teachers_he = 0
	replace teachers_he = 1 if teacher_type == 2
	bys country_id: egen teacher_share_he = wtmean(teachers_he) if employed == 1, weight(perwt)
 
* 2. Share of teachers in the high-skilled employed population
	gen teachers_hs = teachers * high_skill
	bys country_id: egen teacher_share_hs = wtmean(teachers_hs) if (employed == 1 & high_skill == 1), weight(perwt)

* 3. Share of teachers amongst indivdiuals holding university degrees
	gen teachers_uni = teachers * university
	bys country_id: egen teacher_share_uni = wtmean(teachers_uni) if (employed == 1 & university == 1), weight(perwt)
	

* 4. Gender employment shares
	gen male = 0
	replace male = 1 if sex == 1
	replace male = . if sex == .
	
	gen teachers_male = teachers * male
	bys country_id: egen teachers_male_share = wtmean(teachers_male) if (employed == 1 & sex == 1), weight(perwt)
	
	gen teachers_female = teachers * female
	bys country_id: egen teachers_female_share = wtmean(teachers_female) if (employed == 1 & sex == 2), weight(perwt)
	
	gen teachers_uni_male = teachers_uni * male
	bys country_id: egen maleteacher_share_uni = wtmean(teachers_uni_male) if (employed == 1 & sex == 1 & university == 1), weight(perwt)
	
	gen teachers_uni_female = teachers_uni * female
	bys country_id: egen femaleteacher_share_uni = wtmean(teachers_uni_female) if (employed == 1 & sex == 2 & university == 1), weight(perwt)
	
	gen teachers_hs_male = teachers_hs * male
	bys country_id: egen maleteacher_share_hs = wtmean(teachers_hs_male) if (employed == 1 & high_skill == 1 & sex == 1), weight(perwt)

	gen teachers_hs_female = teachers_hs * female
	bys country_id: egen femaleteacher_share_hs = wtmean(teachers_hs_female) if (employed == 1 & high_skill == 1 & sex == 2), weight(perwt)
	
	
	* Age profiles
	bys country_id: egen age_teachers = wtmean(age) if teacher_status != . , weight(perwt)
	
	bys country_id: egen age_teachers_f = wtmean(age) if teacher_status != . & sex == 2 , weight(perwt)
	
	bys country_id: egen age_teachers_m = wtmean(age) if teacher_status !=. & sex == 1, weight(perwt)
	
	bys country_id: egen age_highskill = wtmean(age)  if teacher_status == . & high_skill == 1 , weight(perwt)
	
	bys country_id: egen age_highskill_f = wtmean(age) if teacher_status == . & sex == 2 & high_skill == 1 , weight(perwt)
	
	bys country_id: egen age_highskill_m = wtmean(age) if teacher_status == . & sex == 1 & high_skill == 1, weight(perwt)
	
	bys country_id: egen age_lowskill = wtmean(age)  if teacher_status == . & high_skill != 1 , weight(perwt)
	
	bys country_id: egen age_lowskill_f = wtmean(age) if teacher_status == . & sex == 2 & high_skill != 1 , weight(perwt)
	
	bys country_id: egen age_lowskill_m = wtmean(age) if teacher_status == . & sex == 1 & high_skill != 1, weight(perwt)
	
	bys country_id: egen age_workers = wtmean(age)  if teacher_status == . , weight(perwt)
	
	bys country_id: egen age_workers_f = wtmean(age) if teacher_status == . & sex == 2 , weight(perwt)
	
	bys country_id: egen age_workers_m = wtmean(age) if teacher_status == . & sex == 1, weight(perwt)
	

*******************************************************************************
gen score_lit_q4_wt = .
levelsof country_id if score_lit!= . , local(countries) 
foreach country in `countries' {
	xtile temp_q = score_lit if country_id == `country' [pw=perwt], nquantiles(4)
	replace score_lit_q4_wt = temp_q if country_id == `country'
	drop temp_q
}






	
	
	
	