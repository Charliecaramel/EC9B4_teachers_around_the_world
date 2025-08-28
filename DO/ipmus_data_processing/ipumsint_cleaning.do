*******************************************************************************
* README 
*******************************************************************************
* This is a DO fiile used to process imported IMPUS international data into a
* format where we can make cross-country comparisons.

* The focus is to generate a data set where we can see how relative wages differ
* across nations.

*******************************************************************************



*******************************************************************************
*  [1] Sample Restrictions
*******************************************************************************
* Creating alternative country and sample identifiers for merging datasets
	decode sample, gen(sample_str)
	decode country, gen(country_str)
	
	replace sample_str = proper(sample_str)
	replace country_str = proper(country_str)

* Restricting observations to include incividuals aged 25 to 80
	replace age = . if age ==999
	gen birth_year = year - age if age != . 
	replace birth_year = . if age == .
	gen start_work = birth_year + 25
	gen end_work = start_work + 55
	gen in_cohort = 1 if year >= start_work & year <= end_work
	sort country year in_cohort birth_year
	keep if in_cohort == 1

* Creating varibales to indicate any sample restrictions from IPMUS
	gen yrschool_unavailable = 1 if sample_str == "Brazil 2010" | country_str == "Canada" | sample_str == "Indonesia 1971"| sample_str == "Indonesia 2000"|sample_str == "Indonesia 2010"| country_str == "Israel" | sample_str == "Puerto Rico 1990" | sample_str == "Puerto Rico 2000" | sample_str == "Puerto Rico 2005" | sample_str == "Trinidad and Tobago 1970" | sample_str == "United States 1990"| sample_str == "United States 2000"| sample_str == "United States 2005"| sample_str == "Uruguay 2011" | country_str == "Armenia" | country_str == "Austria"|country_str == "Belarus"| country_str == "Burkina Faso"| country_str == "China" | sample_str == "Cuba 2002" | sample_str == "Ivory Coast 1988" | country_str == "Egypt" | sample_str == "Fiji 1966" | sample_str == "Finland 2010" | country_str == "France" | country_str == "Greece" |sample_str == "Hungary 1970" | sample_str == "Hungary 2001" | sample_str == "Hungary 2011" | sample_str == "Indonesia 1970"| sample_str == "Indonesia 2010" | country_str == "Ireland" | country_str == "Italy" | country_str == "Jordan" | country_str == "Kyrgyzstan" | sample_str == "Malaysia 1970" | sample_str == "Malaysia 2000" | sample_str == "Mali 1987" | country_str == "Mongolia" |country_str == "Mozambique" |country_str == "Netherlands" | country_str == "Poland" | country_str == "Portugal"| country_str == "Romania" | country_str == "Russia" | sample_str == "Rwanda 1991" | country_str == "Slovakia" | country_str == "Spain" | country_str == "Suriname" | country_str == "Switzerland"| country_str == "Turkey" | country_str == "Ukraine" | country_str == "United Kingdom" | sample_str == "Uruguay 2011"
	 
	gen empstat_unavailable = 1 if sample_str == "Indonesia 2000" | sample_str == "Indonesia 2005" | sample_str == "Israel 1983" | sample_str == "Mexico 1960"| sample_str == "Mexico 2005"| sample_str == "Puerto Rico 1970"| sample_str == "Puerto Rico 1980"| sample_str == "South Africa 2016"|sample_str == "China 2000"| sample_str == "Ethiopia 1984" | sample_str == "Ethiopia 1994" | sample_str == "Fiji 1966"| sample_str == "Hungary 1970" | sample_str == "Hungary 1980"| sample_str == "Ireland 1979"| sample_str == "Kenya 1969" | sample_str == "Kenya 1979" |sample_str == "Netherlands 1960" | sample_str == "Netherlands 1971"| sample_str == "Philippines 2000"| sample_str == "Philippines 2010"| sample_str == "Poland 1988"| sample_str == "Poland 2011"| sample_str == "Romania 1977"| country_str == "Thailand"| sample_str == "United Kingdom 1961"| sample_str == "United Kingdom 1971"
	
	gen labforce_unavailable = 1 if empstat_unavailable == 1
	
	gen occisco_unavailable = 1 if sample_str == "Indonesia 2000" |sample_str == "Indonesia 2010" | country_str == "Israel"|sample_str == "Mexico 2005" |sample_str == "Mexico 2020" | sample_str == "South Africa 2011"| sample_str == "South Africa 2016"| sample_str == "Trinidad and Tobago 1970"| sample_str == "Trinidad and Tobago 2011"| sample_str == "Uruguay 2011"| sample_str == "Venezuela 2011" | country_str == "Bangladesh" | country_str == "Laos" | country_str == "Russia" | country_str == "Ukraine"
	
	gen hrswork1_unavailable = 1 if sample_str == "Brazil 1960" | sample_str == "Brazil 1970"| sample_str == "Brazil 2010" | sample_str == "Canada 1971" | sample_str == "Dominican Republic 1960"| sample_str == "Dominican Republic 1970"| sample_str == "Dominican Republic 2000"| sample_str == "Dominican Republic 2010"| sample_str == "Indonesia 1971"| sample_str == "Indonesia 1976"| sample_str == "Indonesia 2000" |  sample_str == "Indonesia 2010" | country_str == "Israel" | sample_str == "Mexico 1960" | sample_str == "Mexico 1970" | sample_str == "Mexico 2005" | sample_str == "Mexico 2015" | sample_str == "Panama 1960" | sample_str == "Panama 1980"| sample_str == "Panama 1990"| sample_str == "Panama 2000"| sample_str == "Panama 2010" | sample_str == "Puerto Rico 1970" | sample_str == "South Africa 1996" | sample_str == "South Africa 2007"| sample_str == "South Africa 2011"| sample_str == "South Africa 2016" | sample_str == "Trinidad and Tobago 1980" | sample_str == "Trinidad and Tobago 1990"| sample_str == "Trinidad and Tobago 2000"  | sample_str == "Trinidad and Tobago 2011" | sample_str == "United States 1960"| sample_str == "United States 1970"| country_str == "Uruguay" | sample_str == "Venezuela 1971"| sample_str == "Venezuela 1990" | country_str == "Argentina" | country_str == "Armenia"| country_str == "Austria" | country_str == "Bangladesh" | country_str == "Belarus" | country_str == "Benin" | country_str == "Bolivia"| country_str == "Botswana" |country_str == "Burkina Faso" | country_str == "Cambodia" | country_str == "Cameroon" | country_str == "Chile" | country_str == "China" | country_str == "Colombia"| country_str == "Costa Rica" | country_str == "Cuba" | country_str == "Ivory Coast" | country_str == "Ecuador" | country_str == "Egypt" | country_str == "El Salvador" | country_str == "Ethiopia"|country_str == "Fiji" | country_str == "Finland" | country_str == "France" | country_str == "Ghana" | country_str == "Greece" | country_str == "Guatemala" | country_str == "Guinea" |country_str == "Haiti" | country_str == "Honduras" | country_str == "Hungary" |country_str == "Indonesia" | country_str == "Iran" | country_str == "Ireland" | country_str == "Italy" | country_str == "Jamaica"| country_str == "Jordan" | country_str == "Kenya" | country_str == "Kyrgyzstan" | country_str == "Laos" | country_str == "Lesotho" | country_str == "Liberia" | country_str == " Malawi" | country_str == "Malaysia" | country_str == "Mali"| country_str == "Mauritius" | country_str == "Mongolia" | country_str == "Morocco" | country_str == "Mozambique" | country_str == "Nepal" | country_str == "Netherlands" | country_str == "Nicaragua" | country_str == "Pakistan" | country_str == "Papua New Guinea" | country_str == "Peru" |country_str == "Philippines" | country_str == "Poland" | country_str == "Portugal" | country_str == "Romania" | country_str == "Russia" | country_str == "Rwanda"|country_str == "Saint Lucia" | country_str == "Senegal" | country_str == "Sierra Leone" | country_str == "Slovakia" | country_str == "Slovenia" | country_str == "South Sudan" | country_str == "Spain" | country_str == "Suriname" | country_str == "Switzerland" | country_str == "Tanzania"| country_str == "Thailand" | country_str == "Togo" | country_str == "Turkey"| country_str == "Uganda"| country_str == "United Kingdom" | country_str == "Vietnam" | country_str == "Zambia"
	
	gen hrsusuak1_only = 1 if sample_str == "Brazil 2010" | sample_str == "Uruguay 2006"
	
	gen hrsactual1_only = 1 if sample_str == "Indonesia 1976" | sample_str == "Panama 1980"
	
	gen hrswork2_only = 1 if sample_str == "Brazil 1980" | country_str == "Israel" | sample_str == "Puerto Rico 1970" |sample_str == "Trinidad and Tobago 1980" | sample_str == "Trinidad and Tobago 1990"| sample_str == "Trinidad and Tobago 2000" |sample_str == "Venezuela 1971"
	
	gen hrs_available = 1 if hrswork1_unavailable != 1
	replace hrs_available = 1 if hrsusuak1_only == 1| hrsactual1_only == 1| hrswork2_only == 1

	gen incwage_unavailble  = 1 if country_str=="Brazil" | sample_str == "Canada 2011"| sample_str == "Dominican Republic 1960"| sample_str == "Dominican Republic 1970"| sample_str == "Dominican Republic 2002"| sample_str == "Dominican Republic 2010"| sample_str == "Indonesia 1971"| sample_str == "Indonesia 1980"| sample_str == "Indonesia 1985"| sample_str == "Indonesia 1990"| sample_str == "Indonesia 2000"| sample_str == "Indonesia 2005"| sample_str == "Indonesia 2010"| sample_str == "Israel 1972" | country_str == "Mauritius"| country_str=="Mexico"| sample_str == "Panama 1970" | country_str=="Panama 1980" | country_str == "South Africa" | sample_str == "Trinidad and Tobago 1970"| sample_str == "Trinidad and Tobago 1980"| sample_str == "Trinidad and Tobago 1990"| sample_str == "Trinidad and Tobago 2011"| sample_str == "Uruguay 1963"| sample_str == "Uruguay 1975"| sample_str == "Uruguay 1975"| sample_str == "Uruguay 1985"| sample_str == "Uruguay 1996"| sample_str == "Uruguay 2011"|  country_str=="Venezuela"| country_str == "Argentina" | country_str == "Armenia"| country_str == "Austria" | country_str == "Bangladesh" | country_str == "Belarus" | country_str == "Benin" | country_str == "Bolivia"| country_str == "Botswana" |country_str == "Burkina Faso" | country_str == "Cambodia" | country_str == "Cameroon" | country_str == "Chile" | country_str == "China" | country_str == "Colombia"| country_str == "Costa Rica" | country_str == "Cuba" | country_str == "Ivory Coast" | country_str == "Ecuador" | country_str == "Egypt" | country_str == "El Salvador" | country_str == "Ethiopia"|country_str == "Fiji" | country_str == "Finland" | country_str == "France" | country_str == "Ghana" | country_str == "Greece" | country_str == "Guatemala" | country_str == "Guinea" |country_str == "Haiti" | country_str == "Honduras" | country_str == "Hungary" |country_str == "Indonesia" | country_str == "Iran" | country_str == "Ireland" | country_str == "Italy" | country_str == "Jamaica"| country_str == "Jordan" | country_str == "Kenya" | country_str == "Kyrgyzstan" | country_str == "Laos" | country_str == "Lesotho" | country_str == "Liberia" | country_str == " Malawi" | country_str == "Malaysia" | country_str == "Mali"| country_str == "Mauritius" | country_str == "Mongolia" | country_str == "Morocco" | country_str == "Mozambique" | country_str == "Nepal" | country_str == "Netherlands" | country_str == "Nicaragua" | country_str == "Pakistan" | country_str == "Papua New Guinea" | country_str == "Peru" |country_str == "Philippines" | country_str == "Poland" | country_str == "Portugal" | country_str == "Romania" | country_str == "Russia" | country_str == "Rwanda"|country_str == "Saint Lucia" | country_str == "Senegal" | country_str == "Sierra Leone" | country_str == "Slovakia" | country_str == "Slovenia" | country_str == "South Sudan" | country_str == "Spain" | country_str == "Suriname" | country_str == "Switzerland" | country_str == "Tanzania"| country_str == "Thailand" | country_str == "Togo" | country_str == "Turkey"| country_str == "Uganda"| country_str == "United Kingdom" | country_str == "Vietnam" | country_str == "Zambia"
	
	gen incearn_only = 1 if sample_str == "Brazil 1980"| sample_str == "Brazil 1991"| sample_str == "Brazil 2000"| sample_str == "Brazil 2010"| sample_str == "Canada 2011"| sample_str == "Israel 1972"| sample_str == "Mexico 1960" | sample_str == "Mexico 1990" | sample_str == "Mexico 1995" | sample_str == "Mexico 2000"| sample_str == "Mexico 2010" |sample_str == "Mexico 2015" | sample_str == "Mexico 2020"| country_str=="Venezuela"
	
	gen inctot_only = 1 if sample_str == "Brazil 1960"| sample_str == "Brazil 1970"| sample_str == "Dominican Republic 2002"| sample_str == "Mauritius 2000"| sample_str == "Mexico 1970"| sample_str == "Panama 1980" | country_str == "South Africa"| sample_str == "Trinidad and Tobago 1970"
	
	gen income_avaliable = 1 if incwage_unavailble == . | incearn_only == 1 | inctot_only == 1
	
