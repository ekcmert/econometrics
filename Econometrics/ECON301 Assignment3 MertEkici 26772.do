//open SMOKE.DTA
use "C:\Users\LENOVO\Desktop\SMOKE.DTA"

//browse the data, check variables
browse

//generate smoking data (if cig > 0 then smoker)
g smoking = cigs > 0

//find proportion of smokers by mean
sum smoking

//share of people lives in a state with smoke restrictions
sum restaurn

//share of smokers based on restricted states
sum smoking if restaurn == 1
sum smoking if restaurn == 0

//smoking linear possibility model
reg smoking educ age income cigpric restaurn white

//print the table to table.doc
cd "C:\Users\LENOVO\Desktop\
outreg2 using tables.doc, replace seeout

//smoking linear possibility model with quadratic age
reg smoking educ age agesq income cigpric restaurn white

//smoking linear possibility model with logarithmic form
reg smoking educ age agesq lincome lcigpric restaurn white

//generating interaction term
g restwhite = restaurn*white

//smoking linear possibility model, interaction variable approach
reg smoking educ age agesq lincome lcigpric restaurn white restwhite

//clear
clear

//open JTRAIN.DTA
use "C:\Users\LENOVO\Desktop\JTRAIN.DTA"

//simple regression of 1988 logstrap grant
reg lscrap grant if year == 1988

//lscrap_1 added regression model
reg lscrap grant lscrap_1 if year == 1988

//close log file
log close