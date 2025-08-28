********************************************************************************
* PIAAC Analysis of Congintive Skills across economies
********************************************************************************

* Country labels 
************************ country
kountry cntryid, from(iso3n)
rename NAMES_STD country
replace country = "United States" if cntryid == 84093

************************ sample restrictions (countries)
drop if country=="Russia"
egen id_country=group(country)


* Standardised test scores
rename spfwt0 weight
bys country: egen totw=sum(weight)
gen perwt = weight/totw

gen score_lit=.
gen score_num=.
gen score_psl =.


levelsof id_country, local(country)
foreach cname of local country{
	foreach s in num lit psl{
	sum pv`s'1 [aw=weight/totw] if id_country == `cname', det 
	gen mean_pv`s'1 = r(mean) if id_country == `cname'
	gen var_pv`s'1 = r(Var) if id_country == `cname'
	gen sd_pv`s'1= sqrt(var_pv`s'1) if id_country == `cname'

	replace score_`s'= (pv`s'1 - mean_pv`s'1)/sd_pv`s'1 if id_country == `cname'
	}
	drop mean_* var_* sd_*
}


* Other variables
* 1. Classifying Teachers 
gen teacher=1 if substr(isco08_c,1,2)=="23" |  substr(isco08_cus_c,1,2) == "23"
gen teacher_type=.
replace teacher_type=1 if substr(isco08_c,1,3)=="234" | substr(isco08_cus_c,1,3)=="234"
replace teacher_type=2 if substr(isco08_c,1,3)=="232" | substr(isco08_c,1,3)=="233" | substr(isco08_cus_c,1,3)=="232" | substr(isco08_cus_c,1,3)=="233"
replace teacher_type=3 if substr(isco08_c,1,3)=="231" | substr(isco08_cus_c,1,3)=="231"
replace teacher_type=4 if substr(isco08_c,1,3)=="235" | isco08_c=="23" | substr(isco08_cus_c,1,3)=="235" | isco08_cus_c =="23"
label define teach 1 "Primary" 2 "Secondary" 3 "Tertiary" 4 "Not spec" 
label values teacher_type teach

* --- Teacher proxy for countries where isco08 is not collected
gen skilled_occ = 0
replace skilled_occ = 1 if substr(isco08_c,1,1) == "1" | substr(isco08_c,1,1) == "2" | substr(isco08_c,1,1) == "3"
replace skilled_occ = 1 if substr(isco08_cus_c,1,1) == "1" | substr(isco08_cus_c,1,1) == "2" | substr(isco08_cus_c,1,1) == "3"
replace skilled_occ = . if substr(isco08_c,1,3) == "999" & country != "United States"
replace skilled_occ = . if substr(isco08_cus_c,1,3)== "999" & country == "United States"


gen professional = 0
replace professional = 1 if substr(isco08_c,1,1)=="2"
replace professional = 1 if substr(isco08_cus_c,1,1)=="2"
replace professional  = . if substr(isco08_c,1,3) == "999" & country != "United States"
replace professional  = . if substr(isco08_cus_c,1,3)== "999" & country == "United States"

gen education_ind = 0
replace education_ind = 1 if isic1c == "P"
replace education_ind = . if substr(isic1c,1,3) == "999"
gen teacher_proxy = professional * education_ind
tab teacher_proxy teacher

* 2. Education Level using ISCED classification 
gen edu=.
replace edu=1 if b_q01a==1 | b_q01a==2 // ISCED 1 or below
replace edu=2 if b_q01a==3  // ISCED 2
replace edu=3 if b_q01a==4 | b_q01a==5 | b_q01a==6 | b_q01a==7 // ISCED 3
replace edu=4 if b_q01a==8 | b_q01a==9 | b_q01a==10 // ISCED 4
replace edu=5 if  b_q01a==11 | b_q01a==12 | b_q01a==13 | b_q01a==14 | b_q01a==16 // ISCED 5 or above 

