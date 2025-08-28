set more off

replace perwt      = perwt      / 100

format sample     %9.0f
format perwt      %8.2f

capture label var country    `"Country"'
capture label var year       `"Year"'
capture label var sample     `"IPUMS sample identifier"'
capture label var pernum     `"Person number"'
capture label var perwt      `"Person weight"'
capture label var age        `"Age"'
capture label var sex        `"Sex"'
capture label var bplcountry `"Country of birth"'
capture label var yrimm      `"Year of immigration"'
capture label var yrsimm     `"Years since immigrated"'
capture label var edattain   `"Educational attainment, international recode [general version]"'
capture label var edattaind  `"Educational attainment, international recode [detailed version]"'
capture label var yrschool   `"Years of schooling"'
capture label var empstat    `"Activity status (employment status) [general version]"'
capture label var empstatd   `"Activity status (employment status) [detailed version]"'
capture label var indgen     `"Industry, general recode"'
capture label var classwk    `"Status in employment (class of worker) [general version]"'
capture label var classwkd   `"Status in employment (class of worker) [detailed version]"'
capture label var hrswork1   `"Hours worked per week"'
capture label var hrswork2   `"Hours worked per week, categorized"'
capture label var incwage    `"Wage and salary income"'

capture label define country_lbl 032 `"Argentina"'
capture label define country_lbl 051 `"Armenia"', add
capture label define country_lbl 040 `"Austria"', add
capture label define country_lbl 050 `"Bangladesh"', add
capture label define country_lbl 112 `"Belarus"', add
capture label define country_lbl 204 `"Benin"', add
capture label define country_lbl 068 `"Bolivia"', add
capture label define country_lbl 072 `"Botswana"', add
capture label define country_lbl 076 `"Brazil"', add
capture label define country_lbl 854 `"Burkina Faso"', add
capture label define country_lbl 116 `"Cambodia"', add
capture label define country_lbl 120 `"Cameroon"', add
capture label define country_lbl 124 `"Canada"', add
capture label define country_lbl 152 `"Chile"', add
capture label define country_lbl 156 `"China"', add
capture label define country_lbl 170 `"Colombia"', add
capture label define country_lbl 188 `"Costa Rica"', add
capture label define country_lbl 192 `"Cuba"', add
capture label define country_lbl 208 `"Denmark"', add
capture label define country_lbl 214 `"Dominican Republic"', add
capture label define country_lbl 218 `"Ecuador"', add
capture label define country_lbl 818 `"Egypt"', add
capture label define country_lbl 222 `"El Salvador"', add
capture label define country_lbl 231 `"Ethiopia"', add
capture label define country_lbl 242 `"Fiji"', add
capture label define country_lbl 246 `"Finland"', add
capture label define country_lbl 250 `"France"', add
capture label define country_lbl 276 `"Germany"', add
capture label define country_lbl 288 `"Ghana"', add
capture label define country_lbl 300 `"Greece"', add
capture label define country_lbl 320 `"Guatemala"', add
capture label define country_lbl 324 `"Guinea"', add
capture label define country_lbl 332 `"Haiti"', add
capture label define country_lbl 340 `"Honduras"', add
capture label define country_lbl 348 `"Hungary"', add
capture label define country_lbl 352 `"Iceland"', add
capture label define country_lbl 356 `"India"', add
capture label define country_lbl 360 `"Indonesia"', add
capture label define country_lbl 364 `"Iran"', add
capture label define country_lbl 368 `"Iraq"', add
capture label define country_lbl 372 `"Ireland"', add
capture label define country_lbl 376 `"Israel"', add
capture label define country_lbl 380 `"Italy"', add
capture label define country_lbl 388 `"Jamaica"', add
capture label define country_lbl 400 `"Jordan"', add
capture label define country_lbl 404 `"Kenya"', add
capture label define country_lbl 417 `"Kyrgyz Republic"', add
capture label define country_lbl 418 `"Laos"', add
capture label define country_lbl 426 `"Lesotho"', add
capture label define country_lbl 430 `"Liberia"', add
capture label define country_lbl 454 `"Malawi"', add
capture label define country_lbl 458 `"Malaysia"', add
capture label define country_lbl 466 `"Mali"', add
capture label define country_lbl 480 `"Mauritius"', add
capture label define country_lbl 484 `"Mexico"', add
capture label define country_lbl 496 `"Mongolia"', add
capture label define country_lbl 504 `"Morocco"', add
capture label define country_lbl 508 `"Mozambique"', add
capture label define country_lbl 104 `"Myanmar"', add
capture label define country_lbl 524 `"Nepal"', add
capture label define country_lbl 528 `"Netherlands"', add
capture label define country_lbl 558 `"Nicaragua"', add
capture label define country_lbl 566 `"Nigeria"', add
capture label define country_lbl 578 `"Norway"', add
capture label define country_lbl 586 `"Pakistan"', add
capture label define country_lbl 275 `"Palestine"', add
capture label define country_lbl 591 `"Panama"', add
capture label define country_lbl 598 `"Papua New Guinea"', add
capture label define country_lbl 600 `"Paraguay"', add
capture label define country_lbl 604 `"Peru"', add
capture label define country_lbl 608 `"Philippines"', add
capture label define country_lbl 616 `"Poland"', add
capture label define country_lbl 620 `"Portugal"', add
capture label define country_lbl 630 `"Puerto Rico"', add
capture label define country_lbl 642 `"Romania"', add
capture label define country_lbl 643 `"Russia"', add
capture label define country_lbl 646 `"Rwanda"', add
capture label define country_lbl 662 `"Saint Lucia"', add
capture label define country_lbl 686 `"Senegal"', add
capture label define country_lbl 694 `"Sierra Leone"', add
capture label define country_lbl 705 `"Slovenia"', add
capture label define country_lbl 710 `"South Africa"', add
capture label define country_lbl 728 `"South Sudan"', add
capture label define country_lbl 724 `"Spain"', add
capture label define country_lbl 729 `"Sudan"', add
capture label define country_lbl 740 `"Suriname"', add
capture label define country_lbl 752 `"Sweden"', add
capture label define country_lbl 756 `"Switzerland"', add
capture label define country_lbl 834 `"Tanzania"', add
capture label define country_lbl 764 `"Thailand"', add
capture label define country_lbl 768 `"Togo"', add
capture label define country_lbl 780 `"Trinidad and Tobago"', add
capture label define country_lbl 792 `"Turkey"', add
capture label define country_lbl 800 `"Uganda"', add
capture label define country_lbl 804 `"Ukraine"', add
capture label define country_lbl 826 `"United Kingdom"', add
capture label define country_lbl 840 `"United States"', add
capture label define country_lbl 858 `"Uruguay"', add
capture label define country_lbl 862 `"Venezuela"', add
capture label define country_lbl 704 `"Vietnam"', add
capture label define country_lbl 894 `"Zambia"', add
capture label define country_lbl 716 `"Zimbabwe"', add
capture label values country country_lbl

capture label define year_lbl 1703 `"1703"'
capture label define year_lbl 1729 `"1729"', add
capture label define year_lbl 1787 `"1787"', add
capture label define year_lbl 1801 `"1801"', add
capture label define year_lbl 1819 `"1819"', add
capture label define year_lbl 1850 `"1850"', add
capture label define year_lbl 1851 `"1851"', add
capture label define year_lbl 1852 `"1852"', add
capture label define year_lbl 1860 `"1860"', add
capture label define year_lbl 1861 `"1861"', add
capture label define year_lbl 1865 `"1865"', add
capture label define year_lbl 1870 `"1870"', add
capture label define year_lbl 1871 `"1871"', add
capture label define year_lbl 1875 `"1875"', add
capture label define year_lbl 1880 `"1880"', add
capture label define year_lbl 1881 `"1881"', add
capture label define year_lbl 1890 `"1890"', add
capture label define year_lbl 1891 `"1891"', add
capture label define year_lbl 1900 `"1900"', add
capture label define year_lbl 1901 `"1901"', add
capture label define year_lbl 1910 `"1910"', add
capture label define year_lbl 1911 `"1911"', add
capture label define year_lbl 1960 `"1960"', add
capture label define year_lbl 1961 `"1961"', add
capture label define year_lbl 1962 `"1962"', add
capture label define year_lbl 1963 `"1963"', add
capture label define year_lbl 1964 `"1964"', add
capture label define year_lbl 1966 `"1966"', add
capture label define year_lbl 1968 `"1968"', add
capture label define year_lbl 1969 `"1969"', add
capture label define year_lbl 1970 `"1970"', add
capture label define year_lbl 1971 `"1971"', add
capture label define year_lbl 1972 `"1972"', add
capture label define year_lbl 1973 `"1973"', add
capture label define year_lbl 1974 `"1974"', add
capture label define year_lbl 1975 `"1975"', add
capture label define year_lbl 1976 `"1976"', add
capture label define year_lbl 1977 `"1977"', add
capture label define year_lbl 1978 `"1978"', add
capture label define year_lbl 1979 `"1979"', add
capture label define year_lbl 1980 `"1980"', add
capture label define year_lbl 1981 `"1981"', add
capture label define year_lbl 1982 `"1982"', add
capture label define year_lbl 1983 `"1983"', add
capture label define year_lbl 1984 `"1984"', add
capture label define year_lbl 1985 `"1985"', add
capture label define year_lbl 1986 `"1986"', add
capture label define year_lbl 1987 `"1987"', add
capture label define year_lbl 1989 `"1989"', add
capture label define year_lbl 1990 `"1990"', add
capture label define year_lbl 1991 `"1991"', add
capture label define year_lbl 1992 `"1992"', add
capture label define year_lbl 1993 `"1993"', add
capture label define year_lbl 1994 `"1994"', add
capture label define year_lbl 1995 `"1995"', add
capture label define year_lbl 1996 `"1996"', add
capture label define year_lbl 1997 `"1997"', add
capture label define year_lbl 1998 `"1998"', add
capture label define year_lbl 1999 `"1999"', add
capture label define year_lbl 2000 `"2000"', add
capture label define year_lbl 2001 `"2001"', add
capture label define year_lbl 2002 `"2002"', add
capture label define year_lbl 2003 `"2003"', add
capture label define year_lbl 2004 `"2004"', add
capture label define year_lbl 2005 `"2005"', add
capture label define year_lbl 2006 `"2006"', add
capture label define year_lbl 2007 `"2007"', add
capture label define year_lbl 2008 `"2008"', add
capture label define year_lbl 2009 `"2009"', add
capture label define year_lbl 2010 `"2010"', add
capture label define year_lbl 2011 `"2011"', add
capture label define year_lbl 2012 `"2012"', add
capture label define year_lbl 2013 `"2013"', add
capture label define year_lbl 2014 `"2014"', add
capture label define year_lbl 2015 `"2015"', add
capture label define year_lbl 2016 `"2016"', add
capture label define year_lbl 2017 `"2017"', add
capture label define year_lbl 2018 `"2018"', add
capture label define year_lbl 2019 `"2019"', add
capture label values year year_lbl

