 ********************************************************************************
* Preliminary Steps: Calculating the size of the labour market
********************************************************************************
	* Memory Management
	keep empstat perwt teacher_status teacher_type year_school university secondary primary lprimary sex high_skill occ_type occ age country year professionals

	gen employed = 0
	replace employed = 1 if empstat == 1
	replace employed = . if empstat == 9
	replace employed = . if empstat == 0	
	gen employed_wt = employed * perw

	
*******************************************************************************
*[1] Generating average education levels for teachers, highskilled and average
*    wokers. 
********************************************************************************

* 1. Average teachers educations and educational attainments
* a. Years of Schooling
	bys year: egen yrschool_teachers = wtmean(year_school) if teacher_status != ., weight(perwt)


* b. Educational Attainment
	* All teachers
	bys year: egen uni_teachers = wtmean(university) if !missing(teacher_status) , weight(perwt)
	
	bys year: egen secondary_teachers = wtmean(secondary) if !missing(teacher_status) , weight(perwt)
	
	bys year: egen primary_teachers = wtmean(primary) if !missing(teacher_status) , weight(perwt)
	
	bys year: egen lprimary_teachers = wtmean(lprimary) if !missing(teacher_status) , weight(perwt)
	
	* for women 
	bys year: egen uni_teachers_f = wtmean(university) if !missing(teacher_status) & sex == 2 , weight(perwt)
	
	bys year: egen secondary_teachers_f = wtmean(secondary) if !missing(teacher_status) & sex == 2 , weight(perwt)
	
	bys year: egen primary_teachers_f = wtmean(primary) if !missing(teacher_status) & sex == 2 , weight(perwt)
	
	bys year: egen lprimary_teachers_f = wtmean(lprimary) if !missing(teacher_status) & sex == 2 , weight(perwt)
	
	* for men 
	bys year: egen uni_teachers_m = wtmean(university) if !missing(teacher_status) & sex == 1 , weight(perwt)
	
	bys year: egen secondary_teachers_m = wtmean(secondary) if !missing(teacher_status) & sex == 1 , weight(perwt)
	
	bys year: egen primary_teachers_m = wtmean(primary) if !missing(teacher_status) & sex == 1 , weight(perwt)
	
	bys year: egen lprimary_teachers_m = wtmean(lprimary) if !missing(teacher_status) & sex == 1 , weight(perwt)
	
* c. Educational attainment by teacher type (Primary, Secondary, Higher Education)
*     -- Years of Schooling
	bys year  : egen yrschool_primary = wtmean(year_school) if teacher_type==1, weight(perwt) 
	bys year  : egen yrschool_secondary2= wtmean(year_school) if teacher_type==2, weight(perwt) 
	bys year  : egen yrschool_he = wtmean(year_school) if teacher_type==3, weight(perwt) 
	bys year  : egen yrschool_un = wtmean(year_school) if teacher_type==4, weight(perwt) 
	bys year  : egen yrschool_prisec = wtmean(year_school) if (teacher_type==5 | teacher_type==1 | teacher_type==2), weight(perwt) 
	bys year  : egen yrschool_secter= wtmean(year_school) if (teacher_type==6 | teacher_type==2 | teacher_type==3), weight(perwt) 
	
*     -- Types of Qualification
	bys year: egen uni_pri = wtmean(university) if !missing(teacher_status) & teacher_type==1 , weight(perwt)
	bys year: egen secondary_pri = wtmean(secondary) if !missing(teacher_status)  & teacher_type==1, weight(perwt)
	bys year: egen primary_pri = wtmean(primary) if !missing(teacher_status) & teacher_type==1 , weight(perwt)
	bys year: egen lprimary_pri = wtmean(lprimary) if !missing(teacher_status) & teacher_type==1 , weight(perwt)

	bys year: egen uni_sec = wtmean(university) if !missing(teacher_status) & teacher_type==2 , weight(perwt)
	bys year: egen secondary_sec = wtmean(secondary) if !missing(teacher_status)  & teacher_type==2, weight(perwt)
	bys year: egen primary_sec = wtmean(primary) if !missing(teacher_status) & teacher_type==2 , weight(perwt)
	bys year: egen lprimary_sec = wtmean(lprimary) if !missing(teacher_status) & teacher_type==2 , weight(perwt)
	
	bys year: egen uni_he = wtmean(university) if !missing(teacher_status) & teacher_type==3 , weight(perwt)
	bys year: egen secondary_he = wtmean(secondary) if !missing(teacher_status)  & teacher_type==3, weight(perwt)
	bys year: egen primary_he = wtmean(primary) if !missing(teacher_status) & teacher_type==3 , weight(perwt)
	bys year: egen lprimary_he = wtmean(lprimary) if !missing(teacher_status) & teacher_type==3 , weight(perwt)
	
