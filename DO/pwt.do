clear
set more off


cd .. 

use "pwt.dta", clear

gen y=rgdpo/pop
gen l_y=log(y)

gen y_us_t=y if country=="United States"
bys year: egen y_us=mean(y_us_t)
gen y_relUS=y/y_us

******* GDP Relative to US in 2000
gen y_relUS_2000_t = y_relUS if year==2000
bys country: egen y_relUS_2000=mean(y_relUS_2000_t)

gen income_group=1 if y_relUS_2000<=0.1 & y_relUS_2000!=.
replace income_group=2 if y_relUS_2000>0.1 & y_relUS_2000<=0.45 & y_relUS_2000!=.
replace income_group=3 if y_relUS_2000>0.45 & y_relUS_2000!=.

***corrections
kountry countrycode, from(iso3c)
replace NAMES_="Serbia" if country=="Serbia"
drop country
rename NAMES_ country

keep country countrycode year y l_y income_group
replace country = strlower(country)
rename country country_str
save "pwt_gdp.dta", replace