capture label define sample_lbl 032197001 `"Argentina 1970"'
capture label define sample_lbl 032198001 `"Argentina 1980"', add
capture label define sample_lbl 032199101 `"Argentina 1991"', add
capture label define sample_lbl 032200101 `"Argentina 2001"', add
capture label define sample_lbl 032201001 `"Argentina 2010"', add
capture label define sample_lbl 051200101 `"Armenia 2001"', add
capture label define sample_lbl 051201101 `"Armenia 2011"', add
capture label define sample_lbl 040197101 `"Austria 1971"', add
capture label define sample_lbl 040198101 `"Austria 1981"', add
capture label define sample_lbl 040199101 `"Austria 1991"', add
capture label define sample_lbl 040200101 `"Austria 2001"', add
capture label define sample_lbl 040201101 `"Austria 2011"', add
capture label define sample_lbl 050199101 `"Bangladesh 1991"', add
capture label define sample_lbl 050200101 `"Bangladesh 2001"', add
capture label define sample_lbl 050201101 `"Bangladesh 2011"', add
capture label define sample_lbl 112199901 `"Belarus 1999"', add
capture label define sample_lbl 112200901 `"Belarus 2009"', add
capture label define sample_lbl 204197901 `"Benin 1979"', add
capture label define sample_lbl 204199201 `"Benin 1992"', add
capture label define sample_lbl 204200201 `"Benin 2002"', add
capture label define sample_lbl 204201301 `"Benin 2013"', add
capture label define sample_lbl 068197601 `"Bolivia 1976"', add
capture label define sample_lbl 068199201 `"Bolivia 1992"', add
capture label define sample_lbl 068200101 `"Bolivia 2001"', add
capture label define sample_lbl 068201201 `"Bolivia 2012"', add
capture label define sample_lbl 072198101 `"Botswana 1981"', add
capture label define sample_lbl 072199101 `"Botswana 1991"', add
capture label define sample_lbl 072200101 `"Botswana 2001"', add
capture label define sample_lbl 072201101 `"Botswana 2011"', add
capture label define sample_lbl 076196001 `"Brazil 1960"', add
capture label define sample_lbl 076197001 `"Brazil 1970"', add
capture label define sample_lbl 076198001 `"Brazil 1980"', add
capture label define sample_lbl 076199101 `"Brazil 1991"', add
capture label define sample_lbl 076200001 `"Brazil 2000"', add
capture label define sample_lbl 076201001 `"Brazil 2010"', add
capture label define sample_lbl 854198501 `"Burkina Faso 1985"', add
capture label define sample_lbl 854199601 `"Burkina Faso 1996"', add
capture label define sample_lbl 854200601 `"Burkina Faso 2006"', add
capture label define sample_lbl 116199801 `"Cambodia 1998"', add
capture label define sample_lbl 116200401 `"Cambodia 2004"', add
capture label define sample_lbl 116200801 `"Cambodia 2008"', add
capture label define sample_lbl 116201301 `"Cambodia 2013"', add
capture label define sample_lbl 120197601 `"Cameroon 1976"', add
capture label define sample_lbl 120198701 `"Cameroon 1987"', add
capture label define sample_lbl 120200501 `"Cameroon 2005"', add
capture label define sample_lbl 124185201 `"Canada 1852"', add
capture label define sample_lbl 124187101 `"Canada 1871"', add
capture label define sample_lbl 124188101 `"Canada 1881"', add
capture label define sample_lbl 124189101 `"Canada 1891"', add
capture label define sample_lbl 124190101 `"Canada 1901"', add
capture label define sample_lbl 124191101 `"Canada 1911"', add
capture label define sample_lbl 124197101 `"Canada 1971"', add
capture label define sample_lbl 124198101 `"Canada 1981"', add
capture label define sample_lbl 124199101 `"Canada 1991"', add
capture label define sample_lbl 124200101 `"Canada 2001"', add
capture label define sample_lbl 124201101 `"Canada 2011"', add
capture label define sample_lbl 152196001 `"Chile 1960"', add
capture label define sample_lbl 152197001 `"Chile 1970"', add
capture label define sample_lbl 152198201 `"Chile 1982"', add
capture label define sample_lbl 152199201 `"Chile 1992"', add
capture label define sample_lbl 152200201 `"Chile 2002"', add
capture label define sample_lbl 156198201 `"China 1982"', add
capture label define sample_lbl 156199001 `"China 1990"', add
capture label define sample_lbl 156200001 `"China 2000"', add
capture label define sample_lbl 170196401 `"Colombia 1964"', add
capture label define sample_lbl 170197301 `"Colombia 1973"', add
capture label define sample_lbl 170198501 `"Colombia 1985"', add
capture label define sample_lbl 170199301 `"Colombia 1993"', add
capture label define sample_lbl 170200501 `"Colombia 2005"', add
capture label define sample_lbl 188196301 `"Costa Rica 1963"', add
capture label define sample_lbl 188197301 `"Costa Rica 1973"', add
capture label define sample_lbl 188198401 `"Costa Rica 1984"', add
capture label define sample_lbl 188200001 `"Costa Rica 2000"', add
capture label define sample_lbl 188201101 `"Costa Rica 2011"', add
capture label define sample_lbl 192200201 `"Cuba 2002"', add
capture label define sample_lbl 192201201 `"Cuba 2012"', add
capture label define sample_lbl 208178701 `"Denmark 1787"', add
capture label define sample_lbl 208180101 `"Denmark 1801"', add
capture label define sample_lbl 214196001 `"Dominican Republic 1960"', add
capture label define sample_lbl 214197001 `"Dominican Republic 1970"', add
capture label define sample_lbl 214198101 `"Dominican Republic 1981"', add
capture label define sample_lbl 214200201 `"Dominican Republic 2002"', add
capture label define sample_lbl 214201001 `"Dominican Republic 2010"', add
capture label define sample_lbl 218196201 `"Ecuador 1962"', add
capture label define sample_lbl 218197401 `"Ecuador 1974"', add
capture label define sample_lbl 218198201 `"Ecuador 1982"', add
capture label define sample_lbl 218199001 `"Ecuador 1990"', add
capture label define sample_lbl 218200101 `"Ecuador 2001"', add
capture label define sample_lbl 218201001 `"Ecuador 2010"', add
capture label define sample_lbl 818198601 `"Egypt 1986"', add
capture label define sample_lbl 818199601 `"Egypt 1996"', add
capture label define sample_lbl 818200601 `"Egypt 2006"', add
capture label define sample_lbl 222199201 `"El Salvador 1992"', add
capture label define sample_lbl 222200701 `"El Salvador 2007"', add
capture label define sample_lbl 231198401 `"Ethiopia 1984"', add
capture label define sample_lbl 231199401 `"Ethiopia 1994"', add
capture label define sample_lbl 231200701 `"Ethiopia 2007"', add
capture label define sample_lbl 242196601 `"Fiji 1966"', add
capture label define sample_lbl 242197601 `"Fiji 1976"', add
capture label define sample_lbl 242198601 `"Fiji 1986"', add
capture label define sample_lbl 242199601 `"Fiji 1996"', add
capture label define sample_lbl 242200701 `"Fiji 2007"', add
capture label define sample_lbl 242201401 `"Fiji 2014"', add
capture label define sample_lbl 246201001 `"Finland 2010"', add
capture label define sample_lbl 250196201 `"France 1962"', add
capture label define sample_lbl 250196801 `"France 1968"', add
capture label define sample_lbl 250197501 `"France 1975"', add
capture label define sample_lbl 250198201 `"France 1982"', add
capture label define sample_lbl 250199001 `"France 1990"', add
capture label define sample_lbl 250199901 `"France 1999"', add
capture label define sample_lbl 250200601 `"France 2006"', add
capture label define sample_lbl 250201101 `"France 2011"', add
capture label define sample_lbl 276181901 `"Germany 1819 (Mecklenburg)"', add
capture label define sample_lbl 276197001 `"Germany 1970 (West)"', add
capture label define sample_lbl 276197101 `"Germany 1971 (East)"', add
capture label define sample_lbl 276198101 `"Germany 1981 (East)"', add
capture label define sample_lbl 276198701 `"Germany 1987 (West)"', add
capture label define sample_lbl 288198401 `"Ghana 1984"', add
capture label define sample_lbl 288200001 `"Ghana 2000"', add
capture label define sample_lbl 288201001 `"Ghana 2010"', add
capture label define sample_lbl 300197101 `"Greece 1971"', add
capture label define sample_lbl 300198101 `"Greece 1981"', add
capture label define sample_lbl 300199101 `"Greece 1991"', add
capture label define sample_lbl 300200101 `"Greece 2001"', add
capture label define sample_lbl 300201101 `"Greece 2011"', add
capture label define sample_lbl 320196401 `"Guatemala 1964"', add
capture label define sample_lbl 320197301 `"Guatemala 1973"', add
capture label define sample_lbl 320198101 `"Guatemala 1981"', add
capture label define sample_lbl 320199401 `"Guatemala 1994"', add
capture label define sample_lbl 320200201 `"Guatemala 2002"', add
capture label define sample_lbl 324198301 `"Guinea 1983"', add
capture label define sample_lbl 324199601 `"Guinea 1996"', add
capture label define sample_lbl 324201401 `"Guinea 2014"', add
capture label define sample_lbl 332197101 `"Haiti 1971"', add
capture label define sample_lbl 332198201 `"Haiti 1982"', add
capture label define sample_lbl 332200301 `"Haiti 2003"', add
capture label define sample_lbl 340196101 `"Honduras 1961"', add
capture label define sample_lbl 340197401 `"Honduras 1974"', add
capture label define sample_lbl 340198801 `"Honduras 1988"', add
capture label define sample_lbl 340200101 `"Honduras 2001"', add
capture label define sample_lbl 348197001 `"Hungary 1970"', add
capture label define sample_lbl 348198001 `"Hungary 1980"', add
capture label define sample_lbl 348199001 `"Hungary 1990"', add
capture label define sample_lbl 348200101 `"Hungary 2001"', add
capture label define sample_lbl 348201101 `"Hungary 2011"', add
capture label define sample_lbl 352170301 `"Iceland 1703"', add
capture label define sample_lbl 352172901 `"Iceland 1729"', add
capture label define sample_lbl 352180101 `"Iceland 1801"', add
capture label define sample_lbl 352190101 `"Iceland 1901"', add
capture label define sample_lbl 352191001 `"Iceland 1910"', add
capture label define sample_lbl 356198341 `"India 1983"', add
capture label define sample_lbl 356198741 `"India 1987"', add
capture label define sample_lbl 356199341 `"India 1993"', add
capture label define sample_lbl 356199941 `"India 1999"', add
capture label define sample_lbl 356200441 `"India 2004"', add
capture label define sample_lbl 356200941 `"India 2009"', add
capture label define sample_lbl 360197101 `"Indonesia 1971"', add
capture label define sample_lbl 360197601 `"Indonesia 1976"', add
capture label define sample_lbl 360198001 `"Indonesia 1980"', add
capture label define sample_lbl 360198501 `"Indonesia 1985"', add
capture label define sample_lbl 360199001 `"Indonesia 1990"', add
capture label define sample_lbl 360199501 `"Indonesia 1995"', add
capture label define sample_lbl 360200001 `"Indonesia 2000"', add
capture label define sample_lbl 360200501 `"Indonesia 2005"', add
capture label define sample_lbl 360201001 `"Indonesia 2010"', add
capture label define sample_lbl 364200601 `"Iran 2006"', add
capture label define sample_lbl 364201101 `"Iran 2011"', add
capture label define sample_lbl 368199701 `"Iraq 1997"', add
capture label define sample_lbl 372190101 `"Ireland 1901"', add
capture label define sample_lbl 372191101 `"Ireland 1911"', add
capture label define sample_lbl 372197101 `"Ireland 1971"', add
capture label define sample_lbl 372197901 `"Ireland 1979"', add
capture label define sample_lbl 372198101 `"Ireland 1981"', add
capture label define sample_lbl 372198601 `"Ireland 1986"', add
capture label define sample_lbl 372199101 `"Ireland 1991"', add
capture label define sample_lbl 372199601 `"Ireland 1996"', add
capture label define sample_lbl 372200201 `"Ireland 2002"', add
capture label define sample_lbl 372200601 `"Ireland 2006"', add
capture label define sample_lbl 372201101 `"Ireland 2011"', add
capture label define sample_lbl 372201601 `"Ireland 2016"', add
capture label define sample_lbl 376197201 `"Israel 1972"', add
capture label define sample_lbl 376198301 `"Israel 1983"', add
capture label define sample_lbl 376199501 `"Israel 1995"', add
capture label define sample_lbl 376200801 `"Israel 2008"', add
capture label define sample_lbl 380200101 `"Italy 2001"', add
capture label define sample_lbl 380201101 `"Italy 2011"', add
capture label define sample_lbl 380201121 `"Italy 2011 Q1 LFS"', add
capture label define sample_lbl 380201221 `"Italy 2012 Q1 LFS"', add
capture label define sample_lbl 380201321 `"Italy 2013 Q1 LFS"', add
capture label define sample_lbl 380201421 `"Italy 2014 Q1 LFS"', add
capture label define sample_lbl 380201521 `"Italy 2015 Q1 LFS"', add
capture label define sample_lbl 380201621 `"Italy 2016 Q1 LFS"', add
capture label define sample_lbl 380201721 `"Italy 2017 Q1 LFS"', add
capture label define sample_lbl 380201821 `"Italy 2018 Q1 LFS"', add
capture label define sample_lbl 380201921 `"Italy 2019 Q1 LFS"', add
capture label define sample_lbl 388198201 `"Jamaica 1982"', add
capture label define sample_lbl 388199101 `"Jamaica 1991"', add
capture label define sample_lbl 388200101 `"Jamaica 2001"', add
capture label define sample_lbl 400200401 `"Jordan 2004"', add
capture label define sample_lbl 404196901 `"Kenya 1969"', add
capture label define sample_lbl 404197901 `"Kenya 1979"', add
capture label define sample_lbl 404198901 `"Kenya 1989"', add
capture label define sample_lbl 404199901 `"Kenya 1999"', add
capture label define sample_lbl 404200901 `"Kenya 2009"', add
capture label define sample_lbl 417199901 `"Kyrgyz Republic 1999"', add
capture label define sample_lbl 417200901 `"Kyrgyz Republic 2009"', add
capture label define sample_lbl 418200501 `"Laos 2005"', add
capture label define sample_lbl 426199601 `"Lesotho 1996"', add
capture label define sample_lbl 426200601 `"Lesotho 2006"', add
capture label define sample_lbl 430197401 `"Liberia 1974"', add
capture label define sample_lbl 430200801 `"Liberia 2008"', add
capture label define sample_lbl 454198701 `"Malawi 1987"', add
capture label define sample_lbl 454199801 `"Malawi 1998"', add
capture label define sample_lbl 454200801 `"Malawi 2008"', add
capture label define sample_lbl 458197001 `"Malaysia 1970"', add
capture label define sample_lbl 458198001 `"Malaysia 1980"', add
capture label define sample_lbl 458199101 `"Malaysia 1991"', add
capture label define sample_lbl 458200001 `"Malaysia 2000"', add
capture label define sample_lbl 466198701 `"Mali 1987"', add
capture label define sample_lbl 466199801 `"Mali 1998"', add
capture label define sample_lbl 466200901 `"Mali 2009"', add
capture label define sample_lbl 480199001 `"Mauritius 1990"', add
capture label define sample_lbl 480200001 `"Mauritius 2000"', add
capture label define sample_lbl 480201101 `"Mauritius 2011"', add
capture label define sample_lbl 484196001 `"Mexico 1960"', add
capture label define sample_lbl 484197001 `"Mexico 1970"', add
capture label define sample_lbl 484199001 `"Mexico 1990"', add
capture label define sample_lbl 484199501 `"Mexico 1995"', add
capture label define sample_lbl 484200001 `"Mexico 2000"', add
capture label define sample_lbl 484200501 `"Mexico 2005"', add
capture label define sample_lbl 484201001 `"Mexico 2010"', add
capture label define sample_lbl 484201501 `"Mexico 2015"', add
capture label define sample_lbl 496198901 `"Mongolia 1989"', add
capture label define sample_lbl 496200001 `"Mongolia 2000"', add
capture label define sample_lbl 504198201 `"Morocco 1982"', add
capture label define sample_lbl 504199401 `"Morocco 1994"', add
capture label define sample_lbl 504200401 `"Morocco 2004"', add
capture label define sample_lbl 504201401 `"Morocco 2014"', add
capture label define sample_lbl 508199701 `"Mozambique 1997"', add
capture label define sample_lbl 508200701 `"Mozambique 2007"', add
capture label define sample_lbl 104201401 `"Myanmar 2014"', add
capture label define sample_lbl 524200101 `"Nepal 2001"', add
capture label define sample_lbl 524201101 `"Nepal 2011"', add
capture label define sample_lbl 528196001 `"Netherlands 1960"', add
capture label define sample_lbl 528197101 `"Netherlands 1971"', add
capture label define sample_lbl 528200101 `"Netherlands 2001"', add
capture label define sample_lbl 528201101 `"Netherlands 2011"', add
capture label define sample_lbl 558197101 `"Nicaragua 1971"', add
capture label define sample_lbl 558199501 `"Nicaragua 1995"', add
capture label define sample_lbl 558200501 `"Nicaragua 2005"', add
capture label define sample_lbl 566200621 `"Nigeria 2006"', add
capture label define sample_lbl 566200721 `"Nigeria 2007"', add
capture label define sample_lbl 566200821 `"Nigeria 2008"', add
capture label define sample_lbl 566200921 `"Nigeria 2009"', add
capture label define sample_lbl 566201021 `"Nigeria 2010"', add
capture label define sample_lbl 578180101 `"Norway 1801"', add
capture label define sample_lbl 578186501 `"Norway 1865"', add
capture label define sample_lbl 578187501 `"Norway 1875"', add
capture label define sample_lbl 578190001 `"Norway 1900"', add
capture label define sample_lbl 578191001 `"Norway 1910"', add
capture label define sample_lbl 586197301 `"Pakistan 1973"', add
capture label define sample_lbl 586198101 `"Pakistan 1981"', add
capture label define sample_lbl 586199801 `"Pakistan 1998"', add
capture label define sample_lbl 275199701 `"Palestine 1997"', add
capture label define sample_lbl 275200701 `"Palestine 2007"', add
capture label define sample_lbl 275201701 `"Palestine 2017"', add
capture label define sample_lbl 591196001 `"Panama 1960"', add
capture label define sample_lbl 591197001 `"Panama 1970"', add
capture label define sample_lbl 591198001 `"Panama 1980"', add
capture label define sample_lbl 591199001 `"Panama 1990"', add
capture label define sample_lbl 591200001 `"Panama 2000"', add
capture label define sample_lbl 591201001 `"Panama 2010"', add
capture label define sample_lbl 598198001 `"Papua New Guinea 1980"', add
capture label define sample_lbl 598199001 `"Papua New Guinea 1990"', add
capture label define sample_lbl 598200001 `"Papua New Guinea 2000"', add
capture label define sample_lbl 600196201 `"Paraguay 1962"', add
capture label define sample_lbl 600197201 `"Paraguay 1972"', add
capture label define sample_lbl 600198201 `"Paraguay 1982"', add
capture label define sample_lbl 600199201 `"Paraguay 1992"', add
capture label define sample_lbl 600200201 `"Paraguay 2002"', add
capture label define sample_lbl 604199301 `"Peru 1993"', add
capture label define sample_lbl 604200701 `"Peru 2007"', add
capture label define sample_lbl 608199001 `"Philippines 1990"', add
capture label define sample_lbl 608199501 `"Philippines 1995"', add
capture label define sample_lbl 608200001 `"Philippines 2000"', add
capture label define sample_lbl 608201001 `"Philippines 2010"', add
capture label define sample_lbl 616197801 `"Poland 1978"', add
capture label define sample_lbl 616198801 `"Poland 1988"', add
capture label define sample_lbl 616200201 `"Poland 2002"', add
capture label define sample_lbl 616201101 `"Poland 2011"', add
capture label define sample_lbl 620198101 `"Portugal 1981"', add
capture label define sample_lbl 620199101 `"Portugal 1991"', add
capture label define sample_lbl 620200101 `"Portugal 2001"', add
capture label define sample_lbl 620201101 `"Portugal 2011"', add
capture label define sample_lbl 630197001 `"Puerto Rico 1970"', add
capture label define sample_lbl 630198001 `"Puerto Rico 1980"', add
capture label define sample_lbl 630199001 `"Puerto Rico 1990"', add
capture label define sample_lbl 630200001 `"Puerto Rico 2000"', add
capture label define sample_lbl 630200501 `"Puerto Rico 2005"', add
capture label define sample_lbl 630201001 `"Puerto Rico 2010"', add
capture label define sample_lbl 642197701 `"Romania 1977"', add
capture label define sample_lbl 642199201 `"Romania 1992"', add
capture label define sample_lbl 642200201 `"Romania 2002"', add
capture label define sample_lbl 642201101 `"Romania 2011"', add
capture label define sample_lbl 643200201 `"Russia 2002"', add
capture label define sample_lbl 643201001 `"Russia 2010"', add
capture label define sample_lbl 646199101 `"Rwanda 1991"', add
capture label define sample_lbl 646200201 `"Rwanda 2002"', add
capture label define sample_lbl 646201201 `"Rwanda 2012"', add
capture label define sample_lbl 662198001 `"Saint Lucia 1980"', add
capture label define sample_lbl 662199101 `"Saint Lucia 1991"', add
capture label define sample_lbl 686198801 `"Senegal 1988"', add
capture label define sample_lbl 686200201 `"Senegal 2002"', add
capture label define sample_lbl 686201301 `"Senegal 2013"', add
capture label define sample_lbl 694200401 `"Sierra Leone 2004"', add
capture label define sample_lbl 705200201 `"Slovenia 2002"', add
capture label define sample_lbl 710199601 `"South Africa 1996"', add
capture label define sample_lbl 710200101 `"South Africa 2001"', add
capture label define sample_lbl 710200701 `"South Africa 2007"', add
capture label define sample_lbl 710201101 `"South Africa 2011"', add
capture label define sample_lbl 710201601 `"South Africa 2016"', add
capture label define sample_lbl 728200801 `"South Sudan 2008"', add
capture label define sample_lbl 724198101 `"Spain 1981"', add
capture label define sample_lbl 724199101 `"Spain 1991"', add
capture label define sample_lbl 724200101 `"Spain 2001"', add
capture label define sample_lbl 724201101 `"Spain 2011"', add
capture label define sample_lbl 724200521 `"Spain 2005 Q1 LFS"', add
capture label define sample_lbl 724200522 `"Spain 2005 Q2 LFS"', add
capture label define sample_lbl 724200523 `"Spain 2005 Q3 LFS"', add
capture label define sample_lbl 724200524 `"Spain 2005 Q4 LFS"', add
capture label define sample_lbl 724200621 `"Spain 2006 Q1 LFS"', add
capture label define sample_lbl 724200622 `"Spain 2006 Q2 LFS"', add
capture label define sample_lbl 724200623 `"Spain 2006 Q3 LFS"', add
capture label define sample_lbl 724200624 `"Spain 2006 Q4 LFS"', add
capture label define sample_lbl 724200721 `"Spain 2007 Q1 LFS"', add
capture label define sample_lbl 724200722 `"Spain 2007 Q2 LFS"', add
capture label define sample_lbl 724200723 `"Spain 2007 Q3 LFS"', add
capture label define sample_lbl 724200724 `"Spain 2007 Q4 LFS"', add
capture label define sample_lbl 724200821 `"Spain 2008 Q1 LFS"', add
capture label define sample_lbl 724200822 `"Spain 2008 Q2 LFS"', add
capture label define sample_lbl 724200823 `"Spain 2008 Q3 LFS"', add
capture label define sample_lbl 724200824 `"Spain 2008 Q4 LFS"', add
capture label define sample_lbl 724200921 `"Spain 2009 Q1 LFS"', add
capture label define sample_lbl 724200922 `"Spain 2009 Q2 LFS"', add
capture label define sample_lbl 724200923 `"Spain 2009 Q3 LFS"', add
capture label define sample_lbl 724200924 `"Spain 2009 Q4 LFS"', add
capture label define sample_lbl 724201021 `"Spain 2010 Q1 LFS"', add
capture label define sample_lbl 724201022 `"Spain 2010 Q2 LFS"', add
capture label define sample_lbl 724201023 `"Spain 2010 Q3 LFS"', add
capture label define sample_lbl 724201024 `"Spain 2010 Q4 LFS"', add
capture label define sample_lbl 724201121 `"Spain 2011 Q1 LFS"', add
capture label define sample_lbl 724201122 `"Spain 2011 Q2 LFS"', add
capture label define sample_lbl 724201123 `"Spain 2011 Q3 LFS"', add
capture label define sample_lbl 724201124 `"Spain 2011 Q4 LFS"', add
capture label define sample_lbl 724201221 `"Spain 2012 Q1 LFS"', add
capture label define sample_lbl 724201222 `"Spain 2012 Q2 LFS"', add
capture label define sample_lbl 724201223 `"Spain 2012 Q3 LFS"', add
capture label define sample_lbl 724201224 `"Spain 2012 Q4 LFS"', add
capture label define sample_lbl 724201321 `"Spain 2013 Q1 LFS"', add
capture label define sample_lbl 724201322 `"Spain 2013 Q2 LFS"', add
capture label define sample_lbl 724201323 `"Spain 2013 Q3 LFS"', add
capture label define sample_lbl 724201324 `"Spain 2013 Q4 LFS"', add
capture label define sample_lbl 724201421 `"Spain 2014 Q1 LFS"', add
capture label define sample_lbl 724201422 `"Spain 2014 Q2 LFS"', add
capture label define sample_lbl 724201423 `"Spain 2014 Q3 LFS"', add
capture label define sample_lbl 724201424 `"Spain 2014 Q4 LFS"', add
capture label define sample_lbl 724201521 `"Spain 2015 Q1 LFS"', add
capture label define sample_lbl 724201522 `"Spain 2015 Q2 LFS"', add
capture label define sample_lbl 724201523 `"Spain 2015 Q3 LFS"', add
capture label define sample_lbl 724201524 `"Spain 2015 Q4 LFS"', add
capture label define sample_lbl 724201621 `"Spain 2016 Q1 LFS"', add
capture label define sample_lbl 724201622 `"Spain 2016 Q2 LFS"', add
capture label define sample_lbl 724201623 `"Spain 2016 Q3 LFS"', add
capture label define sample_lbl 724201624 `"Spain 2016 Q4 LFS"', add
capture label define sample_lbl 724201721 `"Spain 2017 Q1 LFS"', add
capture label define sample_lbl 724201722 `"Spain 2017 Q2 LFS"', add
capture label define sample_lbl 724201723 `"Spain 2017 Q3 LFS"', add
capture label define sample_lbl 724201724 `"Spain 2017 Q4 LFS"', add
capture label define sample_lbl 724201821 `"Spain 2018 Q1 LFS"', add
capture label define sample_lbl 724201822 `"Spain 2018 Q2 LFS"', add
capture label define sample_lbl 724201823 `"Spain 2018 Q3 LFS"', add
capture label define sample_lbl 724201824 `"Spain 2018 Q4 LFS"', add
capture label define sample_lbl 724201921 `"Spain 2019 Q1 LFS"', add
capture label define sample_lbl 724201922 `"Spain 2019 Q2 LFS"', add
capture label define sample_lbl 724201923 `"Spain 2019 Q3 LFS"', add
capture label define sample_lbl 724201924 `"Spain 2019 Q4 LFS"', add
capture label define sample_lbl 729200801 `"Sudan 2008"', add
capture label define sample_lbl 740200401 `"Suriname 2004"', add
capture label define sample_lbl 740201201 `"Suriname 2012"', add
capture label define sample_lbl 752188001 `"Sweden 1880"', add
capture label define sample_lbl 752189001 `"Sweden 1890"', add
capture label define sample_lbl 752190001 `"Sweden 1900"', add
capture label define sample_lbl 752191001 `"Sweden 1910"', add
capture label define sample_lbl 756197001 `"Switzerland 1970"', add
capture label define sample_lbl 756198001 `"Switzerland 1980"', add
capture label define sample_lbl 756199001 `"Switzerland 1990"', add
capture label define sample_lbl 756200001 `"Switzerland 2000"', add
capture label define sample_lbl 834198801 `"Tanzania 1988"', add
capture label define sample_lbl 834200201 `"Tanzania 2002"', add
capture label define sample_lbl 834201201 `"Tanzania 2012"', add
capture label define sample_lbl 764197001 `"Thailand 1970"', add
capture label define sample_lbl 764198001 `"Thailand 1980"', add
capture label define sample_lbl 764199001 `"Thailand 1990"', add
capture label define sample_lbl 764200001 `"Thailand 2000"', add
capture label define sample_lbl 768196001 `"Togo 1960"', add
capture label define sample_lbl 768197001 `"Togo 1970"', add
capture label define sample_lbl 768201001 `"Togo 2010"', add
capture label define sample_lbl 780197001 `"Trinidad and Tobago 1970"', add
capture label define sample_lbl 780198001 `"Trinidad and Tobago 1980"', add
capture label define sample_lbl 780199001 `"Trinidad and Tobago 1990"', add
capture label define sample_lbl 780200001 `"Trinidad and Tobago 2000"', add
capture label define sample_lbl 780201101 `"Trinidad and Tobago 2011"', add
capture label define sample_lbl 792198501 `"Turkey 1985"', add
capture label define sample_lbl 792199001 `"Turkey 1990"', add
capture label define sample_lbl 792200001 `"Turkey 2000"', add
capture label define sample_lbl 800199101 `"Uganda 1991"', add
capture label define sample_lbl 800200201 `"Uganda 2002"', add
capture label define sample_lbl 800201401 `"Uganda 2014"', add
capture label define sample_lbl 804200101 `"Ukraine 2001"', add
capture label define sample_lbl 826185101 `"United Kingdom 1851 (England and Wales)"', add
capture label define sample_lbl 826185102 `"United Kingdom 1851 (Scotland)"', add
capture label define sample_lbl 826185103 `"United Kingdom 1851 (2% sample)"', add
capture label define sample_lbl 826186101 `"United Kingdom 1861 (England and Wales)"', add
capture label define sample_lbl 826186102 `"United Kingdom 1861 (Scotland)"', add
capture label define sample_lbl 826187101 `"United Kingdom 1871 (Scotland)"', add
capture label define sample_lbl 826188101 `"United Kingdom 1881 (England and Wales)"', add
capture label define sample_lbl 826188102 `"United Kingdom 1881 (Scotland)"', add
capture label define sample_lbl 826189101 `"United Kingdom 1891 (England and Wales)"', add
capture label define sample_lbl 826189102 `"United Kingdom 1891 (Scotland)"', add
capture label define sample_lbl 826190101 `"United Kingdom 1901 (England and Wales)"', add
capture label define sample_lbl 826190102 `"United Kingdom 1901 (Scotland)"', add
capture label define sample_lbl 826191101 `"United Kingdom 1911 (England and Wales)"', add
capture label define sample_lbl 826199101 `"United Kingdom 1991"', add
capture label define sample_lbl 826200101 `"United Kingdom 2001"', add
capture label define sample_lbl 840185001 `"United States 1850 (100%)"', add
capture label define sample_lbl 840185002 `"United States 1850 (1%)"', add
capture label define sample_lbl 840186001 `"United States 1860 (1%)"', add
capture label define sample_lbl 840187001 `"United States 1870 (1%)"', add
capture label define sample_lbl 840188001 `"United States 1880 (100%)"', add
capture label define sample_lbl 840188002 `"United States 1880 (10%)"', add
capture label define sample_lbl 840190001 `"United States 1900 (5%)"', add
capture label define sample_lbl 840191001 `"United States 1910 (1%)"', add
capture label define sample_lbl 840196001 `"United States 1960"', add
capture label define sample_lbl 840197001 `"United States 1970"', add
capture label define sample_lbl 840198001 `"United States 1980"', add
capture label define sample_lbl 840199001 `"United States 1990"', add
capture label define sample_lbl 840200001 `"United States 2000"', add
capture label define sample_lbl 840200501 `"United States 2005"', add
capture label define sample_lbl 840201001 `"United States 2010"', add
capture label define sample_lbl 840201501 `"United States 2015"', add
capture label define sample_lbl 858196301 `"Uruguay 1963"', add
capture label define sample_lbl 858196302 `"Uruguay 1963 (full count)"', add
capture label define sample_lbl 858197501 `"Uruguay 1975"', add
capture label define sample_lbl 858197502 `"Uruguay 1975 (full count)"', add
capture label define sample_lbl 858198501 `"Uruguay 1985"', add
capture label define sample_lbl 858198502 `"Uruguay 1985 (full count)"', add
capture label define sample_lbl 858199601 `"Uruguay 1996"', add
capture label define sample_lbl 858199602 `"Uruguay 1996 (full count)"', add
capture label define sample_lbl 858200621 `"Uruguay 2006"', add
capture label define sample_lbl 858201101 `"Uruguay 2011"', add
capture label define sample_lbl 858201102 `"Uruguay 2011 (full count)"', add
capture label define sample_lbl 862197101 `"Venezuela 1971"', add
capture label define sample_lbl 862198101 `"Venezuela 1981"', add
capture label define sample_lbl 862199001 `"Venezuela 1990"', add
capture label define sample_lbl 862200101 `"Venezuela 2001"', add
capture label define sample_lbl 704198901 `"Vietnam 1989"', add
capture label define sample_lbl 704199901 `"Vietnam 1999"', add
capture label define sample_lbl 704200901 `"Vietnam 2009"', add
capture label define sample_lbl 894199001 `"Zambia 1990"', add
capture label define sample_lbl 894200001 `"Zambia 2000"', add
capture label define sample_lbl 894201001 `"Zambia 2010"', add
capture label define sample_lbl 716201201 `"Zimbabwe 2012"', add
capture label values sample sample_lbl

