clear all
set more off
cd "C:\Users\cmlvh\OneDrive\Documents\Mres_PhD\Mres\Teachers\charlotte_files"
import excel "C:\Users\cmlvh\OneDrive\Documents\Mres_PhD\Mres\Teachers\charlotte_files\data_cleaning\piaac\pwt\worldbankclass.xlsx", sheet("Sheet5") firstrow
gen class = real(classification)
labmask class, values(classificationlabel)

kountry country, from(iso3c)
replace NAMES_="Serbia" if country=="Serbia"
drop country
rename NAMES_ country

replace country = "egypt" if country == "egypt arab rep"
replace country = "iran" if country == "iran islamic rep"
replace country = "turkey" if country == "türkiye"
replace country = "venezuela" if country =="venezuela rb"
replace country = "vietnam" if country == "viet nam"
replace country = "saint lucia" if country =="st lucia"
 
replace country = strlower(country)
save "C:\Users\cmlvh\OneDrive\Documents\Mres_PhD\Mres\Teachers\charlotte_files\data_cleaning\piaac\pwt\wbclass.dta", replace