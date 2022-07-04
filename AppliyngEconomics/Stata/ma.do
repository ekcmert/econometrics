//Open the panel dataset
use "C:\Users\Gamegaraj\Desktop\APEC\datF\gedu2.dta"

//Threshold Regression
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp trade lexpect inflation unemp  )
outreg2 using tables.doc, replace seeout

//Regression without threshold, robustness
reg growth educexp
outreg2 using tables.doc, replace seeout
 reg growth educexp linitgdp
outreg2 using tables.doc, append seeout
 reg growth educexp linitgdp trade
outreg2 using tables.doc, append seeout
 reg growth educexp linitgdp trade lexpect
outreg2 using tables.doc, append seeout
 reg growth educexp linitgdp trade lexpect inflation
outreg2 using tables.doc, append seeout
 reg growth educexp linitgdp trade lexpect inflation unemp
outreg2 using tables.doc, append seeout

//Close the log file
log close