capture label define age_lbl 000 `"Less than 1 year"'
capture label define age_lbl 001 `"1 year"', add
capture label define age_lbl 002 `"2 years"', add
capture label define age_lbl 003 `"3"', add
capture label define age_lbl 004 `"4"', add
capture label define age_lbl 005 `"5"', add
capture label define age_lbl 006 `"6"', add
capture label define age_lbl 007 `"7"', add
capture label define age_lbl 008 `"8"', add
capture label define age_lbl 009 `"9"', add
capture label define age_lbl 010 `"10"', add
capture label define age_lbl 011 `"11"', add
capture label define age_lbl 012 `"12"', add
capture label define age_lbl 013 `"13"', add
capture label define age_lbl 014 `"14"', add
capture label define age_lbl 015 `"15"', add
capture label define age_lbl 016 `"16"', add
capture label define age_lbl 017 `"17"', add
capture label define age_lbl 018 `"18"', add
capture label define age_lbl 019 `"19"', add
capture label define age_lbl 020 `"20"', add
capture label define age_lbl 021 `"21"', add
capture label define age_lbl 022 `"22"', add
capture label define age_lbl 023 `"23"', add
capture label define age_lbl 024 `"24"', add
capture label define age_lbl 025 `"25"', add
capture label define age_lbl 026 `"26"', add
capture label define age_lbl 027 `"27"', add
capture label define age_lbl 028 `"28"', add
capture label define age_lbl 029 `"29"', add
capture label define age_lbl 030 `"30"', add
capture label define age_lbl 031 `"31"', add
capture label define age_lbl 032 `"32"', add
capture label define age_lbl 033 `"33"', add
capture label define age_lbl 034 `"34"', add
capture label define age_lbl 035 `"35"', add
capture label define age_lbl 036 `"36"', add
capture label define age_lbl 037 `"37"', add
capture label define age_lbl 038 `"38"', add
capture label define age_lbl 039 `"39"', add
capture label define age_lbl 040 `"40"', add
capture label define age_lbl 041 `"41"', add
capture label define age_lbl 042 `"42"', add
capture label define age_lbl 043 `"43"', add
capture label define age_lbl 044 `"44"', add
capture label define age_lbl 045 `"45"', add
capture label define age_lbl 046 `"46"', add
capture label define age_lbl 047 `"47"', add
capture label define age_lbl 048 `"48"', add
capture label define age_lbl 049 `"49"', add
capture label define age_lbl 050 `"50"', add
capture label define age_lbl 051 `"51"', add
capture label define age_lbl 052 `"52"', add
capture label define age_lbl 053 `"53"', add
capture label define age_lbl 054 `"54"', add
capture label define age_lbl 055 `"55"', add
capture label define age_lbl 056 `"56"', add
capture label define age_lbl 057 `"57"', add
capture label define age_lbl 058 `"58"', add
capture label define age_lbl 059 `"59"', add
capture label define age_lbl 060 `"60"', add
capture label define age_lbl 061 `"61"', add
capture label define age_lbl 062 `"62"', add
capture label define age_lbl 063 `"63"', add
capture label define age_lbl 064 `"64"', add
capture label define age_lbl 065 `"65"', add
capture label define age_lbl 066 `"66"', add
capture label define age_lbl 067 `"67"', add
capture label define age_lbl 068 `"68"', add
capture label define age_lbl 069 `"69"', add
capture label define age_lbl 070 `"70"', add
capture label define age_lbl 071 `"71"', add
capture label define age_lbl 072 `"72"', add
capture label define age_lbl 073 `"73"', add
capture label define age_lbl 074 `"74"', add
capture label define age_lbl 075 `"75"', add
capture label define age_lbl 076 `"76"', add
capture label define age_lbl 077 `"77"', add
capture label define age_lbl 078 `"78"', add
capture label define age_lbl 079 `"79"', add
capture label define age_lbl 080 `"80"', add
capture label define age_lbl 081 `"81"', add
capture label define age_lbl 082 `"82"', add
capture label define age_lbl 083 `"83"', add
capture label define age_lbl 084 `"84"', add
capture label define age_lbl 085 `"85"', add
capture label define age_lbl 086 `"86"', add
capture label define age_lbl 087 `"87"', add
capture label define age_lbl 088 `"88"', add
capture label define age_lbl 089 `"89"', add
capture label define age_lbl 090 `"90"', add
capture label define age_lbl 091 `"91"', add
capture label define age_lbl 092 `"92"', add
capture label define age_lbl 093 `"93"', add
capture label define age_lbl 094 `"94"', add
capture label define age_lbl 095 `"95"', add
capture label define age_lbl 096 `"96"', add
capture label define age_lbl 097 `"97"', add
capture label define age_lbl 098 `"98"', add
capture label define age_lbl 099 `"99"', add
capture label define age_lbl 100 `"100+"', add
capture label define age_lbl 999 `"Not reported/missing"', add
capture label values age age_lbl