*     -- For women
	bys year: egen uni_pri_f = wtmean(university) if !missing(teacher_status) & teacher_type==1 & sex == 2 , weight(perwt)
	bys year: egen secondary_pri_f = wtmean(secondary) if !missing(teacher_status)  & teacher_type==1 & sex == 2, weight(perwt)
	bys year: egen primary_pri_f = wtmean(primary) if !missing(teacher_status) & teacher_type==1 & sex == 2 , weight(perwt)
	bys year: egen lprimary_pri_f = wtmean(lprimary) if !missing(teacher_status) & teacher_type==1  & sex == 2, weight(perwt)

	bys year: egen uni_sec_f = wtmean(university) if !missing(teacher_status) & teacher_type==2 & sex == 2 , weight(perwt)
	bys year: egen secondary_sec_f = wtmean(secondary) if !missing(teacher_status)  & teacher_type==2 & sex == 2, weight(perwt)
	bys year: egen primary_sec_f = wtmean(primary) if !missing(teacher_status) & teacher_type==2 & sex == 2, weight(perwt)
	bys year: egen lprimary_sec_f = wtmean(lprimary) if !missing(teacher_status) & teacher_type==2 & sex == 2 , weight(perwt)
	
	bys year: egen uni_he_f = wtmean(university) if !missing(teacher_status) & teacher_type==3 & sex == 2 , weight(perwt)
	bys year: egen secondary_he_f = wtmean(secondary) if !missing(teacher_status)  & teacher_type==3 & sex == 2, weight(perwt)
	bys year: egen primary_he_f = wtmean(primary) if !missing(teacher_status) & teacher_type==3 & sex == 2, weight(perwt)
	bys year: egen lprimary_he_f = wtmean(lprimary) if !missing(teacher_status) & teacher_type==3 & sex == 2 , weight(perwt)
	
	
*    -- For men
	bys year: egen uni_pri_m = wtmean(university) if !missing(teacher_status) & teacher_type==1 & sex == 1, weight(perwt)
	bys year: egen secondary_pri_m = wtmean(secondary) if !missing(teacher_status) & teacher_type==1 & sex == 1, weight(perwt)
	bys year: egen primary_pri_m = wtmean(primary) if !missing(teacher_status) & teacher_type==1 & sex == 1, weight(perwt)
	bys year: egen lprimary_pri_m = wtmean(lprimary) if !missing(teacher_status) & teacher_type==1 & sex == 1, weight(perwt)

	bys year: egen uni_sec_m = wtmean(university) if !missing(teacher_status) & teacher_type==2 & sex == 1, weight(perwt)
	bys year: egen secondary_sec_m = wtmean(secondary) if !missing(teacher_status) & teacher_type==2 & sex == 1, weight(perwt)
	bys year: egen primary_sec_m = wtmean(primary) if !missing(teacher_status) & teacher_type==2 & sex == 1, weight(perwt)
	bys year: egen lprimary_sec_m = wtmean(lprimary) if !missing(teacher_status) & teacher_type==2 & sex == 1, weight(perwt)

	bys year: egen uni_he_m = wtmean(university) if !missing(teacher_status) & teacher_type==3 & sex == 1, weight(perwt)
	bys year: egen secondary_he_m = wtmean(secondary) if !missing(teacher_status) & teacher_type==3 & sex == 1, weight(perwt)
	bys year: egen primary_he_m = wtmean(primary) if !missing(teacher_status) & teacher_type==3 & sex == 1, weight(perwt)
	bys year: egen lprimary_he_m = wtmean(lprimary) if !missing(teacher_status) & teacher_type==3 & sex == 1, weight(perwt)

