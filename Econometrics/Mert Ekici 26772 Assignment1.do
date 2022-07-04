*open the data
use "C:\Users\LENOVO\Desktop\CEOSAL2.DTA"

*salary average
sum salary

*tenure average
sum ceoten

*correlation between salary and tenure
corr salary ceoten

*CEO's at their first year
sum if ceoten == 0

*CEO tenure max value
sum ceoten

*generate new parameter lnsalary
g lnsalary = ln(salary)

*simple regression model of lnsalary and ceoten
reg lnsalary ceoten

*clear and open new data
clear 
use "C:\Users\LENOVO\Desktop\MEAP93.DTA"

*check the structure of the relationship (math10-expend)
scatter math10 expend || fpfit math10 expend
scatter expend math10 || fpfit expend math10

*generate new variable lnexpend
g lnexpend = ln(expend)

*simple regression model of math10 and lnexpend
reg math10 lnexpend

*clear and open new data
clear
use "C:\Users\LENOVO\Desktop\WAGE2.DTA"

*wage average
sum wage

*IQ average and std
sum IQ

*simple regression model of wage IQ
reg wage IQ

*predicted increase for the wage-IQ model
display 8.303064*15

*generate new variable lnwage
g lnwage = ln(wage)

*simple regression model of lnwage IQ
reg lnwage IQ

*predicted increase for the lnwage-IQ model
display 15*.0088072

*close log file
log close