capture label define sex_lbl 1 `"Male"'
capture label define sex_lbl 2 `"Female"', add
capture label define sex_lbl 9 `"Unknown"', add
capture label values sex sex_lbl

capture label define bplcountry_lbl 00000 `"NIU (not in universe)"'
capture label define bplcountry_lbl 10000 `"Africa"', add
capture label define bplcountry_lbl 11000 `"Eastern Africa"', add
capture label define bplcountry_lbl 11005 `"British Indian Ocean Territory"', add
capture label define bplcountry_lbl 11010 `"Burundi"', add
capture label define bplcountry_lbl 11020 `"Comoros"', add
capture label define bplcountry_lbl 11030 `"Djibouti"', add
capture label define bplcountry_lbl 11040 `"Eritrea"', add
capture label define bplcountry_lbl 11050 `"Ethiopia"', add
capture label define bplcountry_lbl 11051 `"Ethiopia (including Eritrea)"', add
capture label define bplcountry_lbl 11060 `"Kenya"', add
capture label define bplcountry_lbl 11070 `"Madagascar"', add
capture label define bplcountry_lbl 11080 `"Malawi"', add
capture label define bplcountry_lbl 11090 `"Mauritius"', add
capture label define bplcountry_lbl 11100 `"Mozambique"', add
capture label define bplcountry_lbl 11110 `"Reunion"', add
capture label define bplcountry_lbl 11120 `"Rwanda"', add
capture label define bplcountry_lbl 11130 `"Seychelles"', add
capture label define bplcountry_lbl 11140 `"Somalia"', add
capture label define bplcountry_lbl 11150 `"South Sudan"', add
capture label define bplcountry_lbl 11160 `"Uganda"', add
capture label define bplcountry_lbl 11170 `"Tanzania"', add
capture label define bplcountry_lbl 11180 `"Zambia"', add
capture label define bplcountry_lbl 11190 `"Zimbabwe"', add
capture label define bplcountry_lbl 11999 `"Eastern Africa, other or n.s."', add
capture label define bplcountry_lbl 12000 `"Middle Africa"', add
capture label define bplcountry_lbl 12010 `"Angola"', add
capture label define bplcountry_lbl 12020 `"Cameroon"', add
capture label define bplcountry_lbl 12030 `"Central African Republic"', add
capture label define bplcountry_lbl 12040 `"Chad"', add
capture label define bplcountry_lbl 12050 `"Congo (Republic of)"', add
capture label define bplcountry_lbl 12060 `"Democratic Republic of Congo"', add
capture label define bplcountry_lbl 12070 `"Equatorial Guinea"', add
capture label define bplcountry_lbl 12080 `"Gabon"', add
capture label define bplcountry_lbl 12090 `"Sao Tome and Principe"', add
capture label define bplcountry_lbl 12999 `"Middle Africa, other or n.s."', add
capture label define bplcountry_lbl 13000 `"Northern Africa"', add
capture label define bplcountry_lbl 13010 `"Algeria"', add
capture label define bplcountry_lbl 13011 `"Algeria/Tunisia"', add
capture label define bplcountry_lbl 13020 `"Egypt"', add
capture label define bplcountry_lbl 13021 `"Egypt/Sudan"', add
capture label define bplcountry_lbl 13030 `"Libya"', add
capture label define bplcountry_lbl 13040 `"Morocco"', add
capture label define bplcountry_lbl 13050 `"Sudan"', add
capture label define bplcountry_lbl 13060 `"Tunisia"', add
capture label define bplcountry_lbl 13070 `"Western Sahara"', add
capture label define bplcountry_lbl 13999 `"Northern Africa, other or n.s."', add
capture label define bplcountry_lbl 14000 `"Southern Africa"', add
capture label define bplcountry_lbl 14010 `"Botswana"', add
capture label define bplcountry_lbl 14020 `"Lesotho"', add
capture label define bplcountry_lbl 14030 `"Namibia"', add
capture label define bplcountry_lbl 14040 `"South Africa"', add
capture label define bplcountry_lbl 14050 `"Swaziland"', add
capture label define bplcountry_lbl 14999 `"Southern Africa, other or n.s."', add
capture label define bplcountry_lbl 15000 `"Western Africa"', add
capture label define bplcountry_lbl 15010 `"Benin"', add
capture label define bplcountry_lbl 15020 `"Burkina Faso"', add
capture label define bplcountry_lbl 15021 `"Upper Volta"', add
capture label define bplcountry_lbl 15030 `"Cape Verde"', add
capture label define bplcountry_lbl 15040 `"Ivory Coast"', add
capture label define bplcountry_lbl 15050 `"Gambia"', add
capture label define bplcountry_lbl 15060 `"Ghana"', add
capture label define bplcountry_lbl 15070 `"Guinea"', add
capture label define bplcountry_lbl 15080 `"Guinea-Bissau"', add
capture label define bplcountry_lbl 15081 `"Guinea-Bissau and Cape Verde"', add
capture label define bplcountry_lbl 15090 `"Liberia"', add
capture label define bplcountry_lbl 15100 `"Mali"', add
capture label define bplcountry_lbl 15110 `"Mauritania"', add
capture label define bplcountry_lbl 15120 `"Niger"', add
capture label define bplcountry_lbl 15130 `"Nigeria"', add
capture label define bplcountry_lbl 15140 `"St. Helena and Ascension"', add
capture label define bplcountry_lbl 15150 `"Senegal"', add
capture label define bplcountry_lbl 15160 `"Sierra Leone"', add
capture label define bplcountry_lbl 15170 `"Togo"', add
capture label define bplcountry_lbl 15180 `"Canary Islands"', add
capture label define bplcountry_lbl 15999 `"West Africa, other or n.s."', add
capture label define bplcountry_lbl 19999 `"Africa, other or n.s."', add
capture label define bplcountry_lbl 20000 `"Americas"', add
capture label define bplcountry_lbl 21000 `"Caribbean"', add
capture label define bplcountry_lbl 21010 `"Anguilla"', add
capture label define bplcountry_lbl 21020 `"Antigua-Barbuda"', add
capture label define bplcountry_lbl 21030 `"Aruba"', add
capture label define bplcountry_lbl 21040 `"Bahamas"', add
capture label define bplcountry_lbl 21050 `"Barbados"', add
capture label define bplcountry_lbl 21060 `"British Virgin Islands"', add
capture label define bplcountry_lbl 21070 `"Cayman Isles"', add
capture label define bplcountry_lbl 21080 `"Cuba"', add
capture label define bplcountry_lbl 21090 `"Dominica"', add
capture label define bplcountry_lbl 21100 `"Dominican Republic"', add
capture label define bplcountry_lbl 21110 `"Grenada"', add
capture label define bplcountry_lbl 21120 `"Guadeloupe"', add
capture label define bplcountry_lbl 21130 `"Haiti"', add
capture label define bplcountry_lbl 21140 `"Jamaica"', add
capture label define bplcountry_lbl 21150 `"Martinique"', add
capture label define bplcountry_lbl 21160 `"Montserrat"', add
capture label define bplcountry_lbl 21170 `"Netherlands Antilles"', add
capture label define bplcountry_lbl 21180 `"Puerto Rico"', add
capture label define bplcountry_lbl 21190 `"St. Kitts-Nevis"', add
capture label define bplcountry_lbl 21200 `"St. Croix"', add
capture label define bplcountry_lbl 21210 `"St. John"', add
capture label define bplcountry_lbl 21220 `"St. Lucia"', add
capture label define bplcountry_lbl 21230 `"St Thomas"', add
capture label define bplcountry_lbl 21240 `"St. Vincent"', add
capture label define bplcountry_lbl 21250 `"Trinidad and Tobago"', add
capture label define bplcountry_lbl 21260 `"Turks and Caicos"', add
capture label define bplcountry_lbl 21270 `"U.S. Virgin Islands"', add
capture label define bplcountry_lbl 21991 `"Caribbean commonwealth, n.s."', add
capture label define bplcountry_lbl 21999 `"Caribbean, other or n.s."', add
capture label define bplcountry_lbl 22000 `"Central America"', add
capture label define bplcountry_lbl 22010 `"Belize/British Honduras"', add
capture label define bplcountry_lbl 22020 `"Costa Rica"', add
capture label define bplcountry_lbl 22030 `"El Salvador"', add
capture label define bplcountry_lbl 22040 `"Guatemala"', add
capture label define bplcountry_lbl 22050 `"Honduras"', add
capture label define bplcountry_lbl 22060 `"Mexico"', add
capture label define bplcountry_lbl 22070 `"Nicaragua"', add
capture label define bplcountry_lbl 22080 `"Panama"', add
capture label define bplcountry_lbl 22081 `"Panama Canal Zone"', add
capture label define bplcountry_lbl 22999 `"Central America, other or n.s."', add
capture label define bplcountry_lbl 23000 `"South America"', add
capture label define bplcountry_lbl 23010 `"Argentina"', add
capture label define bplcountry_lbl 23020 `"Bolivia"', add
capture label define bplcountry_lbl 23030 `"Brazil"', add
capture label define bplcountry_lbl 23040 `"Chile"', add
capture label define bplcountry_lbl 23050 `"Colombia"', add
capture label define bplcountry_lbl 23060 `"Ecuador"', add
capture label define bplcountry_lbl 23070 `"Falkland Islands"', add
capture label define bplcountry_lbl 23080 `"French Guiana"', add
capture label define bplcountry_lbl 23090 `"Guyana/British Guiana"', add
capture label define bplcountry_lbl 23100 `"Paraguay"', add
capture label define bplcountry_lbl 23110 `"Peru"', add
capture label define bplcountry_lbl 23120 `"Suriname"', add
capture label define bplcountry_lbl 23130 `"Uruguay"', add
capture label define bplcountry_lbl 23140 `"Venezuela"', add
capture label define bplcountry_lbl 23999 `"South America, other or n.s."', add
capture label define bplcountry_lbl 24000 `"North America"', add
capture label define bplcountry_lbl 24010 `"Bermuda"', add
capture label define bplcountry_lbl 24020 `"Canada"', add
capture label define bplcountry_lbl 24030 `"Greenland"', add
capture label define bplcountry_lbl 24040 `"United States"', add
capture label define bplcountry_lbl 24999 `"North America, other or n.s."', add
capture label define bplcountry_lbl 29999 `"Americas, other or n.s."', add
capture label define bplcountry_lbl 30000 `"Asia"', add
capture label define bplcountry_lbl 31000 `"Eastern Asia"', add
capture label define bplcountry_lbl 31010 `"China"', add
capture label define bplcountry_lbl 31011 `"Hong Kong"', add
capture label define bplcountry_lbl 31012 `"Macau"', add
capture label define bplcountry_lbl 31013 `"Taiwan"', add
capture label define bplcountry_lbl 31020 `"Japan"', add
capture label define bplcountry_lbl 31030 `"Korea"', add
capture label define bplcountry_lbl 31031 `"Korea, DPR (North)"', add
capture label define bplcountry_lbl 31032 `"Korea, RO (South)"', add
capture label define bplcountry_lbl 31040 `"Mongolia"', add
capture label define bplcountry_lbl 31999 `"Eastern Asia, other or n.s."', add
capture label define bplcountry_lbl 32000 `"South-Central Asia"', add
capture label define bplcountry_lbl 32010 `"Afghanistan"', add
capture label define bplcountry_lbl 32020 `"Bangladesh"', add
capture label define bplcountry_lbl 32030 `"Bhutan"', add
capture label define bplcountry_lbl 32040 `"India"', add
capture label define bplcountry_lbl 32041 `"India/Pakistan"', add
capture label define bplcountry_lbl 32042 `"India/Pakistan/Bangladesh/Sri Lanka"', add
capture label define bplcountry_lbl 32050 `"Iran"', add
capture label define bplcountry_lbl 32060 `"Kazakhstan"', add
capture label define bplcountry_lbl 32070 `"Kyrgyzstan"', add
capture label define bplcountry_lbl 32080 `"Maldives"', add
capture label define bplcountry_lbl 32090 `"Nepal"', add
capture label define bplcountry_lbl 32100 `"Pakistan"', add
capture label define bplcountry_lbl 32101 `"Pakistan/Bangladesh"', add
capture label define bplcountry_lbl 32110 `"Sri Lanka (Ceylon)"', add
capture label define bplcountry_lbl 32120 `"Tajikistan"', add
capture label define bplcountry_lbl 32130 `"Turkmenistan"', add
capture label define bplcountry_lbl 32140 `"Uzbekistan"', add
capture label define bplcountry_lbl 32999 `"South-Central Asia, other or n.s."', add
capture label define bplcountry_lbl 33000 `"South-Eastern Asia"', add
capture label define bplcountry_lbl 33010 `"Brunei"', add
capture label define bplcountry_lbl 33020 `"Cambodia (Kampuchea)"', add
capture label define bplcountry_lbl 33030 `"East Timor"', add
capture label define bplcountry_lbl 33040 `"Indonesia"', add
capture label define bplcountry_lbl 33050 `"Laos"', add
capture label define bplcountry_lbl 33060 `"Malaysia"', add
capture label define bplcountry_lbl 33070 `"Myanmar (Burma)"', add
capture label define bplcountry_lbl 33080 `"Philippines"', add
capture label define bplcountry_lbl 33090 `"Singapore"', add
capture label define bplcountry_lbl 33100 `"Thailand"', add
capture label define bplcountry_lbl 33110 `"Vietnam"', add
capture label define bplcountry_lbl 33999 `"South-Eastern Asia, other or n.s."', add
capture label define bplcountry_lbl 34000 `"Western Asia"', add
capture label define bplcountry_lbl 34010 `"Armenia"', add
capture label define bplcountry_lbl 34020 `"Azerbaijan"', add
capture label define bplcountry_lbl 34030 `"Bahrain"', add
capture label define bplcountry_lbl 34040 `"Cyprus"', add
capture label define bplcountry_lbl 34050 `"Georgia"', add
capture label define bplcountry_lbl 34051 `"Abkhazia"', add
capture label define bplcountry_lbl 34052 `"South Ossetia"', add
capture label define bplcountry_lbl 34060 `"Iraq"', add
capture label define bplcountry_lbl 34070 `"Israel"', add
capture label define bplcountry_lbl 34071 `"Israel/Palestine"', add
capture label define bplcountry_lbl 34080 `"Jordan"', add
capture label define bplcountry_lbl 34090 `"Kuwait"', add
capture label define bplcountry_lbl 34100 `"Lebanon"', add
capture label define bplcountry_lbl 34110 `"Palestine"', add
capture label define bplcountry_lbl 34111 `"West Bank"', add
capture label define bplcountry_lbl 34112 `"Gaza Strip"', add
capture label define bplcountry_lbl 34120 `"Oman"', add
capture label define bplcountry_lbl 34130 `"Qatar"', add
capture label define bplcountry_lbl 34140 `"Saudi Arabia"', add
capture label define bplcountry_lbl 34150 `"Syria"', add
capture label define bplcountry_lbl 34151 `"Syria/Lebanon"', add
capture label define bplcountry_lbl 34160 `"Turkey"', add
capture label define bplcountry_lbl 34170 `"United Arab Emirates"', add
capture label define bplcountry_lbl 34180 `"Yemen"', add
capture label define bplcountry_lbl 34991 `"Middle East"', add
capture label define bplcountry_lbl 34999 `"Western Asia, other or n.s."', add
capture label define bplcountry_lbl 39999 `"Asia, other or n.s."', add
capture label define bplcountry_lbl 40000 `"Europe"', add
capture label define bplcountry_lbl 41000 `"Eastern Europe"', add
capture label define bplcountry_lbl 41010 `"Belarus"', add
capture label define bplcountry_lbl 41020 `"Bulgaria"', add
capture label define bplcountry_lbl 41021 `"Bulgaria/Greece"', add
capture label define bplcountry_lbl 41030 `"Czech Republic/Czechoslovakia"', add
capture label define bplcountry_lbl 41040 `"Hungary"', add
capture label define bplcountry_lbl 41050 `"Poland"', add
capture label define bplcountry_lbl 41060 `"Moldova"', add
capture label define bplcountry_lbl 41070 `"Romania"', add
capture label define bplcountry_lbl 41080 `"Russia/USSR"', add
capture label define bplcountry_lbl 41090 `"Slovakia"', add
capture label define bplcountry_lbl 41100 `"Ukraine"', add
capture label define bplcountry_lbl 41991 `"Albania, Bulgaria, Czech, Hungary, Romania, Yugoslavia"', add
capture label define bplcountry_lbl 41992 `"Central-Eastern Europe"', add
capture label define bplcountry_lbl 41999 `"Eastern Europe, other or n.s."', add
capture label define bplcountry_lbl 42000 `"Northern Europe"', add
capture label define bplcountry_lbl 42010 `"Denmark"', add
capture label define bplcountry_lbl 42020 `"Estonia"', add
capture label define bplcountry_lbl 42030 `"Faroe Islands"', add
capture label define bplcountry_lbl 42040 `"Finland"', add
capture label define bplcountry_lbl 42050 `"Iceland"', add
capture label define bplcountry_lbl 42060 `"Ireland"', add
capture label define bplcountry_lbl 42070 `"Latvia"', add
capture label define bplcountry_lbl 42080 `"Lithuania"', add
capture label define bplcountry_lbl 42090 `"Norway"', add
capture label define bplcountry_lbl 42100 `"Svalbard and Jan Mayen Islands"', add
capture label define bplcountry_lbl 42110 `"Sweden"', add
capture label define bplcountry_lbl 42120 `"United Kingdom"', add
capture label define bplcountry_lbl 42999 `"Northern Europe, other or n.s."', add
capture label define bplcountry_lbl 43000 `"Southern Europe"', add
capture label define bplcountry_lbl 43010 `"Albania"', add
capture label define bplcountry_lbl 43020 `"Andorra"', add
capture label define bplcountry_lbl 43030 `"Bosnia and Herzegovina"', add
capture label define bplcountry_lbl 43040 `"Croatia"', add
capture label define bplcountry_lbl 43050 `"Gibraltar"', add
capture label define bplcountry_lbl 43060 `"Greece"', add
capture label define bplcountry_lbl 43070 `"Italy"', add
capture label define bplcountry_lbl 43071 `"Vatican City"', add
capture label define bplcountry_lbl 43080 `"Malta"', add
capture label define bplcountry_lbl 43090 `"Portugal"', add
capture label define bplcountry_lbl 43100 `"San Marino"', add
capture label define bplcountry_lbl 43110 `"Slovenia"', add
capture label define bplcountry_lbl 43120 `"Spain"', add
capture label define bplcountry_lbl 43121 `"Spain/Portugal"', add
capture label define bplcountry_lbl 43130 `"Macedonia"', add
capture label define bplcountry_lbl 43140 `"Yugoslavia"', add
capture label define bplcountry_lbl 43141 `"Montenegro"', add
capture label define bplcountry_lbl 43142 `"Serbia"', add
capture label define bplcountry_lbl 43143 `"Kosovo"', add
capture label define bplcountry_lbl 43144 `"Serbia and Montenegro"', add
capture label define bplcountry_lbl 43991 `"Gibraltar/Malta"', add
capture label define bplcountry_lbl 43992 `"Portugal/Greece"', add
capture label define bplcountry_lbl 43993 `"Italy, Holy See, San Marino"', add
capture label define bplcountry_lbl 43999 `"Southern Europe, other or n.s."', add
capture label define bplcountry_lbl 44000 `"Western Europe"', add
capture label define bplcountry_lbl 44010 `"Austria"', add
capture label define bplcountry_lbl 44020 `"Belgium"', add
capture label define bplcountry_lbl 44021 `"Belgium/Luxemburg"', add
capture label define bplcountry_lbl 44022 `"Belgium/Netherlands/Luxemburg"', add
capture label define bplcountry_lbl 44030 `"France"', add
capture label define bplcountry_lbl 44040 `"Germany"', add
capture label define bplcountry_lbl 44042 `"West Germany"', add
capture label define bplcountry_lbl 44043 `"Germany/Austria"', add
capture label define bplcountry_lbl 44044 `"Mecklenburg-Schwerin"', add
capture label define bplcountry_lbl 44050 `"Liechtenstein"', add
capture label define bplcountry_lbl 44060 `"Luxembourg"', add
capture label define bplcountry_lbl 44070 `"Monaco"', add
capture label define bplcountry_lbl 44080 `"Netherlands"', add
capture label define bplcountry_lbl 44090 `"Switzerland"', add
capture label define bplcountry_lbl 44991 `"Belgium, Denmark, Luxembourg, Netherlands"', add
capture label define bplcountry_lbl 44999 `"Western Europe, other or n.s."', add
capture label define bplcountry_lbl 49992 `"European Union"', add
capture label define bplcountry_lbl 49993 `"European Union (original 15)"', add
capture label define bplcountry_lbl 49994 `"Other European Union (not original 15)"', add
capture label define bplcountry_lbl 49999 `"Europe, other or n.s."', add
capture label define bplcountry_lbl 50000 `"Oceania"', add
capture label define bplcountry_lbl 51000 `"Australia and New Zealand"', add
capture label define bplcountry_lbl 51010 `"Australia"', add
capture label define bplcountry_lbl 51020 `"New Zealand"', add
capture label define bplcountry_lbl 51030 `"Norfolk Islands"', add
capture label define bplcountry_lbl 51999 `"Australia and New Zealand, n.s."', add
capture label define bplcountry_lbl 52000 `"Melanesia"', add
capture label define bplcountry_lbl 52010 `"Fiji"', add
capture label define bplcountry_lbl 52020 `"New Caledonia"', add
capture label define bplcountry_lbl 52030 `"Papua New Guinea"', add
capture label define bplcountry_lbl 52040 `"Solomon Islands"', add
capture label define bplcountry_lbl 52050 `"Vanuatu (New Hebrides)"', add
capture label define bplcountry_lbl 52999 `"Melanesia, n.s."', add
capture label define bplcountry_lbl 53000 `"Micronesia"', add
capture label define bplcountry_lbl 53010 `"Kiribati"', add
capture label define bplcountry_lbl 53020 `"Marshall Islands"', add
capture label define bplcountry_lbl 53030 `"Nauru"', add
capture label define bplcountry_lbl 53040 `"Northern Mariana Isls."', add
capture label define bplcountry_lbl 53050 `"Palau"', add
capture label define bplcountry_lbl 53999 `"Micronesia, other or n.s."', add
capture label define bplcountry_lbl 54000 `"Polynesia"', add
capture label define bplcountry_lbl 54010 `"Cook Islands"', add
capture label define bplcountry_lbl 54020 `"French Polynesia"', add
capture label define bplcountry_lbl 54030 `"Niue"', add
capture label define bplcountry_lbl 54040 `"Pitcairn Island"', add
capture label define bplcountry_lbl 54050 `"Western Samoa"', add
capture label define bplcountry_lbl 54060 `"Eastern Samoa"', add
capture label define bplcountry_lbl 54070 `"Tokelau"', add
capture label define bplcountry_lbl 54080 `"Tonga"', add
capture label define bplcountry_lbl 54090 `"Tuvalu"', add
capture label define bplcountry_lbl 54100 `"Wallis and Futuna Isls."', add
capture label define bplcountry_lbl 54999 `"Polynesia, other or n.s."', add
capture label define bplcountry_lbl 55000 `"U.S. Pacific Possessions"', add
capture label define bplcountry_lbl 55010 `"American Samoa"', add
capture label define bplcountry_lbl 55020 `"Baker Island"', add
capture label define bplcountry_lbl 55030 `"Guam"', add
capture label define bplcountry_lbl 55040 `"Howland Island"', add
capture label define bplcountry_lbl 55050 `"Johnston Atoll"', add
capture label define bplcountry_lbl 55060 `"Kingman Reef"', add
capture label define bplcountry_lbl 55070 `"Midway Islands"', add
capture label define bplcountry_lbl 55080 `"Wake Island"', add
capture label define bplcountry_lbl 55999 `"US Pacific, other or n.s."', add
capture label define bplcountry_lbl 59999 `"Oceania, other or n.s."', add
capture label define bplcountry_lbl 80000 `"AT SEA"', add
capture label define bplcountry_lbl 90000 `"Other countries n.s."', add
capture label define bplcountry_lbl 99999 `"Unknown"', add
capture label values bplcountry bplcountry_lbl

capture label define yrimm_lbl 0000 `"NIU (not in universe)"'
capture label define yrimm_lbl 1790 `"1790"', add
capture label define yrimm_lbl 1800 `"1800"', add
capture label define yrimm_lbl 1801 `"1801"', add
capture label define yrimm_lbl 1802 `"1802"', add
capture label define yrimm_lbl 1803 `"1803"', add
capture label define yrimm_lbl 1804 `"1804"', add
capture label define yrimm_lbl 1805 `"1805"', add
capture label define yrimm_lbl 1806 `"1806"', add
capture label define yrimm_lbl 1807 `"1807"', add
capture label define yrimm_lbl 1808 `"1808"', add
capture label define yrimm_lbl 1809 `"1809"', add
capture label define yrimm_lbl 1810 `"1810"', add
capture label define yrimm_lbl 1811 `"1811"', add
capture label define yrimm_lbl 1812 `"1812"', add
capture label define yrimm_lbl 1813 `"1813"', add
capture label define yrimm_lbl 1814 `"1814"', add
capture label define yrimm_lbl 1815 `"1815"', add
capture label define yrimm_lbl 1816 `"1816"', add
capture label define yrimm_lbl 1817 `"1817"', add
capture label define yrimm_lbl 1818 `"1818"', add
capture label define yrimm_lbl 1819 `"1819"', add
capture label define yrimm_lbl 1820 `"1820"', add
capture label define yrimm_lbl 1821 `"1821"', add
capture label define yrimm_lbl 1822 `"1822"', add
capture label define yrimm_lbl 1823 `"1823"', add
capture label define yrimm_lbl 1824 `"1824"', add
capture label define yrimm_lbl 1825 `"1825"', add
capture label define yrimm_lbl 1826 `"1826"', add
capture label define yrimm_lbl 1827 `"1827"', add
capture label define yrimm_lbl 1828 `"1828"', add
capture label define yrimm_lbl 1829 `"1829"', add
capture label define yrimm_lbl 1830 `"1830"', add
capture label define yrimm_lbl 1831 `"1831"', add
capture label define yrimm_lbl 1832 `"1832"', add
capture label define yrimm_lbl 1833 `"1833"', add
capture label define yrimm_lbl 1834 `"1834"', add
capture label define yrimm_lbl 1835 `"1835"', add
capture label define yrimm_lbl 1836 `"1836"', add
capture label define yrimm_lbl 1837 `"1837"', add
capture label define yrimm_lbl 1838 `"1838"', add
capture label define yrimm_lbl 1839 `"1839"', add
capture label define yrimm_lbl 1840 `"1840"', add
capture label define yrimm_lbl 1841 `"1841"', add
capture label define yrimm_lbl 1842 `"1842"', add
capture label define yrimm_lbl 1843 `"1843"', add
capture label define yrimm_lbl 1844 `"1844"', add
capture label define yrimm_lbl 1845 `"1845"', add
capture label define yrimm_lbl 1846 `"1846"', add
capture label define yrimm_lbl 1847 `"1847"', add
capture label define yrimm_lbl 1848 `"1848"', add
capture label define yrimm_lbl 1849 `"1849"', add
capture label define yrimm_lbl 1850 `"1850"', add
capture label define yrimm_lbl 1851 `"1851"', add
capture label define yrimm_lbl 1852 `"1852"', add
capture label define yrimm_lbl 1853 `"1853"', add
capture label define yrimm_lbl 1854 `"1854"', add
capture label define yrimm_lbl 1855 `"1855"', add
capture label define yrimm_lbl 1856 `"1856"', add
capture label define yrimm_lbl 1857 `"1857"', add
capture label define yrimm_lbl 1858 `"1858"', add
capture label define yrimm_lbl 1859 `"1859"', add
capture label define yrimm_lbl 1860 `"1860"', add
capture label define yrimm_lbl 1861 `"1861"', add
capture label define yrimm_lbl 1862 `"1862"', add
capture label define yrimm_lbl 1863 `"1863"', add
capture label define yrimm_lbl 1864 `"1864"', add
capture label define yrimm_lbl 1865 `"1865"', add
capture label define yrimm_lbl 1866 `"1866"', add
capture label define yrimm_lbl 1867 `"1867"', add
capture label define yrimm_lbl 1868 `"1868"', add
capture label define yrimm_lbl 1869 `"1869"', add
capture label define yrimm_lbl 1870 `"1870"', add
capture label define yrimm_lbl 1871 `"1871"', add
capture label define yrimm_lbl 1872 `"1872"', add
capture label define yrimm_lbl 1873 `"1873"', add
capture label define yrimm_lbl 1874 `"1874"', add
capture label define yrimm_lbl 1875 `"1875"', add
capture label define yrimm_lbl 1876 `"1876"', add
capture label define yrimm_lbl 1877 `"1877"', add
capture label define yrimm_lbl 1878 `"1878"', add
capture label define yrimm_lbl 1879 `"1879"', add
capture label define yrimm_lbl 1880 `"1880"', add
capture label define yrimm_lbl 1881 `"1881"', add
capture label define yrimm_lbl 1882 `"1882"', add
capture label define yrimm_lbl 1883 `"1883"', add
capture label define yrimm_lbl 1884 `"1884"', add
capture label define yrimm_lbl 1885 `"1885"', add
capture label define yrimm_lbl 1886 `"1886"', add
capture label define yrimm_lbl 1887 `"1887"', add
capture label define yrimm_lbl 1888 `"1888"', add
capture label define yrimm_lbl 1889 `"1889"', add
capture label define yrimm_lbl 1890 `"1890"', add
capture label define yrimm_lbl 1891 `"1891"', add
capture label define yrimm_lbl 1892 `"1892"', add
capture label define yrimm_lbl 1893 `"1893"', add
capture label define yrimm_lbl 1894 `"1894"', add
capture label define yrimm_lbl 1895 `"1895"', add
capture label define yrimm_lbl 1896 `"1896"', add
capture label define yrimm_lbl 1897 `"1897"', add
capture label define yrimm_lbl 1898 `"1898"', add
capture label define yrimm_lbl 1899 `"1899"', add
capture label define yrimm_lbl 1900 `"1900"', add
capture label define yrimm_lbl 1901 `"1901"', add
capture label define yrimm_lbl 1902 `"1902"', add
capture label define yrimm_lbl 1903 `"1903"', add
capture label define yrimm_lbl 1904 `"1904"', add
capture label define yrimm_lbl 1905 `"1905"', add
capture label define yrimm_lbl 1906 `"1906"', add
capture label define yrimm_lbl 1907 `"1907"', add
capture label define yrimm_lbl 1908 `"1908"', add
capture label define yrimm_lbl 1909 `"1909"', add
capture label define yrimm_lbl 1910 `"1910"', add
capture label define yrimm_lbl 1911 `"1911"', add
capture label define yrimm_lbl 1912 `"1912"', add
capture label define yrimm_lbl 1913 `"1913"', add
capture label define yrimm_lbl 1914 `"1914"', add
capture label define yrimm_lbl 1915 `"1915"', add
capture label define yrimm_lbl 1916 `"1916"', add
capture label define yrimm_lbl 1917 `"1917"', add
capture label define yrimm_lbl 1918 `"1918"', add
capture label define yrimm_lbl 1919 `"1919"', add
capture label define yrimm_lbl 1920 `"1920"', add
capture label define yrimm_lbl 1921 `"1921"', add
capture label define yrimm_lbl 1922 `"1922"', add
capture label define yrimm_lbl 1923 `"1923"', add
capture label define yrimm_lbl 1924 `"1924"', add
capture label define yrimm_lbl 1925 `"1925"', add
capture label define yrimm_lbl 1926 `"1926"', add
capture label define yrimm_lbl 1927 `"1927"', add
capture label define yrimm_lbl 1928 `"1928"', add
capture label define yrimm_lbl 1929 `"1929"', add
capture label define yrimm_lbl 1930 `"1930"', add
capture label define yrimm_lbl 1931 `"1931"', add
capture label define yrimm_lbl 1932 `"1932"', add
capture label define yrimm_lbl 1933 `"1933"', add
capture label define yrimm_lbl 1934 `"1934"', add
capture label define yrimm_lbl 1935 `"1935"', add
capture label define yrimm_lbl 1936 `"1936"', add
capture label define yrimm_lbl 1937 `"1937"', add
capture label define yrimm_lbl 1938 `"1938"', add
capture label define yrimm_lbl 1939 `"1939"', add
capture label define yrimm_lbl 1940 `"1940"', add
capture label define yrimm_lbl 1941 `"1941"', add
capture label define yrimm_lbl 1942 `"1942"', add
capture label define yrimm_lbl 1943 `"1943"', add
capture label define yrimm_lbl 1944 `"1944"', add
capture label define yrimm_lbl 1945 `"1945"', add
capture label define yrimm_lbl 1946 `"1946"', add
capture label define yrimm_lbl 1947 `"1947"', add
capture label define yrimm_lbl 1948 `"1948"', add
capture label define yrimm_lbl 1949 `"1949"', add
capture label define yrimm_lbl 1950 `"1950"', add
capture label define yrimm_lbl 1951 `"1951"', add
capture label define yrimm_lbl 1952 `"1952"', add
capture label define yrimm_lbl 1953 `"1953"', add
capture label define yrimm_lbl 1954 `"1954"', add
capture label define yrimm_lbl 1955 `"1955"', add
capture label define yrimm_lbl 1956 `"1956"', add
capture label define yrimm_lbl 1957 `"1957"', add
capture label define yrimm_lbl 1958 `"1958"', add
capture label define yrimm_lbl 1959 `"1959"', add
capture label define yrimm_lbl 1960 `"1960"', add
capture label define yrimm_lbl 1961 `"1961"', add
capture label define yrimm_lbl 1962 `"1962"', add
capture label define yrimm_lbl 1963 `"1963"', add
capture label define yrimm_lbl 1964 `"1964"', add
capture label define yrimm_lbl 1965 `"1965"', add
capture label define yrimm_lbl 1966 `"1966"', add
capture label define yrimm_lbl 1967 `"1967"', add
capture label define yrimm_lbl 1968 `"1968"', add
capture label define yrimm_lbl 1969 `"1969"', add
capture label define yrimm_lbl 1970 `"1970"', add
capture label define yrimm_lbl 1971 `"1971"', add
capture label define yrimm_lbl 1972 `"1972"', add
capture label define yrimm_lbl 1973 `"1973"', add
capture label define yrimm_lbl 1974 `"1974"', add
capture label define yrimm_lbl 1975 `"1975"', add
capture label define yrimm_lbl 1976 `"1976"', add
capture label define yrimm_lbl 1977 `"1977"', add
capture label define yrimm_lbl 1978 `"1978"', add
capture label define yrimm_lbl 1979 `"1979"', add
capture label define yrimm_lbl 1980 `"1980"', add
capture label define yrimm_lbl 1981 `"1981"', add
capture label define yrimm_lbl 1982 `"1982"', add
capture label define yrimm_lbl 1983 `"1983"', add
capture label define yrimm_lbl 1984 `"1984"', add
capture label define yrimm_lbl 1985 `"1985"', add
capture label define yrimm_lbl 1986 `"1986"', add
capture label define yrimm_lbl 1987 `"1987"', add
capture label define yrimm_lbl 1988 `"1988"', add
capture label define yrimm_lbl 1989 `"1989"', add
capture label define yrimm_lbl 1990 `"1990"', add
capture label define yrimm_lbl 1991 `"1991"', add
capture label define yrimm_lbl 1992 `"1992"', add
capture label define yrimm_lbl 1993 `"1993"', add
capture label define yrimm_lbl 1994 `"1994"', add
capture label define yrimm_lbl 1995 `"1995"', add
capture label define yrimm_lbl 1996 `"1996"', add
capture label define yrimm_lbl 1997 `"1997"', add
capture label define yrimm_lbl 1998 `"1998"', add
capture label define yrimm_lbl 1999 `"1999"', add
capture label define yrimm_lbl 2000 `"2000"', add
capture label define yrimm_lbl 2001 `"2001"', add
capture label define yrimm_lbl 2002 `"2002"', add
capture label define yrimm_lbl 2003 `"2003"', add
capture label define yrimm_lbl 2004 `"2004"', add
capture label define yrimm_lbl 2005 `"2005"', add
capture label define yrimm_lbl 2006 `"2006"', add
capture label define yrimm_lbl 2007 `"2007"', add
capture label define yrimm_lbl 2008 `"2008"', add
capture label define yrimm_lbl 2009 `"2009"', add
capture label define yrimm_lbl 2010 `"2010"', add
capture label define yrimm_lbl 2011 `"2011"', add
capture label define yrimm_lbl 2012 `"2012"', add
capture label define yrimm_lbl 2013 `"2013"', add
capture label define yrimm_lbl 2014 `"2014"', add
capture label define yrimm_lbl 2015 `"2015"', add
capture label define yrimm_lbl 2016 `"2016"', add
capture label define yrimm_lbl 2017 `"2017"', add
capture label define yrimm_lbl 2018 `"2018"', add
capture label define yrimm_lbl 2019 `"2019"', add
capture label define yrimm_lbl 9998 `"In transit"', add
capture label define yrimm_lbl 9999 `"Unknown"', add
capture label values yrimm yrimm_lbl

capture label define yrsimm_lbl 00 `"0 (within previous year)"'
capture label define yrsimm_lbl 01 `"1"', add
capture label define yrsimm_lbl 02 `"2"', add
capture label define yrsimm_lbl 03 `"3"', add
capture label define yrsimm_lbl 04 `"4"', add
capture label define yrsimm_lbl 05 `"5"', add
capture label define yrsimm_lbl 06 `"6"', add
capture label define yrsimm_lbl 07 `"7"', add
capture label define yrsimm_lbl 08 `"8"', add
capture label define yrsimm_lbl 09 `"9"', add
capture label define yrsimm_lbl 10 `"10"', add
capture label define yrsimm_lbl 11 `"11"', add
capture label define yrsimm_lbl 12 `"12"', add
capture label define yrsimm_lbl 13 `"13"', add
capture label define yrsimm_lbl 14 `"14"', add
capture label define yrsimm_lbl 15 `"15"', add
capture label define yrsimm_lbl 16 `"16"', add
capture label define yrsimm_lbl 17 `"17"', add
capture label define yrsimm_lbl 18 `"18"', add
capture label define yrsimm_lbl 19 `"19"', add
capture label define yrsimm_lbl 20 `"20"', add
capture label define yrsimm_lbl 21 `"21"', add
capture label define yrsimm_lbl 22 `"22"', add
capture label define yrsimm_lbl 23 `"23"', add
capture label define yrsimm_lbl 24 `"24"', add
capture label define yrsimm_lbl 25 `"25"', add
capture label define yrsimm_lbl 26 `"26"', add
capture label define yrsimm_lbl 27 `"27"', add
capture label define yrsimm_lbl 28 `"28"', add
capture label define yrsimm_lbl 29 `"29"', add
capture label define yrsimm_lbl 30 `"30"', add
capture label define yrsimm_lbl 31 `"31"', add
capture label define yrsimm_lbl 32 `"32"', add
capture label define yrsimm_lbl 33 `"33"', add
capture label define yrsimm_lbl 34 `"34"', add
capture label define yrsimm_lbl 35 `"35"', add
capture label define yrsimm_lbl 36 `"36"', add
capture label define yrsimm_lbl 37 `"37"', add
capture label define yrsimm_lbl 38 `"38"', add
capture label define yrsimm_lbl 39 `"39"', add
capture label define yrsimm_lbl 40 `"40"', add
capture label define yrsimm_lbl 41 `"41"', add
capture label define yrsimm_lbl 42 `"42"', add
capture label define yrsimm_lbl 43 `"43"', add
capture label define yrsimm_lbl 44 `"44"', add
capture label define yrsimm_lbl 45 `"45"', add
capture label define yrsimm_lbl 46 `"46"', add
capture label define yrsimm_lbl 47 `"47"', add
capture label define yrsimm_lbl 48 `"48"', add
capture label define yrsimm_lbl 49 `"49"', add
capture label define yrsimm_lbl 50 `"50"', add
capture label define yrsimm_lbl 51 `"51"', add
capture label define yrsimm_lbl 52 `"52"', add
capture label define yrsimm_lbl 53 `"53"', add
capture label define yrsimm_lbl 54 `"54"', add
capture label define yrsimm_lbl 55 `"55"', add
capture label define yrsimm_lbl 56 `"56"', add
capture label define yrsimm_lbl 57 `"57"', add
capture label define yrsimm_lbl 58 `"58"', add
capture label define yrsimm_lbl 59 `"59"', add
capture label define yrsimm_lbl 60 `"60"', add
capture label define yrsimm_lbl 61 `"61"', add
capture label define yrsimm_lbl 62 `"62"', add
capture label define yrsimm_lbl 63 `"63"', add
capture label define yrsimm_lbl 64 `"64"', add
capture label define yrsimm_lbl 65 `"65"', add
capture label define yrsimm_lbl 66 `"66"', add
capture label define yrsimm_lbl 67 `"67"', add
capture label define yrsimm_lbl 68 `"68"', add
capture label define yrsimm_lbl 69 `"69"', add
capture label define yrsimm_lbl 70 `"70"', add
capture label define yrsimm_lbl 71 `"71"', add
capture label define yrsimm_lbl 72 `"72"', add
capture label define yrsimm_lbl 73 `"73"', add
capture label define yrsimm_lbl 74 `"74"', add
capture label define yrsimm_lbl 75 `"75"', add
capture label define yrsimm_lbl 76 `"76"', add
capture label define yrsimm_lbl 77 `"77"', add
capture label define yrsimm_lbl 78 `"78"', add
capture label define yrsimm_lbl 79 `"79"', add
capture label define yrsimm_lbl 80 `"80"', add
capture label define yrsimm_lbl 81 `"81"', add
capture label define yrsimm_lbl 82 `"82"', add
capture label define yrsimm_lbl 83 `"83"', add
capture label define yrsimm_lbl 84 `"84"', add
capture label define yrsimm_lbl 85 `"85"', add
capture label define yrsimm_lbl 86 `"86"', add
capture label define yrsimm_lbl 87 `"87"', add
capture label define yrsimm_lbl 88 `"88"', add
capture label define yrsimm_lbl 89 `"89"', add
capture label define yrsimm_lbl 90 `"90"', add
capture label define yrsimm_lbl 91 `"91"', add
capture label define yrsimm_lbl 92 `"92"', add
capture label define yrsimm_lbl 93 `"93"', add
capture label define yrsimm_lbl 94 `"94"', add
capture label define yrsimm_lbl 95 `"95"', add
capture label define yrsimm_lbl 96 `"96"', add
capture label define yrsimm_lbl 97 `"97+"', add
capture label define yrsimm_lbl 98 `"Unknown"', add
capture label define yrsimm_lbl 99 `"NIU (not in universe)"', add
capture label values yrsimm yrsimm_lbl

capture label define edattain_lbl 0 `"NIU (not in universe)"'
capture label define edattain_lbl 1 `"Less than primary completed"', add
capture label define edattain_lbl 2 `"Primary completed"', add
capture label define edattain_lbl 3 `"Secondary completed"', add
capture label define edattain_lbl 4 `"University completed"', add
capture label define edattain_lbl 9 `"Unknown"', add
capture label values edattain edattain_lbl

capture label define edattaind_lbl 000 `"NIU (not in universe)"'
capture label define edattaind_lbl 100 `"Less than primary completed (n.s.)"', add
capture label define edattaind_lbl 110 `"No schooling"', add
capture label define edattaind_lbl 120 `"Some primary completed"', add
capture label define edattaind_lbl 130 `"Primary (4 yrs) completed"', add
capture label define edattaind_lbl 211 `"Primary (5 yrs) completed"', add
capture label define edattaind_lbl 212 `"Primary (6 yrs) completed"', add
capture label define edattaind_lbl 221 `"Lower secondary general completed"', add
capture label define edattaind_lbl 222 `"Lower secondary technical completed"', add
capture label define edattaind_lbl 311 `"Secondary, general track completed"', add
capture label define edattaind_lbl 312 `"Some college completed"', add
capture label define edattaind_lbl 320 `"Secondary or post-secondary technical completed"', add
capture label define edattaind_lbl 321 `"Secondary, technical track completed"', add
capture label define edattaind_lbl 322 `"Post-secondary technical education"', add
capture label define edattaind_lbl 400 `"University completed"', add
capture label define edattaind_lbl 999 `"Unknown/missing"', add
capture label values edattaind edattaind_lbl

capture label define yrschool_lbl 00 `"None or pre-school"'
capture label define yrschool_lbl 01 `"1 year"', add
capture label define yrschool_lbl 02 `"2 years"', add
capture label define yrschool_lbl 03 `"3 years"', add
capture label define yrschool_lbl 04 `"4 years"', add
capture label define yrschool_lbl 05 `"5 years"', add
capture label define yrschool_lbl 06 `"6 years"', add
capture label define yrschool_lbl 07 `"7 years"', add
capture label define yrschool_lbl 08 `"8 years"', add
capture label define yrschool_lbl 09 `"9 years"', add
capture label define yrschool_lbl 10 `"10 years"', add
capture label define yrschool_lbl 11 `"11 years"', add
capture label define yrschool_lbl 12 `"12 years"', add
capture label define yrschool_lbl 13 `"13 years"', add
capture label define yrschool_lbl 14 `"14 years"', add
capture label define yrschool_lbl 15 `"15 years"', add
capture label define yrschool_lbl 16 `"16 years"', add
capture label define yrschool_lbl 17 `"17 years"', add
capture label define yrschool_lbl 18 `"18 years or more"', add
capture label define yrschool_lbl 90 `"Not specified"', add
capture label define yrschool_lbl 91 `"Some primary"', add
capture label define yrschool_lbl 92 `"Some technical after primary"', add
capture label define yrschool_lbl 93 `"Some secondary"', add
capture label define yrschool_lbl 94 `"Some tertiary"', add
capture label define yrschool_lbl 95 `"Adult literacy"', add
capture label define yrschool_lbl 96 `"Special education"', add
capture label define yrschool_lbl 98 `"Unknown/missing"', add
capture label define yrschool_lbl 99 `"NIU (not in universe)"', add
capture label values yrschool yrschool_lbl

capture label define empstat_lbl 0 `"NIU (not in universe)"'
capture label define empstat_lbl 1 `"Employed"', add
capture label define empstat_lbl 2 `"Unemployed"', add
capture label define empstat_lbl 3 `"Inactive"', add
capture label define empstat_lbl 9 `"Unknown/missing"', add
capture label values empstat empstat_lbl