*2. Average workers education and educational attaiments
* a. Years of Schooling
	bys year: egen yrschool_workers = wtmean(year_school) if teacher_status == . & employed == 1 , weight(perwt)
	
* b. Educational Attainment
	bys year: egen uni_workers = wtmean(university) if teacher_status == . & employed == 1 , weight(perwt)
	
	bys year: egen secondary_workers = wtmean(secondary) if teacher_status == . & employed == 1 , weight(perwt)
	
	bys year: egen primary_workers = wtmean(primary) if teacher_status == . & employed == 1 , weight(perwt)
	
	bys year: egen lprimary_workers = wtmean(lprimary) if teacher_status == . & employed == 1 , weight(perwt)
	
	* for women 
	bys year: egen uni_workers_f = wtmean(university) if teacher_status == . & employed == 1 & sex == 2 , weight(perwt)
	
	bys year: egen secondary_workers_f = wtmean(secondary) if teacher_status == . & employed == 1 & sex == 2 , weight(perwt)
	
	bys year: egen primary_workers_f = wtmean(primary) if teacher_status == . & employed == 1 & sex == 2 , weight(perwt)
	
	bys year: egen lprimary_workers_f = wtmean(lprimary) if teacher_status == . & employed == 1 & sex == 2 , weight(perwt)
	
	* for men 
	bys year: egen uni_workers_m = wtmean(university) if teacher_status == . & employed == 1 & sex == 1 , weight(perwt)
	
	bys year: egen secondary_workers_m = wtmean(secondary) if teacher_status == . & employed == 1 & sex == 1 , weight(perwt)
	
	bys year: egen primary_workers_m = wtmean(primary) if teacher_status == . & employed == 1 & sex == 1 , weight(perwt)
	
	bys year: egen lprimary_workers_m = wtmean(lprimary) if teacher_status == . & employed == 1 & sex == 1 , weight(perwt)
	
*3. Average highskilled workers and education attainments
* a. Years of Schooling
	bys year: egen yrschool_hsworkers = wtmean(year_school) if (teacher_status == . & high_skill == 1), weight(perwt)
	bys year:egen yrschool_hsworkers_prof = wtmean(year_school) if (teacher_status == . & professionals == 1), weight(perwt)
	
* b. Educational Attainment
	bys year: egen uni_hs = wtmean(university) if teacher_status == . & employed == 1 & high_skill == 1 , weight(perwt)
	
	bys year: egen secondary_hs = wtmean(secondary) if teacher_status == . & employed == 1 & high_skill == 1, weight(perwt)
	
	bys year: egen primary_hs = wtmean(primary) if teacher_status == . & employed == 1 & high_skill == 1, weight(perwt)
	
	bys year: egen lprimary_hs = wtmean(lprimary) if teacher_status == . & employed == 1 & high_skill == 1 , weight(perwt)
	
	* for men
	bys year: egen uni_hs_m = wtmean(university) if teacher_status == . & employed == 1 & high_skill == 1 & sex == 1 , weight(perwt)
	
	bys year: egen secondary_hs_m = wtmean(secondary) if teacher_status == . & employed == 1 & high_skill == 1 & sex == 1, weight(perwt)
	
	bys year: egen primary_hs_m = wtmean(primary) if teacher_status == . & employed == 1 & high_skill == 1 & sex == 1, weight(perwt)
	
	bys year: egen lprimary_hs_m = wtmean(lprimary) if teacher_status == . & employed == 1 & high_skill == 1 & sex == 1 , weight(perwt)
	
	*for women
	
	bys year: egen uni_hs_f = wtmean(university) if teacher_status == . & employed == 1 & high_skill == 1 & sex == 2 , weight(perwt)
	
	bys year: egen secondary_hs_f = wtmean(secondary) if teacher_status == . & employed == 1 & high_skill == 1 & sex == 2, weight(perwt)
	
	bys year: egen primary_hs_f = wtmean(primary) if teacher_status == . & employed == 1 & high_skill == 1 & sex == 2, weight(perwt)
	
	bys year: egen lprimary_hs_f = wtmean(lprimary) if teacher_status == . & employed == 1 & high_skill == 1 & sex == 2, weight(perwt)
	
	
	*3. Average lowskilled workers and education attainments
