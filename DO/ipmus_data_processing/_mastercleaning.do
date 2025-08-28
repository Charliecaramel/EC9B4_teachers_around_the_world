********************************************************************************
* READ ME
********************************************************************************
* This do file is aimed to clean and process the data. This needs to be run
* before running _masterfile.do

*******************************************************************************
*[1] Importing raw IPMUS to STATA
*******************************************************************************
cd

cd ../..
foreach country in argentina armenia austria brazil bangladesh belarus benin bf bolivia botswana  canada cambodia cameroon chile china coloumbia cr cuba dr ecuador egypt es ethiopia fiji finland france ghana greece guatemala guinea haiti honduras hungary indonesia iran ireland israel italy jamaica jordan kenya kyrgyzstan laos lesotho liberia malawi malaysia mali mauritius mexico mongolia morocco mozambique nepal netherlands nicaragua pakistan panama papau paraguay peru philippines poland portugal Romania Russia Rwanda sa sengal sl slovakia slovenia spain suriname switzerland tanzania thailand tt turkey uganda uk ukraine uruguay venezuela vietnam zambia us {
	cd Data_ipmus/`country'
	local myfilelist : dir "." files "*.dta"
	local filename : word 1 of `myfilelist'
	display "`filename'"
    use "`filename'", clear
    quietly do "../../DO/ipmus_import.do" 
    save "../../Data_ipmus/`country'/`country'.dta",replace
    cd ../..
}




********************************************************************************
* [2] Cleaning imported data and merge with teacher status
********************************************************************************
foreach country in argentina armenia austria belarus brazil benin bf bolivia botswana canada cambodia cameroon chile china coloumbia cr cuba dr ecuador egypt es ethiopia fiji finland france ghana greece guatemala guinea haiti honduras hungary indonesia iran ireland israel italy jamaica jordan kenya kyrgyzstan laos lesotho liberia malawi malaysia mali mauritius mexico mongolia morocco mozambique nepal nicaragua pakistan panama papau paraguay peru philippines poland portugal Romania Rwanda sa sengal sl slovakia slovenia spain suriname switzerland tanzania thailand tt turkey uganda uruguay venezuela vietnam zambia us {
	use "Data_ipmus/`country'/`country'.dta",replace
	 quietly do "DO/ipumsint_cleaning.do" 
	save "Data_ipmus/`country'/`country'.dta",replace
}  