********************************************************************************
*[2] Educational Attainments
********************************************************************************
	capture confirm variable yrschool
	if _rc {
		gen yrschool = . if country_str == "Canada" | country_str == "Israel" |country_str == "Armenia" | country_str == "Austria" | country_str == "Belarus" | sample_str== "Burkina Faso 1996"|sample_str == "Burkina Faso 2006" | sample_str == "Cuba 2002"| sample_str == "Ivory Coast 1988" | country_str == "Egypt" | country_str == "Fiji" | sample_str == "Finland 2010"| country_str == "France" | country_str == "Greece" | sample_str == "Hungary 1970" | sample_str == "Hungary 2001" | sample_str == "Hungary 2011"| country_str == "Iran" | country_str == "Ireland" | country_str == "Italy" |country_str == "Jordan" | country_str == "Kyrgyzstan" | sample_str == "Malaysia 1970" | sample_str == "Malaysia 2000" | sample_str == "Mali 1987"| country_str == "Mongolia" | country_str == "Mozambique" | country_str == "Netherlands"| country_str == "Pakistan"| country_str == "Poland" | country_str == "Portugal"| country_str == "Romania" | country_str == "Russia"| sample_str == "Rwanda 1991"| country_str == "Saint Lucia"| country_str == "Slovakia" | country_str == "Slovenia"| country_str == "South Sudan" | country_str == "Spain" | country_str == "Sudan" country_str == "Suriname" | country_str == "Switzerland"| country_str == "Togo" | country_str == "Turkey" | country_str == "Ukraine" | country_str == "United Kingdom"
}
	
	gen year_school = yrschool
	replace year_school = . if yrschool == 90 |yrschool == 91 |yrschool == 92 |yrschool == 93 |yrschool == 94 |yrschool == 95 |yrschool == 96 |yrschool == 98 |yrschool == 99 
	
	replace year_school = 3 if edattain == 1 & country_str == "Canada" 
	replace year_school = 6 if edattain == 2 & country_str == "Canada" 
	replace year_school = 12 if edattain == 3 & country_str == "Canada" 
	replace year_school = 15 if edattain == 4 & country_str == "Canada" 
	
	replace year_school = 3 if edattain == 1 & country_str == "Israel" 
	replace year_school = 6 if edattain == 2 & country_str == "Israel"
	replace year_school = 12 if edattain == 3 & country_str == "Israel"
	replace year_school = 15 if edattain == 4 & country_str == "Israel"
	
	replace year_school = 3 if edattain == 1 & sample_str == "Brazil 2010"
	replace year_school = 5 if edattain == 2  & sample_str == "Brazil 2010"
	replace year_school = 12 if edattain == 3  & sample_str == "Brazil 2010"
	replace year_school = 15 if edattain == 4   & sample_str == "Brazil 2010"
	
	replace year_school = 3 if edattain == 1 & (sample_str == "Indonesia 1971" | sample_str == "Indonesia 2000" | sample_str == "Indonesia 2010")
	replace year_school = 6 if edattain == 2  & (sample_str == "Indonesia 1971" | sample_str == "Indonesia 2000" | sample_str == "Indonesia 2010")
	replace year_school = 12 if edattain == 3  & (sample_str == "Indonesia 1971" | sample_str == "Indonesia 2000" | sample_str == "Indonesia 2010")
	replace year_school = 15 if edattain == 4  & (sample_str == "Indonesia 1971" | sample_str == "Indonesia 2000" | sample_str == "Indonesia 2010")
	
	replace year_school = 3 if edattain == 1 & sample_str == "Puerto Rico 1990"
	replace year_school = 8 if edattain == 2 & sample_str == "Puerto Rico 1990"
	replace year_school = 14 if edattain == 3 & sample_str == "Puerto Rico 1990"
	replace year_school = 17 if edattain == 4 & sample_str == "Puerto Rico 1990"

	replace year_school = 3 if edattain == 1 & sample_str == "Puerto Rico 2000"
	replace year_school = 6 if edattain == 2 & sample_str == "Puerto Rico 2000"
	replace year_school = 12 if edattain == 3 & sample_str == "Puerto Rico 2000"
	replace year_school = 15 if edattain == 4 & sample_str == "Puerto Rico 2000"

	replace year_school = 3 if edattain == 1 & sample_str == "Puerto Rico 2005"
	replace year_school = 6 if edattain == 2 & sample_str == "Puerto Rico 2005"
	replace year_school = 12 if edattain == 3 & sample_str == "Puerto Rico 2005"
	replace year_school = 15 if edattain == 4 & sample_str == "Puerto Rico 2005"
	
	replace year_school = 3 if edattain == 1 & sample_str == "Trinidad and Tobago 1970"
	replace year_school = 7 if edattain == 2 & sample_str == "Trinidad and Tobago 1970"
	replace year_school = 12 if edattain == 2 & sample_str == "Trinidad and Tobago 1970"
	replace year_school = 15 if edattain == 2 & sample_str == "Trinidad and Tobago 1970"
	
	replace year_school = 3 if edattain == 1 & (sample_str == "United States 1990"| sample_str == "United States 2000"| sample_str == "United States 2005")
	replace year_school = 6 if edattain == 2 & (sample_str == "United States 1990"| sample_str == "United States 2000"| sample_str == "United States 2005")
	replace year_school = 12 if edattain == 3 & (sample_str == "United States 1990"| sample_str == "United States 2000"| sample_str == "United States 2005")
	replace year_school = 15 if edattain == 4 & (sample_str == "United States 1990"| sample_str == "United States 2000"| sample_str == "United States 2005")
	
	replace year_school = 3 if edattain == 1 & sample_str == "Uruguay 2011"
	replace year_school = 6 if edattain == 2 & sample_str == "Uruguay 2011"
	replace year_school = 12 if edattain == 3 & sample_str == "Uruguay 2011"
	replace year_school = 15 if edattain == 4 & sample_str == "Uruguay 2011"
	
	replace year_school = 3 if edattain == 1 & sample_str == "Armenia 2001"
	replace year_school = 3 if edattain == 2 & sample_str == "Armenia 2001"
	replace year_school = 10 if edattain == 3 & sample_str == "Armenia 2001"
	replace year_school = 13 if edattain == 4 & sample_str == "Armenia 2001" 
	
	replace year_school = 3 if edattain == 1 & sample_str == "Armenia 2011"	
	replace year_school = 4 if edattain == 2 & sample_str == "Armenia 2011" 
	replace year_school = 11 if edattain == 3 & sample_str == "Armenia 2011" 
	replace year_school = 14 if edattain == 4 & sample_str == "Armenia 2011" 
	
	replace year_school = 2 if edattain == 1 & country_str == "Austria"
	replace year_school = 4 if edattain == 2 & country_str == "Austria" 
	replace year_school = 12 if edattain == 3 & country_str == "Austria"
	replace year_school = 15 if edattain == 4 & country_str == "Austria"
	
	replace year_school = 2 if edattain == 1 & country_str == "Belarus"
	replace year_school = 4 if edattain == 2 & country_str == "Belarus"
	replace year_school = 11 if edattain == 3 & country_str == "Belarus"
	replace year_school = 14 if edattain == 4 & country_str == "Belarus"
	
	replace year_school = 3 if edattain == 1 & sample_str== "Burkina Faso 1996"
	replace year_school = 6 if edattain == 2 & sample_str== "Burkina Faso 1996"
	replace year_school = 13 if edattain == 3 & sample_str== "Burkina Faso 1996"
	replace year_school = 16 if edattain == 4 & sample_str== "Burkina Faso 1996"
	
	replace year_school = 3 if edattain == 1 & sample_str== "Burkina Faso 2006"
	replace year_school = 6 if edattain == 2 & sample_str== "Burkina Faso 2006"
	replace year_school = 13 if edattain == 3 & sample_str== "Burkina Faso 2006"
	replace year_school = 16 if edattain == 4 & sample_str== "Burkina Faso 2006"
	
	
	replace year_school = 3 if edattain == 1 & sample_str == "Cuba 2002"
	replace year_school = 6 if edattain == 2 & sample_str == "Cuba 2002"
	replace year_school = 12 if edattain == 3 & sample_str == "Cuba 2002"
	replace year_school = 15 if edattain == 4 & sample_str == "Cuba 2002"
	
	replace year_school = 3 if edattain == 1 & sample_str == "Ivory Coast 1988"
	replace year_school = 6 if edattain == 2 & sample_str == "Ivory Coast 1988"
	replace year_school = 13 if edattain == 3 & sample_str == "Ivory Coast 1988"
	replace year_school = 16 if edattain == 4 & sample_str == "Ivory Coast 1988"
	
	replace year_school = 3 if edattain == 1 & sample_str == "Egypt 1986"
	replace year_school = 6 if edattain == 2 & sample_str == "Egypt 1986"
	replace year_school = 12 if edattain == 3 & sample_str == "Egypt 1986"
	replace year_school = 15 if edattain == 4 & sample_str == "Egypt 1986"
	
	replace year_school = 3 if edattain == 1 & sample_str == "Egypt 1996"
	replace year_school = 5 if edattain == 2 & sample_str == "Egypt 1996"
	replace year_school = 11 if edattain == 3 & sample_str == "Egypt 1996"
	replace year_school = 14 if edattain == 4 & sample_str == "Egypt 1996"
	
	replace year_school = 3 if edattain == 1 & sample_str == "Egypt 2006"
	replace year_school = 6 if edattain == 2 & sample_str == "Egypt 2006"
	replace year_school = 12 if edattain == 3 & sample_str == "Egypt 2006"
	replace year_school = 15 if edattain == 4 & sample_str == "Egypt 2006"
	
	replace year_school = 3 if edattain == 1 & country_str == "Fiji"
	replace year_school = 6 if edattain == 2   & country_str == "Fiji"
	replace year_school = 12 if edattain == 3 & country_str == "Fiji"
	replace year_school = 15 if edattain == 4 & country_str == "Fiji"
	
	replace year_school = 3 if edattain == 1 & country_str == "China"
	replace year_school = 6 if edattain == 2   & country_str == "China"
	replace year_school = 12 if edattain == 3 & country_str == "China"
	replace year_school = 15 if edattain == 4 & country_str == "China"
	
	replace year_school = 3 if edattain == 1 & sample_str == "Finland 2010"
	replace year_school = 6 if edattain == 2 & sample_str == "Finland 2010"
	replace year_school = 12 if edattain == 3 & sample_str == "Finland 2010"
	replace year_school = 15 if edattain == 4 & sample_str == "Finland 2010"
	
	replace year_school = 2.5 if edattain == 1 & country_str == "France"
	replace year_school = 5 if edattain == 2 & country_str == "France"
	replace year_school = 12 if edattain == 3 & country_str == "France" 
	replace year_school = 15 if edattain == 4 & country_str == "France"
	
	replace year_school = 3 if edattain == 1 &  country_str == "Greece"
	replace year_school = 6 if edattain == 2 &  country_str == "Greece"
	replace year_school = 12 if edattain == 3 &  country_str == "Greece" 
	replace year_school = 15 if edattain == 4 &  country_str == "Greece"
	
	replace year_school = 2 if edattain == 1 & country_str == "Hungary"
	replace year_school = 4 if edattain == 2 & country_str == "Hungary"
	replace year_school = 12 if edattain == 3 & country_str == "Hungary"
	replace year_school = 15 if edattain == 4 & country_str == "Hungary"
	
	replace year_school = 3 if edattain == 1 & country_str == "Iran"
	replace year_school = 5 if edattain == 2  & country_str == "Iran"
	replace year_school = 12 if edattain == 3  & country_str == "Iran"
	replace year_school = 15 if edattain == 4  & country_str == "Iran"	
		
	replace year_school = 3 if edattain == 1 & country_str == "Ireland" & year <= 1997
	replace year_school = 6 if edattain == 2 & country_str == "Ireland" & year <= 1997		
	replace year_school = 11 if edattain == 3 & country_str == "Ireland" & year <= 1997		
	replace year_school = 14 if edattain == 4 & country_str == "Ireland" & year <= 1997		
	
	replace year_school = 4 if edattain == 1 & country_str == "Ireland" & year >= 1997
	replace year_school = 8 if edattain == 2 & country_str == "Ireland" & year>= 1997		
	replace year_school = 13 if edattain == 3 & country_str == "Ireland" & year>= 1997		
	replace year_school = 16 if edattain == 4 & country_str == "Ireland" & year >= 1997	
		
	replace year_school = 2.5 if edattain == 1 & country_str == "Italy"
	replace year_school = 5 if edattain == 2 & country_str == "Italy"
	replace year_school = 13 if edattain == 3 & country_str == "Italy"
	replace year_school = 16 if edattain == 4 & country_str == "Italy"
	
	replace year_school = 3 if edattain == 1 & country_str == "Jordan"
	replace year_school = 6 if edattain == 2  & country_str == "Jordan"
	replace year_school = 12 if edattain == 3  & country_str == "Jordan"
	replace year_school = 15 if edattain == 4  & country_str == "Jordan"
	
	replace year_school = 3 if edattain == 1 & country_str == "Kyrgyzstan"
	replace year_school = 4 if edattain == 2  & country_str == "Kyrgyzstan"
	replace year_school = 11 if edattain == 3  & country_str == "Kyrgyzstan"
	replace year_school = 14 if edattain == 4  & country_str == "Kyrgyzstan"
	
	replace year_school = 3 if edattain == 1 & country_str == "Malaysia"
	replace year_school = 6 if edattain == 2  & country_str == "Malaysia"
	replace year_school = 12 if edattain == 3  & country_str == "Malaysia"
	replace year_school = 15 if edattain == 4  & country_str == "Malaysia"
	
	replace year_school = 3 if edattain == 1 & country_str == "Mali"
	replace year_school = 6 if edattain == 2 & country_str == "Mali"
	replace year_school = 12 if edattain == 3 & country_str == "Mali"
	replace year_school = 15 if edattain == 4 & country_str == "Mali"
	
	replace year_school = 1.5 if edattain == 1 & sample_str == "Mongolia 1989"
	replace year_school = 3 if edattain == 2 & sample_str == "Mongolia 1989"
	replace year_school = 10 if edattain == 3 & sample_str == "Mongolia 1989"
	replace year_school = 13 if edattain == 4 & sample_str == "Mongolia 1989"
	
	replace year_school = 2 if edattain == 1 & sample_str == "Mongolia 2000"
	replace year_school = 4 if edattain == 2 & sample_str == "Mongolia 2000"
	replace year_school = 10 if edattain == 3 & sample_str == "Mongolia 2000"
	replace year_school = 13 if edattain == 4 & sample_str == "Mongolia 2000"
	
	replace year_school = 3 if edattain == 1 & sample_str == "Mozambique 1997"
	replace year_school = 5 if edattain == 2 & sample_str == "Mozambique 1997"
	replace year_school = 13 if edattain == 3 & sample_str == "Mozambique 1997"
	replace year_school = 16 if edattain == 4 & sample_str == "Mozambique 1997"

	replace year_school = 3 if edattain == 1 & sample_str == "Mozambique 2007"
	replace year_school = 7 if edattain == 2 & sample_str == "Mozambique 2007"
	replace year_school = 12 if edattain == 3 & sample_str == "Mozambique 2007"
	replace year_school = 15 if edattain == 4 & sample_str == "Mozambique 2007"
	
	replace year_school = 3 if edattain == 1 & country_str == "Netherlands"
	replace year_school = 6 if edattain == 2 & country_str == "Netherlands"
	replace year_school = 12 if edattain == 3 & country_str == "Netherlands"
	replace year_school = 15 if edattain == 4 & country_str == "Netherlands"
	
	replace year_school = 3 if edattain == 1 & country_str == "Pakistan"
	replace year_school = 5 if edattain == 2  & country_str == "Pakistan"
	replace year_school = 12 if edattain == 3 & country_str == "Pakistan"
	replace year_school = 15 if edattain == 4  & country_str == "Pakistan"
	

	replace year_school = 3 if edattain == 1 & country_str == "Poland"
	replace year_school = 6 if edattain == 2 & country_str == "Poland"
	replace year_school = 12 if edattain == 3 & country_str == "Poland"
	replace year_school = 15 if edattain == 4 & country_str == "Poland"
	
	replace year_school = 3 if edattain == 1 & country_str == "Portugal"
	replace year_school = 6 if edattain == 2 & country_str == "Portugal"
	replace year_school = 12 if edattain == 3 & country_str == "Portugal"
	replace year_school = 15 if edattain == 4 & country_str == "Portugal"
	
	replace year_school = 2 if edattain == 1 & country_str == "Romania"
	replace year_school = 4 if edattain == 2 & country_str == "Romania"
	replace year_school = 12 if edattain == 3 & country_str == "Romania"
	replace year_school = 15 if edattain == 4 & country_str == "Romania"
	
	replace year_school = 2 if edattain == 1 & country_str == "Russia"
	replace year_school = 4 if edattain == 2 & country_str == "Russia"
	replace year_school = 11 if edattain == 3 & country_str == "Russia"
	replace year_school = 14 if edattain == 4 & country_str == "Russia"
	
	replace year_school = 3 if edattain == 1 & sample_str == "Rwanda 1991"
	replace year_school = 6 if edattain == 2 & sample_str == "Rwanda 1991"
	replace year_school = 12 if edattain == 3 & sample_str == "Rwanda 1991"
	replace year_school = 15 if edattain == 4 & sample_str == "Rwanda 1991"
	
	replace year_school = 3 if edattain == 1 & country_str == "Saint Lucia"
	replace year_school = 6 if edattain == 2 & country_str == "Saint Lucia"
	replace year_school = 12 if edattain == 3 & country_str == "Saint Lucia"
	replace year_school = 15 if edattain == 4 & country_str == "Saint Lucia"
	
	replace year_school = 2 if edattain == 1 &  country_str == "Slovakia"
	replace year_school = 4 if edattain == 2 & sample_str == "Slovakia 1991"
	replace year_school = 12 if edattain == 3 & sample_str == "Slovakia 1991"
	replace year_school = 14 if edattain == 4 & sample_str == "Slovakia 1991"

	replace year_school = 4 if edattain == 2 & country_str == "Slovakia" & year != 1991
	replace year_school = 13 if edattain == 3 & country_str == "Slovakia" & year != 1991
	replace year_school = 15 if edattain == 4 & country_str == "Slovakia" & year != 1991
		
	replace year_school = 2 if edattain == 1 &  country_str == "Slovenia"
	replace year_school = 4 if edattain == 2 &  country_str == "Slovenia"
	replace year_school = 12 if edattain == 3 &  country_str == "Slovenia"
	replace year_school = 15 if edattain == 4 &  country_str == "Slovenia"
	
	replace year_school = 3 if edattain == 1 & country_str == "South Sudan" 
	replace year_school = 6 if edattain == 2 & country_str == "South Sudan"
	replace year_school = 12 if edattain == 3 & country_str == "South Sudan"
	replace year_school = 15 if edattain == 4 & country_str == "South Sudan"
	
	replace year_school = 2.5 if edattain == 1 &  country_str == "Spain" & year <= 1996
	replace year_school = 5 if edattain ==2 &  country_str == "Spain" & year <= 1996
	replace year_school = 12 if edattain == 3 &  country_str == "Spain" & year <= 1996
	replace year_school = 15 if edattain == 4 &  country_str == "Spain" & year <= 1996

	replace year_school = 3 if edattain == 1 &  country_str == "Spain" & year >= 1996
	replace year_school = 6 if edattain ==2 &  country_str == "Spain" & year >= 1996
	replace year_school = 12 if edattain == 3 &  country_str == "Spain" & year >= 1996
	replace year_school = 15 if edattain == 4 &  country_str == "Spain" & year >= 1996
	
	replace year_school = 3 if edattain == 1 &  country_str == "Sudan"
	replace year_school = 6 if edattain == 2 &  country_str == "Sudan"
	replace year_school = 11 if edattain == 3 &  country_str == "Sudan"
	replace year_school = 14 if edattain == 4 &  country_str == "Sudan"
	
	replace year_school = 3 if edattain == 1 & sample_str == "Suriname 2012"
	replace year_school = 6 if edattain == 2 & sample_str == "Suriname 2012"
	replace year_school = 13 if edattain == 3 & sample_str == "Suriname 2012"
	replace year_school = 16 if edattain == 4 & sample_str == "Suriname 2012"

	replace year_school = 3 if edattain == 1 & sample_str == "Suriname 2014"
	replace year_school = 6 if edattain == 2 & sample_str == "Suriname 2014"
	replace year_school = 12 if edattain == 3 & sample_str == "Suriname 2014"
	replace year_school = 15 if edattain == 4 & sample_str == "Suriname 2014"	
	 

	replace year_school = 3 if edattain == 1 &  country_str == "Switzerland"
	replace year_school = 6 if edattain == 2 &  country_str == "Switzerland"
	replace year_school = 13 if edattain == 3 &  country_str == "Switzerland" 
	replace year_school = 16 if edattain == 4 &  country_str == "Switzerland"
	
	replace year_school = 3 if edattain == 1 & country_str == "Togo"
	replace year_school = 6 if edattain == 2 & country_str == "Togo"
	replace year_school = 13 if edattain == 3 & country_str == "Togo"
	replace year_school = 16 if edattain == 4 & country_str == "Togo"
	
	replace year_school = 3 if edattain == 1 & country_str == "Turkey"
	replace year_school = 5 if edattain == 2  & country_str == "Turkey"
	replace year_school = 11 if edattain == 3  & country_str == "Turkey"
	replace year_school = 14 if edattain == 4  & country_str == "Turkey"
	
	
	replace year_school = 1.5 if edattain == 1 & country_str == "Ukraine"
	replace year_school = 3 if edattain == 2 & country_str == "Ukraine"
	replace year_school = 10 if edattain == 3 & country_str == "Ukraine"
	replace year_school = 13 if edattain == 4 & country_str == "Ukraine"
	
	replace year_school = 3 if edattain == 1 & country_str == "United Kingdom"
	replace year_school = 6 if edattain == 2 & country_str == "United Kingdom"
	replace year_school = 13 if edattain == 3 & country_str == "United Kingdom"
	replace year_school = 16 if edattain == 4 & country_str == "United Kingdom"
		
	replace edattain = . if edattain == 0 | edattain == 9
	
	gen university = 0 
	replace university = 1 if edattain == 4
	replace university = . if edattain == . 

	gen secondary = 0 
	replace secondary = 1 if edattain == 3
	replace secondary = . if edattain == . 

	gen primary = 0 
	replace primary = 1 if edattain == 2
	replace primary = . if edattain == . 

	gen lprimary = 0 
	replace lprimary = 1 if edattain == 1
	replace lprimary = . if edattain == .  
	