capture label define empstatd_lbl 000 `"NIU (not in universe)"'
capture label define empstatd_lbl 100 `"Employed, not specified"', add
capture label define empstatd_lbl 110 `"At work"', add
capture label define empstatd_lbl 111 `"At work, and 'student'"', add
capture label define empstatd_lbl 112 `"At work, and 'housework'"', add
capture label define empstatd_lbl 113 `"At work, and 'seeking work'"', add
capture label define empstatd_lbl 114 `"At work, and 'retired'"', add
capture label define empstatd_lbl 115 `"At work, and 'no work'"', add
capture label define empstatd_lbl 116 `"At work, and other situation"', add
capture label define empstatd_lbl 117 `"At work, family holding, not specified"', add
capture label define empstatd_lbl 118 `"At work, family holding, not agricultural"', add
capture label define empstatd_lbl 119 `"At work, family holding, agricultural"', add
capture label define empstatd_lbl 120 `"Have job, not at work in reference period"', add
capture label define empstatd_lbl 130 `"Armed forces"', add
capture label define empstatd_lbl 131 `"Armed forces, at work"', add
capture label define empstatd_lbl 132 `"Armed forces, not at work in reference period"', add
capture label define empstatd_lbl 133 `"Military trainee"', add
capture label define empstatd_lbl 140 `"Marginally employed"', add
capture label define empstatd_lbl 200 `"Unemployed, not specified"', add
capture label define empstatd_lbl 201 `"Unemployed 6 or more months"', add
capture label define empstatd_lbl 202 `"Worked fewer than 6 months, permanent job"', add
capture label define empstatd_lbl 203 `"Worked fewer than 6 months, temporary job"', add
capture label define empstatd_lbl 210 `"Unemployed, experienced worker"', add
capture label define empstatd_lbl 220 `"Unemployed, new worker"', add
capture label define empstatd_lbl 230 `"No work available"', add
capture label define empstatd_lbl 240 `"Inactive unemployed"', add
capture label define empstatd_lbl 300 `"Inactive (not in labor force)"', add
capture label define empstatd_lbl 310 `"Housework"', add
capture label define empstatd_lbl 320 `"Unable to work, disabled or health reasons"', add
capture label define empstatd_lbl 321 `"Permanent disability"', add
capture label define empstatd_lbl 322 `"Temporary illness"', add
capture label define empstatd_lbl 323 `"Disabled or imprisoned"', add
capture label define empstatd_lbl 330 `"In school"', add
capture label define empstatd_lbl 340 `"Retirees and living on rent"', add
capture label define empstatd_lbl 341 `"Living on rents"', add
capture label define empstatd_lbl 342 `"Living on rents or pension"', add
capture label define empstatd_lbl 343 `"Retirees/pensioners"', add
capture label define empstatd_lbl 344 `"Retired"', add
capture label define empstatd_lbl 345 `"Pensioner"', add
capture label define empstatd_lbl 346 `"Non-retirement pension"', add
capture label define empstatd_lbl 347 `"Disability pension"', add
capture label define empstatd_lbl 348 `"Retired without benefits"', add
capture label define empstatd_lbl 350 `"Elderly"', add
capture label define empstatd_lbl 351 `"Elderly or disabled"', add
capture label define empstatd_lbl 360 `"Institutionalized"', add
capture label define empstatd_lbl 361 `"Prisoner"', add
capture label define empstatd_lbl 370 `"Intermittent worker"', add
capture label define empstatd_lbl 371 `"Not working, seasonal worker"', add
capture label define empstatd_lbl 372 `"Not working, occasional worker"', add
capture label define empstatd_lbl 380 `"Other income recipient"', add
capture label define empstatd_lbl 390 `"Inactive, other reasons"', add
capture label define empstatd_lbl 391 `"Too young to work"', add
capture label define empstatd_lbl 392 `"Dependent"', add
capture label define empstatd_lbl 999 `"Unknown/missing"', add
capture label values empstatd empstatd_lbl