* a. Years of Schooling
	bys year: egen yrschool_lsworkers = wtmean(year_school) if (teacher_status == . & employed == 1 & high_skill == 0), weight(perwt)
	
* b. Educational Attainment
	bys year: egen uni_ls = wtmean(university) if teacher_status == . & employed == 1 & high_skill == 0 , weight(perwt)
	
	bys year: egen secondary_ls = wtmean(secondary) if teacher_status == . & employed == 1 & high_skill == 0, weight(perwt)
	
	bys year: egen primary_ls = wtmean(primary) if teacher_status == . & employed == 1 & high_skill == 0, weight(perwt)
	
	bys year: egen lprimary_ls = wtmean(lprimary) if teacher_status == . & employed == 1 & high_skill == 0 , weight(perwt)
	
	* for men
	bys year: egen uni_ls_m = wtmean(university) if teacher_status == . & employed == 1 & high_skill == 0 & sex == 1 , weight(perwt)
	
	bys year: egen secondary_ls_m = wtmean(secondary) if teacher_status == . & employed == 1 & high_skill == 0 & sex == 1, weight(perwt)
	
	bys year: egen primary_ls_m = wtmean(primary) if teacher_status == . & employed == 1 & high_skill == 0 & sex == 1, weight(perwt)
	
	bys year: egen lprimary_ls_m = wtmean(lprimary) if teacher_status == . & employed == 1 & high_skill == 0 & sex == 1 , weight(perwt)
	
	*for women
	
	bys year: egen uni_ls_f = wtmean(university) if teacher_status == . & employed == 1 & high_skill == 0 & sex == 2 , weight(perwt)
	
	bys year: egen secondary_ls_f = wtmean(secondary) if teacher_status == . & employed == 1 & high_skill == 0 & sex == 2, weight(perwt)
	
	bys year: egen primary_ls_f = wtmean(primary) if teacher_status == . & employed == 1 & high_skill == 0 & sex == 2, weight(perwt)
	
	bys year: egen lprimary_ls_f = wtmean(lprimary) if teacher_status == . & employed == 1 & high_skill == 0 & sex == 2, weight(perwt)
	
********************************************************************************
*[2] Generating labour market shares for occupations
********************************************************************************

	
	
* 1. Occupation shares based on three broad occ classifications
	gen teachers = 0
	replace teachers = 1 if occ_type == 3
	replace teachers = . if employed == 0
	replace teachers = . if occ == .
	bys year: egen teacher_share = wtmean(teachers) if employed == 1, weight(perwt)
	
	gen hs = 0
	replace hs = 1 if occ_type == 2
	replace hs = . if employed == 0
	replace hs = . if occ == . 
	bys year: egen hs_share = wtmean(hs) if employed == 1, weight(perwt)
	
	gen ls = 0 
	replace ls = 1 if occ_type == 1
	replace ls = . if employed == 0
	replace ls = . if occ == . 
	bys year: egen ls_share = wtmean(ls) if employed == 1, weight(perwt)
	
	gen hs_type = 0
	replace hs_type = 1 if hs == 1
	replace hs_type = 2 if professionals == 1
	
	gen hs_prof = 0
	replace hs_prof = 1 if hs_type == 2 & teacher_type == .
	replace hs_prof = . if hs_type == .
	bys year: egen hs_prof_share = wtmean(hs_prof) if employed == 1, weight(perwt)
	
	gen hs_other = 0
	replace hs_other = 1 if hs_type == 1 & teacher_type == .
	replace hs_other = . if hs_type == .
	bys year: egen hs_other_share = wtmean(hs_other) if employed == 1, weight(perwt)

