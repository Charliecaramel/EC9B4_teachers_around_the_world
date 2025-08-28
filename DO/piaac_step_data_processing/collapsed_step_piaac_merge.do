
********************************************************************************
*[3] Collapsing the data to country_id country_id
********************************************************************************
collapse (mean) uni_teachers secondary_teachers primary_teachers lprimary_teachers ///
    uni_teachers_f secondary_teachers_f primary_teachers_f lprimary_teachers_f ///
    uni_teachers_m secondary_teachers_m primary_teachers_m lprimary_teachers_m ///
    uni_pri secondary_pri primary_pri lprimary_pri ///
    uni_sec secondary_sec primary_sec lprimary_sec ///
    uni_he secondary_he primary_he lprimary_he ///
    uni_pri_f secondary_pri_f primary_pri_f lprimary_pri_f ///
    uni_sec_f secondary_sec_f primary_sec_f lprimary_sec_f ///
    uni_he_f secondary_he_f primary_he_f lprimary_he_f ///
    uni_pri_m secondary_pri_m primary_pri_m lprimary_pri_m ///
    uni_sec_m secondary_sec_m primary_sec_m lprimary_sec_m ///
    uni_he_m secondary_he_m primary_he_m lprimary_he_m ///
    uni_workers secondary_workers primary_workers lprimary_workers ///
    uni_workers_f secondary_workers_f primary_workers_f lprimary_workers_f ///
    uni_workers_m secondary_workers_m primary_workers_m lprimary_workers_m ///
    uni_hs secondary_hs primary_hs lprimary_hs score_lit_q4_wt ///
    uni_hs_m secondary_hs_m primary_hs_m lprimary_hs_m ///
    uni_hs_f secondary_hs_f primary_hs_f lprimary_hs_f ///
	numscore_ls_p numscore_hs_p numscore_teachers_p ///
	litscore_ls_p litscore_hs_p litscore_teachers_p ///
	litscore_teachers numscore_teachers pslscore_teachers litscore_teachers_m numscore_teachers_m pslscore_teachers_m litscore_teachers_f numscore_teachers_f pslscore_teachers_f litscore_hs numscore_hs pslscore_hs litscore_hs_m numscore_hs_m pslscore_hs_m litscore_hs_f numscore_hs_f pslscore_hs_f litscore_ls numscore_ls pslscore_ls litscore_ls_m numscore_ls_m pslscore_ls_m litscore_ls_f numscore_ls_f pslscore_ls_f litscore_workers numscore_workers pslscore_workers litscore_workers_m numscore_workers_m pslscore_workers_m litscore_workers_f numscore_workers_f pslscore_workers_f ///
    teacher_share teacher_share_he teacher_share_sec teacher_share_pri teacher_share_hs teacher_share_uni ///
	age_lowskill age_lowskill_f age_lowskill_m ///
    teachers_male_share teachers_female_share ///
	age_teachers age_teachers_f age_teachers_m age_highskill age_highskill_f age_highskill_m age_workers age_workers_f age_workers_m ///
    maleteacher_share_uni femaleteacher_share_uni maleteacher_share_hs femaleteacher_share_hs, ///
    by(country_id year)

decode country_id, gen(country_str)
replace country_str = lower(country_str)
merge 1:1 country_str year using "pwt_gdp.dta"
drop if _m == 2