capture label define indgen_lbl 000 `"NIU (not in universe)"'
capture label define indgen_lbl 010 `"Agriculture, fishing, and forestry"', add
capture label define indgen_lbl 020 `"Mining and extraction"', add
capture label define indgen_lbl 030 `"Manufacturing"', add
capture label define indgen_lbl 040 `"Electricity, gas, water and waste management"', add
capture label define indgen_lbl 050 `"Construction"', add
capture label define indgen_lbl 060 `"Wholesale and retail trade"', add
capture label define indgen_lbl 070 `"Hotels and restaurants"', add
capture label define indgen_lbl 080 `"Transportation, storage, and communications"', add
capture label define indgen_lbl 090 `"Financial services and insurance"', add
capture label define indgen_lbl 100 `"Public administration and defense"', add
capture label define indgen_lbl 110 `"Services, not specified"', add
capture label define indgen_lbl 111 `"Business services and real estate"', add
capture label define indgen_lbl 112 `"Education"', add
capture label define indgen_lbl 113 `"Health and social work"', add
capture label define indgen_lbl 114 `"Other services"', add
capture label define indgen_lbl 120 `"Private household services"', add
capture label define indgen_lbl 130 `"Other industry, n.e.c."', add
capture label define indgen_lbl 998 `"Response suppressed"', add
capture label define indgen_lbl 999 `"Unknown"', add
capture label values indgen indgen_lbl