* 2. Shares of teachers in based on teacher type
	gen teachers_pri = 0
	replace teachers_pri = 1 if teacher_type == 1
	replace teachers_pri = . if employed == 0
	bys year: egen teacher_share_pri = wtmean(teachers_pri) if employed == 1, weight(perwt)
	
	gen teachers_sec = 0
	replace teachers_sec = 1 if teacher_type == 2
	replace teachers_sec = . if employed == 0
	bys year: egen teacher_share_sec = wtmean(teachers_sec) if employed == 1, weight(perwt)
	
	gen teachers_he = 0
	replace teachers_he = 1 if teacher_type == 3
	replace teachers_he = . if employed == 0
	bys year: egen teacher_share_he = wtmean(teachers_he) if employed == 1, weight(perwt)
	
	gen teachers_prisec = 0
	replace teachers_prisec = 1 if teacher_type == 5
	replace teachers_prisec = . if employed == 0
	bys year: egen teacher_share_prisec = wtmean(teachers_prisec) if employed == 1, weight(perwt)
	
	gen teachers_secter = 0
	replace teachers_secter = 1 if teacher_type == 6
	replace teachers_secter = . if employed == 0
	bys year: egen teacher_share_secter = wtmean(teachers_secter) if employed == 1, weight(perwt)
	
	gen teachers_unspec = 0
	replace teachers_unspec = 1 if teacher_type == 6
	replace teachers_unspec = . if employed == 0
	bys year: egen teacher_share_unspec = wtmean(teachers_unspec) if employed == 1, weight(perwt)
	
	** Shares composition within teaching occupation	
	bys year: egen primary_share = wtmean(teachers_pri) if teachers == 1 & employed == 1, weight(perwt)
	bys year: egen secondary_share = wtmean(teachers_sec) if teachers == 1 & employed == 1, weight(perwt)
	bys year: egen he_share = wtmean(teachers_he) if teachers == 1 & employed == 1, weight(perwt)
 	bys year: egen prisec_share = wtmean(teachers_prisec) if teachers == 1 & employed == 1, weight(perwt)
 	bys year: egen secter_share = wtmean(teachers_secter) if teachers == 1 & employed == 1, weight(perwt)
	bys year: egen unspec_share = wtmean(teachers_unspec) if teachers == 1 & employed == 1, weight(perwt)
	
* 3. Share of teachers in the high-skilled employed population
	gen teachers_hs = teachers * high_skill
	bys year: egen teacher_share_hs = wtmean(teachers_hs) if (employed == 1 & high_skill == 1), weight(perwt)

* 4. Share of teachers amongst indivdiuals holding university degrees
	gen teachers_uni = teachers * university
	bys year: egen teacher_share_uni = wtmean(teachers_uni) if (employed == 1 & university == 1), weight(perwt)
	
	gen hs_uni = hs * university
	bys year: egen hs_share_uni = wtmean(hs_uni) if (employed == 1 & university == 1), weight(perwt)

	gen ls_uni = ls * university
	bys year: egen ls_share_uni = wtmean(ls_uni) if (employed == 1 & university == 1), weight(perwt)
	
	bys year: egen teacher_share_uni_f = wtmean(teachers_uni) if (employed == 1 & university == 1 & sex == 2), weight(perwt)
	bys year: egen hs_share_uni_f = wtmean(hs_uni) if (employed == 1 & university == 1 & sex == 2), weight(perwt)
	bys year: egen ls_share_uni_f = wtmean(ls_uni) if (employed == 1 & university == 1 & sex == 2), weight(perwt)
	
	bys year: egen teacher_share_uni_m = wtmean(teachers_uni) if (employed == 1 & university == 1 & sex == 1), weight(perwt)
	bys year: egen hs_share_uni_m = wtmean(hs_uni) if (employed == 1 & university == 1 & sex == 1), weight(perwt)
	bys year: egen ls_share_uni_m = wtmean(ls_uni) if (employed == 1 & university == 1 & sex == 1), weight(perwt)
	