********************************************************************************
*[3] Labour market variables
********************************************************************************
 *Skill classification and based on ISCO
	  gen skill_level = . 
	  replace skill_level = 3 if (occisco ==1| occisco == 2 | occisco == 3 ) & occisco_unavailable != 1
	  replace skill_level = 2 if (occisco == 4 |occisco == 5 | occisco == 6 | occisco == 7 | occisco == 8) & occisco_unavailable != 1
	  replace skill_level = 1 if occisco == 9 & occisco_unavailable != 1
	  
	  replace skill_level = 3  if (occ == 0 | occ == 1) & sample_str == "Israel 1972"
	  replace skill_level = 3  if (occ == 1 | occ == 2 | occ == 3) & sample_str == "Israel 1983"
	  replace skill_level = 3  if (occ == 0 | occ == 1 | occ == 2) & sample_str == "Israel 1995"
	  replace skill_level = 3 if  (occ == 0 | occ == 1 | occ == 2) & sample_str == "Israel 2008"

	  * Identifying the OCCISCO professionals for teacher identifications
	  * Note, some years OCC for Israel makes distinction for academic occupations. so we use that as
	  * "Professionals" for the purpose of this paper. 
	  capture gen occisco = . if country_str == "Israel"
	  replace occisco = 2  if (occ == 0) & sample_str == "Israel 1972" 
	  replace occisco = 2 if (occ == 1) & sample_str == "Israel 1983" 
	  replace occisco = 2 if (occ == 0) & sample_str == "Israel 1995"
	  replace occisco = 2 if (occ == 0) & sample_str == "Israel 2008"
	  
	  
	  gen high_skill = 0 
	  replace high_skill = 1 if skill_level == 3
	  replace high_skill = . if skill_level ==.
	  replace high_skill = 0 if occ != . & high_skill ==. & country_str == "Israel"
	  
	  gen medium_skill = 0 
	  replace medium_skill = 1 if skill_level == 2
	  replace medium_skill = . if skill_level ==. 
	  
	  gen low_skill = 0 
	  replace low_skill = 1 if skill_level == 1
	  replace low_skill = . if skill_level ==.   
  
 * Industry classification
	  replace indgen = . if indgen == 000 | indgen == 998 | indgen == 999
  
 *Employment status
	 capture replace classwk = . if classwk == 0 |  classwk == 9 
	  gen self_employed = 0
	  capture replace self_employed = 1 if classwk == 1
	  capture replace self_employed  = . if classwk == . 
	  
	  capture gen wage_worker = 0 
	  capture replace wage_worker = 1 if classwk == 2
	  capture replace wage_worker = . if classwk == . 
	  
