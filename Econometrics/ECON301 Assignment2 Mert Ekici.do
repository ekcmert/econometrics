// ECON301 Assignment 2 

//open discrim.dta
use "C:\Users\LENOVO\Desktop\discrim.dta"

//browse the data
browse

//OLS estimation psoda prrblck income
reg psoda prpblck income

//change the directory
cd "C:\Users\LENOVO"

//extract the table of the model to tables.doc
outreg2 using tables.doc, replace seeout

//calculate difference from 0.1 t-value
display (0.1149882-0.1)/(0.0260006)

//Simple regression psoda prpblck
reg psoda prpblck

//estimate the correlation coefficient of prpblck and income
corr prpblck income

//multi regression income elasticity
reg lpsoda lincome prpblck

//multiple regression prppov is added
reg psoda prpblck income prppov

//correlation income prppov
corr income prppov

//open VOTE1.dta
use "C:\Users\LENOVO\Desktop\VOTE1.DTA"

//generate log expendA and log expendB
g lnexpendA = ln(expendA)
g lnexpendB = ln(expendB)

//multi regression
reg voteA lnexpendA lnexpendB prtystrA

//correlation lnexpendA voteA
corr voteA lnexpendA

//close log
log close