* 5. Occupation shares based on three broad occ classifications by gender
	gen female = 0 
	replace female = 1 if sex == 2
	replace female = . if sex == 9

	gen male = 0
	replace male = 1 if sex == 1
	replace male = . if sex == 9 
	
	* Gender shares within occupation
	bys year: egen male_share_teachers = wtmean(male) if employed == 1 & teachers == 1, weight(perwt)
	bys year: egen male_share_hs = wtmean(male) if employed == 1 & hs == 1, weight(perwt)
	bys year: egen male_share_ls = wtmean(male) if employed == 1 & ls == 1, weight(perwt)
	
	bys year: egen female_share_teachers = wtmean(female) if employed == 1 & teachers == 1, weight(perwt)
	bys year: egen female_share_hs = wtmean(female) if employed == 1 & hs == 1, weight(perwt)
	bys year: egen female_share_ls = wtmean(female) if employed == 1 & ls == 1, weight(perwt)
	
	* Share of occupation in the employed gender population 
	bys year: egen hs_share_f = wtmean(hs) if (employed == 1 & sex == 2), weight(perwt)
	
	bys year: egen hs_share_m = wtmean(hs) if (employed == 1 & sex == 1), weight(perwt)
		
	bys year: egen ls_share_f = wtmean(ls) if (employed == 1 & sex == 2), weight(perwt)
	
	bys year: egen ls_share_m = wtmean(ls) if (employed == 1 & sex == 1), weight(perwt)
		
	bys year: egen teachers_male_share = wtmean(teachers) if (employed == 1 & sex == 1), weight(perwt)
	
	bys year: egen teachers_female_share = wtmean(teachers) if (employed == 1 & sex == 2), weight(perwt)
	
	*Share of male and female university/HS teachers amongst the university and HS employed population
	
	gen teachers_uni_male = teachers_uni * male
	bys year: egen maleteacher_share_uni = wtmean(teachers_uni_male) if (employed == 1 & sex == 1 & university == 1), weight(perwt)
	
	gen teachers_uni_female = teachers_uni * female
	bys year: egen femaleteacher_share_uni = wtmean(teachers_uni_female) if (employed == 1 & sex == 2 & university == 1), weight(perwt)

	gen teachers_hs_male = teachers_hs * male
	bys year: egen maleteacher_share_hs = wtmean(teachers_hs_male) if (employed == 1 & high_skill == 1 & sex == 1), weight(perwt)
	
	gen teachers_hs_female = teachers_hs * female
	bys year: egen femaleteacher_share_hs = wtmean(teachers_hs_female) if (employed == 1 & high_skill == 1 & sex == 2), weight(perwt)
	
	
********************************************************************************
*[3] Age Profiles
********************************************************************************
	bys year: egen age_teachers = wtmean(age) if !missing(teacher_status), weight(perwt)

	bys year: egen age_teachers_f = wtmean(age) if !missing(teacher_status) & sex == 2 , weight(perwt)
	
	bys year: egen age_teachers_m = wtmean(age) if !missing(teacher_status) & sex == 1, weight(perwt)
	
	bys year: egen age_highskill = wtmean(age)  if teacher_status == . & employed == 1 & hs == 1 , weight(perwt)
	
	bys year: egen age_highskill_f = wtmean(age) if teacher_status == . & employed == 1 & sex == 2 & hs == 1 , weight(perwt)
	
	bys year: egen age_highskill_m = wtmean(age) if teacher_status == . & employed == 1 & sex == 1 & hs == 1, weight(perwt)
	
	bys year: egen age_lowskill = wtmean(age)  if teacher_status == . & employed == 1 & ls == 1 , weight(perwt)
	
	bys year: egen age_lowskill_f = wtmean(age) if teacher_status == . & employed == 1 & sex == 2 & ls == 1 , weight(perwt)
	
	bys year: egen age_lowskill_m = wtmean(age) if teacher_status == . & employed == 1 & sex == 1 & ls == 1, weight(perwt)
	
	bys year: egen age_workers = wtmean(age)  if teacher_status == . & employed == 1 , weight(perwt)
	
	bys year: egen age_workers_f = wtmean(age) if teacher_status == . & employed == 1 & sex == 2 , weight(perwt)
	
	bys year: egen age_workers_m = wtmean(age) if teacher_status == . & employed == 1 & sex == 1, weight(perwt)
	




	keep yrschool_teachers yrschool_prisec yrschool_he ///
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
    maleteacher_share_hs femaleteacher_share_hs ///
    hs_prof_share hs_other_share teacher_share_prisec ///
	teacher_share_secter teacher_share_unspec primary_share ///
	secondary_share he_share prisec_share secter_share unspec_share ///
	country year yrschool_hsworkers_prof

	
	
	