* Hours	  
	  gen hours = .

	  replace hours = hrswork1  if  country_str != "Israel"| country_str != "Uruguay" 
	  replace hours =. if (hrswork1==999 | hrswork1==998 | empstat!=1) & (country_str != "Israel"| country_str != "Uruguay" )
	 
	  
	  *Imputing hours using other variables hrsusuak1, hrsactual1 and hrswork2
	  sum hrswork2_only
	  if r(mean) == 1{
	  	replace hours = 0 if hrswork2==0 & empstat==1 & hrswork2_only ==1
		replace hours = 7.5 if hrswork2==1 & empstat==1 & hrswork2_only ==1 
	  	replace hours = 22 if hrswork2==2 & empstat==1 & hrswork2_only ==1 
		replace hours = 34.5 if hrswork2==3 & empstat==1 & hrswork2_only ==1
		replace hours = 44 if hrswork2==4 & empstat==1 & hrswork2_only==1
		replace hours = 49 if hrswork2==5 & empstat==1 & hrswork2_only==1
		
		
		replace hours = 8.5 if hrswork2==1 & empstat==1 & hrswork2_only ==1 & country_str == "Trinidad and Tobago"
		replace hours = 24.5 if hrswork2==2 & empstat==1 & hrswork2_only ==1 & country_str == "Trinidad and Tobago"
		replace hours = 36.5 if hrswork2==3 & empstat==1 & hrswork2_only ==1 & country_str == "Trinidad and Tobago"
		replace hours = 45.5 if hrswork2==4 & empstat==1 & hrswork2_only ==1 & country_str == "Trinidad and Tobago"
		replace hours = 51 if hrswork2==5 & empstat==1 & hrswork2_only ==1 & country_str == "Trinidad and Tobago"
	  }
	  
	  sum hrsusuak1_only
	  if r(mean) == 1{
	  	replace hrsusual1 = . if (hrsusual1 == 997 | hrsusual1 == 998 |hrsusual1 == 999| empstat!=1)
	  	replace hours = hrsusual1 if empstat==1 & hrsusuak1_only ==1
		replace hours = 140 if empstat==1 & hrsusuak1_only ==1 & hrsusual1 == 140
	  }
	  
	  sum hrsactual1_only
	  if r(mean) == 1{
	  	replace hrsactual1 = . if (hrsactual1 == 997 | hrsactual1 == 998 |hrsactual1 == 999| empstat!=1)
	  	replace hours = hrsactual1 if empstat==1 & hrsactual1_only ==1
		replace hours = 140 if empstat==1 & hrsactual1_only ==1 & hrsactual1 == 140
	  }
	  	  