replace edu=1 if yrsqual==6 & edu==. //impute from yrsqual from Canada & Estonia
replace edu=2 if yrsqual==9 & edu==.
replace edu=3 if yrsqual==12 & edu==.
replace edu=4 if (yrsqual==13 | yrsqual==14)  & edu==.
replace edu=5 if yrsqual>=16 & yrsqual>=16!=. & edu==.

label define edu 1"ISCED 1 or below" 2"ISCED 2 - 3C" 3"ISCED 3" 4"ISCED 4" 5"ISCED 5A and above" 
label values edu edu


gen edattain = .
replace edattain = 1 if edu == 5 // University
replace edattain = 2 if inlist(edu, 3, 4) // Secondary
replace edattain = 3 if edu == 2 // Primary
replace edattain = 4 if edu == 1 // Less than primary

label define edattain 1 "University" 2 "Secondary" 3 "Primary" 4 "Less than primary"
label values edattain edattain


* 3. Focusing on specifically university and above education
gen bachelors = .
replace bachelors  = 1 if b_q01a == 12

gen masters = .
replace masters = 1 if b_q01a == 13

gen pg_high = .
replace pg_high = 1 if b_q01a == 14


* 4. The required level of qualification for their occupation (Perceived?)
gen edu_req =. 
replace edu_req = 1 if d_q12a == 1 | d_q12a == 2
replace edu_req = 2 if d_q12a == 3 | d_q12a == 4
replace edu_req = 3 if d_q12a == 5 | d_q12a == 6 | d_q12a == 7
replace edu_req = 4 if d_q12a == 8 | d_q12a == 9 | d_q12a == 10 | d_q12a == 11
replace edu_req = 5 if d_q12a == 12 | d_q12a == 13 | d_q12a == 14 | d_q12a == 15



* 5. Wages
*    (a) Continuous Wages
gen wage=earnhrppp
replace wage=. if wage==.v | wage==.n
gen available_cwage_t = 1 if wage!=.
bys country: egen available_cwage=max(available_cwage_t)

*    (b) Triming
gen wage_tr=.

forvalues i=1(1)35{
qui sum wage if id_country==`i', d
replace wage_tr=wage if wage>=r(p1) & wage<=r(p99) & available_cwage==1 & id_country==`i' 
}

*    (c) Imputed wages based on deciles
gen wage_imp=wage
replace earnhrdcl=. if earnhrdcl>10

//Austria
replace	wage_imp	=	31.3		if 	cntryid==40 &	earnhrdcl ==10
replace	wage_imp	=	23.4		if 	cntryid==40 &	earnhrdcl ==9
replace	wage_imp	=	19.8		if 	cntryid==40 &	earnhrdcl ==8
replace	wage_imp	=	17.4		if 	cntryid==40 &	earnhrdcl ==7
replace	wage_imp	=	15.6		if 	cntryid==40 &	earnhrdcl ==6
replace	wage_imp	=	14.0		if 	cntryid==40 &	earnhrdcl ==5
replace	wage_imp	=	12.6		if 	cntryid==40 &	earnhrdcl ==4
replace	wage_imp	=	11.0		if 	cntryid==40 &	earnhrdcl ==3
replace	wage_imp	=	9.5			if 	cntryid==40 &	earnhrdcl ==2
replace	wage_imp	=	6.9			if 	cntryid==40 &	earnhrdcl ==1

//Canada
replace	wage_imp	=	39.0	    if 	cntryid==124 &	earnhrdcl ==10
replace	wage_imp	=	30.1		if 	cntryid==124 &	earnhrdcl ==9
replace	wage_imp	=	25.0	    if 	cntryid==124 &	earnhrdcl ==8
replace	wage_imp	=	21.1		if 	cntryid==124 &	earnhrdcl ==7
replace	wage_imp	=	18.3		if 	cntryid==124 &	earnhrdcl ==6
replace	wage_imp	=	15.7		if 	cntryid==124 &	earnhrdcl ==5
replace	wage_imp	=   13.6		if 	cntryid==124 &	earnhrdcl ==4
replace	wage_imp	=	11.4	 	if 	cntryid==124 &	earnhrdcl ==3
replace	wage_imp	=	9.2			if 	cntryid==124 &	earnhrdcl ==2
replace	wage_imp	=	8.1			if 	cntryid==124 &	earnhrdcl ==1

