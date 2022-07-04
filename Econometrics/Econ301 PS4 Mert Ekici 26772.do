//open the article data
use "C:\Users\LENOVO\Desktop\card_krueger_data.dta"

//change directory
cd "C:\Users\LENOVO"

//generate full time equivalent employment variables
g fte = nmgrs + empft + (0.5 * emppt)
g fte2 = nmgrs2 + empft2 + (0.5 * emppt2)


//table3

reg fte if state==0
//extract the table
outreg2 using tables.doc, replace seeout

reg fte2 if state==0
//extract the table
outreg2 using tables.doc, replace seeout

reg fte if state==1
//extract the table
outreg2 using tables.doc, replace seeout

reg fte2 if state==1
//extract the table
outreg2 using tables.doc, replace seeout

//t tests for standard error of differences
ttest fte, by(state) reverse welch
ttest fte2, by(state) reverse welch



//table4

//generate change of employment
g dfte = fte2 - fte

//without chain & company control (available data on employment and wage)
reg dfte state if wage_st != . & wage_st2 != .
outreg2 using tables.doc, replace seeout

//with chain & company control (available data on employment and wage)
reg dfte state co_owned i.chain if wage_st != . & wage_st2 != . 
outreg2 using tables.doc, replace seeout


//table7

//generate the meal variables
g lpmeal = ln(psoda + pfry + pentree)
g lpmeal2 = ln(psoda2 + pfry2 + pentree2)
g ldpmeal = lpmeal2 - lpmeal


//without chain & company control (available data on employment and wage )
reg ldpmeal state if wage_st != . & wage_st2 != . & fte != . & fte2 != .
outreg2 using tables.doc, replace seeout
 
//without chain & company control (available data on employment and wage)
reg ldpmeal state co_owned i.chain if wage_st != . & wage_st2 != . & fte != . & fte2 != .
outreg2 using tables.doc, replace seeout


//clear to open new data
clear

// open TRAFFIC2.DTA
use "C:\Users\LENOVO\Desktop\TRAFFIC2.DTA"

//check variables of the data
browse 

//regression model on prcfat with linear time trend, monthly dummy variables and wkends, unem, spdlaw, beltlaw
reg prcfat t wkends unem spdlaw beltlaw feb mar apr may jun jul aug sep oct nov dec

//clear to open new data
clear

// open INJURY.DTA
use "C:\Users\LENOVO\Desktop\INJURY.DTA"

//check the data, analyze variables
browse

//adding explanatory variables (Kentucky data)
reg ldurat afchnge highearn afhigh male married manuf construc head neck upextr trunk lowback lowextr occdis if ky == 1

//normal version of the model (Kentucky data)
reg ldurat afchnge highearn afhigh if ky == 1

//extract the table
outreg2 using tables.doc, replace seeout

//normal version of the model (Kentucy and Michigan)
reg ldurat afchnge highearn afhigh if ky == 1
reg ldurat afchnge highearn afhigh if mi == 1

//extract the table
outreg2 using tables.doc, replace seeout

//close log file
log close