*  Wages
	gen wages_weekly = . 
	
	replace wages_weekly = incwage if incwage_unavailble != 1
	replace wages_weekly = . if (incwage == 9999998|incwage == 9999999| empstat != 1) & incwage_unavailble != 1
	
	sum incearn_only
	if r(mean) == 1 {
		replace incearn = . if (incearn == 9999998|incearn == 9999999|empstat != 1)
		replace wages_weekly = incearn if empstat == 1  & incearn_only == 1	
	}
	
		sum inctot_only
	if r(mean) == 1 {
		replace inctot = . if (inctot == 9999998|inctot == 9999999|empstat != 1)
		replace wages_weekly = inctot if empstat == 1  & inctot_only == 1	
	}
	
	* Wage adjustment such that all wages are weekly wages. Most are in weekly
	* Countries where wages are collected as annual income
	replace wages_weekly = wages_weekly/52 if country_str == "Canada" | country_str == "Jamaica" | sample_str == "Israel 2008" |country_str == "Puerto Rico" |country_str == "United States"
	
	* Countries where wages are collected as monthly income
	replace wages_weekly = (wages_weekly * 12)/52 if country_str == "Dominican Republic" | country_str == "Indonesia"| sample_str == "Israel 1995" | sample_str == "Panama 1980"| sample_str == "Panama 1990"| sample_str == "Panama 2000"| sample_str == "Panama 2010"
	
	replace wages_weekly = (wages_weekly) /4 if sample_str == "Panama 1970"	
	
	gen wages_hourly = wages_weekly / hours
	
	gen ln_wages_w = ln(wages_weekly)
	gen ln_wages_h = ln(wages_hourly)

	