//Germany
replace	wage_imp	=	36.0		if 	cntryid==276 &	earnhrdcl ==10
replace	wage_imp	=	28.0		if 	cntryid==276 &	earnhrdcl ==9
replace	wage_imp	=	22.9		if 	cntryid==276 &	earnhrdcl ==8
replace	wage_imp	=	19.8		if 	cntryid==276 &	earnhrdcl ==7
replace	wage_imp	=	17.4		if 	cntryid==276 &	earnhrdcl ==6
replace	wage_imp	=	15.2		if 	cntryid==276 &	earnhrdcl ==5
replace	wage_imp	=	12.8		if 	cntryid==276 &	earnhrdcl ==4
replace	wage_imp	=	10.8		if 	cntryid==276 &	earnhrdcl ==3
replace	wage_imp	=	8.6			if 	cntryid==276 &	earnhrdcl ==2
replace	wage_imp	=	5.5			if 	cntryid==276 &	earnhrdcl ==1


//Sweden							
replace	wage_imp	=	30.5		if 	cntryid==752 &	earnhrdcl ==10
replace	wage_imp	=	24.2		if 	cntryid==752 &	earnhrdcl ==9
replace	wage_imp	=	21.0		if 	cntryid==752 &	earnhrdcl ==8
replace	wage_imp	=	19.0		if 	cntryid==752 &	earnhrdcl ==7
replace	wage_imp	=	17.6		if 	cntryid==752 &	earnhrdcl ==6
replace	wage_imp	=	16.6		if 	cntryid==752 &	earnhrdcl ==5
replace	wage_imp	=	15.5		if 	cntryid==752 &	earnhrdcl ==4
replace	wage_imp	=	14.5		if 	cntryid==752 &	earnhrdcl ==3
replace	wage_imp	=	13.3		if 	cntryid==752 &	earnhrdcl ==2
replace	wage_imp	=	11.5		if 	cntryid==752 &	earnhrdcl ==1

//United States						
replace	wage_imp	=	51.5		if 	cntryid==840 &	earnhrdcl ==10
replace	wage_imp	=	33.8		if 	cntryid==840 &	earnhrdcl ==9
replace	wage_imp	=	26.4		if 	cntryid==840 &	earnhrdcl ==8
replace	wage_imp	=	22.0		if 	cntryid==840 &	earnhrdcl ==7
replace	wage_imp	=	18.2		if 	cntryid==840 &	earnhrdcl ==6
replace	wage_imp	=	15.3		if 	cntryid==840 &	earnhrdcl ==5
replace	wage_imp	=	13.0		if 	cntryid==840 &	earnhrdcl ==4
replace	wage_imp	=	10.8		if 	cntryid==840 &	earnhrdcl ==3
replace	wage_imp	=	9.0			if 	cntryid==840 &	earnhrdcl ==2
replace	wage_imp	=	7.4			if 	cntryid==840 &	earnhrdcl ==1

replace	wage_imp	=	51.5		if 	cntryid==84093 &	earnhrdcl ==10
replace	wage_imp	=	33.8		if 	cntryid==84093 &	earnhrdcl ==9
replace	wage_imp	=	26.4		if 	cntryid==84093 &	earnhrdcl ==8
replace	wage_imp	=	22.0		if 	cntryid==84093 &	earnhrdcl ==7
replace	wage_imp	=	18.2		if 	cntryid==84093 &	earnhrdcl ==6
replace	wage_imp	=	15.3		if 	cntryid==84093 &	earnhrdcl ==5
replace	wage_imp	=	13.0		if 	cntryid==84093 &	earnhrdcl ==4
replace	wage_imp	=	10.8		if 	cntryid==84093 &	earnhrdcl ==3
replace	wage_imp	=	9.0			if 	cntryid==84093 &	earnhrdcl ==2
replace	wage_imp	=	7.4			if 	cntryid==84093 &	earnhrdcl ==1