capture label define classwk_lbl 0 `"NIU (not in universe)"'
capture label define classwk_lbl 1 `"Self-employed"', add
capture label define classwk_lbl 2 `"Wage/salary worker"', add
capture label define classwk_lbl 3 `"Unpaid worker"', add
capture label define classwk_lbl 4 `"Other"', add
capture label define classwk_lbl 9 `"Unknown/missing"', add
capture label values classwk classwk_lbl

capture label define classwkd_lbl 000 `"NIU (not in universe)"'
capture label define classwkd_lbl 100 `"Self-employed"', add
capture label define classwkd_lbl 101 `"Self-employed, unincorporated"', add
capture label define classwkd_lbl 102 `"Self-employed, incorporated"', add
capture label define classwkd_lbl 110 `"Employer"', add
capture label define classwkd_lbl 111 `"Sharecropper, employer"', add
capture label define classwkd_lbl 120 `"Working on own account"', add
capture label define classwkd_lbl 121 `"Own account, agriculture"', add
capture label define classwkd_lbl 122 `"Domestic worker, self-employed"', add
capture label define classwkd_lbl 123 `"Subsistence worker, own consumption"', add
capture label define classwkd_lbl 124 `"Own account, other"', add
capture label define classwkd_lbl 125 `"Own account, without temporary/unpaid help"', add
capture label define classwkd_lbl 126 `"Own account, with temporary/unpaid help"', add
capture label define classwkd_lbl 130 `"Member of cooperative"', add
capture label define classwkd_lbl 140 `"Sharecropper"', add
capture label define classwkd_lbl 141 `"Sharecropper, self-employed"', add
capture label define classwkd_lbl 142 `"Sharecropper, employee"', add
capture label define classwkd_lbl 150 `"Kibbutz member"', add
capture label define classwkd_lbl 199 `"Self-employed, not specified"', add
capture label define classwkd_lbl 200 `"Wage/salary worker"', add
capture label define classwkd_lbl 201 `"Management"', add
capture label define classwkd_lbl 202 `"Non-management"', add
capture label define classwkd_lbl 203 `"White collar (non-manual)"', add
capture label define classwkd_lbl 204 `"Blue collar (manual)"', add
capture label define classwkd_lbl 205 `"White or blue collar"', add
capture label define classwkd_lbl 206 `"Day laborer"', add
capture label define classwkd_lbl 207 `"Employee, with a permanent job"', add
capture label define classwkd_lbl 208 `"Employee, occasional, temporary, contract"', add
capture label define classwkd_lbl 209 `"Employee without legal contract"', add
capture label define classwkd_lbl 210 `"Wage/salary worker, private employer"', add
capture label define classwkd_lbl 211 `"Apprentice"', add
capture label define classwkd_lbl 212 `"Religious worker"', add
capture label define classwkd_lbl 213 `"Wage/salary worker, non-profit, NGO"', add
capture label define classwkd_lbl 214 `"White collar, private"', add
capture label define classwkd_lbl 215 `"Blue collar, private"', add
capture label define classwkd_lbl 216 `"Paid family worker"', add
capture label define classwkd_lbl 217 `"Cooperative employee"', add
capture label define classwkd_lbl 220 `"Wage/salary worker, government"', add
capture label define classwkd_lbl 221 `"Federal, government employee"', add
capture label define classwkd_lbl 222 `"State government employee"', add
capture label define classwkd_lbl 223 `"Local government employee"', add
capture label define classwkd_lbl 224 `"White collar, public"', add
capture label define classwkd_lbl 225 `"Blue collar, public"', add
capture label define classwkd_lbl 226 `"Public companies"', add
capture label define classwkd_lbl 227 `"Civil servants, local collectives"', add
capture label define classwkd_lbl 230 `"Domestic worker (work for private household)"', add
capture label define classwkd_lbl 240 `"Seasonal migrant"', add
capture label define classwkd_lbl 241 `"Seasonal migrant, no broker"', add
capture label define classwkd_lbl 242 `"Seasonal migrant, uses broker"', add
capture label define classwkd_lbl 250 `"Other wage and salary"', add
capture label define classwkd_lbl 251 `"Canal zone/commission employee"', add
capture label define classwkd_lbl 252 `"Government employment/training program"', add
capture label define classwkd_lbl 253 `"Mixed state/private enterprise/parastatal"', add
capture label define classwkd_lbl 254 `"Government public work program"', add
capture label define classwkd_lbl 255 `"State enterprise employee"', add
capture label define classwkd_lbl 256 `"Coordinated and continuous collaboration job"', add
capture label define classwkd_lbl 300 `"Unpaid worker"', add
capture label define classwkd_lbl 310 `"Unpaid family worker"', add
capture label define classwkd_lbl 320 `"Apprentice, unpaid or unspecified"', add
capture label define classwkd_lbl 330 `"Trainee"', add
capture label define classwkd_lbl 340 `"Apprentice or trainee"', add
capture label define classwkd_lbl 350 `"Works for others without wage"', add
capture label define classwkd_lbl 400 `"Other"', add
capture label define classwkd_lbl 999 `"Unknown/missing"', add
capture label values classwkd classwkd_lbl