********************************************************************************
*[4] Identifiying teachers amongst all individuals
********************************************************************************
*Identifiying teachers in the sample
*   note - Here we generate two varibales:
*          1. teacher_type : indivdiuals where we can label as teacher using
*                            detailed occ codes
*          2. teacher_status: indivdiuals where we label as teachers using a
*                             a combination of occiso and industry classification
*                             in addition to indivdiuals identified using detailed
*                             occ.

*1. Merging with teacher OCC codes to identify observations associated with teachers
replace country_str = lower(country_str)
merge m:1 country_str year occ using "harmonization_v2.dta"
/* reasons why not merged
- no observations for particular occupation in a occ_country-year
*/
drop if _me==2 
drop _me

*2. Proxy teacher status for samples where detailed occ codes are not avaliable
gen professionals = 1 if occisco == 2
gen education_ind = 1 if indgen == 112 

gen teacher_proxy = 1 if professionals == 1 & education_ind == 1
replace teacher_proxy = 0 if teacher_proxy == . & empstat == 1

gen teacher_status = teacher_type
replace teacher_status = 4 if teacher_proxy == 1 & teacher_type ==.
label values teacher_status teach


********************************************************************************
* [5] Creating three occupation categories
********************************************************************************
gen occ_type = .
replace occ_type = 1 if empstat == 1 & high_skill == 0 & teacher_status == . 
replace occ_type = 2 if empstat == 1 & high_skill == 1 & teacher_status == . 
replace occ_type = 3 if empstat == 1 & teacher_status != . 
label define occ_type 1 "Low Skilled occupations" 2 "High Skilled occupations" 3 "Teaching occupations"
label values occ_type occ_type

gen occ_type_d = .
replace occ_type_d = 1 if empstat == 1 & high_skill == 0 & teacher_status == . 
replace occ_type_d = 21 if empstat == 1 & high_skill == 1 & professionals == . & teacher_status == . 
replace occ_type_d = 22 if empstat == 1 & high_skill == 1 & professionals == 1 & teacher_status == . 
replace occ_type_d = 3 if empstat == 1 & teacher_status != . 
label define occ_type_d 1 "Low Skilled occupations" 21 "High Skilled non-professionals" 22 "High Skilled professionals" 3 "Teaching occupations"
label values occ_type_d occ_type_d

gen occ_type_r = .
replace occ_type_r = 1 if empstat == 1 & high_skill == 0 & teacher_type == . 
replace occ_type_r = 2 if empstat == 1 & high_skill == 1 & teacher_type == . 
replace occ_type_r = 3 if empstat == 1 & teacher_type != . 
label define occ_type_r 1 "Low Skilled occupations" 2 "High Skilled occupations" 3 "Teaching occupations"
label values occ_type_r occ_type