//Turkey
//Hungary
//Peru
//Singapore

*** trimmed
gen wage_imp_tr = wage_imp if available_cwage==.
replace wage_imp_tr=wage_tr if available_cwage==1

gen l_wage = log(wage)
gen l_wage_tr = log(wage_tr)
gen l_wage_imp = log(wage_imp)
gen l_wage_imp_tr = log(wage_imp_tr)


* 6. Demograpgic Variables
*    (a) Age 
gen age=age_r
replace age=. if age==.n
replace age=17.5 if ageg5lfs==1 & age==.
replace age=22 if ageg5lfs==2 & age==.
replace age=27 if ageg5lfs==3 & age==.
replace age=32 if ageg5lfs==4 & age==.
replace age=37 if ageg5lfs==5 & age==.
replace age=42 if ageg5lfs==6 & age==.
replace age=47 if ageg5lfs==7 & age==.
replace age=52 if ageg5lfs==8 & age==.
replace age=57 if ageg5lfs==9 & age==.
replace age=62.5 if ageg5lfs==10 & age==.

replace age=24 if ageg10lfs == 1 & age == .

*    (b) Effective labour market expereince
gen age_complete = b_q01c1 if b_q01c1 != .
replace age_complete = 15 if b_q01c1 == . & b_q01c1_c == 1
replace age_complete = 17.5 if b_q01c1 == . & b_q01c1_c == 2
replace age_complete = 22 if b_q01c1 == . & b_q01c1_c == 3
replace age_complete = 27 if b_q01c1 == . & b_q01c1_c == 4
replace age_complete = 31.5 if b_q01c1 == . & b_q01c1_c == 5
replace age_complete = 35 if b_q01c1 == . & b_q01c1_c == 6

gen expereince = age - age_complete if age_complete !=.


*     (c) Gender
gen female = .
replace female = 1 if gender_r == 2
replace female = 0 if gender_r == 1


*     (d) Employment status B_Q15a D_Q04

gen employed = .
replace employed = 1 if c_d05 == 1
replace employed = 0 if c_d05 == 2

gen wage_worker = 1 if d_q04 == 1
replace wage_worker = 0 if d_q04 == 2

*     (e) Waiting to start job C_Q02b C_Q02c
gen new_joiner = .
replace new_joiner = 1 if c_q02b == 1
replace new_joiner = 0 if c_q02b == 2



*** Generating three occupation groups
gen teachers = 0 
replace teachers = 1 if teacher_type !=.
gen occupation = .
replace occupation = 1 if skilled_occ == 0 & teachers == 0
replace occupation = 2 if skilled_occ == 1 & teachers == 0
replace occupation = 3 if teachers == 1

label define occupation_code 1"Low skill occuptaion" 2"Other high skill occupation" 3"Teachers"
label value occupation occupation_code

keep country pvnum1 pvlit1 pvpsl1 weight perwt score_lit score_num score_psl ///
     teacher teacher_type skilled_occ professional education_ind teacher_proxy ///
     edu edattain bachelors masters pg_high edu_req ///
     wage available_cwage_t available_cwage wage_tr wage_imp wage_imp_tr ///
     l_wage l_wage_tr l_wage_imp l_wage_imp_tr employed wage_worker ///
     age age_complete expereince female employed new_joiner ///
     teachers occupation isco08_c isco08_cus_c readwork writwork readwork_wle_ca writwork_wle_ca
	 