capture label define hrswork1_lbl 000 `"0 hours"'
capture label define hrswork1_lbl 001 `"1 hour"', add
capture label define hrswork1_lbl 002 `"2 hours"', add
capture label define hrswork1_lbl 003 `"3 hours"', add
capture label define hrswork1_lbl 004 `"4 hours"', add
capture label define hrswork1_lbl 005 `"5 hours"', add
capture label define hrswork1_lbl 006 `"6 hours"', add
capture label define hrswork1_lbl 007 `"7 hours"', add
capture label define hrswork1_lbl 008 `"8 hours"', add
capture label define hrswork1_lbl 009 `"9 hours"', add
capture label define hrswork1_lbl 010 `"10 hours"', add
capture label define hrswork1_lbl 011 `"11 hours"', add
capture label define hrswork1_lbl 012 `"12 hours"', add
capture label define hrswork1_lbl 013 `"13 hours"', add
capture label define hrswork1_lbl 014 `"14 hours"', add
capture label define hrswork1_lbl 015 `"15 hours"', add
capture label define hrswork1_lbl 016 `"16 hours"', add
capture label define hrswork1_lbl 017 `"17 hours"', add
capture label define hrswork1_lbl 018 `"18 hours"', add
capture label define hrswork1_lbl 019 `"19 hours"', add
capture label define hrswork1_lbl 020 `"20 hours"', add
capture label define hrswork1_lbl 021 `"21 hours"', add
capture label define hrswork1_lbl 022 `"22 hours"', add
capture label define hrswork1_lbl 023 `"23 hours"', add
capture label define hrswork1_lbl 024 `"24 hours"', add
capture label define hrswork1_lbl 025 `"25 hours"', add
capture label define hrswork1_lbl 026 `"26 hours"', add
capture label define hrswork1_lbl 027 `"27 hours"', add
capture label define hrswork1_lbl 028 `"28 hours"', add
capture label define hrswork1_lbl 029 `"29 hours"', add
capture label define hrswork1_lbl 030 `"30 hours"', add
capture label define hrswork1_lbl 031 `"31 hours"', add
capture label define hrswork1_lbl 032 `"32 hours"', add
capture label define hrswork1_lbl 033 `"33 hours"', add
capture label define hrswork1_lbl 034 `"34 hours"', add
capture label define hrswork1_lbl 035 `"35 hours"', add
capture label define hrswork1_lbl 036 `"36 hours"', add
capture label define hrswork1_lbl 037 `"37 hours"', add
capture label define hrswork1_lbl 038 `"38 hours"', add
capture label define hrswork1_lbl 039 `"39 hours"', add
capture label define hrswork1_lbl 040 `"40 hours"', add
capture label define hrswork1_lbl 041 `"41 hours"', add
capture label define hrswork1_lbl 042 `"42 hours"', add
capture label define hrswork1_lbl 043 `"43 hours"', add
capture label define hrswork1_lbl 044 `"44 hours"', add
capture label define hrswork1_lbl 045 `"45 hours"', add
capture label define hrswork1_lbl 046 `"46 hours"', add
capture label define hrswork1_lbl 047 `"47 hours"', add
capture label define hrswork1_lbl 048 `"48 hours"', add
capture label define hrswork1_lbl 049 `"49 hours"', add
capture label define hrswork1_lbl 050 `"50 hours"', add
capture label define hrswork1_lbl 051 `"51 hours"', add
capture label define hrswork1_lbl 052 `"52 hours"', add
capture label define hrswork1_lbl 053 `"53 hours"', add
capture label define hrswork1_lbl 054 `"54 hours"', add
capture label define hrswork1_lbl 055 `"55 hours"', add
capture label define hrswork1_lbl 056 `"56 hours"', add
capture label define hrswork1_lbl 057 `"57 hours"', add
capture label define hrswork1_lbl 058 `"58 hours"', add
capture label define hrswork1_lbl 059 `"59 hours"', add
capture label define hrswork1_lbl 060 `"60 hours"', add
capture label define hrswork1_lbl 061 `"61 hours"', add
capture label define hrswork1_lbl 062 `"62 hours"', add
capture label define hrswork1_lbl 063 `"63 hours"', add
capture label define hrswork1_lbl 064 `"64 hours"', add
capture label define hrswork1_lbl 065 `"65 hours"', add
capture label define hrswork1_lbl 066 `"66 hours"', add
capture label define hrswork1_lbl 067 `"67 hours"', add
capture label define hrswork1_lbl 068 `"68 hours"', add
capture label define hrswork1_lbl 069 `"69 hours"', add
capture label define hrswork1_lbl 070 `"70 hours"', add
capture label define hrswork1_lbl 071 `"71 hours"', add
capture label define hrswork1_lbl 072 `"72 hours"', add
capture label define hrswork1_lbl 073 `"73 hours"', add
capture label define hrswork1_lbl 074 `"74 hours"', add
capture label define hrswork1_lbl 075 `"75 hours"', add
capture label define hrswork1_lbl 076 `"76 hours"', add
capture label define hrswork1_lbl 077 `"77 hours"', add
capture label define hrswork1_lbl 078 `"78 hours"', add
capture label define hrswork1_lbl 079 `"79 hours"', add
capture label define hrswork1_lbl 080 `"80 hours"', add
capture label define hrswork1_lbl 081 `"81 hours"', add
capture label define hrswork1_lbl 082 `"82 hours"', add
capture label define hrswork1_lbl 083 `"83 hours"', add
capture label define hrswork1_lbl 084 `"84 hours"', add
capture label define hrswork1_lbl 085 `"85 hours"', add
capture label define hrswork1_lbl 086 `"86 hours"', add
capture label define hrswork1_lbl 087 `"87 hours"', add
capture label define hrswork1_lbl 088 `"88 hours"', add
capture label define hrswork1_lbl 089 `"89 hours"', add
capture label define hrswork1_lbl 090 `"90 hours"', add
capture label define hrswork1_lbl 091 `"91 hours"', add
capture label define hrswork1_lbl 092 `"92 hours"', add
capture label define hrswork1_lbl 093 `"93 hours"', add
capture label define hrswork1_lbl 094 `"94 hours"', add
capture label define hrswork1_lbl 095 `"95 hours"', add
capture label define hrswork1_lbl 096 `"96 hours"', add
capture label define hrswork1_lbl 097 `"97 hours"', add
capture label define hrswork1_lbl 098 `"98 hours"', add
capture label define hrswork1_lbl 099 `"99 hours"', add
capture label define hrswork1_lbl 100 `"100 hours"', add
capture label define hrswork1_lbl 101 `"101 hours"', add
capture label define hrswork1_lbl 102 `"102 hours"', add
capture label define hrswork1_lbl 103 `"103 hours"', add
capture label define hrswork1_lbl 104 `"104 hours"', add
capture label define hrswork1_lbl 105 `"105 hours"', add
capture label define hrswork1_lbl 106 `"106 hours"', add
capture label define hrswork1_lbl 107 `"107 hours"', add
capture label define hrswork1_lbl 108 `"108 hours"', add
capture label define hrswork1_lbl 109 `"109 hours"', add
capture label define hrswork1_lbl 110 `"110 hours"', add
capture label define hrswork1_lbl 111 `"111 hours"', add
capture label define hrswork1_lbl 112 `"112 hours"', add
capture label define hrswork1_lbl 113 `"113 hours"', add
capture label define hrswork1_lbl 114 `"114 hours"', add
capture label define hrswork1_lbl 115 `"115 hours"', add
capture label define hrswork1_lbl 116 `"116 hours"', add
capture label define hrswork1_lbl 117 `"117 hours"', add
capture label define hrswork1_lbl 118 `"118 hours"', add
capture label define hrswork1_lbl 119 `"119 hours"', add
capture label define hrswork1_lbl 120 `"120 hours"', add
capture label define hrswork1_lbl 121 `"121 hours"', add
capture label define hrswork1_lbl 122 `"122 hours"', add
capture label define hrswork1_lbl 123 `"123 hours"', add
capture label define hrswork1_lbl 124 `"124 hours"', add
capture label define hrswork1_lbl 125 `"125 hours"', add
capture label define hrswork1_lbl 126 `"126 hours"', add
capture label define hrswork1_lbl 127 `"127 hours"', add
capture label define hrswork1_lbl 128 `"128 hours"', add
capture label define hrswork1_lbl 129 `"129 hours"', add
capture label define hrswork1_lbl 130 `"130 hours"', add
capture label define hrswork1_lbl 131 `"131 hours"', add
capture label define hrswork1_lbl 132 `"132 hours"', add
capture label define hrswork1_lbl 133 `"133 hours"', add
capture label define hrswork1_lbl 134 `"134 hours"', add
capture label define hrswork1_lbl 135 `"135 hours"', add
capture label define hrswork1_lbl 136 `"136 hours"', add
capture label define hrswork1_lbl 137 `"137 hours"', add
capture label define hrswork1_lbl 138 `"138 hours"', add
capture label define hrswork1_lbl 139 `"139 hours"', add
capture label define hrswork1_lbl 140 `"140+ hours"', add
capture label define hrswork1_lbl 998 `"Unknown"', add
capture label define hrswork1_lbl 999 `"NIU (not in universe)"', add
capture label values hrswork1 hrswork1_lbl

capture label define hrswork2_lbl 0 `"None"'
capture label define hrswork2_lbl 1 `"1 to 14 hours (except tt1980, tt1990 and tt2000)"', add
capture label define hrswork2_lbl 2 `"15 to 29 hours (except de1970, ps2017, tt1980, tt1990, tt2000, and ve1971)"', add
capture label define hrswork2_lbl 3 `"30 to 39 hours (except de1970, ps2017, tt1980, tt1990, tt2000, and ve1971)"', add
capture label define hrswork2_lbl 4 `"40-48 hours (except il1972, tt1980, tt1990, and tt2000)"', add
capture label define hrswork2_lbl 5 `"49 hours or more (except il1972 and tt2000)"', add
capture label define hrswork2_lbl 8 `"Unknown"', add
capture label define hrswork2_lbl 9 `"NIU (not in universe)"', add
capture label values hrswork2 hrswork2_lbl

