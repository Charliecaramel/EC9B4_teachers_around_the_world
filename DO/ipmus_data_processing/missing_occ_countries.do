
clear all
clear
tempfile results
save `results', emptyok

foreach country in argentina armenia austria brazil belarus benin bf bolivia botswana cambodia cameroon canada chile china coloumbia cr cuba dr ecuador egypt es ethiopia fiji finland france ghana greece guatemala guinea haiti honduras hungary indonesia iran ireland israel italy jamaica jordan kenya kyrgyzstan laos lesotho liberia malawi malaysia mali mauritius mexico mongolia morocco mozambique nepal nicaragua pakistan panama papau paraguay peru philippines poland portugal Romania Rwanda sa sengal sl slovakia slovenia spain suriname switzerland tanzania thailand tt turkey uganda uruguay us venezuela vietnam zambia {
    global thiscountry `country' 
    use "Data_ipmus/`country'/`country'.dta", clear
	keep empstat country year occisco  occ
    
    * define employed
    qui gen employed = 0
    qui replace employed = 1 if empstat == 1
    qui replace employed = . if inlist(empstat,0,9)

    * clean occisco
    qui replace occisco = . if inlist(occisco,98,99)
**# Bookmark #1

    * construct tests
    qui gen test1 = . 
    qui replace test1 = 0 if employed == 1 & occisco == .
    qui replace test1 = 1 if employed == 1 & occisco != .
    
    qui gen test2 = . 
    qui replace test2 = 0 if employed == 1 & occ == .
    qui replace test2 = 1 if employed == 1 & occ != .

    keep country test1 test2 year

* collapse to mean -> gives proportion of ==1 automatically
collapse (mean) test1 test2, by(country year)

* rename for clarity
rename test1 prop_test1
rename test2 prop_test2

order country prop_test1 prop_test2
    
    append using `results'
    save `results', replace
}

use `results', clear
save "Data_ipmus/missing_occ_country.dta",replace 


*******************************************************************************
gen problem = .
replace problem = 0 if prop_test1 !=. 
replace problem = 1 if prop_test1 < 0.8 & prop_test1 !=.
replace problem = . if prop_test1 == 0

*******************************************************************************




