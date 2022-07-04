//open happiness.dta
use "C:\Users\LENOVO\Desktop\happiness.dta"

//fraction of people that feel very happy (vhappy)
sum vhappy

//browse the categorical variable of work status
browse workstat
tab workstat

//effect of work status on feeling very happy
reg vhappy i.workstat

//find standard deviation of prestige
sum prestige

//regression model with prestige
reg vhappy prestige i.workstat

//browse income
browse income
tab income

//generating highinc variable 
g highinc = 1 if income == 12
replace highinc = 0 if income != 12
replace highinc = . if missing(highinc)

//regression model added highinc
reg vhappy highinc prestige i.workstat

//store old and new regressions into a table
cd "C:\Users\LENOVO"

reg vhappy prestige i.workstat 
outreg2 using tables.doc, replace ctitle(Model 1) label

reg vhappy highinc prestige i.workstat 
outreg2 using tables.doc, append ctitle(Model 2) label

//correlation between highinc-prestige
corr highinc prestige
//correlation between highinc-vhappy
corr highinc vhappy

//gender race with interaction term added
reg vhappy highinc prestige black female blackfemale i.workstat

//occattend regattend added
reg vhappy highinc prestige occattend regattend black female blackfemale i.workstat

//tabulate attend to see levels
tab attend

//checking the variables
browse babies
tabulate babies
tabulate year

//generate baby variable 
g baby = 0 if babies == 0
replace baby = 1 if babies != 0
replace baby = . if missing(babies)
outreg2 using tables.doc, replace seeout

//final regression with new variables 
reg vhappy highinc prestige occattend regattend mothfath16 educ baby black female blackfemale y96 y98 y00 y02 y04 y06 i.workstat i.reg16

outreg2 using tables.doc, replace seeout

//clear data
clear

//open MURDER.DTA
use "C:\Users\LENOVO\Desktop\MURDER.DTA"

//browse data 
browse

//90 - 93 data regression model
reg mrdrte d93 exec unem if year==90|year==93
outreg2 using tables.doc, replace seeout

//first difference estimation approach
reg cmrdrte cexec cunem if year==93
outreg2 using tables.doc, replace seeout

//finding outlier state for exec variable

//max exec value is 34
sum exec if year == 93
//state is Texas (TX)
tabulate state if exec == 34

//first difference model Texas removed (outlier)
reg cmrdrte cexec cunem if year==93 & state != "TX"
outreg2 using tables.doc, replace seeout

//fixed effects model for years 1987, 1990 and 1993 
xtreg mrdrte exec unem d90 d93, fe
outreg2 using tables.doc, replace seeout

//clear data
clear

//open FISH.dta
use "C:\Users\LENOVO\Desktop\FISH.DTA"

//price elasticity of demand controlling days and linear time trend
reg ltotqty lavgprc t mon tues wed thurs
outreg2 using tables.doc, replace seeout

//check if price varies systematically 
reg lavgprc t mon tues wed thurs
outreg2 using tables.doc, replace seeout

//check wave2 wave3 relevance assumption
reg lavgprc wave2
reg lavgprc wave3

//prediction model of lavgprc
reg lavgprc t mon tues wed thurs wave2 wave3

//predict and generate lavgprchat
predict lavgprchat

//2SLS model with lavgprchat
reg ltotqty lavgprchat t mon tues wed thurs

//2SLS model with ivreg
ivreg ltotqty t mon tues wed thurs (lavgprc = wave2 wave3)

//close log file
log close


