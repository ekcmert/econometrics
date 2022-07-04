//ECON323 Assignment2

//open the EU data
use "C:\Users\LENOVO\Desktop\EUelectricity.dta"

//generate electricity consumption per capita
g ecpc = electricity/population

//scatter plot question1
scatter ecpc gdp if country == "France"

//find the values of 1980 and 2009 from the data
list ecpc if country == "France" & year == 1980
list ecpc if country == "France" & year == 2009
list gdp if country == "France" & year == 1980
list gdp if country == "France" & year == 2009

//calculations for the simple growth-rate approach to estimate elasticity parameter
display (2724.903- 1145.494)/1145.494
display (29388.02 - 20285.02)/20285.02
display (1.3788016/.4487548)

//generate ln variables for elasticity
g lnecpc = ln(ecpc)
g lngdp = ln(gdp)
g lneprice = ln(eprice)

//simple linear regressions for questions 3 and 4
reg lnecpc lngdp if country == 	"France"
reg lnecpc lneprice if country == "France"

//multiple linear regression lnecpc lngdp lneprice
reg lnecpc lngdp lneprice if country == "France"

//analyze the correlation between variables to determine biasedness
corr lngdp hdd
corr lnecpc hdd

//generate ln versions of hdd and cdd for better intuition
g lnhdd=ln(hdd)
g lncdd=ln(cdd)

//multiple linear regression (controlling for a linear time trend, heating and cooling requirement)
reg lnecpc lngdp lneprice lnhdd lncdd year if country == "France"

//outreg installation and instructions
ssc install outreg2
help outreg2

//change directory
cd "C:\Users\LENOVO"

//extract the table
outreg2 using tables.doc, replace seeout

//browse country names
browse country

//regression analysis for each country and extraction of the tables
reg lnecpc lngdp lneprice lnhdd lncdd year if country == "Austria"
outreg2 using tables.doc, replace seeout
reg lnecpc lngdp lneprice lnhdd lncdd year if country == "Belgium"
outreg2 using tables.doc, replace seeout
reg lnecpc lngdp lneprice lnhdd lncdd year if country == "Denmark"
outreg2 using tables.doc, replace seeout
reg lnecpc lngdp lneprice lnhdd lncdd year if country == "Finland"
outreg2 using tables.doc, replace seeout
reg lnecpc lngdp lneprice lnhdd lncdd year if country == "France"
outreg2 using tables.doc, replace seeout
reg lnecpc lngdp lneprice lnhdd lncdd year if country == "Germany"
outreg2 using tables.doc, replace seeout
reg lnecpc lngdp lneprice lnhdd lncdd year if country == "Greece"
outreg2 using tables.doc, replace seeout
reg lnecpc lngdp lneprice lnhdd lncdd year if country == "Ireland"
outreg2 using tables.doc, replace seeout
reg lnecpc lngdp lneprice lnhdd lncdd year if country == "Italy"
outreg2 using tables.doc, replace seeout
reg lnecpc lngdp lneprice lnhdd lncdd year if country == "Netherlands"
outreg2 using tables.doc, replace seeout
reg lnecpc lngdp lneprice lnhdd lncdd year if country == "Portugal"
outreg2 using tables.doc, replace seeout
reg lnecpc lngdp lneprice lnhdd lncdd year if country == "Spain"
outreg2 using tables.doc, replace seeout
reg lnecpc lngdp lneprice lnhdd lncdd year if country == "United Kingdom"
outreg2 using tables.doc, replace seeout

//generate year2
g year2 = year^2

//multiple linear regression (controlling for a quadratic time trend, heating and cooling requirement) and extraction
reg lnecpc lngdp lneprice lnhdd lncdd year year2
outreg2 using tables.doc, replace seeout

//multiple linear regression (controlling for a quadratic time trend, heating and cooling requirement and country specific time-constant factors) and extraction
reg lnecpc lngdp lneprice lnhdd lncdd year year2 i.id
outreg2 using tables.doc, replace seeout

//multiple linear regression (controlling for year-specific effects, heating and cooling requirement and country specific time-constant factors) and extraction
reg lnecpc lngdp lneprice lnhdd lncdd i.id i.year 
outreg2 using tables.doc, replace seeout

//calculation for the estimation of the expected saving
display 20*(.2051333)

//close log file
log close

